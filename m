From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiaserfsck core dumps
Date: Mon, 12 Jan 2004 13:15:09 +0300
Message-ID: <200401121315.09707.vitaly@namesys.com>
References: <4001D0BA.5020604@wisc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16452-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4001D0BA.5020604@wisc.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "B. J. Zolp" <bjzolp@wisc.edu>, reiserfs-list@namesys.com

On Monday 12 January 2004 01:39, B. J. Zolp wrote:
> I have a LVM partition that I cannot seem to mount anymore.  Mount tells
> me the standard "Too many mounted files systems.... " message.  So I
> decided to run reiserfsck on it, well when i do that it soon crashes
> with this output:
>
> [root@orion root]# reiserfsck /dev/vg0/logical0
> reiserfsck, 2002 - reiserfsprogs 3.6.3

Please update the version of reiserfsprogs.

> Will read-only check consistency
> of the filesystem on /dev/vg0/logical0
> Will put log info to 'stdout'
>
> Do you want to run this program?[N/Yes] (note need to type Yes):Yes
> ###########
> reiserfsck --check started at Sun Jan 11 15:19:58 2004
> ###########
>
> bread: Cannot read a block # 119472128.

Do you see anything related in the syslog? Looks like a bad block
or an access beyond end of device.

> Aborted (core dumped)
>
>
>
> Now, I am pretty sure the LVM is intact, all the drives are added
> correctly and all that is ok.  I ran badblocks on the partition and it
> gave me a list of about ~1000 badblocks.  Is there a way I can use this
> list of blocks to my advantage to recover this partition, I would like
> to get data from it.
>
>
> Thanks

-- 
Thanks,
Vitaly Fertman


