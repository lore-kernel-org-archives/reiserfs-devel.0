From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: reiserfs3 problem, need advice/guidance
Date: Thu, 21 Oct 2004 21:12:54 +0200
Message-ID: <200410212112.54822.christian.mayrhuber@gmx.net>
References: <1098375399.4177e0e70c104@webmail.highstream.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22120-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1098375399.4177e0e70c104@webmail.highstream.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 21 October 2004 18:16, brianmas@highstream.net wrote:
> I have a server vanilla 2.4.26 SMP kernel, Adaptec SCSI RAID5 w/ reiserfs, 
been
> running fine for about 9 months.
> 
> I recently (last 3 days) started doing some back ups with most current rsync
> (2.6.3), just reading from the disk in this machine writing to a remote
> machine. That's the only thing I can think of that's changed, besides added 
an
> ntp server but I am assuming that's not it. At the same time this rsync job 
was
> running there is a samba share I am reading from and translating data from, 
this
> job has been running since the machine was installed though never caused a
> problem.
> 
> this morning the machine locked up, still responded to pings but everything 
else
> seemed completely dead. Checking the error logs after reboot I see this:
> 
> 
> Oct 21 04:15:04 hsa10 kernel: sd(8,3):vs-13060: reiserfs_update_sd: stat 
data of
>  object [25333038 23882091 0x0 SD] (nlink == 1) not found (pos 33)
> Oct 21 04:15:04 hsa10 last message repeated 3 times
> Oct 21 04:15:04 hsa10 kernel: sd(8,3):PAP-12350: do_balance: insert_size == 
0, m
> ode == p
> Oct 21 04:15:04 hsa10 kernel:  <4>sd(8,3):vs-13060: reiserfs_update_sd: stat 
dat
> a of object [25333038 23882091 0x0 SD] (nlink == 1) not found (pos 33)
> Oct 21 04:15:04 hsa10 kernel: sd(8,3):vs-13060: reiserfs_update_sd: stat 
data of
>  object [25333038 23882091 0x0 SD] (nlink == 1) not found (pos 33)
> 
> and on and on until an hour and 40 minutes later when the logs end.
> 
> these numbers: [25333038 23882091 0x0 SD]  and vs-13060 do not change in the
> rest of the log.
> 
> there are other messages that aren't exactly like the above mixed in like:
> 
> Oct 21 04:18:00 hsa10 kernel: sd(8,3):PAP-5660: reiserfs_do_truncate: wrong
> result -1 of search for [25333038 23882091 0xfffffffffffffff DIRECT]
> 
> also I noticed all these retries happen at around 00 seconds after the 
minute
> (top of the minute)
> 
> So what should I do? what could cause this as well? We have a write cache
> (another situation where there can be this kind of error apparently dring 
power
> loss) on this server but it's also battery backed up so that shouldn't be an
> issue (according to what I read).
> 
> on reboot the dmesg spews:
> 
> reiserfs: found format "3.6" with standard journal
> reiserfs: checking transaction log (device sd(8,3)) ...
> for (sd(8,3))
> reiserfs: replayed 63 transactions in 0 seconds
> sd(8,3):Using r5 hash to sort names
> 
> I see some people who have gotten this type of error told
> to rebuild the filesystem, is that suggested in all cases? I don't want to
> have to do that if it's not needed. We do have back ups but even so ...
> 
> the server is rebooted and seems to be running fine now.
> 
> Any help is appreciated.
> 
> brian
> 

Power loss + enabled write cache should not be a problem if the scsi 
controller has a battery pack. That's what it's there for.

Try to reiserfsck the filesystem with the most recent tools available at:
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.gz

You can check the version you owe, with:
# reiserfsck -V

To repair, first umount the fs or remount it read only and do:
# reiserfsck --check /dev/sda3

After this run, reiserfsck will suggest a method of repair which you
should follow. If --fix-fixable is sufficient it will suggest it, but
if it cannot you'll have to use --rebuild-tree.

Note: --rebuild-tree will find files on vmware images or loopback files
  that contain reiserfs filesystems, because the reiserfs design lacks
  the support of per filesystem unique keys.

-- 
lg, Chris

