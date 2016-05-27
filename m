From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [Bug]Reiser4-for-4.5.3 mount: page allocation failure
Date: Fri, 27 May 2016 17:01:39 +0200
Message-ID: <CADW=+3=SW34-jBYFtAF9cxxckOTsJv4X1=+p15+7NZ6=xyALjA@mail.gmail.com>
References: <CADW=+3=rUH_b24G9HvfR1nV047YbYna6W5ZxXqHadJqm46mVmA@mail.gmail.com>
	<fd958078-03af-d50b-6586-03c56f2f54f4@gmail.com>
	<CADW=+3nTCfNUvVGL_2ucrseosi+pj_xvZqHoNJK4wPEaKurf_w@mail.gmail.com>
	<CADW=+3=CAOnS2ctUE1LMgmXR3rfDmJX0LuAA-SsXfy=WB2ZmnA@mail.gmail.com>
	<CADW=+3mDrm8u8-10GWgFJ85ihhUJtC824wA-fa_AGY3VAJSjFQ@mail.gmail.com>
	<72a90646-5219-de5f-edb5-f330d1b7e33d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-transfer-encoding;
        bh=K/eZ+YAFLbTmQlwHdYVmEI124VVigjk1WEOxpwkgUdI=;
        b=0DC2bykdN5zpzzJL9riJ/g/pEmI6BzRH+5+rwZz7qZBGKKy8916kf0g4DmUpIU03jJ
         lPYtWzyOWWLmAYA7iF/0ObOmwaUBjMr4KGazYCPaw5T18CghwvjZEydNt+kiwPm5oUFR
         qXQMkI6ZJd3cGU192HPSZ6w35QZB1p/Hco+BVHbcFp5IaDx6aa1Usy0pWKa7nmttTvIq
         YoU71t3H/F/G7oHgt1FVjZhy2Db1TqGzQyECHnQA9fQpS00IWKJqPGD+idh6tKgOVhvZ
         JRALwLptRbyCjvStg5kY0VFRKdLd9zFlRwd8ZRtYRypDOa7YXt5CEpI+xXoeLiFyTcPk
         fIsw==
In-Reply-To: <72a90646-5219-de5f-edb5-f330d1b7e33d@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

On Fri, May 27, 2016 at 4:20 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> This is just FYI, that with some options fsck doesn't perform any che=
ck.
> It was added to make some distros happy at boot time.

If -a is a false option then it shouldn't advert as:  automatically
checks the consistency without any questions.

Would -p be a better option to use then?

> As to page allocation failure: it is an old issue, not always reprodu=
cible.
> I'll add a respective ticket.
>

OK

Problem with this corruption is that fsck doesn't repair it, files
that should be removed aren't. This is from 2nd fsck run:

fsck.reiser4 --build-fs /dev/md125
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

=46scking the /dev/md125 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will build the Reiser4 FileSystem.
Continue?
(Yes/No): y
***** fsck.reiser4 started at Fri May 27 15:48:27 2016
Reiser4 fs was detected on /dev/md125.
Master super block (16):
magic:        ReIsEr4
blksize:    4096
format:        0x0 (format40)
uuid:        184e9560-bdf9-42b0-896c-0af2a0c84066
label:        <none>

=46ormat super block (17):
plugin:        format40
description:    Disk-format plugin.
version:    1
magic:        ReIsEr40FoRmAt
mkfs id:    0x2a685787
flushes:    0
blocks:        17091120
free blocks:    3760703
root block:    12895243
tail policy:    0x2 (smart)
next oid:    0x12603d1
file count:    1165916
tree height:    5
key policy:    LARGE


CHECKING THE STORAGE TREE
        Read nodes 7710317
    Nodes left in the tree 7710317
        Leaves of them 7618113, Twigs of them 91046
    Time interval: Fri May 27 15:48:31 2016 - Fri May 27 15:57:36 2016
CHECKING EXTENT REGIONS.
        Read twigs 91046
    Time interval: Fri May 27 15:57:36 2016 - Fri May 27 16:02:54 2016
LOOKING FOR UNCONNECTED NODES
        Read nodes 0
    Good nodes 0
        Leaves of them 0, Twigs of them 0
    Time interval: Fri May 27 16:02:55 2016 - Fri May 27 16:02:55 2016
CHECKING EXTENT REGIONS.
        Read twigs 0
    Time interval: Fri May 27 16:02:55 2016 - Fri May 27 16:02:55 2016
