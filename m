From: Valdis.Kletnieks@vt.edu
Subject: Re: missing files?
Date: Wed, 02 Feb 2005 00:33:07 -0500
Message-ID: <200502020533.j125X7U2016595@turing-police.cc.vt.edu>
References: <1107318853.18354.214122527@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1107322387_14992P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 01 Feb 2005 23:34:13 EST."
             <1107318853.18354.214122527@webmail.messagingengine.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: michael@styer.net
Cc: reiserfs-list@namesys.com

--==_Exmh_1107322387_14992P
Content-Type: text/plain; charset=us-ascii

On Tue, 01 Feb 2005 23:34:13 EST, michael@styer.net said:

> All seemed fine, until I noticed that my nightly cron job that runs the
> Gentoo emerge program to check for software updates was failing. After
> investigating I discovered that a number of directories were missing.
> That is, they appeared when using 'ls' with no options, but using 'ls
> -l' produced multiple 'No such file or directory' results. 
> 
> Now it appears I'm unable to remove those directories. 'rm -f
> <filename>' doesn't work, and rmdir reports the directory isn't empty. I
> can rename the directory, but that doesn't fix the apparent corruption
> in the filesystem. Also, fsck.reiser4 doesn't report any problems.
> 
> Can anyone explain why this might have happened and what I might be able
> to do to fix it?

Sounds like wonky file permissions on the directory - lack of write permission
*on the directory* will cause 'rm' to fail.  Remember that renaming the directory
requires write permission *on it's parent*, not on itself.

(Note the following is on an ext3 filesystem)

[~]2 mkdir /tmp/foo-bar
[~]2 touch /tmp/foo-bar/baz 
[~]2 chmod 555 /tmp/foo-bar/   
[~]2 rm /tmp/foo-bar/baz
rm: cannot remove `/tmp/foo-bar/baz': Permission denied
[~]2 mv /tmp/foo-bar /tmp/foo-bar-quux
[~]2 rm /tmp/foo-bar-quux/baz
rm: cannot remove `/tmp/foo-bar-quux/baz': Permission denied
[~]2 ls /tmp/foo-bar-quux/baz
/tmp/foo-bar-quux/baz
[~]2 ls -l /tmp/foo-bar-quux/baz
-rw-r--r--  1 valdis valdis 0 Feb  2 00:25 /tmp/foo-bar-quux/baz
[~]2 ls -l /tmp/foo-bar-quux
total 1
-rw-r--r--  1 valdis valdis 0 Feb  2 00:25 baz
[~]2 chmod 400 /tmp/foo-bar-quux 
[~]2 ls -l /tmp/foo-bar-quux
total 0
?---------  ? ? ? ?           ? baz
[~]2 chmod 100 /tmp/foo-bar-quux
[~]2 ls -l /tmp/foo-bar-quux
ls: /tmp/foo-bar-quux: Permission denied
[~]2 ls -l /tmp/foo-bar-quux/baz
-rw-r--r--  1 valdis valdis 0 Feb  2 00:25 /tmp/foo-bar-quux/baz
[~]2 ls -ld /tmp/foo-bar-quux/   
d--x------  2 valdis valdis 1024 Feb  2 00:25 /tmp/foo-bar-quux/

Bad umask/chmod? (Note that some shells and scripting languages do
very different things with 'umask 22' and 'umask 022', and 'chmod 600'
and 'chmod 0600'....)

--==_Exmh_1107322387_14992P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCAGYTcC3lWbTT17ARAqduAJ0UITyPSvRkUX+EW9nObo2Lvca+IACdGwQp
KR9MPmHdEE6DWg0vKt8/sfM=
=kO8G
-----END PGP SIGNATURE-----

--==_Exmh_1107322387_14992P--
