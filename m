From: Posern <foo@posern.org>
Subject: rsync from reiser4 to ext3 caused 100% cpu load and unstoppable task :-)
Date: Tue, 29 Aug 2006 11:45:31 +0200
Message-ID: <20060829094531.GB9135@jolie.SPINNEN-NET>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Return-path: <reiserfs-list-return-29727-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi.

I don't know if this can help you to improve reiser4:

On a:
Linux jolie 2.6.17.8-reiser4-r3-jolie #1 Tue Aug 15 00:14:45 CEST 2006 i686=
 Intel(R) Pentium(R) 4 CPU 2.53GHz GNU/Linux

I did a:
rsync -avx --delete-before // /mnt/backup/root/

And as usual I had 3 rsync processes. One of them was in R+ state and at 99=
%/100% CPU load, the other two were sleeping.
I waited the first time for 20h and no change and rsync was still at the sa=
me file:

etc/mldonkey/actual/donkey.ini.tmp

So I decided to STOP this rsync:
    I tried to CTRL-C the rsync. It did not work.
    killall rsync did not work.
    killall -9 rsync, killed one process and left one zombie process (son o=
f the 99%-running process), but the running process was STILL in R+ running=
 ...
    init 6 told me that it was unable to remount / ro, because of my rsync =
process :-)
    So I had to pull the plug to stop it ...

The kernel-log from this time told me:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Aug 29 09:00:11 [kernel] [17180436.096000] kjournald starting.  Commit inte=
rval 5 seconds
Aug 29 09:00:11 [kernel] [17180436.096000] EXT3-fs warning: maximal mount c=
ount reached, running e2fsck is recommended
Aug 29 09:00:11 [kernel] [17180436.104000] EXT3 FS on sde6, internal journal
Aug 29 09:00:11 [kernel] [17180436.104000] EXT3-fs: mounted filesystem with=
 ordered data mode.
Aug 29 09:00:12 [kernel] [17180437.604000] reiser4[rsync(8618)]: present_lw=
_sd (fs/reiser4/plugin/item/static_stat.c:277)[]:
Aug 29 09:00:12 [kernel] [17180437.604000] WARNING: partially converted fil=
e is encountered
Aug 29 09:00:12 [kernel] [17180437.604000] reiser4[rsync(8618)]: present_lw=
_sd (fs/reiser4/plugin/item/static_stat.c:277)[]:
Aug 29 09:00:12 [kernel] [17180437.604000] WARNING: partially converted fil=
e is encountered
Aug 29 09:00:12 [kernel] [17180437.608000] reiser4[rsync(8618)]: present_lw=
_sd (fs/reiser4/plugin/item/static_stat.c:277)[]:
Aug 29 09:00:12 [kernel] [17180437.608000] WARNING: partially converted fil=
e is encountered
Aug 29 09:00:12 [kernel] [17180437.608000] reiser4[rsync(8618)]: present_lw=
_sd (fs/reiser4/plugin/item/static_stat.c:277)[]:
Aug 29 09:00:12 [kernel] [17180437.608000] WARNING: partially converted fil=
e is encountered
Aug 29 09:00:12 [kernel] [17180437.608000] reiser4[rsync(8618)]: present_lw=
_sd (fs/reiser4/plugin/item/static_stat.c:277)[]:
Aug 29 09:00:12 [kernel] [17180437.608000] WARNING: partially converted fil=
e is encountered
Aug 29 09:00:12 [kernel] [17180437.608000] reiser4[rsync(8618)]: present_lw=
_sd (fs/reiser4/plugin/item/static_stat.c:277)[]:
Aug 29 09:00:12 [kernel] [17180437.608000] WARNING: partially converted fil=
e is encountered
Aug 29 09:00:12 [kernel] [17180437.616000] reiser4[rsync(8618)]: present_lw=
_sd (fs/reiser4/plugin/item/static_stat.c:277)[]:
Aug 29 09:00:12 [kernel] [17180437.616000] WARNING: partially converted fil=
e is encountered
Aug 29 09:00:23 [su] Successful su for root by me
Aug 29 09:00:23 [su] + pts/6 me:root
Aug 29 09:00:23 [su(pam_unix)] session opened for user root by (uid=3D1001)
Aug 29 09:00:26 [kernel] [17180451.100000] reiser4[rsync(8618)]: present_lw=
_sd (fs/reiser4/plugin/item/static_stat.c:277)[]:
Aug 29 09:00:26 [kernel] [17180451.100000] WARNING: partially converted fil=
e is encountered
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This behaviour was reproducable after reboot.

Then I booted with the www.sysresccd.org v0.2.19 and did a fsck.reiser4 on =
this partition. It said I should run "fsck.reiser4 --build-fs".
Unfortunatly I don't have the output of this call (next time :-).

Then I booted into my gentoo linux again ... and now the rsync works fine.


Greetings,

K. Posern

--=20
+-------------------------------------------------------------+
   K. Posern
   voicebox & phone  +49 (0)6421 - 13 5 75
   mobile phone      +49 (0)6421 - 917 963
+-------------------------------------------------------------+

Ich bin eine Fusszeile. Wenn ich gross bin, moechte ich ein Roman werden.

--=20
+-------------------------------------------------------------+
   K. Posern
   voicebox & phone  +49 (0)6421 - 13 5 75
   mobile phone      +49 (0)6421 - 917 963
+-------------------------------------------------------------+

Ich bin eine Fusszeile. Wenn ich gross bin, moechte ich ein Roman werden.


--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFE9Ay73Lt2OxO8u5URArO9AJ9nflulCHTnpKiZDYIbZsIj1uIIKQCfY62l
OjRPDGpDZNmLaPHDQwr4P4M=
=us+v
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
