From: Valdis.Kletnieks@vt.edu
Subject: Re: Plugin for corruption resistance?
Date: Fri, 18 Feb 2005 17:09:00 -0500
Message-ID: <200502182209.j1IM904m016607@turing-police.cc.vt.edu>
References: <e692861c05021110583585f84e@mail.gmail.com> <loom.20050215T213823-62@post.gmane.org> <42141928.7080608@slaphack.com> <200502171153.43403.chrivers@iversen-net.dk> <4215644C.4000602@slaphack.com> <200502180428.j1I4S92I019716@turing-police.cc.vt.edu>
            <e692861c0502180536270fcee2@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1108764540_6251P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 18 Feb 2005 08:36:51 EST."
             <e692861c0502180536270fcee2@mail.gmail.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_1108764540_6251P
Content-Type: text/plain; charset=us-ascii

On Fri, 18 Feb 2005 08:36:51 EST, Gregory Maxwell said:

> Tree hashes.
> Divide the file into blocks of N bytes. Compute size/N hashes. 
> Group hashes into pairs. Compute N/2 N' hashes, this is fast because
> hashes are small. Group N' hashes into pairs compute N'/2 N'' hashes
> etc.. Reduce to a single hash.

You get massively I/O bound real fast this way.  You may want to re-evaluate
whether this *really* buys you anything, especially if you're not using some
sort of guarantee that you know what's actually b0rked...

> In my initial suggestion I offered that hashes could be verified by a
> userspace daemon, or by fsck (since it's an expensive operation)...
> Such policy could be controlled in the daemon.
> In most cases I'd like it to make the file inaccessible until I go and
> fix it by hand.

You're still missing the point that in general, you don't have a way to tell whether
the block the file lived in went bad, or the block the hash lived in went bad.

Sure, if the file *happens* to be ascii text, you can use Wetware 1.5 to scan
the file and tell which one went bad.  However, you'll need Wetware 2.0 to
do the same for your multi-gigabyte Oracle database... :)

(And yes, I *have* seen cases where Tripwire went completely and totally bananas
and claimed zillions of files were corrupted, when the *real* problem was that
the Tripwire database itself had gotten stomped on - so it's *not* a purely
theoretical issue....

--==_Exmh_1108764540_6251P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCFmd8cC3lWbTT17ARAiH+AJ9b3eHNwI9xktimI4G6AcYEnZ7JCACdHWzj
dOy7dcYMytFf+nHMLfJ3BXw=
=4Bef
-----END PGP SIGNATURE-----

--==_Exmh_1108764540_6251P--
