From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on /mnt/backup
 failed: Cannot allocate memory
Date: Sun, 2 Nov 2014 09:38:20 +0100
Message-ID: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Qo2dOZeh0Jdh3lN5MFe6KIkD1kvo/e23Fj0IDD0QOGE=;
        b=oZZQM4SJ0BuvuO8okxml/QQoIAcgsGyn+H6Qw+zt0wWB5txzO9ulqHnevZ3YYcUN8r
         Qe7ga0cWVEh9nRBCsb5rOxUrNupYrKv9tAjdOK8uRgwPnsXyL4d2OexAHdmvUMPn5xtX
         4KmglYKbC7Rdi4mEGE6e1PsNSbSNnYlW7lGpuISnC5ANTNKa9qitMI8TZDR2OTAoY1M4
         W8pE2r/AWLZwIUaV4XzMAfEdVeyHBXfdbNRzelpzntJ5/6bJOaVBF2a6q78mZ3m62+ck
         yJ7SJTZd40/JQbn4PocZuvMBgphBlds3mgnCdT0sS0VaNqiQyO4d5V1Tmf49uAb6LFoy
         wcyg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>

When I try to mount a cc reiser4 partition (reiser4-for-3.16.2.patch)
I get: mount: mount /dev/md125 on /mnt/backup failed: Cannot allocate
memory
Uptime is almost 7 days and mounting of this partition worked every
day untill last night (I get automated messages on mail when something
goes wrong).

Now I tried on kernel 3.10 and everything works OK

krshina3 goran # uname -a
Linux krshina3 3.10.6-gentoo #2 SMP Wed Aug 14 17:33:45 CEST 2013
x86_64 Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz GenuineIntel GNU/Linux

krshina3 goran# free -m
             total       used       free     shared    buffers     cached
Mem:          7681       6794        887         30          0       2933
-/+ buffers/cache:       3860       3821
Swap:          580        325        254

krshina3 goran# cat /etc/fstab | grep -v "#"

/dev/sda1               /boot           ext2            noauto,noatime  1 2
/dev/md123              none            swap            sw              0 0
/dev/sda2               /               reiser4
noatime,onerror=remount-ro              0 0
/dev/md125              /mnt/backup     reiser4
noatime,noauto,onerror=remount-ro       0 0
/dev/md126              /mnt/media      reiser4
noatime,users,onerror=remount-ro        0 0
/dev/md127              /usr/portage    reiser4
noatime,onerror=remount-ro              0 0
shm                     /dev/shm        tmpfs
nodev,nosuid,noexec     0 0


krshina3 goran # df
Filesystem     1K-blocks      Used Available Use% Mounted on
/dev/sda2       37017728  24870384  12147344  68% /
tmpfs             786872       832    786040   1% /run
udev               10240         0     10240   0% /dev
shm              3934340        80   3934260   1% /dev/shm
/dev/md126     383034100 298007740  85026360  78% /mnt/media
/dev/md127       6113484   5427288    686196  89% /usr/portage
/dev/md125      64959612  57618884   7340728  89% /mnt/backup

I get these in logs:

