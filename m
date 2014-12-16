From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on
 /mnt/backup failed: Cannot allocate memory
Date: Tue, 16 Dec 2014 14:03:14 +0100
Message-ID: <CADW=+3kAMh3hiz7nr6qvW05w21uc=G0RYn-Mu0iT0BGE+QSRJw@mail.gmail.com>
References: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com>
	<CADW=+3nSsTDABn4bWy0g8LVGmx4iJJ8YvdYuS2eokpi4RwdepQ@mail.gmail.com>
	<5458CB45.2050303@gmail.com>
	<CADW=+3k7mvPTc0x02UKYbg6Jq=zUQ5dORiUULNiB7kFLXjiG6g@mail.gmail.com>
	<545965C7.5010304@gmail.com>
	<CADW=+3k40KVKf5hLD1BgJ8a6uj=ZJ=T_gOmijDZVxWS3pK_6AQ@mail.gmail.com>
	<54665EFD.7030304@gmail.com>
	<CADW=+3mrqv=BjX8TCpRszFbr3OYEvgOk0OpcYe56f6OJmYDZbQ@mail.gmail.com>
	<CADW=+3m75JHiu2fWHJ5mq0Q4XUd2vkp5An1mKsOPkd8OWQnz+w@mail.gmail.com>
	<547BACC8.6090805@gmail.com>
	<CADW=+3=Tqw-2yfe6q4ERKSdyu9BmbApoREi-p4A7Auu_k27A6Q@mail.gmail.com>
	<547BAF3D.1000605@gmail.com>
	<CADW=+3=GpYCc3aQOexJY7afL6suKxXRhs=dkf0m9zZfHQ0cnFA@mail.gmail.com>
	<CADW=+3kpg6zYxNWwX5tN0AWZ8Cuof0ccVRsQaL-6knM5AmOhbg@mail.gmail.com>
	<54843175.7010503@gmail.com>
	<CADW=+3mU8A6VzsZ2KTmgc=qVhSJ1DHHLmQAcqrk+BvOTKSLnuQ@mail.gmail.com>
	<54858A06.1000504@gmail.com>
	<CADW=+3=ogWit1ppvthPSvR9p8RQGjn2OKj7a2QAK-vcppfuhLg@mail.gmail.com>
	<5485FB84.5010001@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=bp0ah3tuN1/ea5btHFdHy9ogZIffCEcRLXbfeX8kEuA=;
        b=OAKp4PFOdsu5j0zodvD+2de6sqdab1gOG/38BwgwOm3DeGJGqENrNlhLuSdJ2VJnwK
         9pWOjilVqM73bCDwc3en2gRvPnFflwMWOWq9fHdMvmvRkR3Mx/+gOmE0Ryicg+8kjzul
         vzJa9hX4o7Q73tPJ9CEscdFlszTfHs5qUWxhdViB+dL6fTYEYLr5ZkWOv4PxZI8fUe9A
         U/hs6GkaB3pUo6WIOmNK5ohIfo6YiWeCmWGJY48uEE/LFZ0md4sJQEIZSoh+rXeEHon9
         f+qzRH+M2GYmpLaxoLmFda03bDzbfsj+ILpgVS3u16RNnDTAIoJOa5EbIJMrY49yR5si
         ZhVQ==
In-Reply-To: <5485FB84.5010001@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Ivan Shapovalov <intelfx100@gmail.com>

On Mon, Dec 8, 2014 at 8:27 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> So in 3.16 when we ask for some memory, we get ENOMEM
> plus a corrupted root partition..
> I would also check the stuff for 3.17 before doing anything.
>
With 3.16.2.patch the problem usually manifested after 4th run.
With 3.17.2.patch last night system finished 5th rsnapshot run without =
problems.
I'll try to keep it up as long as possible.



