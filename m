From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] reiserfs: on-demand bitmap loading (testing only)
Date: Sat, 09 Jul 2005 00:46:55 -0700
Message-ID: <42CF80EF.7030204@namesys.com>
References: <42CC4B7F.2070506@suse.com>	<42CC5F1E.6060505@namesys.com>	<42CD528B.9040502@suse.com>	<5a59ce530507071059731b30cc@mail.gmail.com> <20050708003756.21bd4c80.petchema@concept-micro.com> <42CDB7AC.8030408@slaphack.com> <42CEF308.5070302@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25069-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CEF308.5070302@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: David Masover <ninja@slaphack.com>, =?UTF-8?B?UGllcnJlIEV0Y2hlbWHDr3TDqQ==?= <petchema@concept-micro.com>, reiserfs-list@namesys.com

Jeff Mahoney wrote:

>
>
> The results showed that delayed allocation was only slightly faster than
> waiting on the buffers. The reason for this is that the majority of the
> time is actually spent issuing the block read requests, not actually
> waiting for their results. 

Can you define "spent issuing"?  Perhaps this is simply a bad choice of
block device congestion configuration, and changing it would fix
things.  Because device congestion is based on NUMBER of requests, not
their size, bitmap reading would congest things more than file IO.

Block device congestion limits I suspect to be in need of serious
review, not just because of bitmaps.....

> The amount of time waiting on the blocks
> appears not to change radically, though the amount of time issuing the
> read requests does.
>
> Here are the actual numbers from the test runs. Between each mount
> attempt, I attempted to clear the system caches by allocating and
> writing to all the memory on the system, as well as the disk caches by
> reading 50 MB from disk. I performed the tests with four block sizes in
> order to increase the number of bitmap blocks that need to be loaded at
> mount time. Note that each decrease in block size increases the number
> of bitmaps fourfold. This is because when the block size is halved, it
> not only doubles the number of blocks, but also halves the capacity of
> each bitmap block.
>
> 4k block size:                          2k block size:
> 10036464 blocks,                        20072928 blocks,
> 307 bitmaps (~= 39 GB)                  1226 bitmaps  (~= 153 GB @ 4k)
> -opin_bitmaps                           -opin_bitmaps
> sb_getblk loop: 0.0s                    sb_getblk loop: 0.3999643s
> ll_rw_block: 1.435871744s               ll_rw_block: 8.143272619s
> wait_on_buffer: 0.513519144s            wait_on_buffer: 1.990925198s
> real    0m4.551s                        real    0m10.906s
> user    0m0.000s                        user    0m0.000s
> sys     0m0.060s                        sys     0m0.028s
>
> -opin_bitmaps,delayed_bitmaps           -opin_bitmaps,delayed_bitmaps
> sb_getblk loop: 0.0s                    sb_getblk loop: 0.3999643s
> ll_rw_block: 1.443871029s               ll_rw_block: 8.944447839s
> real    0m2.128s                        real    0m8.630s
> user    0m0.000s                        user    0m0.000s
> sys     0m0.016s                        sys     0m0.020s
>
> -odyn_bitmaps                           -odyn_bitmaps
> real    0m0.626s                        real    0m0.850s
> user    0m0.000s                        user    0m0.000s
> sys     0m0.008s                        sys     0m0.016s
>
> 1k block size:                          512b block size:
> 40145856 blocks,                        80291712 blocks,
> 4901 bitmaps (~= 612 GB @ 4k)           19603 bitmaps (~= 2.4 TB@4k)
> -opin_bitmaps                           -opin_bitmaps
> sb_getblk loop: 0.19998214s             sb_getblk loop: 0.95991426s
> ll_rw_block: 33.727900516s              ll_rw_block: 110.98165711s
> wait_on_buffer: 1.423872816s            wait_on_buffer: 0.749324905s
> real    0m36.052s                       real    1m51.423s
> user    0m0.000s                        user    0m0.000s
> sys     0m0.124s                        sys     0m0.256s
>
> -opin_bitmaps,delayed_bitmaps           -opin_bitmaps,delayed_bitmaps
> sb_getblk loop: 0.23997856s             sb_getblk loop: 0.95991426s
> ll_rw_block: 33.644994731s              ll_rw_block: 109.427893721s
> real    0m34.562s                       real    1m50.693s
> user    0m0.004s                        user    0m0.004s
> sys     0m0.060s                        sys     0m0.232s
>
> -odyn_bitmaps                           -odyn_bitmaps
> real    0m0.516s                        real    0m0.601s
> user    0m0.000s                        user    0m0.000s
> sys     0m0.004s                        sys     0m0.000s
>
> I will post runtime results of each case early next week.
>
> -Jeff
>
> --
> Jeff Mahoney
> SuSE Labs

