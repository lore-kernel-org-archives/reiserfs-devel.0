From: ch4os <chaosworldwide@gmail.com>
Subject: unmountable partition
Date: Thu, 30 Jun 2005 10:02:01 -0600
Message-ID: <64769d96050630090276093f40@mail.gmail.com>
Reply-To: ch4os <chaosworldwide@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Greetings,=20

Had a Mirrored Drive slightly unclipped for a few days. SLES 9 AMD64
It blew the controller, and syncronized the bad blocks... the sda2
partition became unmountable.

I have tried all of the reiserfsck options, with no luck. even the
badblocks file.
Always failing on 8210...=20

I have dd_rhelp the partition to an external usb partition.
and have dd the partition of a another (sdc2) for diagnostics.
debugreiserfs -B bb.txt /dev/sdc2
states no bad blocks in the copy of the partition
but that is also unmountable and the reiserfsck --rebuild-tree says:
bread: End of file, cannot read the block (17384335).

I believe that the partition is unrecognized as a reiserfs.

How do I recreate the header to specify the filesystem type?

>felix:/mnt # dd if=3D/mnt/disk.dump of=3Dtempfile bs=3D1024 count=3D1
>felix:/mnt # mount -t reiserfs -o loop tempfile /mnt/recover
>mount: wrong fs type, bad option, bad superblock on /dev/loop0,
>       or too many mounted file systems
>       (could this be the IDE device where you in fact use
>       ide-scsi so that sr0 or sda or so is needed?)

I'd compiling the Coroners Toolkit now...

Thanks
