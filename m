From: "Michael Konrad" <mkonrad@syr.edu>
Subject: reiser4 mount issue
Date: Tue, 02 Sep 2003 21:17:52 -0400
Message-ID: <sf55090d.092@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15520-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Compile of linux-2.6.0-test4 with reiser4 is good.=20
Compile of libaal-0.4.9 is good
Compile of reiser4fsprogs-0.4.12 is good.

mkfs.reiser4 /dev/hda8 is good.=20

When I issue the following command:

mount -t reiser4 /dev/hda8 /mnt/lfs  or
mount -t reiserfs /dev/hda8 /mnt/lfs=20

I get the following error:=20

mount: wrong fs type, bad option, bad superblock on /dev/hda8, or too many =
mounted file systems

cat /proc/filesystems=20

list both reiserfs and reiser4

Am I missing something simple here?

Thank you,
Michael