> Thanks,
> Edward.
>
>
>
> On 12/08/2014 12:54 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>> On Mon, Dec 8, 2014 at 12:22 PM, Edward Shishkin
>> <edward.shishkin@gmail.com> wrote:
>>>
>>> Is .config the same as in the stuff for 3.10?
>>>
>>> Thanks,
>>> Edward.
>>>
>> Only thing that jumps out that we haven't mentioned yet is optimize =
for
>> size....
>> I used same config for 3.16.2.patch and for 3.16ported-from3.11.patc=
h
>>
>> http://marc.info/?l=3Dreiserfs-devel&m=3D141503126615043&w=3D2
>>
>> "
>>
>> Last time I enabled page migration in kernel so I tried to find what=
's
>> the difference between kernel config that worked and that fails:
>>
>> krshina3 linux-3.16.5-gentoo # diff -du ./.config configBAD |grep
>> "+"|grep -v "#"|grep -v "@@"
>> --- ./.config   2014-11-03 17:09:03.895249969 +0100
>> +++ configBAD   2014-10-24 01:27:07.677613236 +0200
>> +CONFIG_CGROUPS=3Dy
>> +CONFIG_CGROUP_SCHED=3Dy
>> +CONFIG_FAIR_GROUP_SCHED=3Dy
>> +CONFIG_SCHED_AUTOGROUP=3Dy
>> +CONFIG_SCHED_MC=3Dy
>> +CONFIG_KSM=3Dy
>> +CONFIG_X86_INTEL_PSTATE=3Dy
>> +CONFIG_EDAC=3Dy
>> +CONFIG_EDAC_LEGACY_SYSFS=3Dy
>> +CONFIG_DEBUG_INFO=3Dy
>> +CONFIG_DEBUG_INFO_REDUCED=3Dy
>> +CONFIG_FRAME_POINTER=3Dy
>>
>>
>> krshina3 linux-3.16.5-gentoo # diff -du ./.config configBAD |grep
>> "-"|grep -v "#"|grep -v "@@"
>> --- ./.config   2014-11-03 17:09:03.895249969 +0100
>> +++ configBAD   2014-10-24 01:27:07.677613236 +0200
>> -CONFIG_USELIB=3Dy
>> -CONFIG_AUDIT=3Dy
>> -CONFIG_AUDITSYSCALL=3Dy
>> -CONFIG_AUDIT_WATCH=3Dy
>> -CONFIG_AUDIT_TREE=3Dy
>> -CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
>> -CONFIG_GART_IOMMU=3Dy
>> -CONFIG_LCD_CLASS_DEVICE=3Dy
>> "
>>
>>
>>>
>>> On 12/08/2014 12:45 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>
>>>> On Sun, Dec 7, 2014 at 11:52 AM, Edward Shishkin
>>>> <edward.shishkin@gmail.com>  wrote:
>>>>>
>>>>> And the root partition became corrupted, or...?
>>>>>
>>>> Yes, just managed to fsck it now.
>>>>
>>>> fsck:
>>>>
>>>> CHECKING THE STORAGE TREE
>>>> $
>>>> [=3D=3D\                                                ] 4%
>>>> $
>>>>           Nodes left in the tree 3678479
>>>>                   Leaves of them 3626831, Twigs of them 50438
>>>>           Time interval: Sun Dec  7 23:22:35 2014 - Sun Dec  7 23:=
25:26
>>>> 2014
>>>> CHECKING EXTENT REGIONS.
>>>>           Read twigs 50438
>>>>           Time interval: Sun Dec  7 23:25:26 2014 - Sun Dec  7 23:=
25:35
>>>> 2014
>>>> CHECKING THE SEMANTIC TREE
>>>> FSCK:
>>>>
>>>>
>>>> /mkdeb/build/reiser4progs/reiser4progs/plugin/object/ccreg40/ccreg=
40_repair.c:
>>>> 167: ccreg40_check_cluster: The file [1b529a6:134623831303736:1d80=
a73]
>>>> (ccreg40): the cluster at [0] offset 65536 bytes long is orphan.
>>>>           Found 543127 objects (some could be encountered more the=
n
>>>> once).
>>>>           Time interval: Sun Dec  7 23:25:35 2014 - Sun Dec  7 23:=
28:50
>>>> 2014
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/repair.c: 5=
50:
>>>> repair_sem_fini: On-disk used block bitmap and really used block b=
itmap
>>>> differ.
>>>> ***** fsck.reiser4 finished at Sun Dec  7 23:28:50 2014
>>>> Closing fs...done
>>>>
>>>>
>>>> build-fs:
>>>>
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4078203), items (60) and (61): Wron=
g
>>>> order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4078899), items (6) and (7): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4079383), items (0) and (1): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4079488), items (0) and (1): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4079546), items (0) and (1): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4080447), items (0) and (1): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4080571), items (0) and (1): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4081137), items (1) and (2): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4090871), items (0) and (1): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4091337), items (0) and (1): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4091990), items (0) and (1): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4092423), items (1) and (2): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4093016), items (0) and (1): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4093690), items (27) and (28): Wron=
g
>>>> order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4094525), items (0) and (1): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4096175), items (0) and (1): Wrong =
order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4099659), items (12) and (13): Wron=
g
>>>> order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4099663), items (21) and (22): Wron=
g
>>>> order
>>>> of
>>>> keys.
>>>> FSCK: /mkdeb/build/reiser4progs/reiser4progs/librepair/node.c: 108=
:
>>>> repair_node_items_check: Node (4113492), items (0) and (1): Wrong =
order
>>>> of
>>>> keys.
>>>>
>>>>> Thanks,
>>>>> Edward.
>>>>>
>>>>>
>>>>>
>>>>> On 12/07/2014 09:07 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>>>
>>>>>> And on the  4th day:
>>>>>>
>>>>>> ### RSNAPSHOT DAILY ###
>>>>>> fsck.reiser4 /dev/md125
>>>>>> mount: mount /dev/md125 on /mnt/backup failed: Cannot allocate m=
emory
>>>>>> Backup failure
>>>>>> umount: /mnt/backup: not mounted
>>>>>>
>>>>>>
>>>>>> krshina3 ~ # cat /proc/meminfo
>>>>>> MemTotal:        7867900 kB
>>>>>> MemFree:         1553044 kB
>>>>>> MemAvailable:    4853752 kB
>>>>>> Buffers:               0 kB
>>>>>> Cached:          2975880 kB
>>>>>> SwapCached:         4944 kB
>>>>>> Active:          3780968 kB
>>>>>> Inactive:        2003640 kB
>>>>>> Active(anon):    2336740 kB
>>>>>> Inactive(anon):   498120 kB
>>>>>> Active(file):    1444228 kB
>>>>>> Inactive(file):  1505520 kB
>>>>>> Unevictable:           0 kB
>>>>>> Mlocked:               0 kB
>>>>>> SwapTotal:        594300 kB
>>>>>> SwapFree:         180008 kB
>>>>>> Dirty:              3064 kB
>>>>>> Writeback:             0 kB
>>>>>> AnonPages:       2804424 kB
>>>>>> Mapped:           180772 kB
>>>>>> Shmem:             26132 kB
>>>>>> Slab:             427632 kB
>>>>>> SReclaimable:     392984 kB
>>>>>> SUnreclaim:        34648 kB
>>>>>> KernelStack:        7536 kB
>>>>>> PageTables:        38328 kB
>>>>>> NFS_Unstable:          0 kB
>>>>>> Bounce:                0 kB
>>>>>> WritebackTmp:          0 kB
>>>>>> CommitLimit:     4528248 kB
>>>>>> Committed_AS:    5352472 kB
>>>>>> VmallocTotal:   34359738367 kB
>>>>>> VmallocUsed:      352244 kB
>>>>>> VmallocChunk:   34359293283 kB
>>>>>> HugePages_Total:       0
>>>>>> HugePages_Free:        0
>>>>>> HugePages_Rsvd:        0
>>>>>> HugePages_Surp:        0
>>>>>> Hugepagesize:       2048 kB
>>>>>> DirectMap4k:       12224 kB
>>>>>> DirectMap2M:     8056832 kB
>>>>>>
>>>>>>
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.958316] reiser4: md125:=
 found
