From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on /mnt/backup
 failed: Cannot allocate memory
Date: Mon, 03 Nov 2014 12:42:01 +0100
Message-ID: <54576A09.6010901@gmail.com>
References: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com>	<CADW=+3ms6zaqzpkRBEgApi=gkMNPLCzzex8ShK4CkCFD-WNk8Q@mail.gmail.com>	<5457629C.8040906@gmail.com> <CADW=+3=XfcVJsYTitCHdAsehw61Vyk0vHqM7wLr0dQNLiP94Fw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=PLvQWMdAvqORX0ZD7QtEEXtcM0KWsDf2pBWb3GgXW/I=;
        b=qwNC4rLWCtkEm3Fh6BYseoyIPH8smPXzWopw1ZmltAn9Wb4cDbuieC8le/Wa+V15r4
         cifoYfXHSgGS9HJlKQ3BRGW2WfaHtIWpNrj5aULi3HcxhYSr+kacuAWbbAwdkSgVp+2v
         kxUZ6/ONUtZWk8v4JRJjwyBOo6pzwcZw5XJs9mmqND91M11IgGG/sxByiPI2eM0QIYPx
         0PiwcLr7nN6kooEBq/dvliHYpXvHtFISMUCevPbbb1UbF9vL30m6kJmD9Ybvjg6oFjQl
         3Kv0kZJPsRr2r/VcenEdCtlcpuXE+KCYSKOd/pafHG9SB7hL/1HYrxzJNFD+YDZ4X8qV
         dJPg==
In-Reply-To: <CADW=+3=XfcVJsYTitCHdAsehw61Vyk0vHqM7wLr0dQNLiP94Fw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Ivan Shapovalov <intelfx100@gmail.com>


On 11/03/2014 12:12 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> I fscked it yesterday before crash and now I'm fsck-ing it again but
> as you remember it lasts 1hr+ for some reason.


=46or the full 70G partition it looks normal.

OK, if you can reproduce this BUG at fs/reiser4/plugin/item/ctail.c:669
after fsck, then please let me know: it will essentially speed up thing=
s..

Edward.



