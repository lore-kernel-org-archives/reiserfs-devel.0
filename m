From: Milan =?ISO-8859-1?Q?Holz=E4pfel?= <lists@mjh.name>
Subject: reiser4: traverse_tree (fs/reiser4/search.c:755)[nikita-1481]:
 WARNING: Too many iterations
Date: Wed, 25 Aug 2004 15:29:21 +0200
Sender: news <news@sea.gmane.org>
Message-ID: <20040825152921.6cfa3493.lists@mjh.name>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20502-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

I've started building a new gentoo system (on my new Athlon64, but since
there is some stupid binary only driver by some even more stupid company
as usual x86-arch) and I'd like to make heavy use of Reiser4.  These are
my partitions:

| /dev/sd/c0b0t0u0p8    999M  7.7M  992M   1% /mnt/gentoo
| /dev/sd/c0b0t0u0p12   130M   13K  123M   1% /mnt/gentoo/boot
| /dev/sd/c1b0t0u0p16   254M  112K  254M   1% /mnt/gentoo/home
| /dev/sd/c1b0t0u0p8    999M  148K  999M   1% /mnt/gentoo/opt
| /dev/sd/c1b0t0u0p15   157M  108K  157M   1% /mnt/gentoo/root
| /dev/sd/c0b0t0u0p13   127M  108K  127M   1% /mnt/gentoo/tmp
| /dev/sd/c0b0t0u0p11   3.9G   33M  3.9G   1% /mnt/gentoo/usr
| /dev/sd/c1b0t0u0p11   3.0G  477M  2.5G  16% /mnt/gentoo/usr/src/pkg
| /dev/sd/c1b0t0u0p12   246M  112K  246M   1% /mnt/gentoo/usr/portage
| /dev/sd/c0b0t0u0p10   4.9G  296K  4.9G   1% /mnt/gentoo/usr/portage/pkg
| /dev/sd/c1b0t0u0p10   4.9G  296K  4.9G   1% /mnt/gentoo/usr/portage/tmp
| /dev/sd/c1b0t0u0p13   187M  644K  186M   1% /mnt/gentoo/var
| /dev/sd/c1b0t0u0p14   403M  124K  403M   1% /mnt/gentoo/var/tmp

/boot is ext2, everything else Reiser4.  Yesterday I unpacked a stage1
tarball, and did a bootstrap without any problems in sight.  (this means
gcc, glibc, binutils and a few others things were compiled and installed
and used afterwards.)

Today I wanted to go on with emerge system (which builds installs all the u=
sual
systems utilites, like grep, make etc) but I ran into the following
problem:  CPU usage goes up to 100% (system) and I get the following in
the syslog: (this is with all debugging options except the memory copy
one enabled)

| Aug 25 13:30:22 bombax reiser4[portageq(7214)]: traverse_tree (fs/reiser4=
/search.c:755)[nikita-1481]:
| Aug 25 13:30:22 bombax code: -2 at fs/reiser4/search.c:1305
| Aug 25 13:30:22 bombax WARNING: Too many iterations: 128
| Aug 25 13:30:22 bombax key: (11473:4:6c642e736f2e63:0:12b28:1000)[file bo=
dy]
| Aug 25 13:30:22 bombax reiser4[portageq(7214)]: traverse_tree (fs/reiser4=
/search.c:755)[nikita-1481]:
| Aug 25 13:30:22 bombax code: -2 at fs/reiser4/search.c:1305
| Aug 25 13:30:22 bombax WARNING: Too many iterations: 256
| Aug 25 13:30:22 bombax key: (11473:4:6c642e736f2e63:0:12b28:1000)[file bo=
dy]
| Aug 25 13:30:22 bombax reiser4[portageq(7214)]: traverse_tree (fs/reiser4=
/search.c:755)[nikita-1481]:
| Aug 25 13:30:22 bombax code: -2 at fs/reiser4/search.c:1305
| Aug 25 13:30:22 bombax WARNING: Too many iterations: 512
| Aug 25 13:30:22 bombax key: (11473:4:6c642e736f2e63:0:12b28:1000)[file bo=
dy]

(it continues until I press the reset button - killing the process hangs
the kill process and shutdown wants to sync, which hangs too. In addtion
ps aux hangs when printing all the processes when this has happended.)

Kernel have been a few now, amongst others 2.6.8.1-mm4, fsck after the
last reset with this kernel shows all partitions are consistent.

So far I have replaced the /usr/portage and the /var filesystem with
reiserfs v3.6, but no change.  (/usr/portage is where gentoo's portage
system stores its ebuilds which describe how packages are built, and in
/var there is some cache of portage consisting of many small files)  I
also re-mkfs-d /usr and still the same.

Now I have no idea what to, also since the message doesn't give me any
pointer which fs it occured on.=20

Since I'll leave Friday for two weeks and I'd like to have that machine
up and running ASAP (school starts again after these two weeks...)  I
think I'll stick with ReiserFS v3.6 for now.  (but fortunately all these
partitions are on two brand-new 120 GB disks so I'll have plenty of
space to move things around...)=20

One more note:  I'm not using gentoo's usual "stable" branch here but a
more or less unofficial profile which uses gcc 3.4 (which isn't marked
as stable for x86) and some version of glibc 2.3.4 which isn't marked
stable for x86 so far (a few olders are) so this is not a usual
environment, but I don't think any user space app should be able to
cause such a kind of a lock, shouldn't it?

Regards,
Milan

- --=20

                   Milan Holz=E4pfel alias jagdfalke alias jag

Meine eMail-Adresse ist hier zu              You can find my eMail-address
                      finden:                here:
Kontaktinfos sowie                                   Contact infos as well =
as
=D6ff GnuPG-Schl=FCssel    <URL:http://con.mjh.name/>    GnuPG Public Key
GnuPG Fingerabdruck     4C8A 5FAF 5D32 6125 89D1     GnuPG Fingerprint
                        0CE5 DB0C AF4F 6583 7966


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBLJQx2wyvT2WDeWYRAgr8AJ0Wmyf97mUjkXW+WmHev9pfYlrDVQCfZXo8
zDZhNZovsfUQ3W3CdX5jMSI=3D
=3D7t1F
-----END PGP SIGNATURE-----

