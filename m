From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: Re: Read only rootfs after reiserfsck
Date: Wed, 12 Nov 2003 03:35:26 +0100
Message-ID: <3FB19C6E.7030109@gmx.net>
References: <000001c3a707$58db90e0$7dea1d97@delta> <3FAEA7CA.4000301@gmx.net> <011b01c3a89d$28e03520$0100007f@delta>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16053-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <011b01c3a89d$28e03520$0100007f@delta>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paolo Azzaroli <paoloazzaroli@libero.it>, ReiserFS List <reiserfs-list@namesys.com>

Can anyone else shed some light on the issue?

Thanks,
Carl-Daniel


Paolo Azzaroli wrote:
> Dear Sir:, I apreciated Your suggestion, I tried it,  but it doesn't
> fix my problem.
> Anyway, many thank for your kindly attention
> Paolo Azzaroli
> 
> ----- Original Message -----
> From: "Carl-Daniel Hailfinger" <c-d.hailfinger.kernel.2003@gmx.net>
> To: "Paolo Azzaroli" <paoloazzaroli@libero.it>
> Cc: <reiserfs-list@namesys.com>
> Sent: Sunday, November 09, 2003 9:47 PM
> Subject: Re: Read only rootfs after reiserfsck
> 
> 
> 
>> Paolo Azzaroli wrote:
>> 
>>> Dear Sir, My Linux box has a distro SuSE 8.1, and its HD has 1 swap
>>> partition, 3 reiserfs partitions, apart from a NTFS partition (where
>>> resides Win2K).
>>> Some days ago the Linux box  filesystem had triubles, maybe because
>>> of not correct shutdown.
>>> After then I repaired the fs (reiserfsck --check etc . . . ); the
>>> check operation reported successfull.
>>> But when booting the Linux box, the linux root partitions is 
>>> "read-only"; the contents of /etc/mtab and /proc/mounts are
>>> different. I can mount the root partition (mount -n -o remount,rw 
>>> /dev/hda3), but attempt to mount/umount other partitions are
>>> frustated by messages as "already mounted or busy"/ "not mounted".
>> 
>> Delete all lines in /etc/mtab which reference filesystems other than
>> your root partition. That should fix it.