>
> On Mon, Nov 3, 2014 at 12:10 PM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> On 11/03/2014 11:58 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>> Now a Bug happened to me on this same ccreg40 partition with
>> Reiser4-for-3.16.2.patch and I don't know if it's related.
>>
>>
>>
>> It can not be related to inability to allocate memory at mount time.
>>
>>
>> I have a partition that I use for daily, weekly and monthly snapshot=
s -
>> /dev/md125 with rsnapshot.
>> I fsck-ed it yesterday.
>>
>>
>>
>> Did you fsck-ed it before, or after crash?
>>
>> Edward.
>>
>>
>>
>> After mounting rsync starts and snapshots my /home directory. This B=
ug
>> happened on rsync start.
>>
>>
>> rsnapshot log:
>> fsck.reiser4 /dev/md125
>> rsync: writefd_unbuffered failed to write 5 bytes to socket [generat=
or]:
>> Broken pipe (32)
>> rsync error: error in rsync protocol data stream (code 12) at io.c(1=
532)
>> [generator=3D3.0.9]
>> ------------------------------
>> ----------------------------------------------
>> rsnapshot encountered an error! The program was invoked with these o=
ptions:
>> /usr/bin/rsnapshot -c /etc/rsnapshot.d/daily.conf daily
>> --------------------------------------------------------------------=
--------
>> ERROR: /usr/bin/rsync returned 0.04296875 while processing /home/
>> WARNING: Rolling back "localhost/"
>> Backup failure
>>
>> daily.conf:
>> include_conf    /etc/rsnapshot.d/base.conf
>>
>> # Daily (30 increments)
>> interval        daily   30
>> backup          /home/          localhost/
>> exclude         /home/windows.qcow2
>>
>> base.conf:
>>
>> # Default config version
>> config_version  1.2
>>
>> # So the hard disk is not polluted in case the backup filesystem is =
not
>> available
>> no_create_root  1
>>
>> # Standard settings
>> cmd_cp                  /bin/cp
>> cmd_rm                  /bin/rm
>> cmd_rsync               /usr/bin/rsync
>> link_dest               1
>> cmd_rsnapshot_diff      /usr/bin/rsnapshot-diff
>>
>> # For convenience, so that mount points can be taken as backup start=
ing
>> points
>> one_fs                  1
>>
>> # Store all backups in one directory per machine
>> # A useful alternative may be to create a separate directory for eac=
h
>> interval
>> snapshot_root   /mnt/backup/
>>
>> Logs:
>> Nov  3 07:00:10 krshina3 kernel: [ 1650.974059] reiser4: md125: foun=
d disk
>> format 4.0.0.
>> Nov  3 07:00:13 krshina3 kernel: [ 1654.207021] reiser4: md125: usin=
g Hybrid
>> Transaction Model.
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.914414] ------------[ cut he=
re
>> ]------------
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.914682] kernel BUG at
>> fs/reiser4/plugin/item/ctail.c:669!
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.915010] invalid opcode: 0000=
 [#1]
>> SMP
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.915259] CPU: 0 PID: 4950 Com=
m: rsync
>> Not tainted 3.16.5-gentoo #1
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.915625] Hardware name: Gigab=
yte
>> Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS F5 07/04/2=
012
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.916183] task: ffff88022d3f17=
d0 ti:
>> ffff880100004000 task.ti: ffff880100004000
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.916610] RIP:
>> 0010:[<ffffffff811c3a70>]  [<ffffffff811c3a70>]
>> do_readpage_ctail+0x2c0/0x420
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.917111] RSP: 0018:ffff880100=
007978
>> EFLAGS: 00010246
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.917412] RAX: 800000000000002=
5 RBX:
>> ffffea0004570218 RCX: ffff8800b94f0800
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.917819] RDX: 000000000000003=
5 RSI:
>> 0000000000000000 RDI: ffff8800b94f0000
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.918226] RBP: ffff8801000079b=
8 R08:
>> 0000000000001000 R09: 0000000000000001
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.918632] R10: ffffffff811b3fc=
0 R11:
>> ffffea00023f1330 R12: 0000000000000002
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.919039] R13: ffff8801ebb78d2=
0 R14:
>> ffff880100007a88 R15: 0000000000000001
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.919450] FS:  00007f4d6b27c70=
0(0000)
>> GS:ffff88022e200000(0000) knlGS:0000000000000000
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.919912] CS:  0010 DS: 0000 E=
S: 0000
>> CR0: 0000000080050033
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.920239] CR2: 0000000003035dd=
f CR3:
>> 0000000008a76000 CR4: 00000000001427e0
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.920645] Stack:
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.920756]  ffff8801000079b8
>> ffffffff811b5c4f ffffea0004570218 ffff880100007a88
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.921200]  ffffea0004570218
>> 0000000000000000 ffff8801ebb78d20 ffffffff811c3bd0
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.921643]  ffff880100007a08
>> ffffffff811c3cea ffff880100007a08 00000000810e1785
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.922087] Call Trace:
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.922226]  [<ffffffff811b5c4f>=
] ?
>> prepare_page_cluster+0xff/0x1f0
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.922583]  [<ffffffff811c3bd0>=
] ?
>> do_readpage_ctail+0x420/0x420
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.922931]  [<ffffffff811c3cea>=
]
>> ctail_readpages_filler+0x11a/0x220
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.923299]  [<ffffffff811c3bd0>=
] ?
>> do_readpage_ctail+0x420/0x420
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.923646]  [<ffffffff810ebdfa>=
]
>> read_cache_pages+0xba/0x120
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.923973]  [<ffffffff811c4073>=
]
>> readpages_ctail+0x133/0x360
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.924299]  [<ffffffff811b7e76>=
]
>> readpages_cryptcompress+0x46/0x80
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.924656]  [<ffffffff811a2b8e>=
]
>> reiser4_readpages_dispatch+0x3e/0x50
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.925029]  [<ffffffff810ec009>=
]
>> __do_page_cache_readahead+0x1a9/0x240
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.925407]  [<ffffffff810ec1f7>=
]
>> ondemand_readahead+0x157/0x290
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.925749]  [<ffffffff810e2326>=
] ?
>> pagecache_get_page+0x36/0x1e0
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.926097]  [<ffffffff810ec41e>=
]
>> page_cache_sync_readahead+0x2e/0x50
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.926464]  [<ffffffff810e33e9>=
]
>> generic_file_read_iter+0x409/0x5f0
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.926827]  [<ffffffff8112da8e>=
] ?
>> link_path_walk+0x26e/0x880
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.927160]  [<ffffffff81122b49>=
]
>> new_sync_read+0x79/0xb0
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.927470]  [<ffffffff811b7f23>=
]
>> read_cryptcompress+0x73/0xb0
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.927803]  [<ffffffff811b21c2>=
]
>> reiser4_read_dispatch+0x72/0x160
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.928156]  [<ffffffff81123abb>=
]
>> vfs_read+0x9b/0x190
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.928443]  [<ffffffff8112408a>=
]
>> SyS_read+0x4a/0xc0
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.928726]  [<ffffffff816ab1d2>=
]
>> system_call_fastpath+0x16/0x1b
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.929068] Code: fe ff ff 0f 1f=
 84 00
