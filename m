From: "Paolo Azzaroli" <paoloazzaroli@libero.it>
Subject: Read only rootfs after reiserfsck
Date: Sat, 8 Nov 2003 23:14:21 +0100
Message-ID: <000001c3a707$58db90e0$7dea1d97@delta>
Reply-To: "Paolo Azzaroli" <paoloazzaroli@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16028-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Dear Sir,
My Linux box has a distro SuSE 8.1, and its HD has
1 swap partition, 3 reiserfs partitions, apart from a NTFS partition(where
resides Win2K).
Some days ago the Linux box  filesystem had triubles, maybe because of not
correct shutdown.
After then I repaired the fs (reiserfsck --check etc . . . ); the check
operation reported successfull.
But when booting the Linux box, the linux root partitions is "read-only";
the contents of /etc/mtab and /proc/mounts
are different. I can mount the root partition (mount -n -o remount,rw
/dev/hda3), but
attempt to mount/umount other partitions are frustated by messages as
"already mounted or busy"/ "not mounted".

Something is wrong with reiserfsck ?
After reiserfsck should I  perform some other actions for repairing the fs
and leave it "read-write"  ?
Or there is some trouble with the mount command?

Best Regards

Paolo Azzaroli