>>>>>> disk format 4.0.0.
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.958998] mount: page
>>>>>> allocation failure: order:4, mode:0x2040d0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959000] CPU: 2 PID: 707=
8
>>>>>> Comm: mount Not tainted 3.16.5-gentoo #1
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959001] Hardware name:
>>>>>> Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V, BI=
OS F5
>>>>>> 07/04/2012
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959003]  00000000000000=
06
>>>>>> ffffffff8152bdfb 0000000000000001 ffffffff810b0bc3
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959005]  ffffffff81818d=
f8
>>>>>> 0000000000000000 00000002fffffff0 0000000000000010
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959006]  ffff8801007b27=
a0
>>>>>> 0000000000000000 0000000000000010 0000204081818240
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959008] Call Trace:
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959011]  [<ffffffff8152=
bdfb>]
>>>>>> ? dump_stack+0x41/0x51
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959014]  [<ffffffff810b=
0bc3>]
>>>>>> ? warn_alloc_failed+0x10c/0x120
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959016]  [<ffffffff810b=
2b66>]
>>>>>> ? __alloc_pages_nodemask+0x581/0x69d
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959019]  [<ffffffff810d=
b5f4>]
>>>>>> ? cache_alloc_refill+0x261/0x48c
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959022]  [<ffffffff8113=
eefd>]
>>>>>> ? reiser4_mount+0xc/0xc
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959024]  [<ffffffff810d=
b35f>]
>>>>>> ? kmem_cache_alloc+0x6d/0xa1
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959026]  [<ffffffff8112=
bf58>]
>>>>>> ? znodes_tree_init+0xb9/0xe6
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959028]  [<ffffffff8113=
23ee>]
>>>>>> ? reiser4_init_tree+0x3f/0xb2
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959031]  [<ffffffff8115=
fb05>]
>>>>>> ? init_format_format40+0x357/0x4e4
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959033]  [<ffffffff8108=
0f74>]
>>>>>> ? wake_up_bit+0xc/0x1b
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959035]  [<ffffffff8113=
efc8>]
>>>>>> ? fill_super+0xcb/0x1ad
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959037]  [<ffffffff810e=
142e>]
>>>>>> ? mount_bdev+0x133/0x186
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959039]  [<ffffffff810e=
15ed>]
>>>>>> ? mount_fs+0xc/0x9e
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959041]  [<ffffffff810f=
55f2>]
>>>>>> ? vfs_kern_mount+0x5e/0xef
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959042]  [<ffffffff810f=
71c1>]
>>>>>> ? do_mount+0x80b/0x904
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959044]  [<ffffffff810f=
74d5>]
>>>>>> ? SyS_mount+0x7e/0xb7
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959046]  [<ffffffff8153=
3612>]
>>>>>> ? system_call_fastpath+0x16/0x1b
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959047] Mem-Info:
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959048] DMA per-cpu:
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959049] CPU    0: hi:  =
  0,