>> 00 00 00 00 48 89 df e8 a8 e4 f1 ff e9 3c fe ff ff 0f 1f 00 48 89 df=
 e8 98
>> e4 f1 ff e9 73 fe ff ff 0f 1f 00 <0f> 0b 48 8b 03 a8 08 0f 84 a1 00 =
00 00 49
>> 8b be 80 00 00 00 e8
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.930505] RIP  [<ffffffff811c3=
a70>]
>> do_readpage_ctail+0x2c0/0x420
>> Nov  3 07:00:52 krshina3 kernel: [ 1692.930868]  RSP <ffff8801000079=
78>
>> Nov  3 07:00:52 krshina3 kernel: [ 1693.043372] ---[ end trace
>> 36e8590f8aa347d3 ]---
>>
>> On Sun, Nov 2, 2014 at 9:38 AM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@g=
mail.com> wrote:
>>> When I try to mount a cc reiser4 partition (reiser4-for-3.16.2.patc=
h)
>>> I get: mount: mount /dev/md125 on /mnt/backup failed: Cannot alloca=
te
>>> memory
>>> Uptime is almost 7 days and mounting of this partition worked every
>>> day untill last night (I get automated messages on mail when someth=
ing
>>> goes wrong).
>>>
>>> Now I tried on kernel 3.10 and everything works OK
>>>
>>> krshina3 goran # uname -a
>>> Linux krshina3 3.10.6-gentoo #2 SMP Wed Aug 14 17:33:45 CEST 2013
>>> x86_64 Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz GenuineIntel GNU/Lin=
ux
>>>
>>> krshina3 goran# free -m
>>>               total       used       free     shared    buffers    =
 cached
>>> Mem:          7681       6794        887         30          0     =
  2933
>>> -/+ buffers/cache:       3860       3821
>>> Swap:          580        325        254
>>>
>>> krshina3 goran# cat /etc/fstab | grep -v "#"
>>>
>>> /dev/sda1               /boot           ext2            noauto,noat=
ime  1
>>> 2
>>> /dev/md123              none            swap            sw         =
     0
