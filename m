From: Linux PCH EDV <linux@pch-edv.com>
Subject: reiserfsck segmentation fault
Date: Thu, 22 Aug 2002 13:10:21 +0200
Message-ID: <1874477781.20020822131021@pch-edv.com>
Reply-To: Linux PCH EDV <linux@pch-edv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11285-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello all,

I just encountered a major problem with one of my
reiserfs-filesystems. I had to reinstall my SuSE 8.0-Linux over an
existing one (which had some problems that have nothing to do with the
problem described here). I told the setup not to format anything
rather leave all filesystems as they were and mount the root
filesystem "/" to the same partition as before. The setup wouldn't let
me enter a mountpoint for the important "data partition" (hdb3) formatted
with reiserfs, so I simply left it alone.
Everything seemed to be ok afterwards, after a reboot my old data
partition had been mounted under "/data2". I changed that by editing
"/etc/fstab". There I changed the mountpount from "/data2" to
"/server2" which was the mountpoint the partition had before the installation.
While applying the change to fstab with yast2 the system froze.
Therefore I had to reboot.
After that reboot, the system wouldn't recognize the partition
anymore. reiserfsck told me that it couldn't find any
reiserfs-partition on hdb3. So I rebuilt the superblock with
reiserfsck. I hope that I chose the right "version" from the ones that
reiserfsck offered me, at least I remembered that it used to be a
3.5-partition.
Now I try to use reiserfsck for rebuilding the tree.
I enter "reiserfsck --rebuild-tree /dev/hdb3"
It gives me a segmentation fault after saying
"Loading on-disk bitmap ..ok, 16828156 blocks marked used".
I am using reiserfsck 3.x.1b.
The harddisk is a Maxtor 4G160J8 with 160 gigabyte storage space. It
is supported by both the kernel (2.4.18) and the BIOS.

Can anyone help?

Thanks

Peter

