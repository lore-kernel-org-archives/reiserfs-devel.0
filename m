From: Valdis.Kletnieks@vt.edu
Subject: Re: Behavior of tails with respect to shred, wipe, etc
Date: Sat, 26 Oct 2002 03:06:17 -0400
Message-ID: <200210260706.g9Q76I8Q012539@turing-police.cc.vt.edu>
References: <HDEFILEPHCPLCAGPLCEMIELIDFAA.icycle@charter.net> <15801.26994.705639.374241@laputa.namesys.com>
            <20021025200014.A1763@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1768222758P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11795-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 25 Oct 2002 20:00:14 +0400."
             <20021025200014.A1763@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: Reiserfs-List <reiserfs-list@namesys.com>

--==_Exmh_-1768222758P
Content-Type: text/plain; charset=us-ascii

On Fri, 25 Oct 2002 20:00:14 +0400, Oleg Drokin said:

> > I guess we should address this issue in reiser4. This is -security-
> > feature after all. Hans? It is not clear how to intehgrate this with
> > journalling though.
> 
> Zero out all freed blocks (mount option). This will kill write performance
> though.

This is the correct way to deal with "object reuse" in the Orange Book sense.

It's actually possible to (usually) do it without killing performance TOO
badly.  The way it's been implemented on other systems (for instance, the
"Clear Temp-Disk" support in IBM's VM operating system) has been along these
general lines:

1) When resource is freed, it does *NOT* go to the free list.  It is instead
put on a "to be cleaned" list.

2) A low-priority kernel thread then goes through and schedules a write of
a block of zeros, and as each write completes, *then* moves the page onto
the actual free list.  This can be optimized in a number of ways (for instance,
the obvious of only having 1 4K page and using it as the source for all the
writes - VM went one better and would launch one "CCW Chain" to clear
a cylinder at a time. If it knew there was a caching controller, it would
ensure the 4K page got into the cache, and then re-use it from there, resulting
in clearing a cylinder of 600K to 1.5M with only 6-8K of I/O bandwidth.  But
I don't think the average SCSI is that smart. ;)

This *is* subject to resource starvation if you have a lot of disk I/O *and*
a lot of file creation/deletion.  On the other hand, if it's something like
/tmp, it's probably time to use tmpfs so there's no need to worry about flushing
out the data.  Clever I/O scheduling will probably allow implementing
full data journalling *and* disk wiping with performance comparable to
journalling metadata only (think about it for a bit.. ;)
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-1768222758P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9uj7pcC3lWbTT17ARAt9JAJ99MWvoDqMqHc8VLEP47UwqM2UBfwCg3R50
E6zuFxqyJZnLKznnq/gufx4=
=2ubH
-----END PGP SIGNATURE-----

--==_Exmh_-1768222758P--
