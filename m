From: Yury Umanets <umka@namesys.com>
Subject: Re: ReiserFS on a flash device?
Date: Sun, 27 Jul 2003 14:55:31 +0400
Message-ID: <1059303331.17569.119.camel@haron.namesys.com>
References: <200307261640.13629.swsnyder@insightbb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15059-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200307261640.13629.swsnyder@insightbb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steve Snyder <swsnyder@insightbb.com>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

On Sun, 2003-07-27 at 03:40, Steve Snyder wrote:
> I was taken aback by Yury Umanets' recent suggestion 
> (http://groups.google.com/groups?hl=en&lr=lang_en&ie=UTF-8&safe=off&th=d50aa0bf6c7f26d0&seekm=1059231274.28094.40.camel%40haron.namesys.com.lucky.linux.kernel#link11) 
> that ReiserFS is not an appropriate for a flash device.
> 
> I am currently using it (via Linux kernel v2.4.21) on an E-Disk 
> (http://www.bitmicro.com/products_edisk_35_scsiw.php) flash device as the 
> front-end of a low-traffic Squid Web cache. 

>  The Squid experts recommend 
> the use of ReiserFS (with the notail option) for it's superior 
> performance in handling lots of small files.
Yes, but they probably did not mean use it with flash device? 

Actually I have took a look onto edisk specifications. It has SCSI
interface. System will not be concerned about its physical details. Also
it has lots of data security features, and probably you should not be
worry about its exhausting :)

>   I understand that flash has 
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
> More detail, please?  How is journal size a factor?  

Default journal size is too big (32MB) for usual embedded device. I
mean, that flash is expensive and it is pity to loss 32MB for journal :)

> How does notails 
> reduce flash longevity?

Tail policy "tails turned on" causes do not use redundant block (4K) for
small piece of data, as it may be saved in tree. This may be considered
as compression with very bad rate :)

> 
> Thanks.
> 
> 
-- 
We're flying high, we're watching the world passes by...