Nov  2 03:30:01 krshina3 kernel: [562035.221513] reiser4: md125: found
disk format 4.0.0.
Nov  2 03:30:01 krshina3 kernel: [562035.221749] mount: page
allocation failure: order:4, mode:0x2040d0
Nov  2 03:30:01 krshina3 kernel: [562035.221752] CPU: 0 PID: 517 Comm:
mount Not tainted 3.16.5-gentoo #1
Nov  2 03:30:01 krshina3 kernel: [562035.221753] Hardware name:
Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS F5
07/04/2012
Nov  2 03:30:01 krshina3 kernel: [562035.221754]  0000000000000000
ffff88020ece7968 ffffffff816a31b4 0000000000000007
Nov  2 03:30:01 krshina3 kernel: [562035.221757]  00000000002040d0
ffff88020ece79f8 ffffffff810e609a ffffffff00000040
Nov  2 03:30:01 krshina3 kernel: [562035.221758]  0000000000000286
ffffffff819a8a78 fffffff00000000f ffff88020ece79c8
Nov  2 03:30:01 krshina3 kernel: [562035.221760] Call Trace:
Nov  2 03:30:01 krshina3 kernel: [562035.221765]  [<ffffffff816a31b4>]
dump_stack+0x46/0x58
Nov  2 03:30:01 krshina3 kernel: [562035.221768]  [<ffffffff810e609a>]
warn_alloc_failed+0xda/0x130
Nov  2 03:30:01 krshina3 kernel: [562035.221770]  [<ffffffff810e86c9>]
__alloc_pages_nodemask+0x5d9/0x7a0
Nov  2 03:30:01 krshina3 kernel: [562035.221774]  [<ffffffff8111f16a>]
cache_alloc_refill+0x31a/0x550
Nov  2 03:30:01 krshina3 kernel: [562035.221776]  [<ffffffff8111ee23>]
kmem_cache_alloc+0xb3/0xe0
Nov  2 03:30:01 krshina3 kernel: [562035.221778]  [<ffffffff81186529>]
znodes_tree_init+0xc9/0x120
Nov  2 03:30:01 krshina3 kernel: [562035.221781]  [<ffffffff8118e7b4>]
reiser4_init_tree+0x44/0xd0
Nov  2 03:30:01 krshina3 kernel: [562035.221784]  [<ffffffff811cb905>]
init_format_format40+0x265/0x5b0
Nov  2 03:30:01 krshina3 kernel: [562035.221787]  [<ffffffff8119e8b1>]
fill_super+0x101/0x200
Nov  2 03:30:01 krshina3 kernel: [562035.221789]  [<ffffffff81126be4>]
mount_bdev+0x194/0x1d0
Nov  2 03:30:01 krshina3 kernel: [562035.221792]  [<ffffffff8119e7b0>]
? reiser4_mount+0x20/0x20
Nov  2 03:30:01 krshina3 kernel: [562035.221794]  [<ffffffff8119e7a0>]
reiser4_mount+0x10/0x20
Nov  2 03:30:01 krshina3 kernel: [562035.221796]  [<ffffffff81126e2b>]
mount_fs+0x1b/0xd0
Nov  2 03:30:01 krshina3 kernel: [562035.221799]  [<ffffffff8114042f>]
vfs_kern_mount+0x6f/0x130
Nov  2 03:30:01 krshina3 kernel: [562035.221801]  [<ffffffff81141f68>]
do_mount+0x218/0xab0
Nov  2 03:30:01 krshina3 kernel: [562035.221803]  [<ffffffff810e88a2>]
? __get_free_pages+0x12/0x60
Nov  2 03:30:01 krshina3 kernel: [562035.221805]  [<ffffffff81141bf5>]
? copy_mount_options+0x35/0x150
Nov  2 03:30:01 krshina3 kernel: [562035.221808]  [<ffffffff81142ad9>]
SyS_mount+0x89/0xd0
Nov  2 03:30:01 krshina3 kernel: [562035.221811]  [<ffffffff816ab1d2>]
system_call_fastpath+0x16/0x1b
Nov  2 03:30:01 krshina3 kernel: [562035.221812] Mem-Info:
Nov  2 03:30:01 krshina3 kernel: [562035.221813] DMA per-cpu:
Nov  2 03:30:01 krshina3 kernel: [562035.221814] CPU    0: hi:    0,
btch:   1 usd:   0
Nov  2 03:30:01 krshina3 kernel: [562035.221815] CPU    1: hi:    0,
btch:   1 usd:   0
Nov  2 03:30:01 krshina3 kernel: [562035.221816] CPU    2: hi:    0,
btch:   1 usd:   0
Nov  2 03:30:01 krshina3 kernel: [562035.221817] CPU    3: hi:    0,
btch:   1 usd:   0
Nov  2 03:30:01 krshina3 kernel: [562035.221817] DMA32 per-cpu:
Nov  2 03:30:01 krshina3 kernel: [562035.221819] CPU    0: hi:  186,
btch:  31 usd:   0
Nov  2 03:30:01 krshina3 kernel: [562035.221819] CPU    1: hi:  186,
btch:  31 usd:   0
Nov  2 03:30:01 krshina3 kernel: [562035.221820] CPU    2: hi:  186,
btch:  31 usd:   0
Nov  2 03:30:01 krshina3 kernel: [562035.221821] CPU    3: hi:  186,
btch:  31 usd:   0
Nov  2 03:30:01 krshina3 kernel: [562035.221822] Normal per-cpu:
Nov  2 03:30:01 krshina3 kernel: [562035.221823] CPU    0: hi:  186,
btch:  31 usd:   0
Nov  2 03:30:01 krshina3 kernel: [562035.221824] CPU    1: hi:  186,
btch:  31 usd:   0
Nov  2 03:30:01 krshina3 kernel: [562035.221825] CPU    2: hi:  186,
btch:  31 usd:  56
Nov  2 03:30:01 krshina3 kernel: [562035.221826] CPU    3: hi:  186,
btch:  31 usd:   0
Nov  2 03:30:01 krshina3 kernel: [562035.221828] active_anon:701641
inactive_anon:138699 isolated_anon:0
Nov  2 03:30:01 krshina3 kernel: [562035.221828]  active_file:399519
inactive_file:396920 isolated_file:0
Nov  2 03:30:01 krshina3 kernel: [562035.221828]  unevictable:0
dirty:204 writeback:0 unstable:0
Nov  2 03:30:01 krshina3 kernel: [562035.221828]  free:155878
slab_reclaimable:126123 slab_unreclaimable:9074
Nov  2 03:30:01 krshina3 kernel: [562035.221828]  mapped:21535
shmem:5701 pagetables:10162 bounce:0
Nov  2 03:30:01 krshina3 kernel: [562035.221828]  free_cma:0
Nov  2 03:30:01 krshina3 kernel: [562035.221833] DMA free:15900kB
min:20kB low:24kB high:28kB active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:15984kB managed:15900kB mlocked:0kB
dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB
slab_unreclaimable:0kB kernel_stack:0kB pagetables:0kB unstable:0kB
bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0
all_unreclaimable? yes
Nov  2 03:30:01 krshina3 kernel: [562035.221834] lowmem_reserve[]: 0
2950 7665 7665
Nov  2 03:30:01 krshina3 kernel: [562035.221839] DMA32 free:250180kB
min:4308kB low:5384kB high:6460kB active_anon:1026572kB
inactive_anon:257356kB active_file:616152kB inactive_file:612572kB
unevictable:0kB isolated(anon):0kB isolated(file):0kB
present:3098560kB managed:3022260kB mlocked:0kB dirty:4kB
writeback:0kB mapped:33232kB shmem:9336kB slab_reclaimable:180492kB
slab_unreclaimable:12176kB kernel_stack:2496kB pagetables:16872kB
unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0
all_unreclaimable? no
Nov  2 03:30:01 krshina3 kernel: [562035.221840] lowmem_reserve[]: 0 0 4714 4714
Nov  2 03:30:01 krshina3 kernel: [562035.221844] Normal free:357432kB
min:6884kB low:8604kB high:10324kB active_anon:1779992kB
inactive_anon:297440kB active_file:981924kB inactive_file:975108kB
unevictable:0kB isolated(anon):0kB isolated(file):0kB
present:4954112kB managed:4828124kB mlocked:0kB dirty:812kB
writeback:0kB mapped:52908kB shmem:13468kB slab_reclaimable:324000kB
slab_unreclaimable:24120kB kernel_stack:4160kB pagetables:23776kB
unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB
pages_scanned:24 all_unreclaimable? no
Nov  2 03:30:01 krshina3 kernel: [562035.221845] lowmem_reserve[]: 0 0 0 0
Nov  2 03:30:01 krshina3 kernel: [562035.221847] DMA: 1*4kB (U) 1*8kB
(U) 1*16kB (U) 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB
1*1024kB (U) 1*2048kB (R) 3*4096kB (M) = 15900kB
Nov  2 03:30:01 krshina3 kernel: [562035.221855] DMA32: 52520*4kB
(UEM) 5030*8kB (UE) 3*16kB (UR) 0*32kB 1*64kB (R) 0*128kB 0*256kB
0*512kB 0*1024kB 0*2048kB 0*4096kB = 250432kB
Nov  2 03:30:01 krshina3 kernel: [562035.221861] Normal: 62961*4kB
(UEM) 11874*8kB (UEM) 640*16kB (UEMR) 17*32kB (UEMR) 1*64kB (E)
0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 357684kB
Nov  2 03:30:01 krshina3 kernel: [562035.221867] Node 0
hugepages_total=0 hugepages_free=0 hugepages_surp=0
hugepages_size=2048kB
Nov  2 03:30:01 krshina3 kernel: [562035.221868] 804788 total pagecache pages
Nov  2 03:30:01 krshina3 kernel: [562035.221869] 2600 pages in swap cache
Nov  2 03:30:01 krshina3 kernel: [562035.221870] Swap cache stats: add
91111, delete 88511, find 38599/41340
Nov  2 03:30:01 krshina3 kernel: [562035.221871] Free swap  = 277028kB
Nov  2 03:30:01 krshina3 kernel: [562035.221872] Total swap = 594300kB
Nov  2 03:30:01 krshina3 kernel: [562035.221873] 2017164 pages RAM
Nov  2 03:30:01 krshina3 kernel: [562035.221873] 0 pages HighMem/MovableOnly
Nov  2 03:30:01 krshina3 kernel: [562035.221874] 31497 pages reserved




