From: Vadim <vadim@sheelab.dynodns.net>
Subject: ReiserFS partition detected as vfat
Date: Thu, 20 Jun 2002 19:21:14 +0200
Message-ID: <200206201921.26559.vadim@sheelab.dynodns.net>
Reply-To: vadim@hardison.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello, I'm having a really strange problem.

I installed Debian on one of my machines using the floppies with=20
the 2.4 kernel, and created a ReiserFS system on it. I think the=20
kernel used is 2.4.16. The installation went well, but on reboot=20
it failed to mount root and I got a panic. Kernel messages show=20
that it was attempted to be mounted as vfat. Unfortunately I=20
don't have that log anymore.

Now I'm moving the system to another disk, with reiserfs too. It=20
seems to work fine, but I'm using a 2.4.18 kernel without vfat=20
support, as I don't need it there. Here's what happens if I try=20
to mount the old disk:

rabbit:/mnt# mount /dev/hda1 hda
mount: fs type vfat not supported by kernel
rabbit:/mnt#=20

If I specify the file type it works:
rabbit:/mnt# mount -t reiserfs /dev/hda1 hda
rabbit:/mnt#=20


On my other computer, with kernel 2.4.18, where I do have vfat=20
support it seems it attempts mounting the reiserfs partition as=20
vfat as well:

FAT: bogus logical sector size 0
UMSDOS: msdos_read_super failed, mount aborted.
FAT: bogus logical sector size 0
FAT: bogus logical sector size 0
(USB messages)
reiserfs: checking transaction log (device 03:03) ...
Warning, log replay starting on readonly filesystem
reiserfs: replayed 24 transactions in 9 seconds
Using r5 hash to sort names
ReiserFS version 3.6.25
VFS: Mounted root (reiserfs filesystem) readonly.

I'm not sure if this is a reiserfs problem or a vfat one, but it=20
seems related at least. I won't have the disk from the "rabbit"=20
machine for long, so if you need a few sectors from it or=20
anything like that, please ask now.

Thanks in advance


- --=20
Vadim
<@chani> I *cannot* remember names. but I did memorize 214 digits=20
of pi once.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9Eg8SvCkUtBccqkoRAr/HAJ9q0R5HMLPHl934MZo9NyuYE9WXfgCeLeIl
jw2iguNzYQBAlDa8cOEnRiU=3D
=3DyOFw
-----END PGP SIGNATURE-----

