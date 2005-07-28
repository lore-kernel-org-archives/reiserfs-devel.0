From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: newly created 8.5TB reiserfs fails fsck on amd64 and causes OOPS
Date: Thu, 28 Jul 2005 21:15:59 +0400
Message-ID: <42E912CF.9080605@namesys.com>
References: <20050719114736.GA25930@wurtel.net> <200507281756.06406.vitaly@namesys.com> <42E909A9.9070901@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25261-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42E909A9.9070901@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Hello

Jeff Mahoney wrote:
> Vitaly Fertman wrote:
> 
>>>Hello, 
>>>
>>>On Tuesday 19 July 2005 15:47, Paul Slootman wrote:
>>>
>>>>This is on a dual-CPU opteron system, with 2 x 3ware 9500 12-channel
>>>>SATA controllers for a total of 8.5TB; I've configured a RAID5 over each
>>>>3ware controller, and use linux md RAID0 over those two "devices".
>>>>There was an issue with linux md RAID0 for that size, but that's been
>>>>resolved (at least, the problem I had first :-)
>>>>
>>>>The device itself seems to work fine, as reiser4 works. I
>>>>wanted to compare to reiserfs 3.6, so I created a reiserfs, mounted it,
>>>>and tried to use it. Running bonnie++ on it caused an oops, apparently
>>>>in the reiserfs code:
>>>>
>>>>I rebooted (hard, as a shutdown didn't work...). After that, I tried a
>>>>mkfs followd by an fsck, which gives an error! Here's the console log:
>>>>
>>>>
>>>>satazilla:~# mkfs.reiserfs /dev/md13
>>>>mkfs.reiserfs 3.6.19 (2003 www.namesys.com)
>>>>
>>>>Guessing about desired format.. Kernel 2.6.12.2.raid0fixreiser4 is running.
>>>>Format 3.6 with standard journal
>>>>Count of blocks on the device: 2148377056
>>>
>>>ahh, indeed, this amount of blocks needs 65564 bitmap count,
>>>whereas there is only 16 bits field in the super block for 
>>>the bitmap count. in other words, this limits the reiserfs 
>>>size to: 65535 * BlockSize * 8 * Blocksize, for BlockSize 
>>>== 4K it is 8T. 
>>>
>>>the check for bitmap block count overflow seems to be missed 
>>>in progs. hmm, and our faq about 16Tb is not correct also...
> 
> 
> Out of curiousity, why is the number of bitmaps even needed if it can be
> calculated?
> 
Well, usually, at least for me, when you look at the code you wrote some time ago (8 years for example)
you always wonder "how me could write that".
So, reiserfs could go just fine without it.

> If that's truly the limiting factor, could we perhaps set s_bmap_nr = 0
> and calculate the number of bitmaps at mount time? The s_bmap_nr = 0
> would ensure that a mount of the filesystem on a kernel unaware of the
> larger size would fail since it would fail allocating memory to store
> the buffer heads.
> 
> It's not friendly, but neither is advertising a 16TB filesystem size,
> when there is a limit at 8TB on most systems.
> 
> -Jeff
> 
> --
> Jeff Mahoney
> SuSE Labs