INSERTING UNCONNECTED NODES
1. Twigs: done
2. Twigs by item: done
3. Leaves: done
4. Leaves by item: done
        Twigs: read 0, inserted 0, by item 0, empty 0
    Leaves: read 0, inserted 0, by item 0
    Time interval: Fri May 27 16:02:55 2016 - Fri May 27 16:02:55 2016
CHECKING THE SEMANTIC TREE
=46SCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
[1253cec:2e77696e646f77:1253ced] (ccreg40): the cluster at [851116032]
offset 65536 bytes long is
corrupted. Removed.
=46SCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
[124224e:2e77696e646f77:124224f] (ccreg40): the cluster at [851116032]
offset 65536 bytes long is
corrupted. Removed.
=46SCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
[1230c6e:2e77696e646f77:1230c6f] (ccreg40): the cluster at [850722816]
offset 65536 bytes long is
corrupted. Removed.
        Found 1165916 objects.
    Time interval: Fri May 27 16:02:55 2016 - Fri May 27 16:39:37 2016
CLEANING UP THE STORAGE TREE
        Removed items 0
    Time interval: Fri May 27 16:39:37 2016 - Fri May 27 16:56:07 2016
***** fsck.reiser4 finished at Fri May 27 16:56:07 2016
Closing fs...done

=46S is consistent.


