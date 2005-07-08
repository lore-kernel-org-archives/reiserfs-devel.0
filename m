From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: on-demand bitmap loading (testing only)
Date: Fri, 08 Jul 2005 17:41:28 -0400
Message-ID: <42CEF308.5070302@suse.com>
References: <42CC4B7F.2070506@suse.com>	<42CC5F1E.6060505@namesys.com>	<42CD528B.9040502@suse.com>	<5a59ce530507071059731b30cc@mail.gmail.com> <20050708003756.21bd4c80.petchema@concept-micro.com> <42CDB7AC.8030408@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CDB7AC.8030408@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: David Masover <ninja@slaphack.com>
Cc: =?UTF-8?B?UGllcnJlIEV0Y2hlbWHDr3TDqQ==?= <petchema@concept-micro.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

David Masover wrote:
> Pierre Etchemaïté wrote:
>> Le Thu, 7 Jul 2005 13:59:35 -0400, studdugie <studdugie@gmail.com> a
>> écrit :
>>
>>
>>> I agree w/ Jeff 100%. I'm not a kernel hacker, simply a user. As a
>>> matter of fact, I was one of those people that Jeff aluded to when he
>>> said: "There have been reports of large filesystems taking an
>>> unacceptably long time to mount."
>>
>>
>> That also makes reiserfs uncomfortable with automount devices, specially
>> if they're bandwidth limited like external USB or firewire disks...
> 
> USB and firewire disks already take a little long to mount anyway.
> 
> But, it is definitely a performance enhancement, or at least a tweak.
> I'd like to see it happen -- it takes 10-15 seconds to mount my 200 gig
> Reiser4 partition, which is unacceptabe for a desktop machine -- at
> least, for a *linux* desktop machine.
> 
> To keep Hans happy about the "default case", can we load the bitmap in
> the background during boot/mount?  Basically, if it's loaded on demand,
> then we pretend to demand each part of it, one by one.  Would that
> considerably slow normal FS operation?  Could we defer it to when the
> disk is idle?  (*disk*, not FS)

I believe there are two possible methods of delayed loading. The first
is to issue all the bitmap read requests on mount and then when we need
that particular bitmap later we can wait on it. The second is to issue
the read request the first time it's needed, and don't let go of it. For
the sake of exploring other options, I decided to implment the first
one. The results were surprising.

The disk I've been testing on lately is a 40 GB ATA/100 disk mounted in
a USB2 enclosure. I tested with a range of block sizes so that the
number of bitmaps would increase without needing a larger disk. I
realize the results won't be identical to filesystems that large, but
it's the best I can do with my storage constraints. Realistically, the
times will be even longer on the larger filesystems.

The results showed that delayed allocation was only slightly faster than
waiting on the buffers. The reason for this is that the majority of the
time is actually spent issuing the block read requests, not actually
waiting for their results. The amount of time waiting on the blocks
appears not to change radically, though the amount of time issuing the
read requests does.

Here are the actual numbers from the test runs. Between each mount
attempt, I attempted to clear the system caches by allocating and
writing to all the memory on the system, as well as the disk caches by
reading 50 MB from disk. I performed the tests with four block sizes in
order to increase the number of bitmap blocks that need to be loaded at
mount time. Note that each decrease in block size increases the number
of bitmaps fourfold. This is because when the block size is halved, it
not only doubles the number of blocks, but also halves the capacity of
each bitmap block.

4k block size:                          2k block size:
10036464 blocks,                        20072928 blocks,
307 bitmaps (~= 39 GB)                  1226 bitmaps  (~= 153 GB @ 4k)
- -opin_bitmaps                           -opin_bitmaps
sb_getblk loop: 0.0s                    sb_getblk loop: 0.3999643s
ll_rw_block: 1.435871744s               ll_rw_block: 8.143272619s
wait_on_buffer: 0.513519144s            wait_on_buffer: 1.990925198s
real    0m4.551s                        real    0m10.906s
user    0m0.000s                        user    0m0.000s
sys     0m0.060s                        sys     0m0.028s

- -opin_bitmaps,delayed_bitmaps           -opin_bitmaps,delayed_bitmaps
sb_getblk loop: 0.0s                    sb_getblk loop: 0.3999643s
ll_rw_block: 1.443871029s               ll_rw_block: 8.944447839s
real    0m2.128s                        real    0m8.630s
user    0m0.000s                        user    0m0.000s
sys     0m0.016s                        sys     0m0.020s

- -odyn_bitmaps                           -odyn_bitmaps
real    0m0.626s                        real    0m0.850s
user    0m0.000s                        user    0m0.000s
sys     0m0.008s                        sys     0m0.016s

1k block size:                          512b block size:
40145856 blocks,                        80291712 blocks,
4901 bitmaps (~= 612 GB @ 4k)           19603 bitmaps (~= 2.4 TB@4k)
- -opin_bitmaps                           -opin_bitmaps
sb_getblk loop: 0.19998214s             sb_getblk loop: 0.95991426s
ll_rw_block: 33.727900516s              ll_rw_block: 110.98165711s
wait_on_buffer: 1.423872816s            wait_on_buffer: 0.749324905s
real    0m36.052s                       real    1m51.423s
user    0m0.000s                        user    0m0.000s
sys     0m0.124s                        sys     0m0.256s

- -opin_bitmaps,delayed_bitmaps           -opin_bitmaps,delayed_bitmaps
sb_getblk loop: 0.23997856s             sb_getblk loop: 0.95991426s
ll_rw_block: 33.644994731s              ll_rw_block: 109.427893721s
real    0m34.562s                       real    1m50.693s
user    0m0.004s                        user    0m0.004s
sys     0m0.060s                        sys     0m0.232s

- -odyn_bitmaps                           -odyn_bitmaps
real    0m0.516s                        real    0m0.601s
user    0m0.000s                        user    0m0.000s
sys     0m0.004s                        sys     0m0.000s

I will post runtime results of each case early next week.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCzvMILPWxlyuTD7IRApRLAJ0YDdH24YEef9XSE7JfzF7hp1jCAACgjWTX
+chdg0ihAJmup6GjQtKBc/o=
=WUUP
-----END PGP SIGNATURE-----
