From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Booting problem from root reiser4 after new kernel
Date: Mon, 5 Dec 2005 14:21:10 +0300
Message-ID: <200512051421.11088.vitaly@namesys.com>
References: <1133630764.2915.8.camel@mercury>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27193-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1133630764.2915.8.camel@mercury>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Charles Johnston <charles@infoplatter.com>
Cc: reiserfs-list@namesys.com

On Saturday 03 December 2005 20:26, Charles Johnston wrote:
> I've been keeping quite up-to-date with new kernels, so I compiled
> 2.6.15-rc4 plus the reiser4 patches from 2.6.15-rc3-mm1 plus the
> reiser4-fix-fsync.patch.
> 
> I'm using grub 0.97 with the 20050808 reiser4 patch.
> 
> Put the new kernel in /boot, modified /boot/grub/menu.lst for it,
> rebooted, and got the following error, after "Uncompressing Linux":
> 
> ran out of input data
> 
> system halted
> 
> 
> So, after trying different things to no avail, I just made another copy
> of the kernel file, and it booted fine from that.  I'm thinking it's
> something to do with the way the original file is layed out on disk, and
> grub w/ reiser4 is having trouble with it.

do you still fail to boot with that kernel? would you run:
	debugfs.reiser4 -P <device> | bzip2 -c > <device>.bz2
on <device> which the kernel file sits in and provide it to 
me for downloading. Then I will be able to debug the problem.
 
> What's the best way to read off the meta-data for just that one file?
> I've wanted to contribute something to Reiser4 development for a while
> now.  

grub debugging is needed here, if libreiser4 reads the file correctly.

probably reiser4progs/demos/busy, the 'cp' command, can reveal the 
problem too.

> Perhaps I can figure out what's causing this boot problem and fix
> it. 

it would be probably better to check first that the problem is not 
fixed yet.

-- 
Vitaly
