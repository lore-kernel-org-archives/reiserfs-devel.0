From: Chris Mason <mason@suse.com>
Subject: Re: Need some help on reiserfs failure
Date: 28 Oct 2002 08:17:55 -0500
Message-ID: <1035811075.1005.234.camel@tiny>
References: <1035562356.3711.30.camel@preston>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11807-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1035562356.3711.30.camel@preston>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Preston Lord <webmaster@t2.net>
Cc: reiserfs-list@namesys.com

On Fri, 2002-10-25 at 12:12, Preston Lord wrote:
> Hi List,
> 
> On my home pc I am running SuSE 8 Pro.
> I have my root partition using reiserfs.
> When I woke up this morning the computer was frozen and after rebooting
> it tells me there is no root partition defined. I pulled the hdd from
> the machine and slaved it into another SuSE 8 pc. If I use Yast2-
> Partition Utilities I can see the partitions are defined and the fs is
> still being listed as reiserfs on the failed root on the home hdd.
> 
> I tried using reiserfsck as follows:
> 
> resiserfsck --check /dev/hda4
> 
>  reiserfs_open: bread failed reading block 2
>  reiserfs_open: bread failed reading block 16

These two indicate some hardware issue.  reiserfs is unable to read from
the disk at all.  This doesn't mean your disk is gone, but you do need
to look further in your logs for hardware related issues.

Does the kernel detect the drive at all?  If so, please post the
relevant messages. 

-chris



