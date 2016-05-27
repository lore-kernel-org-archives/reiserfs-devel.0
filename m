From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [Bug]Reiser4-for-4.5.3 mount: page allocation failure
Date: Fri, 27 May 2016 11:33:56 +0200
Message-ID: <fd958078-03af-d50b-6586-03c56f2f54f4@gmail.com>
References: <CADW=+3=rUH_b24G9HvfR1nV047YbYna6W5ZxXqHadJqm46mVmA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=O2RMzosAwadRgNW4Lf7od293pYWc85pof/zUlvH6s1g=;
        b=UB0yYFo6qync9cxOYHNeLoKVU6K/0cm3iyybjE/FbJANNoyjd3KNodgLPFzDwzjGvK
         9EGYIvWZK+U2L40/qod04j/3iDH1V/ibARLFOTKRrslTaL9KzxdS66DDrNm/HRT0g4nB
         vVp01z91b9xlaciUrHVHlaDxqfeyGGgSmVwUi14d2s7g5m5BxyFAEAoJpd0LOlQnb2Ll
         iJyErhYUjWAOSSPx4Hpe4qmZuxaf4Yxo2rTQETwXxbAIQpnGgwjN5qwFEaP0TW8UQVEa
         z305MQ80toxcqO50ybqhPpS4S2CuwA+dZYR8nN8azsjTtgyynEy00cJSlW81vuS2Mh7c
         uabw==
In-Reply-To: <CADW=+3=rUH_b24G9HvfR1nV047YbYna6W5ZxXqHadJqm46mVmA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hi Dushan,


On 05/27/2016 11:16 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> I recieved this error few days ago.

What is md125?

> Remounting this partition doesn't reproduce the error as it's
> automatically fscked.

Are you sure that it is fscked at all?
Checking by fsck is rather long process...

Thanks,
Edward.


