From: Bill Rees <mtfbwy_1968@yahoo.com>
Subject: Re: Large Partition Performance Test
Date: Thu, 11 Apr 2002 12:48:49 -0700 (PDT)
Message-ID: <20020411194849.7982.qmail@web10006.mail.yahoo.com>
References: <20020411181459.69516.qmail@web10002.mail.yahoo.com>
Reply-To: bill@billrees.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10047-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020411181459.69516.qmail@web10002.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bill@billrees.com, reiserfs-list@namesys.com

Correction, 512mb of RAM, not 512gb! :)


--- Bill Rees <mtfbwy_1968@yahoo.com> wrote:
> I upgraded my kernel to 2.4.19-pre6 with the speedup
> patch installed and still see similiar results as
> before.  As the amount of data on the partition
> increases, my write performance slows.  This time, I
> simply modified a previously posted script to mimic
> my
> production application.  The test is still running
> and
> will take quite awhile to fill the disk.  Each line
> of
> the output represents 1.68gb of disk space.
> 
> Test system:
> ------------
> 
> Dual Athlon MP 1600+
> 512 gb system memory
> 3ware 7450 disk switch configured for RAID 5 (6x160
> Maxtor drives) formatted to 800gb
> custom distribution of Linux using aformentioned
> kernel
> 
> Results:
> --------
> 
> day/hour 00 00 seconds = 259
> day/hour 00 01 seconds = 278
> day/hour 00 02 seconds = 290
> day/hour 00 03 seconds = 302
> day/hour 00 04 seconds = 314
> day/hour 00 05 seconds = 328
> day/hour 00 06 seconds = 339
> day/hour 00 07 seconds = 352
> day/hour 00 08 seconds = 365
> day/hour 00 09 seconds = 375
> day/hour 00 10 seconds = 386
> day/hour 00 11 seconds = 393
> day/hour 00 12 seconds = 405
> day/hour 00 13 seconds = 416
> day/hour 00 14 seconds = 425
> day/hour 00 15 seconds = 434
> day/hour 00 16 seconds = 446
> day/hour 00 17 seconds = 457
> day/hour 00 18 seconds = 468
> 
> Script:
> -------
> 
> #!/bin/sh
> block_size=1024
> blocks_count=15
> for d1 in 00 01 02 03 04 05 06 07 08 09 10 11 12 13
> 14
> 15 16 17 18 19 20 21 22 23 24 25; do
>     for h1 in 00 01 02 03 04 05 06 07 08 09 10 11 12
> 13 14 15 16 17 18 19 20 21 22 23; do
>         echo -n "day/hour $d1 $h1 seconds = "
>         begin_time=`date +%s`
>         for m1 in 00 01 02 03 04 05 06 07 08 09 10
> 11
> 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28
> 29
> 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 46 47
> 48
> 49 50 51 52 53 54 55 56 57 58 59 ; do
>             mkdir -p /video00/$d1/$h1$m1
>             for s1 in 00 01 02 03 04 05 06 07 08 09
> 10
> 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
> 28
> 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
> 46
> 47 48 49 50 51 52 53 54 55 56 57 58 59; do
>                 for f1 in 00 01 02 03 04 05 06 07 08
> 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
> 26
> 27 28 29; do
>                     dd if=/dev/zero
> of=/video00/$d1/$h1$m1/$s1$f1 \
>                         bs=$block_size
> count=$blocks_count \
>                         >/dev/null 2>&1
>                 done
>             done
>         done
>         end_time=`date +%s`
>         echo $(($end_time - $begin_time))
>     done
> done
> 
> __________________________________________________
> Do You Yahoo!?
> Yahoo! Tax Center - online filing with TurboTax
> http://taxes.yahoo.com/


=====
Bill Rees - bill@billrees.com - http://billrees.com

__________________________________________________
Do You Yahoo!?
Yahoo! Tax Center - online filing with TurboTax
http://taxes.yahoo.com/
