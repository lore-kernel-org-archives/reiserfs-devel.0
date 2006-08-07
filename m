From: =?windows-1250?Q?Maciej_So=B3tysiak?= <pysiak.satriani@wp.pl>
Subject: Experimental Reiser4-enabled Ubuntu kernels ready for testing
Date: Mon, 7 Aug 2006 21:25:56 +0200
Message-ID: <1871286894.20060807212556@wp.pl>
Reply-To: =?windows-1250?Q?Maciej_So=B3tysiak?= <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29531-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hello,

as I said, I'd be doing this, so...

ftp://ubuntu.ae.poznan.pl/

There is a readme.txt file that says:
=3D=3D Description =3D=3D
This directory contains Ubuntu Linux kernel image packages with support
for Reiser4 (http://wiki.namesys.com)

=3D=3D Usage =3D=3D
1. download a desired kernel image
2. install the kernel:

$ sudo dpkg -i <downloaded_file>

3. reboot, let the new kernel boot
4. prepare a partition (eg. fdisk /dev/sdb)
5. get reiser4progs (mkfs.reiser4, fsck.reiser4, ...)=20

$ sudo apt-get install reiser4progs

6. make the filesystem:

$ mkfs.reiser4 /dev/sdb1

7. mount it:

$ mkdir /mnt/r4
$ mount /dev/sdb1 /mnt/r4

8. mount should show:
$ mount | grep reiser4
/dev/sdb1 on /r4 type reiser4 (rw)

9. lsmod | grep reiser4 shoud show:
reiser4               418392  1

10. Play!

=3D=3D Technical details =3D=3D
The images were built using Edgy Eft's build system on current ubuntu
GIT repository. The configurations of the kernels are the same as ubuntu
ships them + reiser4 option enabled as module.

The images come in a few flavours: 386,686,k7, server-bigiron, server.

=3D=3D Disclaimer =3D=3D
This is all experimental stuff. These are my first publicly available
kernel images. Tested *only* on my virtualized machine on Edgy Eft!

Please test and report. I am open to suggestions.

One more thing... If it breaks, don't sue me, my pet hamster is an
excellent attourney.

=3D=3D Contact =3D=3D
My name is Maciej So=B3tysiak

You can reach me at maciej(at)soltysiak(dot)com