>>>>>> btch:   1 usd:   0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959050] CPU    1: hi:  =
  0,
>>>>>> btch:   1 usd:   0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959051] CPU    2: hi:  =
  0,
>>>>>> btch:   1 usd:   0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959052] CPU    3: hi:  =
  0,
>>>>>> btch:   1 usd:   0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959052] DMA32 per-cpu:
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959053] CPU    0: hi:  =
186,
>>>>>> btch:  31 usd:   0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959054] CPU    1: hi:  =
186,
>>>>>> btch:  31 usd:   0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959055] CPU    2: hi:  =
186,
>>>>>> btch:  31 usd:   0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959056] CPU    3: hi:  =
186,
>>>>>> btch:  31 usd:   0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959057] Normal per-cpu:
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959057] CPU    0: hi:  =
186,
>>>>>> btch:  31 usd:   0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959058] CPU    1: hi:  =
186,
>>>>>> btch:  31 usd:   0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959059] CPU    2: hi:  =
186,
>>>>>> btch:  31 usd:   0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959060] CPU    3: hi:  =
186,
>>>>>> btch:  31 usd:   0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959062] active_anon:593=
069
>>>>>> inactive_anon:120226 isolated_anon:0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959062]  active_file:50=
3137
>>>>>> inactive_file:503029  isolated_file:0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959062]  unevictable:0
>>>>>> dirty:333 writeback:0 unstable:0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959062]  free:104532
>>>>>> slab_reclaimable:109978 slab_unreclaimable:8402
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959062]  mapped:51579
>>>>>> shmem:5928 pagetables:9488 bounce:0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959062]  free_cma:0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959068] DMA free:15900k=
B
>>>>>> min:20kB low:24kB high:28kB active_anon:0kB inactive_anon:0kB
>>>>>> active_file:0kB  inactive_file:0kB  unevictable:0kB isolated(ano=
n):0kB
>>>>>> isolated(file):0kB present:15984kB managed:15900kB mlocked:0kB
>>>>>> dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0k=
B
>>>>>> slab_unreclaimable:0kB kernel_stack:0kB pagetables:0kB unstable:=
0kB
>>>>>> bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0
>>>>>> all_unreclaimable? yes
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959069] lowmem_reserve[=
]: 0
>>>>>> 2952 7667 7667
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959074] DMA32 free:1680=
28kB
>>>>>> min:4308kB low:5384kB high:6460kB active_anon:837216kB
>>>>>> inactive_anon:214776kB active_file:790440kB  inactive_file:79044=
0kB
>>>>>> unevictable:0kB isolated(anon):0kB isolated(file):0kB
>>>>>> present:3098560kB managed:3023876kB mlocked:0kB dirty:316kB
>>>>>> writeback:0kB mapped:78860kB shmem:8760kB slab_reclaimable:17128=
4kB
>>>>>> slab_unreclaimable:11888kB kernel_stack:2240kB pagetables:16348k=
B
>>>>>> unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_sca=
nned:0
>>>>>> all_unreclaimable? no
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959075] lowmem_reserve[=
]: 0 0
>>>>>> 4714 4714
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959079] Normal free:234=
200kB
>>>>>> min:6880kB low:8600kB high:10320kB active_anon:1535060kB
>>>>>> inactive_anon:266128kB active_file:1222108kB  inactive_file:1221=
676kB
>>>>>> unevictable:0kB isolated(anon):0kB isolated(file):0kB
>>>>>> present:4954112kB managed:4828124kB mlocked:0kB dirty:1016kB
>>>>>> writeback:0kB mapped:127456kB shmem:14952kB slab_reclaimable:268=
628kB
>>>>>> slab_unreclaimable:21720kB kernel_stack:4976kB pagetables:21604k=
B
>>>>>> unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_sca=
nned:0
>>>>>> all_unreclaimable? no
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959080] lowmem_reserve[=
]: 0 0
>>>>>> 0
>>>>>> 0
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959081] DMA: 1*4kB (U) =
1*8kB
>>>>>> (U) 1*16kB (U) 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB
>>>>>> 1*1024kB (U) 1*2048kB (R) 3*4096kB (M) =3D 15900kB
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959088] DMA32: 36545*4k=
B
>>>>>> (UEM) 2543*8kB (UEM) 70*16kB (UMR) 0*32kB 0*64kB 1*128kB (R) 0*2=
56kB
>>>>>> 1*512kB (R) 0*1024kB 0*2048kB 0*4096kB =3D 168284kB
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959093] Normal: 50408*4=
kB
>>>>>> (UEM) 3913*8kB (UEM) 36*16kB (UMR) 0*32kB 1*64kB (R) 1*128kB (R)
>>>>>> 1*256kB (R) 1*512kB (R) 0*1024kB 0*2048kB 0*4096kB =3D 234472kB
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959099] Node 0
>>>>>> hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0
>>>>>> hugepages_size=3D2048kB
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959100] 1013453 total
>>>>>> pagecache
>>>>>> pages
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959101] 1228 pages in s=
wap
>>>>>> cache
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959102] Swap cache stat=
s: add
>>>>>> 133257, delete 132029, find 57308/68141
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959103] Free swap  =3D =
184632kB
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959103] Total swap =3D =
594300kB
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959104] 2017164 pages R=
AM
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959105] 0 pages
>>>>>> HighMem/MovableOnly
>>>>>> Dec  7 03:30:01 krshina3 kernel: [281555.959106] 31497 pages res=
erved
>>>>>>
>>>>>> On Wed, Dec 3, 2014 at 9:16 PM, Du=C5=A1an =C4=8Coli=C4=87<dusan=
c@gmail.com>  wrote:
>>>>>>>
>>>>>>> On Mon, Dec 1, 2014 at 12:58 AM, Edward Shishkin
>>>>>>> <edward.shishkin@gmail.com>  wrote:
>>>>>>>>
>>>>>>>> On 12/01/2014 12:53 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On Dec 1, 2014 12:47 AM, "Edward
>>>>>>>> Shishkin"<edward.shishkin@gmail.com>
>>>>>>>> wrote:
>>>>>>>>>
>>>>>>>>> On 12/01/2014 12:04 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>>>>>>>
>>>>>>>>>> On Fri, Nov 14, 2014 at 9:09 PM, Du=C5=A1an =C4=8Coli=C4=87<=
dusanc@gmail.com>
>>>>>>>>>> wrote:
>>>>>>>>>>>
>>>>>>>>>>> As I had no time to make a full backup I went back to 3.10 =
kernel
>>>>>>>>>>> and
>>>>>>>>>>> had no
>>>>>>>>>>> problem since.
>>>>>>>>>>>
>>>>>>>>>>> Could this issue be connected with those firefox cache file=
s that
>>>>>>>>>>> were
>>>>>>>>>>> bad
>>>>>>>>>>> (see other mail thread) so I deleted them but for some reas=
on
>>>>>>>>>>> they
>>>>>>>>>>> continued
>>>>>>>>>>> making problems or problem wasn't really solved by deletion=
? I
>>>>>>>>>>> ask
>>>>>>>>>>> this
>>>>>>>>>>> as
>>>>>>>>>>> after long time of stable r4 I got 2 problems in same week =
so
>>>>>>>>>>> they're
>>>>>>>>>>> probably related.
>>>>>>>>>>>
>>>>>>>>>>> On Nov 14, 2014 8:58 PM, "Edward Shishkin"
>>>>>>>>>>> <edward.shishkin@gmail.com>
>>>>>>>>>>> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> On 11/05/2014 12:04 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> On Nov 5, 2014 12:48 AM, "Edward Shishkin"
>>>>>>>>>>>> <edward.shishkin@gmail.com>
>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 11/04/2014 02:16 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Did a fsck of source partition.
>>>>>>>>>>>>>> Btw. why is there a reason this corruption appeared when=
 I
