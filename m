From: Yury Umanets <umka@namesys.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Sun, 27 Jul 2003 18:13:34 +0400
Message-ID: <1059315214.25363.6.camel@haron.namesys.com>
References: <3F1EF7DB.2010805@namesys.com>
	 <1059062380.29238.260.camel@sonja>
	 <16160.4704.102110.352311@laputa.namesys.com>
	 <1059093594.29239.314.camel@sonja>
	 <16161.10863.793737.229170@laputa.namesys.com>
	 <1059142851.6962.18.camel@sonja>
	 <1059143985.19594.3.camel@haron.namesys.com>
	 <1059181687.10059.5.camel@sonja>
	 <1059203990.21910.13.camel@haron.namesys.com>
	 <1059228808.10692.7.camel@sonja>
	 <1059231274.28094.40.camel@haron.namesys.com>
	 <3F23D43C.9080607@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15072-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F23D43C.9080607@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Daniel Egger <degger@fhm.edu>, Nikita Danilov <Nikita@Namesys.COM>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

On Sun, 2003-07-27 at 17:31, Hans Reiser wrote:
> Yury Umanets wrote:
> 
> >On Sat, 2003-07-26 at 18:13, Daniel Egger wrote:
> >  
> >
> >>Am Sam, 2003-07-26 um 09.19 schrieb Yury Umanets:
> >>
> >>    
> >>
> >>>I think this is more then enough for running reiser4. Reiser4 is a linux
> >>>filesystem first of all, and linux is able to be ran on even worse
> >>>hardware then you have.
> >>>      
> >>>
> >
> >  
> >
> >>Linux is running just fine one the system, thanks. My question is
> >>whether reiserfs is suitable for flash devices. The chances to get some
> >>usable answers seem to be incredible low though...
> >>    
> >>
> >
> >Reiserfs cannot be used efficiently with flash, as it uses block size 4K
> >(by default) and usual flash block size is in range 64K - 256K.
> >

> This answer is incorrect.  The device driver will hide this from us, 
> slum squeezing will tend to write in large batches, and things will 
> probably work.  However, you should try it and see rather than theorize.

See my explanation in last emails. Also I have not just theorized. I
have been developing block device driver for MPIO players (Smart Card
based one). And reiserfs does not use squeezing on flush (and I've
spoken about reiserfs here).

> 
> >
> >Also reiserfs does not use compression, that would be very nice of it
> >:), because flash has limited number of erase cycles per block (in range
> >100.000) and it is about three times as expensive as SDRAM.
> >

> We have compression plugins that will be ready soon.  Go ask Edward in 
> the chair behind you what he does for a living.;-)

Yes, we have compression plugins in reiser4, but we have spoken about
reiserfs.

> 
> >
> >So, it is better to use something more convenient. For instance jffs2.
> >
> >But, if you are still want to use reiserfs for flash device, you should
> >do at least the following: 
> >
> >(1) Make the journal substantial smaller of size.
> >(2) Don't turn tails off. This is useful to prolong flash live.
> >
> >
> >Regards.
> >
> >  
> >
> He is asking about reiser4, not reiserfs V3.
-- 
We're flying high, we're watching the world passes by...