Nov  2 09:13:48 krshina3 kernel: [582660.900521] reiser4: md125: found
disk format 4.0.0.
Nov  2 09:13:48 krshina3 kernel: [582660.900907] mount: page
allocation failure: order:4, mode:0x2040d0
Nov  2 09:13:48 krshina3 kernel: [582660.900910] CPU: 1 PID: 1414
Comm: mount Not tainted 3.16.5-gentoo #1
Nov  2 09:13:48 krshina3 kernel: [582660.900912] Hardware name:
Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS F5
07/04/2012
Nov  2 09:13:48 krshina3 kernel: [582660.900914]  0000000000000000
ffff880148093968 ffffffff816a31b4 0000000000000007
Nov  2 09:13:48 krshina3 kernel: [582660.900917]  00000000002040d0
ffff8801480939f8 ffffffff810e609a ffffffff00000040
Nov  2 09:13:48 krshina3 kernel: [582660.900919]  0000000000000286
ffffffff819a8a78 fffffff00000000f ffff8801480939c8
Nov  2 09:13:48 krshina3 kernel: [582660.900922] Call Trace:
Nov  2 09:13:48 krshina3 kernel: [582660.900929]  [<ffffffff816a31b4>]
dump_stack+0x46/0x58
Nov  2 09:13:48 krshina3 kernel: [582660.900933]  [<ffffffff810e609a>]
warn_alloc_failed+0xda/0x130
Nov  2 09:13:48 krshina3 kernel: [582660.900937]  [<ffffffff810e86c9>]
__alloc_pages_nodemask+0x5d9/0x7a0
Nov  2 09:13:48 krshina3 kernel: [582660.900941]  [<ffffffff8111f16a>]
cache_alloc_refill+0x31a/0x550
Nov  2 09:13:48 krshina3 kernel: [582660.900945]  [<ffffffff8111ee23>]
kmem_cache_alloc+0xb3/0xe0
Nov  2 09:13:48 krshina3 kernel: [582660.900948]  [<ffffffff81186529>]
znodes_tree_init+0xc9/0x120
Nov  2 09:13:48 krshina3 kernel: [582660.900951]  [<ffffffff8118e7b4>]
reiser4_init_tree+0x44/0xd0
Nov  2 09:13:48 krshina3 kernel: [582660.900955]  [<ffffffff811cb905>]
init_format_format40+0x265/0x5b0
Nov  2 09:13:48 krshina3 kernel: [582660.900959]  [<ffffffff8119e8b1>]
fill_super+0x101/0x200
Nov  2 09:13:48 krshina3 kernel: [582660.900963]  [<ffffffff81126be4>]
mount_bdev+0x194/0x1d0
Nov  2 09:13:48 krshina3 kernel: [582660.900966]  [<ffffffff8119e7b0>]
? reiser4_mount+0x20/0x20
Nov  2 09:13:48 krshina3 kernel: [582660.900969]  [<ffffffff8119e7a0>]
reiser4_mount+0x10/0x20
Nov  2 09:13:48 krshina3 kernel: [582660.900972]  [<ffffffff81126e2b>]
mount_fs+0x1b/0xd0
Nov  2 09:13:48 krshina3 kernel: [582660.900976]  [<ffffffff8114042f>]
vfs_kern_mount+0x6f/0x130
Nov  2 09:13:48 krshina3 kernel: [582660.900979]  [<ffffffff81141f68>]
do_mount+0x218/0xab0
Nov  2 09:13:48 krshina3 kernel: [582660.900982]  [<ffffffff810e88a2>]
? __get_free_pages+0x12/0x60
Nov  2 09:13:48 krshina3 kernel: [582660.900986]  [<ffffffff81141bf5>]
? copy_mount_options+0x35/0x150
Nov  2 09:13:48 krshina3 kernel: [582660.900989]  [<ffffffff81142ad9>]
SyS_mount+0x89/0xd0
Nov  2 09:13:48 krshina3 kernel: [582660.900993]  [<ffffffff816ab1d2>]
system_call_fastpath+0x16/0x1b
Nov  2 09:13:48 krshina3 kernel: [582660.900994] Mem-Info:
Nov  2 09:13:48 krshina3 kernel: [582660.900996] DMA per-cpu:
Nov  2 09:13:48 krshina3 kernel: [582660.900997] CPU    0: hi:    0,
btch:   1 usd:   0
Nov  2 09:13:48 krshina3 kernel: [582660.900999] CPU    1: hi:    0,
btch:   1 usd:   0
Nov  2 09:13:48 krshina3 kernel: [582660.901000] CPU    2: hi:    0,
btch:   1 usd:   0
Nov  2 09:13:48 krshina3 kernel: [582660.901001] CPU    3: hi:    0,
btch:   1 usd:   0
Nov  2 09:13:48 krshina3 kernel: [582660.901002] DMA32 per-cpu:
Nov  2 09:13:48 krshina3 kernel: [582660.901004] CPU    0: hi:  186,
btch:  31 usd:   0
Nov  2 09:13:48 krshina3 kernel: [582660.901005] CPU    1: hi:  186,
btch:  31 usd:   0
Nov  2 09:13:48 krshina3 kernel: [582660.901006] CPU    2: hi:  186,
btch:  31 usd:   0
Nov  2 09:13:48 krshina3 kernel: [582660.901008] CPU    3: hi:  186,
btch:  31 usd:   0
Nov  2 09:13:48 krshina3 kernel: [582660.901009] Normal per-cpu:
Nov  2 09:13:48 krshina3 kernel: [582660.901010] CPU    0: hi:  186,
btch:  31 usd:   0
Nov  2 09:13:48 krshina3 kernel: [582660.901011] CPU    1: hi:  186,
btch:  31 usd:   0
Nov  2 09:13:48 krshina3 kernel: [582660.901013] CPU    2: hi:  186,
btch:  31 usd:  21
Nov  2 09:13:48 krshina3 kernel: [582660.901014] CPU    3: hi:  186,
btch:  31 usd:   0
Nov  2 09:13:48 krshina3 kernel: [582660.901017] active_anon:719713
inactive_anon:145280 isolated_anon:0
Nov  2 09:13:48 krshina3 kernel: [582660.901017]  active_file:390035
inactive_file:389999 isolated_file:0
Nov  2 09:13:48 krshina3 kernel: [582660.901017]  unevictable:0
dirty:1180 writeback:0 unstable:0
Nov  2 09:13:48 krshina3 kernel: [582660.901017]  free:161223
slab_reclaimable:112227 slab_unreclaimable:9155
Nov  2 09:13:48 krshina3 kernel: [582660.901017]  mapped:35966
shmem:7263 pagetables:10549 bounce:0
Nov  2 09:13:48 krshina3 kernel: [582660.901017]  free_cma:0
Nov  2 09:13:48 krshina3 kernel: [582660.901024] DMA free:15900kB
min:20kB low:24kB high:28kB active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB
isolated(file):0kB present:15984kB managed:15900kB mlocked:0kB
dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB
slab_unreclaimable:0kB kernel_stack:0kB pagetables:0kB unstable:0kB
bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0
all_unreclaimable? yes
Nov  2 09:13:48 krshina3 kernel: [582660.901026] lowmem_reserve[]: 0
2950 7665 7665
Nov  2 09:13:48 krshina3 kernel: [582660.901033] DMA32 free:243456kB
min:4308kB low:5384kB high:6460kB active_anon:1055312kB
inactive_anon:268364kB active_file:605480kB inactive_file:605344kB
unevictable:0kB isolated(anon):0kB isolated(file):0kB
present:3098560kB managed:3022260kB mlocked:0kB dirty:1728kB
writeback:0kB mapped:55944kB shmem:11860kB slab_reclaimable:164900kB
slab_unreclaimable:12340kB kernel_stack:2496kB pagetables:17284kB
unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0
all_unreclaimable? no
Nov  2 09:13:48 krshina3 kernel: [582660.901034] lowmem_reserve[]: 0 0 4714 4714
Nov  2 09:13:48 krshina3 kernel: [582660.901040] Normal free:385536kB
min:6884kB low:8604kB high:10324kB active_anon:1823540kB
inactive_anon:312756kB active_file:954660kB inactive_file:954652kB
unevictable:0kB isolated(anon):0kB isolated(file):0kB
present:4954112kB managed:4828124kB mlocked:0kB dirty:2992kB
writeback:0kB mapped:87920kB shmem:17192kB slab_reclaimable:284008kB
slab_unreclaimable:24280kB kernel_stack:4368kB pagetables:24912kB
unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB
pages_scanned:21 all_unreclaimable? no
Nov  2 09:13:48 krshina3 kernel: [582660.901041] lowmem_reserve[]: 0 0 0 0
Nov  2 09:13:48 krshina3 kernel: [582660.901044] DMA: 1*4kB (U) 1*8kB
(U) 1*16kB (U) 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB
1*1024kB (U) 1*2048kB (R) 3*4096kB (M) = 15900kB
Nov  2 09:13:48 krshina3 kernel: [582660.901054] DMA32: 46552*4kB (UE)
7159*8kB (U) 2*16kB (R) 0*32kB 1*64kB (R) 0*128kB 0*256kB 0*512kB
0*1024kB 0*2048kB 0*4096kB = 243576kB
Nov  2 09:13:48 krshina3 kernel: [582660.901063] Normal: 40881*4kB
(UEM) 27461*8kB (UEM) 151*16kB (UR) 2*32kB (R) 0*64kB 0*128kB 0*256kB
0*512kB 0*1024kB 0*2048kB 0*4096kB = 385692kB
Nov  2 09:13:48 krshina3 kernel: [582660.901072] Node 0
hugepages_total=0 hugepages_free=0 hugepages_surp=0
hugepages_size=2048kB
Nov  2 09:13:48 krshina3 kernel: [582660.901073] 789766 total pagecache pages
Nov  2 09:13:48 krshina3 kernel: [582660.901075] 2404 pages in swap cache
Nov  2 09:13:48 krshina3 kernel: [582660.901076] Swap cache stats: add
94924, delete 92520, find 40323/43073
Nov  2 09:13:48 krshina3 kernel: [582660.901077] Free swap  = 261888kB
Nov  2 09:13:48 krshina3 kernel: [582660.901078] Total swap = 594300kB
Nov  2 09:13:48 krshina3 kernel: [582660.901079] 2017164 pages RAM
Nov  2 09:13:48 krshina3 kernel: [582660.901080] 0 pages HighMem/MovableOnly
Nov  2 09:13:48 krshina3 kernel: [582660.901081] 31497 pages reserved


Now I'm gonna fsck all partitions and report if anything comes up.

Ask if you need more info

Thanks in advance
Dushan