>>>>>>>>>>>>>> started
>>>>>>>>>>>>>> using 3.16.2 instead 3.10?
>>>>>>>>>>>>>>
>>>>>>>>>>>>> I would also suspect this failed mount.
>>>>>>>>>>>>> It could have fatal consequences for the system, and, in
>>>>>>>>>>>>> particular
>>>>>>>>>>>>> for
>>>>>>>>>>>>> your ''/".
>>>>>>>>>>>>>
>>>>>>>>>>>> Failed mount happened on the partition that I was copying
>>>>>>>>>>>> to,/mnt/backup,
>>>>>>>>>>>> and it fscked ok.
>>>>>>>>>>>> / was partition I was copying from and it had errors.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Hi Du=C5=A1an,
>>>>>>>>>>>>
>>>>>>>>>>>> So, how is your / ?
>>>>>>>>>>
>>>>>>>>>> So I was feeling brave so I put 3.16.2 back 4 days ago and I=
 got
>>>>>>>>>> this:
>>>>>>>>>>
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.436017] -----------=
-[ cut
>>>>>>>>>> here ]------------
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.436320] kernel BUG =
at
>>>>>>>>>> fs/reiser4/plugin/item/ctail.c:669!
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.436652] invalid opc=
ode:
>>>>>>>>>> 0000
>>>>>>>>>> [#1] SMP
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.436899] CPU: 3 PID:=
 30235