> Thanks,
> Edward.
>
>
>
> On 05/27/2016 03:10 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>> fsck.reiser4 --build-fs /dev/md125
>> *******************************************************************
>> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
>> *******************************************************************
>>
>> Fscking the /dev/md125 block device.
>> Will check the consistency of the Reiser4 SuperBlock.
>> Will build the Reiser4 FileSystem.
>> Continue?
>> (Yes/No): y
>> ***** fsck.reiser4 started at Fri May 27 13:29:52 2016
>> Reiser4 fs was detected on /dev/md125.
>> Master super block (16):
>> magic:        ReIsEr4
>> blksize:    4096
>> format:        0x0 (format40)
>> uuid:        184e9560-bdf9-42b0-896c-0af2a0c84066
>> label:        <none>
>>
>> Format super block (17):
>> plugin:        format40
>> description:    Disk-format plugin.
>> version:    1
>> magic:        ReIsEr40FoRmAt
>> mkfs id:    0x2a685787
>> flushes:    0
>> blocks:        17091120
>> free blocks:    3760687
>> root block:    12895243
>> tail policy:    0x2 (smart)
>> next oid:    0x12603d1
>> file count:    1165915
>> tree height:    5
>> key policy:    LARGE
>>
>>
>> CHECKING THE STORAGE TREE
>>          Read nodes 7710333
>>      Nodes left in the tree 7710333
>>          Leaves of them 7618129, Twigs of them 91046
>>      Time interval: Fri May 27 13:29:56 2016 - Fri May 27 13:53:14 2=
016
>> CHECKING EXTENT REGIONS.
>>          Read twigs 91046
>>      Time interval: Fri May 27 13:53:14 2016 - Fri May 27 13:58:55 2=
016
>> LOOKING FOR UNCONNECTED NODES
>>          Read nodes 0
>>      Good nodes 0
>>          Leaves of them 0, Twigs of them 0
>>      Time interval: Fri May 27 13:58:56 2016 - Fri May 27 13:58:56 2=
016
>> CHECKING EXTENT REGIONS.
>>          Read twigs 0
>>      Time interval: Fri May 27 13:58:56 2016 - Fri May 27 13:58:56 2=
016
>> INSERTING UNCONNECTED NODES
>> 1. Twigs: done
>> 2. Twigs by item: done
>> 3. Leaves: done
>> 4. Leaves by item: done
>>          Twigs: read 0, inserted 0, by item 0, empty 0
>>      Leaves: read 0, inserted 0, by item 0
>>      Time interval: Fri May 27 13:58:56 2016 - Fri May 27 13:58:56 2=
016
>> CHECKING THE SEMANTIC TREE
>> FSCK: semantic.c: 705: repair_semantic_lost_prepare: No 'lost+found'
>> entry found. Building a new object with the key 2a:0:ffff.
>> FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize
>> the plugin for the directory [2a:0:ffff].
>> FSCK: semantic.c: 581: repair_semantic_dir_open: Trying to recover t=
he
>> directory [2a:0:ffff] with the default plugin--dir40.
>> FSCK: obj40_repair.c: 599: obj40_prepare_stat: The file [2a:0:ffff]
>> does not have a StatData item. Creating a new one. Plugin dir40.
>> FSCK: dir40_repair.c: 40: dir40_dot: Directory [2a:0:ffff]: The entr=
y
>> "." is not found. Insert a new one. Plugin (dir40).
>> FSCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (13999309)=
,
>> item (2), [2a:0:ffff] (stat40): wrong bytes (0), Fixed to (50).
>> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (13999309), ite=
m
>> (2), [2a:0:ffff] (stat40): wrong size (0), Fixed to (1).
>> FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
>> [1253cec:2e77696e646f77:1253ced] (ccreg40): the cluster at [85111603=
2]
>> offset 65536 bytes long is
>> corrupted. Removed.
>> FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
>> [124224e:2e77696e646f77:124224f] (ccreg40): the cluster at [85111603=
2]
>> offset 65536 bytes long is
>> corrupted. Removed.
>> FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
>> [1230c6e:2e77696e646f77:1230c6f] (ccreg40): the cluster at [85072281=
6]
>> offset 65536 bytes long is
>> corrupted. Removed.
>>          Found 1165916 objects.
>>      Time interval: Fri May 27 13:58:56 2016 - Fri May 27 14:36:59 2=
016
>> CLEANING UP THE STORAGE TREE
>>          Removed items 0
>>      Time interval: Fri May 27 14:36:59 2016 - Fri May 27 14:53:42 2=
016
>> FSCK: repair.c: 674: repair_update: File count 1165915 is wrong. Fix=
ed
>> to 1165916.
>> ***** fsck.reiser4 finished at Fri May 27 14:53:42 2016
>> Closing fs...done
>>
>> FS is consistent.
>>
>> On Fri, May 27, 2016 at 12:00 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc=
@gmail.com> wrote:
>>>
>>> On Fri, May 27, 2016 at 11:50 AM, Du=C5=A1an =C4=8Coli=C4=87 <dusan=
c@gmail.com> wrote:
>>>>
>>>> On Fri, May 27, 2016 at 11:33 AM, Edward Shishkin
>>>> <edward.shishkin@gmail.com> wrote:
>>>>>
>>>>> Hi Dushan,
>>>>>
>>>>>
>>>>> On 05/27/2016 11:16 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>>>
>>>>>> I recieved this error few days ago.
>>>>>
>>>>>
>>>>> What is md125?
>>>>>
>>>> 2 disk Raid1 array
>>>> md125 : active raid1 sdc6[1] sdb6[0]
>>>>        68364480 blocks [2/2] [UU]
>>>>
>>>>
>>>>
>>>>
>>>>>> Remounting this partition doesn't reproduce the error as it's
>>>>>> automatically fscked.
>>>>>
>>>>>
>>>>> Are you sure that it is fscked at all?
>>>>> Checking by fsck is rather long process...
>>>>>
>>> And you were right, I used fsck.reiser4 -a that returns nothing if
>>> reiser4.progs is 1.0.9.
>>> I upgraded it to 1.1.0 and now fscking the partition.
>>> But that script executed for 3 more nights and didn't make the erro=
r I
>>> reported. PC wasn't rebooted in that time.
>>>
>>>
>>>> md125 is my daily snapshot partition. There's a script that fscks =
it,
>>>> then mounts and rsyncs /home to it daily at 2AM
>>>>
>>>>   cat /etc/cron.daily/rsnapshot.daily
>>>> #!/bin/sh
>>>>
>>>> echo "### RSNAPSHOT DAILY ###"
>>>> fsck.reiser4 -a /dev/md125 && mount /mnt/backup && rsnapshot -c
>>>> /etc/rsnapshot.d/daily.conf daily || echo "Backup failure"
>>>> umount /mnt/backup
>>>> logger -s "### RSNAPSHOT DAILY OK###"
>>>>
>>>> It is very crude, error prone and can be improved, I just had no t=
ime ;)
>>>>
>>>>> Thanks,
>>>>> Edward.
>>>>>
>>>>>
>>>>>> Thanks
>>>>>>
>>>>>> Dusan
>>>>>>
>>>>>> Mount options:
>>>>>> /dev/md125        /mnt/backup    reiser4
>>>>>> noatime,noauto,onerror=3Dremount-ro  0 0
>>>>>>
>>>>>> May 25 03:29:57 krshina3 kernel: reiser4: md125: found disk form=
at
>>>>>> 4.0.1.
>>>>>> May 25 03:29:57 krshina3 kernel: mount: page allocation failure:
>>>>>> order:4, mode:0x26040c0
>>>>>> May 25 03:29:57 krshina3 kernel: CPU: 2 PID: 7876 Comm: mount No=
t
>>>>>> tainted 4.5.3-gentoo #4
>>>>>> May 25 03:29:57 krshina3 kernel: Hardware name: Gigabyte Technol=
ogy
>>>>>> Co., Ltd. To be filled by O.E.M./B75-D3V, BIOS F5 07/04/2012
>>>>>> May 25 03:29:57 krshina3 kernel:  0000000000000006 ffffffff81219=
767
>>>>>> 0000000000000001 ffff8801bfe5bb30
>>>>>> May 25 03:29:57 krshina3 kernel:  ffffffff810d2ded ffffffff8192e=
d30
>>>>>> ffff88022e315168 026240c000000010
>>>>>> May 25 03:29:57 krshina3 kernel:  0000000000000000 fffffffffffff=
ff0
>>>>>> 0000000000000001 ffffffff8192ed00
>>>>>> May 25 03:29:57 krshina3 kernel: Call Trace:
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff81219767>] ?
>>>>>> dump_stack+0x46/0x59
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff810d2ded>] ?
>>>>>> warn_alloc_failed+0x113/0x12b
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff810d5222>] ?
>>>>>> __alloc_pages_nodemask+0x748/0x77e
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff81095a1a>] ?
>>>>>> console_unlock+0x371/0x3ac
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff81101401>] ?
>>>>>> cache_alloc_refill+0x27f/0x4c9
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff81168cb6>] ?
>>>>>> reiser4_mount+0xc/0xc
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff81101142>] ?
>>>>>> kmem_cache_alloc+0x69/0xa9
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff8115605f>] ?
>>>>>> znodes_tree_init+0x4d/0xe7
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff8115c458>] ?
>>>>>> reiser4_init_tree+0x3f/0xb2
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff8118afe5>] ?
>>>>>> init_format_format40+0x37b/0x501
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff81168d98>] ?
>>>>>> fill_super+0xe2/0x1f7
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff81107d8e>] ?
>>>>>> mount_bdev+0x131/0x181
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff81107f59>] ?
>>>>>> mount_fs+0xc/0x80
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff8111cb6d>] ?
>>>>>> vfs_kern_mount+0x60/0xea
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff8111e523>] ?
>>>>>> do_mount+0x92c/0xa43
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff811067e0>] ?
>>>>>> __fput+0x169/0x17c
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff810e1aa9>] ?
>>>>>> memdup_user+0x38/0x54
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff8111e84d>] ?
>>>>>> SyS_mount+0x6d/0x93
>>>>>> May 25 03:29:57 krshina3 kernel:  [<ffffffff815f4457>] ?
>>>>>> entry_SYSCALL_64_fastpath+0x12/0x6a
>>>>>> May 25 03:29:57 krshina3 kernel: Mem-Info:
>>>>>> May 25 03:29:57 krshina3 kernel: active_anon:745432
>>>>>> inactive_anon:149913 isolated_anon:0\x0a active_file:474848
>>>>>> inactive_file:465968 isolated_file:0\x0a unevictable:1855 dirty:=
235
>>>>>> writeback:0 unstable:0\x0a slab_reclaimable:77405
>>>>>> slab_unreclaimable:8391\x0a mapped:75083 shmem:6227 pagetables:9=
581
>>>>>> bounce:0\x0a free:15583 free_pcp:0 free_cma:0
>>>>>> May 25 03:29:57 krshina3 kernel: DMA free:15900kB min:20kB low:2=
4kB
>>>>>> high:28kB active_anon:0kB inactive_anon:0kB active_file:0kB
>>>>>> inactive_file:0kB unevictable:0kB isolated(anon):0kB
>>>>>> isolated(file):0kB present:15984kB managed:15900kB mlocked:0kB
>>>>>> dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0k=
B
>>>>>> slab_unreclaimable:0kB kernel_stack:0kB pagetables:0kB unstable:=
0kB
>>>>>> bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB writeback_tmp=
:0kB
>>>>>> pages_scanned:0 all_unreclaimable? yes
>>>>>> May 25 03:29:57 krshina3 kernel: lowmem_reserve[]: 0 2951 7665 7=
665
>>>>>> May 25 03:29:57 krshina3 kernel: DMA32 free:27644kB min:4308kB
>>>>>> low:5384kB high:6460kB active_anon:1121656kB inactive_anon:28411=
6kB
>>>>>> active_file:711732kB inactive_file:701272kB unevictable:3152kB
>>>>>> isolated(anon):0kB isolated(file):0kB present:3098560kB
>>>>>> managed:3022712kB mlocked:3152kB dirty:32kB writeback:0kB
>>>>>> mapped:117268kB shmem:7796kB slab_reclaimable:118956kB
>>>>>> slab_unreclaimable:11168kB kernel_stack:2304kB pagetables:16272k=
B
>>>>>> unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
>>>>>> writeback_tmp:0kB pages_scanned:12 all_unreclaimable? no
>>>>>> May 25 03:29:57 krshina3 kernel: lowmem_reserve[]: 0 0 4714 4714
>>>>>> May 25 03:29:57 krshina3 kernel: Normal free:18788kB min:6884kB
>>>>>> low:8604kB high:10324kB active_anon:1860072kB inactive_anon:3155=
36kB
>>>>>> active_file:1187660kB inactive_file:1162600kB unevictable:4268kB
>>>>>> isolated(anon):0kB isolated(file):0kB present:4954112kB
>>>>>> managed:4828044kB mlocked:4268kB dirty:908kB writeback:0kB
>>>>>> mapped:183064kB shmem:17112kB slab_reclaimable:190664kB
>>>>>> slab_unreclaimable:22396kB kernel_stack:4192kB pagetables:22052k=
B
>>>>>> unstable:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
>>>>>> writeback_tmp:0kB pages_scanned:92 all_unreclaimable? no
>>>>>> May 25 03:29:57 krshina3 kernel: lowmem_reserve[]: 0 0 0 0
>>>>>> May 25 03:29:57 krshina3 kernel: DMA: 1*4kB (U) 1*8kB (U) 1*16kB=
 (U)
