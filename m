From: Shawn Rutledge <e_cloud@yahoo.com>
Subject: Re: ReiserFS on a flash device?
Date: Sat, 26 Jul 2003 17:03:01 -0700
Sender: Shawn Rutledge <rutledge@ecloud.org>
Message-ID: <20030727000301.GE894@ecloud.org>
References: <200307261640.13629.swsnyder@insightbb.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15057-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200307261640.13629.swsnyder@insightbb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I wanted to use ReiserFS for an embedded system, but on a 32 or 64 meg CF
card, v3 takes up too much of it for a journal, so it wasn't practical.
Is there a way to make the journal much smaller, or have it grow
on-demand rather than being fixed-size?  In practice the CF card won't 
be written to very much (for longevity reasons), but I don't ever want 
an embedded system to waste time fscking itself and prompting what to 
do about any errors; and at the same time don't see why it should be 
required to be a read-only filesystem, as is often done, because it makes
the occasional upgrade harder.  And apparently JFFS2 is only for simple 
memory-mapped FLASH chips without built-in write-balancing like CF cards 
have.

I use the mainstream ReiserFS in Linus' kernels on all my home machines
and love it.  It's so fast and stable as a rock, and the only problems 
I've had were hardware-related.

On Sat, Jul 26, 2003 at 04:40:13PM -0700, Steve Snyder wrote:
> I was taken aback by Yury Umanets' recent suggestion 
> (http://groups.google.com/groups?hl=en&lr=lang_en&ie=UTF-8&safe=off&th=d50aa0bf6c7f26d0&seekm=1059231274.28094.40.camel%40haron.namesys.com.lucky.linux.kernel#link11) 
> that ReiserFS is not an appropriate for a flash device.
> 
> I am currently using it (via Linux kernel v2.4.21) on an E-Disk 
> (http://www.bitmicro.com/products_edisk_35_scsiw.php) flash device as the 
> front-end of a low-traffic Squid Web cache.  The Squid experts recommend 
> the use of ReiserFS (with the notail option) for it's superior 
> performance in handling lots of small files.  I understand that flash has 
> a finite number of write cycles, but for this application performance is 
> critical, and disk I/O (access times, not STR) is the bottleneck in Squid 
> performance.
> 
> A quote from the post referred to above:
> 
> >But, if you are still want to use reiserfs for flash device, you should
> >do at least the following: 
> >
> >(1) Make the journal substantial smaller of size.
> >(2) Don't turn tails off. This is useful to prolong flash live.
> 
> More detail, please?  How is journal size a factor?  How does notails 
> reduce flash longevity?
> 
> Thanks.
> 
> 

-- 
  _______                                                Shawn T. Rutledge
 (_  | |_)                      e_cloud@yahoo.com * http://ecloud.org:8080
 __) | | \________________________________________________________________