>>> 0
>>> /dev/sda2               /               reiser4
>>> noatime,onerror=3Dremount-ro              0 0
>>> /dev/md125              /mnt/backup     reiser4
>>> noatime,noauto,onerror=3Dremount-ro       0 0
>>> /dev/md126              /mnt/media      reiser4
>>> noatime,users,onerror=3Dremount-ro        0 0
>>> /dev/md127              /usr/portage    reiser4
>>> noatime,onerror=3Dremount-ro              0 0
>>> shm                     /dev/shm        tmpfs
>>> nodev,nosuid,noexec     0 0
>>>
>>>
>>> krshina3 goran # df
>>> Filesystem     1K-blocks      Used Available Use% Mounted on
>>> /dev/sda2       37017728  24870384  12147344  68% /
>>> tmpfs             786872       832    786040   1% /run
>>> udev               10240         0     10240   0% /dev
>>> shm              3934340        80   3934260   1% /dev/shm
>>> /dev/md126     383034100 298007740  85026360  78% /mnt/media
>>> /dev/md127       6113484   5427288    686196  89% /usr/portage
>>> /dev/md125      64959612  57618884   7340728  89% /mnt/backup
>>>
>>> I get these in logs:
>>>
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221513] reiser4: md125: fo=
und
>>> disk format 4.0.0.
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221749] mount: page
>>> allocation failure: order:4, mode:0x2040d0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221752] CPU: 0 PID: 517 Co=
mm:
>>> mount Not tainted 3.16.5-gentoo #1
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221753] Hardware name:
>>> Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS =
=465
>>> 07/04/2012
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221754]  0000000000000000
>>> ffff88020ece7968 ffffffff816a31b4 0000000000000007
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221757]  00000000002040d0
>>> ffff88020ece79f8 ffffffff810e609a ffffffff00000040
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221758]  0000000000000286
>>> ffffffff819a8a78 fffffff00000000f ffff88020ece79c8
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221760] Call Trace:
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221765]  [<ffffffff816a31b=
4>]
>>> dump_stack+0x46/0x58
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221768]  [<ffffffff810e609=
a>]
>>> warn_alloc_failed+0xda/0x130
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221770]  [<ffffffff810e86c=
9>]
>>> __alloc_pages_nodemask+0x5d9/0x7a0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221774]  [<ffffffff8111f16=
a>]
>>> cache_alloc_refill+0x31a/0x550
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221776]  [<ffffffff8111ee2=
3>]
>>> kmem_cache_alloc+0xb3/0xe0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221778]  [<ffffffff8118652=
9>]
>>> znodes_tree_init+0xc9/0x120
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221781]  [<ffffffff8118e7b=
4>]
>>> reiser4_init_tree+0x44/0xd0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221784]  [<ffffffff811cb90=
5>]
>>> init_format_format40+0x265/0x5b0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221787]  [<ffffffff8119e8b=
1>]
>>> fill_super+0x101/0x200
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221789]  [<ffffffff81126be=
4>]
>>> mount_bdev+0x194/0x1d0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221792]  [<ffffffff8119e7b=
0>]
>>> ? reiser4_mount+0x20/0x20
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221794]  [<ffffffff8119e7a=
0>]
>>> reiser4_mount+0x10/0x20
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221796]  [<ffffffff81126e2=
b>]
>>> mount_fs+0x1b/0xd0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221799]  [<ffffffff8114042=
f>]
>>> vfs_kern_mount+0x6f/0x130
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221801]  [<ffffffff81141f6=
8>]
>>> do_mount+0x218/0xab0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221803]  [<ffffffff810e88a=
2>]
>>> ? __get_free_pages+0x12/0x60
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221805]  [<ffffffff81141bf=
5>]
>>> ? copy_mount_options+0x35/0x150
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221808]  [<ffffffff81142ad=
9>]
>>> SyS_mount+0x89/0xd0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221811]  [<ffffffff816ab1d=
2>]
>>> system_call_fastpath+0x16/0x1b
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221812] Mem-Info:
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221813] DMA per-cpu:
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221814] CPU    0: hi:    0=
,
>>> btch:   1 usd:   0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221815] CPU    1: hi:    0=
,
>>> btch:   1 usd:   0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221816] CPU    2: hi:    0=
,
>>> btch:   1 usd:   0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221817] CPU    3: hi:    0=
,
>>> btch:   1 usd:   0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221817] DMA32 per-cpu:
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221819] CPU    0: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221819] CPU    1: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221820] CPU    2: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221821] CPU    3: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221822] Normal per-cpu:
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221823] CPU    0: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221824] CPU    1: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221825] CPU    2: hi:  186=
,
>>> btch:  31 usd:  56
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221826] CPU    3: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221828] active_anon:701641
>>> inactive_anon:138699 isolated_anon:0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221828]  active_file:39951=
9
>>> inactive_file:396920 isolated_file:0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221828]  unevictable:0
>>> dirty:204 writeback:0 unstable:0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221828]  free:155878
>>> slab_reclaimable:126123 slab_unreclaimable:9074
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221828]  mapped:21535
>>> shmem:5701 pagetables:10162 bounce:0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221828]  free_cma:0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221833] DMA free:15900kB
>>> min:20kB low:24kB high:28kB active_anon:0kB inactive_anon:0kB
>>> active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0k=
B
>>> isolated(file):0kB present:15984kB managed:15900kB mlocked:0kB
>>> dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB
>>> slab_unreclaimable:0kB kernel_stack:0kB pagetables:0kB unstable:0kB
>>> bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0
>>> all_unreclaimable? yes
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221834] lowmem_reserve[]: =
0
>>> 2950 7665 7665
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221839] DMA32 free:250180k=
B
>>> min:4308kB low:5384kB high:6460kB active_anon:1026572kB
>>> inactive_anon:257356kB active_file:616152kB inactive_file:612572kB
>>> unevictable:0kB isolated(anon):0kB isolated(file):0kB
>>> present:3098560kB managed:3022260kB mlocked:0kB dirty:4kB
>>> writeback:0kB mapped:33232kB shmem:9336kB slab_reclaimable:180492kB
>>> slab_unreclaimable:12176kB kernel_stack:2496kB pagetables:16872kB
>>> unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanne=
d:0
>>> all_unreclaimable? no
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221840] lowmem_reserve[]: =
0 0
>>> 4714 4714
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221844] Normal free:357432=
kB
>>> min:6884kB low:8604kB high:10324kB active_anon:1779992kB
>>> inactive_anon:297440kB active_file:981924kB inactive_file:975108kB
>>> unevictable:0kB isolated(anon):0kB isolated(file):0kB
>>> present:4954112kB managed:4828124kB mlocked:0kB dirty:812kB
>>> writeback:0kB mapped:52908kB shmem:13468kB slab_reclaimable:324000k=
B
>>> slab_unreclaimable:24120kB kernel_stack:4160kB pagetables:23776kB
>>> unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB
>>> pages_scanned:24 all_unreclaimable? no
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221845] lowmem_reserve[]: =
0 0 0 0
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221847] DMA: 1*4kB (U) 1*8=
kB
>>> (U) 1*16kB (U) 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB
>>> 1*1024kB (U) 1*2048kB (R) 3*4096kB (M) =3D 15900kB
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221855] DMA32: 52520*4kB
>>> (UEM) 5030*8kB (UE) 3*16kB (UR) 0*32kB 1*64kB (R) 0*128kB 0*256kB
>>> 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 250432kB
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221861] Normal: 62961*4kB
>>> (UEM) 11874*8kB (UEM) 640*16kB (UEMR) 17*32kB (UEMR) 1*64kB (E)
>>> 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 357684kB
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221867] Node 0
>>> hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0
>>> hugepages_size=3D2048kB
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221868] 804788 total pagec=
ache
>>> pages
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221869] 2600 pages in swap=
 cache
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221870] Swap cache stats: =
add
>>> 91111, delete 88511, find 38599/41340
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221871] Free swap  =3D 277=
028kB
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221872] Total swap =3D 594=
300kB
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221873] 2017164 pages RAM
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221873] 0 pages
>>> HighMem/MovableOnly
>>> Nov  2 03:30:01 krshina3 kernel: [562035.221874] 31497 pages reserv=
ed
>>>
>>>
>>>
>>>
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900521] reiser4: md125: fo=
und
>>> disk format 4.0.0.
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900907] mount: page
>>> allocation failure: order:4, mode:0x2040d0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900910] CPU: 1 PID: 1414
>>> Comm: mount Not tainted 3.16.5-gentoo #1
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900912] Hardware name:
>>> Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS =
=465
>>> 07/04/2012
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900914]  0000000000000000
>>> ffff880148093968 ffffffff816a31b4 0000000000000007
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900917]  00000000002040d0
>>> ffff8801480939f8 ffffffff810e609a ffffffff00000040
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900919]  0000000000000286
>>> ffffffff819a8a78 fffffff00000000f ffff8801480939c8
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900922] Call Trace:
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900929]  [<ffffffff816a31b=
4>]
>>> dump_stack+0x46/0x58
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900933]  [<ffffffff810e609=
a>]
>>> warn_alloc_failed+0xda/0x130
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900937]  [<ffffffff810e86c=
9>]
>>> __alloc_pages_nodemask+0x5d9/0x7a0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900941]  [<ffffffff8111f16=
a>]
>>> cache_alloc_refill+0x31a/0x550
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900945]  [<ffffffff8111ee2=
3>]
>>> kmem_cache_alloc+0xb3/0xe0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900948]  [<ffffffff8118652=
9>]
>>> znodes_tree_init+0xc9/0x120
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900951]  [<ffffffff8118e7b=
4>]
>>> reiser4_init_tree+0x44/0xd0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900955]  [<ffffffff811cb90=
5>]
>>> init_format_format40+0x265/0x5b0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900959]  [<ffffffff8119e8b=
1>]
>>> fill_super+0x101/0x200
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900963]  [<ffffffff81126be=
4>]
>>> mount_bdev+0x194/0x1d0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900966]  [<ffffffff8119e7b=
0>]
>>> ? reiser4_mount+0x20/0x20
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900969]  [<ffffffff8119e7a=
0>]
>>> reiser4_mount+0x10/0x20
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900972]  [<ffffffff81126e2=
b>]
>>> mount_fs+0x1b/0xd0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900976]  [<ffffffff8114042=
f>]
>>> vfs_kern_mount+0x6f/0x130
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900979]  [<ffffffff81141f6=
8>]
>>> do_mount+0x218/0xab0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900982]  [<ffffffff810e88a=
2>]
>>> ? __get_free_pages+0x12/0x60
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900986]  [<ffffffff81141bf=
5>]
>>> ? copy_mount_options+0x35/0x150
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900989]  [<ffffffff81142ad=
9>]
>>> SyS_mount+0x89/0xd0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900993]  [<ffffffff816ab1d=
2>]
>>> system_call_fastpath+0x16/0x1b
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900994] Mem-Info:
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900996] DMA per-cpu:
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900997] CPU    0: hi:    0=
,
>>> btch:   1 usd:   0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.900999] CPU    1: hi:    0=
,
>>> btch:   1 usd:   0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901000] CPU    2: hi:    0=
,
>>> btch:   1 usd:   0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901001] CPU    3: hi:    0=
,
>>> btch:   1 usd:   0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901002] DMA32 per-cpu:
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901004] CPU    0: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901005] CPU    1: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901006] CPU    2: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901008] CPU    3: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901009] Normal per-cpu:
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901010] CPU    0: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901011] CPU    1: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901013] CPU    2: hi:  186=
,
>>> btch:  31 usd:  21
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901014] CPU    3: hi:  186=
,
>>> btch:  31 usd:   0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901017] active_anon:719713
>>> inactive_anon:145280 isolated_anon:0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901017]  active_file:39003=
5
>>> inactive_file:389999 isolated_file:0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901017]  unevictable:0
>>> dirty:1180 writeback:0 unstable:0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901017]  free:161223
>>> slab_reclaimable:112227 slab_unreclaimable:9155
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901017]  mapped:35966
>>> shmem:7263 pagetables:10549 bounce:0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901017]  free_cma:0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901024] DMA free:15900kB
>>> min:20kB low:24kB high:28kB active_anon:0kB inactive_anon:0kB
>>> active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0k=
B
>>> isolated(file):0kB present:15984kB managed:15900kB mlocked:0kB
>>> dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB
>>> slab_unreclaimable:0kB kernel_stack:0kB pagetables:0kB unstable:0kB
>>> bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0
>>> all_unreclaimable? yes
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901026] lowmem_reserve[]: =
0
>>> 2950 7665 7665
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901033] DMA32 free:243456k=
B
>>> min:4308kB low:5384kB high:6460kB active_anon:1055312kB
>>> inactive_anon:268364kB active_file:605480kB inactive_file:605344kB
>>> unevictable:0kB isolated(anon):0kB isolated(file):0kB
>>> present:3098560kB managed:3022260kB mlocked:0kB dirty:1728kB
>>> writeback:0kB mapped:55944kB shmem:11860kB slab_reclaimable:164900k=
B
>>> slab_unreclaimable:12340kB kernel_stack:2496kB pagetables:17284kB
>>> unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanne=
d:0
>>> all_unreclaimable? no
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901034] lowmem_reserve[]: =
0 0
>>> 4714 4714
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901040] Normal free:385536=
kB
>>> min:6884kB low:8604kB high:10324kB active_anon:1823540kB
>>> inactive_anon:312756kB active_file:954660kB inactive_file:954652kB
>>> unevictable:0kB isolated(anon):0kB isolated(file):0kB
>>> present:4954112kB managed:4828124kB mlocked:0kB dirty:2992kB
>>> writeback:0kB mapped:87920kB shmem:17192kB slab_reclaimable:284008k=
B
>>> slab_unreclaimable:24280kB kernel_stack:4368kB pagetables:24912kB
>>> unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB
>>> pages_scanned:21 all_unreclaimable? no
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901041] lowmem_reserve[]: =
0 0 0 0
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901044] DMA: 1*4kB (U) 1*8=
kB
>>> (U) 1*16kB (U) 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB
>>> 1*1024kB (U) 1*2048kB (R) 3*4096kB (M) =3D 15900kB
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901054] DMA32: 46552*4kB (=
UE)
>>> 7159*8kB (U) 2*16kB (R) 0*32kB 1*64kB (R) 0*128kB 0*256kB 0*512kB
>>> 0*1024kB 0*2048kB 0*4096kB =3D 243576kB
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901063] Normal: 40881*4kB
>>> (UEM) 27461*8kB (UEM) 151*16kB (UR) 2*32kB (R) 0*64kB 0*128kB 0*256=
kB
>>> 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 385692kB
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901072] Node 0
>>> hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0
>>> hugepages_size=3D2048kB
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901073] 789766 total pagec=
ache
>>> pages
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901075] 2404 pages in swap=
 cache
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901076] Swap cache stats: =
add
>>> 94924, delete 92520, find 40323/43073
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901077] Free swap  =3D 261=
888kB
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901078] Total swap =3D 594=
300kB
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901079] 2017164 pages RAM
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901080] 0 pages
>>> HighMem/MovableOnly
>>> Nov  2 09:13:48 krshina3 kernel: [582660.901081] 31497 pages reserv=
ed
>>>
>>>
>>> Now I'm gonna fsck all partitions and report if anything comes up.
>>>
>>> Ask if you need more info
>>>
>>> Thanks in advance
>>> Dushan
>>
>>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