>
> Thanks
>
> Dusan
>
> Mount options:
> /dev/md125        /mnt/backup    reiser4
> noatime,noauto,onerror=3Dremount-ro  0 0
>
> May 25 03:29:57 krshina3 kernel: reiser4: md125: found disk format 4.=
0.1.
> May 25 03:29:57 krshina3 kernel: mount: page allocation failure:
> order:4, mode:0x26040c0
> May 25 03:29:57 krshina3 kernel: CPU: 2 PID: 7876 Comm: mount Not
> tainted 4.5.3-gentoo #4
> May 25 03:29:57 krshina3 kernel: Hardware name: Gigabyte Technology
> Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS F5 07/04/2012
> May 25 03:29:57 krshina3 kernel:  0000000000000006 ffffffff81219767
> 0000000000000001 ffff8801bfe5bb30
> May 25 03:29:57 krshina3 kernel:  ffffffff810d2ded ffffffff8192ed30
> ffff88022e315168 026240c000000010
> May 25 03:29:57 krshina3 kernel:  0000000000000000 fffffffffffffff0
> 0000000000000001 ffffffff8192ed00
> May 25 03:29:57 krshina3 kernel: Call Trace:
> May 25 03:29:57 krshina3 kernel:  [<ffffffff81219767>] ? dump_stack+0=
x46/0x59
> May 25 03:29:57 krshina3 kernel:  [<ffffffff810d2ded>] ?
> warn_alloc_failed+0x113/0x12b
> May 25 03:29:57 krshina3 kernel:  [<ffffffff810d5222>] ?
> __alloc_pages_nodemask+0x748/0x77e
> May 25 03:29:57 krshina3 kernel:  [<ffffffff81095a1a>] ?
> console_unlock+0x371/0x3ac
> May 25 03:29:57 krshina3 kernel:  [<ffffffff81101401>] ?
> cache_alloc_refill+0x27f/0x4c9
> May 25 03:29:57 krshina3 kernel:  [<ffffffff81168cb6>] ? reiser4_moun=
t+0xc/0xc
> May 25 03:29:57 krshina3 kernel:  [<ffffffff81101142>] ?
> kmem_cache_alloc+0x69/0xa9
> May 25 03:29:57 krshina3 kernel:  [<ffffffff8115605f>] ?
> znodes_tree_init+0x4d/0xe7
> May 25 03:29:57 krshina3 kernel:  [<ffffffff8115c458>] ?
> reiser4_init_tree+0x3f/0xb2
> May 25 03:29:57 krshina3 kernel:  [<ffffffff8118afe5>] ?
> init_format_format40+0x37b/0x501
> May 25 03:29:57 krshina3 kernel:  [<ffffffff81168d98>] ? fill_super+0=
xe2/0x1f7
> May 25 03:29:57 krshina3 kernel:  [<ffffffff81107d8e>] ? mount_bdev+0=
x131/0x181
> May 25 03:29:57 krshina3 kernel:  [<ffffffff81107f59>] ? mount_fs+0xc=
/0x80
> May 25 03:29:57 krshina3 kernel:  [<ffffffff8111cb6d>] ?
> vfs_kern_mount+0x60/0xea
> May 25 03:29:57 krshina3 kernel:  [<ffffffff8111e523>] ? do_mount+0x9=
2c/0xa43
> May 25 03:29:57 krshina3 kernel:  [<ffffffff811067e0>] ? __fput+0x169=
/0x17c
> May 25 03:29:57 krshina3 kernel:  [<ffffffff810e1aa9>] ? memdup_user+=
0x38/0x54
> May 25 03:29:57 krshina3 kernel:  [<ffffffff8111e84d>] ? SyS_mount+0x=
6d/0x93
> May 25 03:29:57 krshina3 kernel:  [<ffffffff815f4457>] ?
> entry_SYSCALL_64_fastpath+0x12/0x6a
> May 25 03:29:57 krshina3 kernel: Mem-Info:
> May 25 03:29:57 krshina3 kernel: active_anon:745432
> inactive_anon:149913 isolated_anon:0\x0a active_file:474848
> inactive_file:465968 isolated_file:0\x0a unevictable:1855 dirty:235
> writeback:0 unstable:0\x0a slab_reclaimable:77405
> slab_unreclaimable:8391\x0a mapped:75083 shmem:6227 pagetables:9581
> bounce:0\x0a free:15583 free_pcp:0 free_cma:0
> May 25 03:29:57 krshina3 kernel: DMA free:15900kB min:20kB low:24kB
> high:28kB active_anon:0kB inactive_anon:0kB active_file:0kB
> inactive_file:0kB unevictable:0kB isolated(anon):0kB
> isolated(file):0kB present:15984kB managed:15900kB mlocked:0kB
> dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB
> slab_unreclaimable:0kB kernel_stack:0kB pagetables:0kB unstable:0kB
> bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp:0kB
> pages_scanned:0 all_unreclaimable? yes
> May 25 03:29:57 krshina3 kernel: lowmem_reserve[]: 0 2951 7665 7665
> May 25 03:29:57 krshina3 kernel: DMA32 free:27644kB min:4308kB
> low:5384kB high:6460kB active_anon:1121656kB inactive_anon:284116kB
> active_file:711732kB inactive_file:701272kB unevictable:3152kB
> isolated(anon):0kB isolated(file):0kB present:3098560kB
> managed:3022712kB mlocked:3152kB dirty:32kB writeback:0kB
> mapped:117268kB shmem:7796kB slab_reclaimable:118956kB
> slab_unreclaimable:11168kB kernel_stack:2304kB pagetables:16272kB
> unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
> writeback_tmp:0kB pages_scanned:12 all_unreclaimable? no
> May 25 03:29:57 krshina3 kernel: lowmem_reserve[]: 0 0 4714 4714
> May 25 03:29:57 krshina3 kernel: Normal free:18788kB min:6884kB
> low:8604kB high:10324kB active_anon:1860072kB inactive_anon:315536kB
> active_file:1187660kB inactive_file:1162600kB unevictable:4268kB
> isolated(anon):0kB isolated(file):0kB present:4954112kB
> managed:4828044kB mlocked:4268kB dirty:908kB writeback:0kB
> mapped:183064kB shmem:17112kB slab_reclaimable:190664kB
> slab_unreclaimable:22396kB kernel_stack:4192kB pagetables:22052kB
> unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
> writeback_tmp:0kB pages_scanned:92 all_unreclaimable? no
> May 25 03:29:57 krshina3 kernel: lowmem_reserve[]: 0 0 0 0
> May 25 03:29:57 krshina3 kernel: DMA: 1*4kB (U) 1*8kB (U) 1*16kB (U)
> 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB 1*1024kB (U)
> 1*2048kB (M) 3*4096kB (M) =3D 15900kB
> May 25 03:29:57 krshina3 kernel: DMA32: 313*4kB (UME) 3299*8kB (UME)
> 14*16kB (UM) 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB
> 0*4096kB =3D 27868kB
> May 25 03:29:57 krshina3 kernel: Normal: 206*4kB (UME) 372*8kB (UME)
> 942*16kB (UME) 4*32kB (U) 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB
> 0*2048kB 0*4096kB =3D 19000kB
> May 25 03:29:57 krshina3 kernel: Node 0 hugepages_total=3D0
> hugepages_free=3D0 hugepages_surp=3D0 hugepages_size=3D2048kB
> May 25 03:29:57 krshina3 kernel: 948736 total pagecache pages
> May 25 03:29:57 krshina3 kernel: 166 pages in swap cache
> May 25 03:29:57 krshina3 kernel: Swap cache stats: add 3579, delete
> 3413, find 0/1
> May 25 03:29:57 krshina3 kernel: Free swap  =3D 580020kB
> May 25 03:29:57 krshina3 kernel: Total swap =3D 594300kB
> May 25 03:29:57 krshina3 kernel: 2017164 pages RAM
> May 25 03:29:57 krshina3 kernel: 0 pages HighMem/MovableOnly
> May 25 03:29:57 krshina3 kernel: 50500 pages reserved
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
