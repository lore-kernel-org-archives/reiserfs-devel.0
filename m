From: Valdis.Kletnieks@vt.edu
Subject: Re: Reserved Blocks
Date: Mon, 16 Sep 2002 10:50:53 -0400
Message-ID: <200209161450.g8GEorM4003750@turing-police.cc.vt.edu>
References: <20020916102742.6538D2926@hofmann.snowcra.sh>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1925021114P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11473-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 16 Sep 2002 11:27:42 BST."
             <20020916102742.6538D2926@hofmann.snowcra.sh> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Sam Vilain <sam@vilain.net>
Cc: 'reiserfs-list' <reiserfs-list@namesys.com>

--==_Exmh_-1925021114P
Content-Type: text/plain; charset=us-ascii

On Mon, 16 Sep 2002 11:27:42 BST, Sam Vilain <sam@vilain.net>  said:
> How can I reserve space on a filesystem for the superuser?  There
> doesn't seem to be an option to mkreiserfs or reiserfstune for it.
> 
> Is this essential UNIX filesystem feature implemented?

"essential feature"?  Hardly.

The *ORIGINAL* reason for the Berkeley FFS doing the "10% reserve"
was to work around the fact that the original FFS code had severe fragmentation
issues if the filesystem ran over 90% full (but at under 90%, there were
enough free blocks usually available to not fragment TOO badly - the "knee"
in the performance curve seems to have been around 92-94% full).  As such,
this shouldn't be at all required for a modern filesystem, as it should be
hardened against fragmentation to start with.

A lot of sites have started abusing the "10% reserve" feature in order to
protect themselves from people hosing things up by filling the disk - these
are usually boxes that have "one big / filesystem" for everything.  I
suggest that this is a *BAD* practice, and that the *proper* protection
here is to have separate /, /usr, /var, /tmp and /home file systems.

If you're worried about security enough to not want users doing a
denial-of-service attack by filling the disk, then DON'T HAVE a world-writable
directory on a partition that will cause trouble if it gets full.

Among other things, if there's a world-writable directory on the same
filesystem, you get exposed to a whole raft of hard-link attacks that
simply Wont Work if (for example) /tmp is a separate filesystem.  You'd
be amazed how many tools would fail in interesting ways if you were able to
do 'ln /etc/passwd /tmp/totally-foobar' because they expect exactly one link
to the /etc/passwd inode.  And if you thought the average symlink attack was
bad, a hardlink is worse - root can stat() the temp file and say "Oh, it's OK,
I own it" and proceed to do Something Very Dumb...
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-1925021114P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9he/NcC3lWbTT17ARAjITAKDcrvbFeI5h6reXUBULB4XV+/uD4wCeLqZa
wQBxUI+Zc3iZroY4QonOEG0=
=8H+c
-----END PGP SIGNATURE-----

--==_Exmh_-1925021114P--
