From: Steve Snyder <swsnyder@insightbb.com>
Subject: ReiserFS on a flash device?
Date: Sat, 26 Jul 2003 16:40:13 -0700
Message-ID: <200307261640.13629.swsnyder@insightbb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15056-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-list@namesys.com>

I was taken aback by Yury Umanets' recent suggestion 
(http://groups.google.com/groups?hl=en&lr=lang_en&ie=UTF-8&safe=off&th=d50aa0bf6c7f26d0&seekm=1059231274.28094.40.camel%40haron.namesys.com.lucky.linux.kernel#link11) 
that ReiserFS is not an appropriate for a flash device.

I am currently using it (via Linux kernel v2.4.21) on an E-Disk 
(http://www.bitmicro.com/products_edisk_35_scsiw.php) flash device as the 
front-end of a low-traffic Squid Web cache.  The Squid experts recommend 
the use of ReiserFS (with the notail option) for it's superior 
performance in handling lots of small files.  I understand that flash has 
a finite number of write cycles, but for this application performance is 
critical, and disk I/O (access times, not STR) is the bottleneck in Squid 
performance.

A quote from the post referred to above:

>But, if you are still want to use reiserfs for flash device, you should
>do at least the following: 
>
>(1) Make the journal substantial smaller of size.
>(2) Don't turn tails off. This is useful to prolong flash live.

More detail, please?  How is journal size a factor?  How does notails 
reduce flash longevity?

Thanks.



