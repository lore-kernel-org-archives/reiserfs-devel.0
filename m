From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: bug report
Date: Tue, 25 Nov 2003 13:54:21 +0300
Message-ID: <200311251354.21720.vitaly@namesys.com>
References: <NHBBLMBAALMFLLANBMBIMECPCAAA.Stephan.Reichel@1net4you.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16161-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <NHBBLMBAALMFLLANBMBIMECPCAAA.Stephan.Reichel@1net4you.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephan Reichel <Stephan.Reichel@1net4you.de>, reiserfs-list@namesys.com


Hello, 

On Tuesday 25 November 2003 03:44, Stephan Reichel wrote:
> Hello,
> thanks to Vitaly for the hint.
> And this is the next result:
> -----------
>
> proxy:/home/reichel# reiserfsck --rebuild-tree -l /home/reichel/rfsck.log
> /dev/hdb6
> reiserfsck 3.6.11 (2003 www.namesys.com)
...
> Pass 3 (semantic):
> /old_var/spool/wwwoffle/prevout6/OrQokTtODwNeuEEihdvrfHQlbalance.c 1019
> leaf_delete_items_entirely
> leaf_delete_items_entirely: bad leaf 55340: level=1, nr_items=22,
> free_space=65484 rdkey
> Aborted

Hm, this is strange. 
Did you build the reiserfsprogs on the same mashine where you run it?
Would you run
    debugreiserfs -p /dev/hdb6 | bzip2 -c > hdb6.bz2
and provide it for downloading -- I will debug reiserfsck localy on your fs 
metadata if there is some bug. Although it may be some hardware problem
also -- with hdb or with the memory. 

-- 
Thanks,
Vitaly Fertman