>>>>>> 0*32kB 2*64kB (U) 1*128kB (U) 1*256kB (U) 0*512kB 1*1024kB (U)
>>>>>> 1*2048kB (M) 3*4096kB (M) =3D 15900kB
>>>>>> May 25 03:29:57 krshina3 kernel: DMA32: 313*4kB (UME) 3299*8kB (=
UME)
>>>>>> 14*16kB (UM) 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 0*1024kB 0*20=
48kB
>>>>>> 0*4096kB =3D 27868kB
>>>>>> May 25 03:29:57 krshina3 kernel: Normal: 206*4kB (UME) 372*8kB (=
UME)
>>>>>> 942*16kB (UME) 4*32kB (U) 0*64kB 0*128kB 0*256kB 0*512kB 0*1024k=
B
>>>>>> 0*2048kB 0*4096kB =3D 19000kB
>>>>>> May 25 03:29:57 krshina3 kernel: Node 0 hugepages_total=3D0
>>>>>> hugepages_free=3D0 hugepages_surp=3D0 hugepages_size=3D2048kB
>>>>>> May 25 03:29:57 krshina3 kernel: 948736 total pagecache pages
>>>>>> May 25 03:29:57 krshina3 kernel: 166 pages in swap cache
>>>>>> May 25 03:29:57 krshina3 kernel: Swap cache stats: add 3579, del=
ete
>>>>>> 3413, find 0/1
>>>>>> May 25 03:29:57 krshina3 kernel: Free swap  =3D 580020kB
>>>>>> May 25 03:29:57 krshina3 kernel: Total swap =3D 594300kB
>>>>>> May 25 03:29:57 krshina3 kernel: 2017164 pages RAM
>>>>>> May 25 03:29:57 krshina3 kernel: 0 pages HighMem/MovableOnly
>>>>>> May 25 03:29:57 krshina3 kernel: 50500 pages reserved
>>>>>> --
>>>>>> To unsubscribe from this list: send the line "unsubscribe
>>>>>> reiserfs-devel"
>>>>>> in
>>>>>> the body of a message to majordomo@vger.kernel.org
>>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.ht=
ml
>>>>>
>>>>>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