>>>>>>>>>> Comm: rsync Not tainted 3.16.5-gentoo #2
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.437275] Hardware na=
me:
>>>>>>>>>> Gigabyte Technology Co., Ltd. To be filled by O.E.M./B75-D3V=
, BIOS
>>>>>>>>>> F5
>>>>>>>>>> 07/04/2012
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.437834] task:
>>>>>>>>>> ffff8801333d4010 ti: ffff880118218000 task.ti: ffff880118218=
000
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.438264] RIP:
>>>>>>>>>> 0010:[<ffffffff8115aaf4>]  [<ffffffff8115aaf4>]
>>>>>>>>>> do_readpage_ctail+0x2c5/0x3c4
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.438768] RSP:
>>>>>>>>>> 0018:ffff88011821baa8  EFLAGS: 00010246
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.439073] RAX:
>>>>>>>>>> 0000000000000000
>>>>>>>>>> RBX: ffff88011821bb78 RCX: 000000000002f35d
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.439484] RDX:
>>>>>>>>>> 000000000000002f
>>>>>>>>>> RSI: 0000000000000000 RDI: ffff8800b953b000
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.439894] RBP:
>>>>>>>>>> ffff880169d231a0
>>>>>>>>>> R08: 0000000000000000 R09: 0000000000000000
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.440304] R10:
>>>>>>>>>> ffffffff8114eb84
>>>>>>>>>> R11: 0000000000012368 R12: 0000000000000002
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.440713] R13:
>>>>>>>>>> 0000000000001000
>>>>>>>>>> R14: ffffea00052f5158 R15: 0000000000000000
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.441124] FS:
>>>>>>>>>> 00007f3d4d434700(0000) GS:ffff88022e380000(0000)
>>>>>>>>>> knlGS:0000000000000000
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.441589] CS:  0010 D=
S:
>>>>>>>>>> 0000
>>>>>>>>>> ES: 0000 CR0: 0000000080050033
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.441918] CR2:
>>>>>>>>>> 0000000000980000
>>>>>>>>>> CR3: 00000001a0c03000 CR4: 00000000001427e0
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.442327] Stack:
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.442443]  0000000000=
000000
>>>>>>>>>> ffff88011821bb78 0000000000000000 ffff880169d231a0
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.442890]  0000000000=
000000
>>>>>>>>>> ffffea00052f5158 0000000000000000 ffffffff8115ad7b
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.443336]  0000000000=
0aa1a1
>>>>>>>>>> ffff88011821bca0 ffffea00052f5158 ffff880169d232e0
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.443784] Call Trace:
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.443926]
>>>>>>>>>> [<ffffffff8115ad7b>]
>>>>>>>>>> ? ctail_readpages_filler+0x188/0x1c9
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.444302]
>>>>>>>>>> [<ffffffff8115abf3>]
>>>>>>>>>> ? do_readpage_ctail+0x3c4/0x3c4
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.444655]
>>>>>>>>>> [<ffffffff810b5528>]
>>>>>>>>>> ? read_cache_pages+0x91/0xfc
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.444990]
>>>>>>>>>> [<ffffffff8115b17c>]
>>>>>>>>>> ? readpages_ctail+0x2c8/0x2e5
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.445332]
>>>>>>>>>> [<ffffffff81151e72>]
>>>>>>>>>> ? readpages_cryptcompress+0x39/0x5f
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.445704]
>>>>>>>>>> [<ffffffff810b56c9>]
>>>>>>>>>> ? __do_page_cache_readahead+0x136/0x1d0
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.446094]
>>>>>>>>>> [<ffffffff810b5958>]
>>>>>>>>>> ? ondemand_readahead+0x1f5/0x203
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.446450]
>>>>>>>>>> [<ffffffff810ae761>]
>>>>>>>>>> ? generic_file_read_iter+0x191/0x539
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.446827]
>>>>>>>>>> [<ffffffff810e9256>]
>>>>>>>>>> ? path_openat+0x24b/0x5ce
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.447147]
>>>>>>>>>> [<ffffffff810de1e6>]
>>>>>>>>>> ? new_sync_read+0x6b/0x8f
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.447469]
>>>>>>>>>> [<ffffffff81151f07>]
>>>>>>>>>> ? read_cryptcompress+0x6f/0x97
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.447815]
>>>>>>>>>> [<ffffffff8114d4c0>]
>>>>>>>>>> ? reiser4_read_dispatch+0xc7/0x11e
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.448181]
>>>>>>>>>> [<ffffffff810dedc9>]
>>>>>>>>>> ? vfs_read+0x84/0x13e
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.448483]
>>>>>>>>>> [<ffffffff810df25c>]
>>>>>>>>>> ? SyS_read+0x41/0x84
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.448780]
>>>>>>>>>> [<ffffffff815346d2>]
>>>>>>>>>> ? system_call_fastpath+0x16/0x1b
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.449135] Code: 01 00=
 00 e9
