From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: Read only rootfs after reiserfsck
Date: Sun, 09 Nov 2003 21:47:06 +0100
Message-ID: <3FAEA7CA.4000301@gmx.net>
References: <000001c3a707$58db90e0$7dea1d97@delta>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16029-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000001c3a707$58db90e0$7dea1d97@delta>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paolo Azzaroli <paoloazzaroli@libero.it>
Cc: reiserfs-list@namesys.com

Paolo Azzaroli wrote:
> Dear Sir,
> My Linux box has a distro SuSE 8.1, and its HD has
> 1 swap partition, 3 reiserfs partitions, apart from a NTFS partition(where
> resides Win2K).
> Some days ago the Linux box  filesystem had triubles, maybe because of not
> correct shutdown.
> After then I repaired the fs (reiserfsck --check etc . . . ); the check
> operation reported successfull.
> But when booting the Linux box, the linux root partitions is "read-only";
> the contents of /etc/mtab and /proc/mounts
> are different. I can mount the root partition (mount -n -o remount,rw
> /dev/hda3), but
> attempt to mount/umount other partitions are frustated by messages as
> "already mounted or busy"/ "not mounted".

Delete all lines in /etc/mtab which reference filesystems other than your
root partition. That should fix it.


HTH,
Carl-Daniel

