From: =?iso-8859-1?Q?Morten_B=F8geskov?= <morten+namesys.com@bogeskov.dk>
Subject: /dev/ram0 and reiserfs3
Date: Fri, 8 Oct 2004 15:10:15 +0200 (CEST)
Message-ID: <Pine.LNX.4.58L.0410081459020.21505@mail.digitell.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22025-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: reiserfs-list@namesys.com


Hello.. I've stumbled upon somthing wierd. and I couldn't see anything on=20
the mailing-list on this subject...

On a 2.6.8.1 stock kernel booted with ramdisk_size=3D32000:

# mkreiserfs -f -s 1024 /dev/ram0
mkreiserfs 3.6.11 (2003 www.namesys.com)

A pair of credits:
Alexander  Lyamin  keeps our hardware  running,  and was very  generous =20
to our
project in many little ways.

Chris Mason wrote the journaling code for V3,  which was enormously more=20
useful
to users than just waiting until  we could create a wandering log=20
filesystem as
Hans would have unwisely done without him.
Jeff Mahoney optimized the bitmap  scanning code for V3,  and performed=20
the big
endian cleanups.=20

Guessing about desired format.. Kernel 2.6.8.1 is running.
Format 3.6 with non-standard journal
Count of blocks on the device: 8000
Number of blocks consumed by mkreiserfs formatting process: 1043
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 1024 blocks (first block 18)
Journal Max transaction length 511
inode generation number: 0
UUID: b66c61ae-3c4d-4682-932c-ee01d0d8009e
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok

Tell your friends to use a kernel based on 2.4.18 or later, and especially =

not a
kernel based on 2.4.9, when you use reiserFS. Have fun.

ReiserFS is successfully created on /dev/ram0.
# dd if=3D/dev/ram0 of=3Dimage bs=3D1k
32000+0 records in
32000+0 records out
# mkdir mountpoint
# mount -o loop image mountpoint -t reiserfs
# umount mountpoint
# mount /dev/ram0 mountpoint -t reiserfs
mount: wrong fs type, bad option, bad superblock on /dev/ram0,
       or too many mounted file systems


I just don't get the difference between mounting a file from a loopback=20
device and mounting a ramdisk with the same content. Could somebody please
enlighten be to the subtle difference?

Yours
--
  Morten B=F8geskov (email: morten@bogeskov.dk)

I just got lost in thought... It was unfamiliar territory.
