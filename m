From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Partial data loss with reiserfs3
Date: Mon, 14 Feb 2005 15:44:34 +0300
Message-ID: <200502141544.34513.vitaly@namesys.com>
References: <1108315756.420f8e6ce67b0@webmail.vu.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1108315756.420f8e6ce67b0@webmail.vu.lt>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Laurynas Biveinis <Laurynas.Biveinis@mif.vu.lt>, reiserfs-list@namesys.com

On Sunday 13 February 2005 20:29, Laurynas Biveinis wrote:
> Hello,
>
> I was trying to move data from my NTFS partition to Linux (Fedora Core
> 3).   I had 2GB ext3 partition for /home. After copying some files from
> NTFS partition to /home and successfully shrinking NTFS partition by
> 4GB I wanted to enlarge my /home. Ext3 does not support partition
> resize and move there, so I have decided to switch /home to ReiserFS
> v3 (That's the version available for FC3)
>
> I've created 4GB Reiser partition (/dev/hda6) and moved data there from
> old /home (/dev/hda7):
> umount /home
> mkdir /home.old
> mount /dev/hda7 /home.old
> mount /dev/hda6 /home
> cd /home.old
> find . -depth -print0 | cpio --null -pvd /home
>
> It worked OK (as in "cpio did not fail and I could see my directories
> and files")
>
> Then I deleted my old /dev/hda7, and tried to enlarge /dev/hda6 to take
> its space - by resizing partition, then by resizefs.reiserfs. Resizefs
> complained about "Error: Can't resize filesystem outside the device."
> no matter what I size I would try to expand it, and with '-f' option
> too.  It occured to me that perhaps reboot might be required there, so
> I rebooted. Bingo, after reboot resizefs enlarged partition to the size
> I wanted. Reboot once again and try to login with ordinary user (whose
> home is on that partition).


reboot is required between repartitioning a drive and starting to use 
moved/created partitions. without that the kernel may continue to use
old partition table. so it would be great to recall step-by-step history 
of your copings, removes, repatitionings and reboots.


> Login got to the point of KDE "Restoring session state" and then PC
> hanged. Hmm. Reboot and retry login with non-root user. The same.
> Reboot and log-in as root.
>
> [root@laurynas-pc ~]# umount /home
> [root@laurynas-pc ~]# reiserfsck /dev/hda6
>
> [See Output 1 below]
>
> OK, so it says --rebuild-tree...
>
> [root@laurynas-pc ~]# reiserfsck --rebuild-tree /dev/hda6
>
> [See Output 2 below]
>
> At this point I remounted partition read-only and looked around. And
> that's it, part of my data is at lost+found, and part is gone.
> Here was a typical mount /dev/hda6 output to syslog:
> -----------------
> Feb 13 18:04:58 laurynas-pc kernel: ReiserFS: hda6: found reiserfs
> format "3.6" with standard journal
> Feb 13 18:04:58 laurynas-pc kernel: ReiserFS: hda6: using ordered data
> mode
> Feb 13 18:04:58 laurynas-pc kernel: ReiserFS: hda6: journal params:
> device hda6, size 8192, journal first block 18, max trans len 1024, max
> batch 900, max commit age 30, max trans age 30
> Feb 13 18:04:58 laurynas-pc kernel: ReiserFS: hda6: checking transaction
> log (hda6)
> Feb 13 18:04:58 laurynas-pc kernel: ReiserFS: hda6: replayed 17
> transactions in 0 seconds
> Feb 13 18:04:58 laurynas-pc kernel: ReiserFS: hda6: Using r5 hash to
> sort names
> ---------------
>
> And one more line looks particularly interesting:
> ---------------
> Feb 13 18:08:05 laurynas-pc kernel: ReiserFS: hda6: warning: vs-4080:
> reiserfs_free_block: free_block (hda6:32998)[dev:blocknr]: bit already
> cleared
> ---------------
>
> Is there anything I can do to look for my other missing data?

-- 
Thanks,
Vitaly Fertman