>>>>>>>>>> 00
>>>>>>>>>> ff ff ff 8b 43 58 41 0f b7 4d 04 48 8d 04 48 48 89 54 c3 28 =
e9 ea
>>>>>>>>>> fe
>>>>>>>>>> ff ff 44 8b a3 88 00 00 00 41 83 fc 02 75 02 <0f> 0b 0f 87 8=
7 00
>>>>>>>>>> 00
>>>>>>>>>> 00
>>>>>>>>>> 41 83 fc 01 0f 85 de 00 00 00 49 8b 56
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.450567] RIP
>>>>>>>>>> [<ffffffff8115aaf4>] do_readpage_ctail+0x2c5/0x3c4
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.450934]  RSP
>>>>>>>>>> <ffff88011821baa8>
>>>>>>>>>> Nov 30 03:30:36 krshina3 kernel: [293446.562843] ---[ end tr=
ace
>>>>>>>>>> 45473ce04b35219f ]---
>>>>>>>>>>
>>>>>>>>>> Looks like same error like last time I used 3.16. Kernel 3.1=
0
>>>>>>>>>> lasted
>>>>>>>>>> with 20 days uptime without problems this month and 3.16 had=
 this
>>>>>>>>>> oops
>>>>>>>>>> after 3 days.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Unfortunately, there is no any ideas...
>>>>>>>>> I can port reiser4-for-3.10 stuff to 3.16. Will you test this=
 port?
>>>>>>>>>
>>>>>>>> Ofcourse!
>>>
>>>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
