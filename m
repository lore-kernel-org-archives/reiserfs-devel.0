From: Ookhoi <ookhoi@humilis.net>
Subject: Re: reiserfsck --rebuild-tree all-in-one problem.
Date: Mon, 3 Feb 2003 05:46:05 +0100
Message-ID: <20030203054605.V2964@humilis>
References: <063201c2cae9$8dfb69d0$0201010a@brian>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12608-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <063201c2cae9$8dfb69d0$0201010a@brian>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Chu <chub@dataroot.hn.org>
Cc: reiserfs-list@namesys.com

Brian Chu wrote (ao):
>     Last friday when I went to upgrade my server, I noticed that there had
> been a lot of kernel messages on my server that were saying that one
> partition was spewing this:
> 
> Jan  5 13:48:14 simmy kernel: hde: dma_intr: status=0x51 { DriveReady
> SeekComplete Error }
> Jan  5 13:48:14 simmy kernel: hde: dma_intr: error=0x40 {
> UncorrectableError }, LBAsect=91887, high=0, low=91887, sector=91824
> Jan  5 13:48:14 simmy kernel: end_request: I/O error, dev 21:01 (hde),
> sector 91824
> Jan  5 13:48:14 simmy kernel: vs-13070: reiserfs_read_inode2: i/o failure
> occurred trying to find stat data of [7495 7710 0x0 SD]
> 
>     I checked it for this email just now and discovered that this problem
> has been persisting for at least one month (logrotate deleted the rest),
> which is surprising because I never had any problems with the hard drive for
> all this time.

But, it is a hardware problem.

>     Either way, after I was done upgrading my server, I figured I could run
> reiserfsck since it was a new reboot with 'reiserfsck --check /dev/hde1'
> (version 3.6.3) which proved to be fatal. 

It is better if you (always) try the latest reiserfsck version, which is
in 3.6.5-pre1 atm. 
ftp://ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.5-pre1.tar.gz

[cut]

>     mount ... weird. mount gives a different message now. mount was giving
> the same "mount: Not a directory" that the first computer had given before
> this last run of reiserfsck.

Can you do an ls -ld on /mnt ?

> simmy:~# mount -t reiserfs /dev/hdd1 /mnt
> Feb  2 13:41:00 simmy kernel: dev 16:41: Unfinished
> reiserfsck --rebuild-tree run detected. Please run
> Feb  2 13:41:00 simmy kernel: reiserfsck --rebuild-tree and wait for a
> completion. If that fails
> Feb  2 13:41:00 simmy kernel: get newer reiserfsprogs package
> Feb  2 13:41:00 simmy kernel: read_super_block: can't find a reiserfs
> filesystem on (dev 16:41, block 2, size 4096)
> mount: wrong fs type, bad option, bad superblock on /dev/hdd1,
>        or too many mounted file systems
> 
>     Any (quick) help will be appreciated. If any information is missing,
> please ask.

After you dd'ed the disk, you should see a lot of error messages in
dmesg. dd can't make a good copy of the fs due to that, so that's why
you need to use dd_rescue. dd_rescue will most likely not be able to
retreive all your data, but most likely most of it.

Of course you should not use the old disk anymore if you got your data
back.

In summary: try dd_rescue again, and fsck the target disk with the
newest reiserfsprogs.

I hope that works for you.
