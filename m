From: Valdis.Kletnieks@vt.edu
Subject: Re: Directory updates in filesystems
Date: Fri, 29 Oct 2004 12:38:13 -0400
Message-ID: <200410291638.i9TGcDqd028755@turing-police.cc.vt.edu>
References: <1098955408.29128.TMDA@h34.zynet2.co.uk>
            <4181D47A.9050609@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1774382132P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22214-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 29 Oct 2004 00:26:18 CDT."
             <4181D47A.9050609@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Simon Waters <simonw@zynet.net>, reiserfs-list@namesys.com

--==_Exmh_-1774382132P
Content-Type: text/plain; charset=us-ascii

On Fri, 29 Oct 2004 00:26:18 CDT, David Masover said:

> If this is about locking not working well with NFS, why not ensure that
> the directory itself is owned by root and read-only before attempting?
> Wait -- don't answer that...

No, this is a different problem.

Imagine a directory with 10K files called 0001, 0002, 0003, .... , 9999.
You start a 'readdir()' loop, and get to 5497 or so.  At this point,
another process removes 1260 through 1265, and then another process renames 8534 to
1263, putting it in the slot just vacated - and you reach the end of
the readdir() loop never seeing that file.

> | Are there any file systems that fully address this issue, or POSIX
> calls that
> | guaranteed to make an atomic readdir, without specific locking, or must a
> | lock be obtained on the directory to ensure that the read is
> consistent. I
> | think that locking is needed in the application if complete
> consistency is
> | required because the underlying behaviour of the OSes/filesystems is so
> | variable in this regard, but I'd be interested in understanding what
> | characteristics a filesystem would have to have to avoid this.
> 
> Maybe an atomic readdir operation?  Does reiser4 do atomic reads?

Do you *REALLY* want to lock the *entire* dir (probably in memory, which
can hurt for directories with 10Ks or 100Ks entries, which is where the
problem is most evident)?  Even if it's not locked in memory, the mere
locking against updates can be *painful* performance-wise.

> I know reiser4 (or at least should by 4.1) have a sys_reiser4 api which
> does atomic write operations.  That is:  application starts the
> transaction, does a bunch of writes, ends the transaction.  If at any
> point there is a failure, filesystem tells application to roll back.

Atomic operations don't help you here, unless you're willing to take a
locking performance hit.  Remember that rename() is *already* atomic (at least
from other process's viewpoint), and you have the "rename into a slot
you've passed" problem mentioned above...


> This alows read-only access, such as a web server, to operate on
> slightly stale "snapshots" as this would create.  When faced with a
> decision of:
> 
> - - serving a slightly stale page immediately
> - - making users wait for a write of a newer version to complete
> - - serving a half-written newer version
> 
> I am sure most web admins would choose the first option, which is what
> they would get if the pages were being updated with vim.  The difference
> is that the filesystem solution works on larger units than single files.

The problem is that if you're a mail server, you probably *don't* want to
be sending a slightly stale version of the mail that just got queued.  There,
the only realistic option is your "make users wait" - which may be intolerable
when you're trying to do millions of transactions an hour...

--==_Exmh_-1774382132P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBgnH0cC3lWbTT17ARAh4HAJ48UiLcrG/JJPr9xUHSTNvWEEOWTQCcDF0T
9QwWTQRvkyGgMp5IGCaCa44=
=nGG5
-----END PGP SIGNATURE-----

--==_Exmh_-1774382132P--
