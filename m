From: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Subject: Heuristic readahead for filesystems
Date: Wed, 11 Sep 2002 17:47:16 +0200
Message-ID: <3D7F6584.6B523B6C@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11417-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserfs List <reiserfs-list@namesys.com>

Hello,

I wonder wether Linux implements a kind of heuristic
readahead for filesystems:

If an application reads a directory with getdents() and if
in the past, it stat()ed a significant part of the directory
entries, it is likely that it will stat() every entry of
every directory it reads with getdents() in the future. Thus
readahead for the stat data could improve the perfomance,
especially if the stat data is located closely to each other
on disk.

If an application did a stat()..open()..read() sequence on a
file, it is likely that, after the next stat(), it will open
and read the mentioned file. Thus, one could readahead the
start of a file on stat() of that file.

Combined: If an application walks a directory tree and
visits each file, it is likely that it will continue up to
the end of that tree.

Example: See this diff strace:

stat64("linux/drivers/usb/net", {st_mode=3DS_IFDIR|0775,
st_size=3D400, ...}) =3D 0
stat64("linux-2.5.24/drivers/usb/net",
{st_mode=3DS_IFDIR|0775, st_size=3D400, ...}) =3D 0
open("linux/drivers/usb/net",
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) =3D 3
fstat64(3, {st_mode=3DS_IFDIR|0775, st_size=3D400, ...}) =3D 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         =3D 0
getdents64(0x3, 0x8057718, 0x1000, 0)   =3D 432
getdents64(0x3, 0x8057718, 0x1000, 0)   =3D 0
close(3)                                =3D 0
open("linux-2.5.24/drivers/usb/net",
O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) =3D 3
fstat64(3, {st_mode=3DS_IFDIR|0775, st_size=3D400, ...}) =3D 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         =3D 0
getdents64(0x3, 0x8057718, 0x1000, 0)   =3D 432
getdents64(0x3, 0x8057718, 0x1000, 0)   =3D 0
close(3)                                =3D 0
stat64("linux/drivers/usb/net/Config.help",
{st_mode=3DS_IFREG|0644, st_size=3D5230, ...}) =3D 0
stat64("linux-2.5.24/drivers/usb/net/Config.help",
{st_mode=3DS_IFREG|0644, st_size=3D5230, ...}) =3D 0
open("linux/drivers/usb/net/Config.help", O_RDONLY) =3D 3
open("linux-2.5.24/drivers/usb/net/Config.help", O_RDONLY) =3D
4
read(3, "CONFIG_USB_CATC\n  Say Y if you w"..., 4096) =3D 4096

read(4, "CONFIG_USB_CATC\n  Say Y if you w"..., 4096) =3D 4096

read(3, "ule ( =3D code which can be\n  inse"..., 1134) =3D 1134

read(4, "ule ( =3D code which can be\n  inse"..., 1134) =3D 1134

close(3)                                =3D 0
close(4)                                =3D 0
stat64("linux/drivers/usb/net/Config.in",
{st_mode=3DS_IFREG|0644, st_size=3D931, ...}) =3D 0
stat64("linux-2.5.24/drivers/usb/net/Config.in",
{st_mode=3DS_IFREG|0644, st_size=3D931, ...}) =3D 0
open("linux/drivers/usb/net/Config.in", O_RDONLY) =3D 3
open("linux-2.5.24/drivers/usb/net/Config.in", O_RDONLY) =3D 4

read(3, "#\n# USB Network devices configur"..., 4096) =3D 931
read(4, "#\n# USB Network devices configur"..., 4096) =3D 931
close(3)                                =3D 0
close(4)                                =3D 0
stat64("linux/drivers/usb/net/Makefile",
{st_mode=3DS_IFREG|0644, st_size=3D299, ...}) =3D 0
stat64("linux-2.5.24/drivers/usb/net/Makefile",
{st_mode=3DS_IFREG|0644, st_size=3D299, ...}) =3D 0
open("linux/drivers/usb/net/Makefile", O_RDONLY) =3D 3
open("linux-2.5.24/drivers/usb/net/Makefile", O_RDONLY) =3D 4
read(3, "#\n# Makefile for USB Network dri"..., 4096) =3D 299
read(4, "#\n# Makefile for USB Network dri"..., 4096) =3D 299
close(3)                                =3D 0
close(4)                                =3D 0
stat64("linux/drivers/usb/net/catc.c",
{st_mode=3DS_IFREG|0644, st_size=3D23960, ...}) =3D 0
stat64("linux-2.5.24/drivers/usb/net/catc.c",
{st_mode=3DS_IFREG|0644, st_size=3D23960, ...}) =3D 0
open("linux/drivers/usb/net/catc.c", O_RDONLY) =3D 3
open("linux-2.5.24/drivers/usb/net/catc.c", O_RDONLY) =3D 4
read(3, "/*\n *  Copyright (c) 2001 Vojtec"..., 4096) =3D 4096

read(4, "/*\n *  Copyright (c) 2001 Vojtec"..., 4096) =3D 4096

read(3, " long last_stats;\n\n\tu8 multicast"..., 19864) =3D
19864
read(4, " long last_stats;\n\n\tu8 multicast"..., 19864) =3D
19864
close(3)                                =3D 0
close(4)                                =3D 0
stat64("linux/drivers/usb/net/cdc-ether.c",
{st_mode=3DS_IFREG|0644, st_size=3D45669, ...}) =3D 0
stat64("linux-2.5.24/drivers/usb/net/cdc-ether.c",
{st_mode=3DS_IFREG|0644, st_size=3D45669, ...}) =3D 0
open("linux/drivers/usb/net/cdc-ether.c", O_RDONLY) =3D 3
open("linux-2.5.24/drivers/usb/net/cdc-ether.c", O_RDONLY) =3D
4
read(3, "// Portions of this file taken f"..., 4096) =3D 4096
read(4, "// Portions of this file taken f"..., 4096) =3D 4096
read(3, "SY;\n}\n\nstatic void write_bulk_ca"..., 41573) =3D
41573
read(4, "SY;\n}\n\nstatic void write_bulk_ca"..., 41573) =3D
41573
close(3)                                =3D 0
close(4)                                =3D 0


Diff only takes 2% CPU time for diffing two linux-kernel
trees on a AMD Duron 1 GHz, DMA enabled. Dumb readahead only
some blocks after the original block does not work here
well. Diff always switches between the kernel trees, and I
assume, the disk head seeks accordingly back and forth. If
the trees were read (at least partly) in parallel, I assume
that reading would be much faster. Hence the question.

Xu=E2n.
