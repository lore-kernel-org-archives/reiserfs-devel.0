From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] Smart fibration plugin ext_4321
Date: Sat, 07 Jan 2017 19:56:23 +0200
Message-ID: <58712BC7.6000802@gmail.com>
References: <CADW=+3=Vwi1LFJn8imp7H6woiRP2Oa0=Q=_K-dDqc=hc2cOkZg@mail.gmail.com> <586165C2.3000702@gmail.com> <CADW=+3moCR2ufXeD4BmXFG0WE5uS2VpM95S6ZiggKg4BD47tfg@mail.gmail.com> <586F9F23.5010409@gmail.com> <CADW=+3nwVneU3ftJOQ8eT5t9Mdm8_XuTwkkBS2u5B0xKT8h86A@mail.gmail.com> <586FF6CA.7090703@gmail.com> <CADW=+3nLSyEFeRu9=GwG-P3Y0f34f-7+L2zoqNO4OWGNGREALA@mail.gmail.com> <587022B5.3040808@gmail.com> <CADW=+3kzCd-jB9dPFyqAdNR6L2Cs81ibTfdYbWdnQd8zY3J38w@mail.gmail.com> <58709FC3.5000606@gmail.com> <CADW=+3=VJQmTXu5GmUzX3NVe8Yn1DiCKMWsu_mzL6UFg5EG_PA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=6ujp6+6ZEUBzZDrazP/BCBAw+OYjf3Pxh2tWtitWsBQ=;
        b=ToqB+6Ew+4mDvhjTPBy46YWOwcGUqvvQph7xWi9jfvysVbA0vu/JEhoBdq49JaRZF8
         xXiSKngwXirTDsh2Ki2XEvD0jqnroe0tYSaiOP190mgspo3rSDFhioLJAELQfXBrRB6x
         AFqf8xQTMbZuCGVl5s+AfFAWc7r0u/Xxhvkw+Vc/KZKZqImwdTzSE/UhKt3Pl0UwC4u5
         ebvOO+Sp5IW54ABFfD6P00jsXICCcGq0T9sGCTvmVtJkLUqiSDIf/JKqw4Pq1mqJUkyk
         cgaUNZYUQb9pZ1a5DJn0EF8bGr2he6gV69cGR7yZaz+xu5sYOiLWMSQC6pmkCO9UG1pb
         gekw==
In-Reply-To: <CADW=+3=VJQmTXu5GmUzX3NVe8Yn1DiCKMWsu_mzL6UFg5EG_PA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>



On 01/07/2017 07:10 PM, Dušan Čolić wrote:
> On Sat, Jan 7, 2017 at 8:58 AM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>>
>> On 01/07/2017 10:15 AM, Dušan Čolić wrote:
>>> On Sat, Jan 7, 2017 at 12:05 AM, Edward Shishkin
>>> <edward.shishkin@gmail.com> wrote:
>>>> On 01/07/2017 01:09 AM, Dušan Čolić wrote:
>>>>> On Fri, Jan 6, 2017 at 8:58 PM, Edward Shishkin
>>>>> <edward.shishkin@gmail.com> wrote:
>>>>>>
>>>>>> On 01/06/2017 05:34 PM, Dušan Čolić wrote:
>>>>>>> On Fri, Jan 6, 2017 at 2:44 PM, Edward Shishkin
>>>>>>> <edward.shishkin@gmail.com> wrote:
>>>>>>>> On 12/26/2016 11:13 PM, Dušan Čolić wrote:
>>>>>>>>> On Mon, Dec 26, 2016 at 7:47 PM, Edward Shishkin
>>>>>>>>> <edward.shishkin@gmail.com> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 12/25/2016 02:59 AM, Dušan Čolić wrote:
>>>>>>>>>>> Fibration is a great way to decrease fragmentation and increase
>>>>>>>>>>> throughput.
>>>>>>>>>>> Currently there are 4 fibration plugins, lex, dot.o, ext_1 and
>>>>>>>>>>> ext_3
>>>>>>>>>>> and they all have their upsides and downsides.
>>>>>>>>>>>
>>>>>>>>>>> Proposed fibration plugin combines them all so that it combines
>>>>>>>>>>> files
>>>>>>>>>>> with same extensions for 1, 2. 3 and 4 character extension  in
>>>>>>>>>>> groups
>>>>>>>>>>> and sorts them in same fiber group.
>>>>>>>>>>>
>>>>>>>>>>> With this fibration plugin all eg. xvid files would be in same
>>>>>>>>>>> group
>>>>>>>>>>> in folder on disk sorted alphabetically
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> What application wants all xvid files to be in the same group?
>>>>>>>>>> Do you have any benchmark numbers which show advantages
>>>>>>>>>> of the new plugin?
>>>>>>>>>>
>>>>>>>>> Xvid files are just an example.
>>>>>>>>> ext_1234 fibration would be equal to sum of ext_1, ext_2, ext_3,
>>>>>>>>> ext_4
>>>>>>>>> and dot_o in one.
>>>>>>>>>
>>>>>>>>> In currently default plugin (dot_o) we sort all files by name from
>>>>>>>>> the
>>>>>>>>> start except .o files which we put at the end.
>>>>>>>>> So if we had a source directory with .c .h and .o files in it files
>>>>>>>>> by
>>>>>>>>> extension would be sorted like: chchchchchchchchoooooooooooooo
>>>>>>>>> I presumed that in some use cases it is better to have files be
>>>>>>>>> sorted
>>>>>>>>> ccccccccccchhhhhhhhhhhhhhoooooooooooo
>>>>>>>>>
>>>>>>>>> Hypothesis is to use the premise that files of same extension are in
>>>>>>>>> same order of size to reduce fragmentation.
>>>>>>>>
>>>>>>>>
>>>>>>>> What kind of fragmentation you are talking about?
>>>>>>>> Internal (which results in "dead" disk space), or
>>>>>>>> external (which results in a lot of "extents")?
>>>>>>>>
>>>>>>> External
>>>>>>>
>>>>>>>> Edward.
>>>>>>>>
>>>>>>>>
>>>>>>>>> If we group files of same extension in groups in one directory, when
>>>>>>>>> we write files of same extension after deletion of some files of one
>>>>>>>>> extension  their group would be in same order as the deleted file so
>>>>>>>>> they would be written in similar place and occupy the 'hole' of
>>>>>>>>> similar size.
>>>>>>
>>>>>>
>>>>>> So "similar" means the same order, that is file sizes can differ in 2
>>>>>> times?
>>>>>> TBH, I don't see what can be deduced from this assumption ;)
>>>>>> It can happen that new file either doesn't fit to that hole, or
>>>>>> occupies
>>>>>> too
>>>>>> small place, so that next file won't fit to the rest of the hole..
>>>>>>
>>>>> OFC we can never guarantee that the new file completely fits the hole
>>>>> (especially as we go through compression in next layer) but for both
>>>>> smaller and larger file than a hole we would have higher probability
>>>>> for less extents for situations with 2 or more types of files in a
>>>>> directory. For one type of file in a directory behavior would be the
>>>>> same as dot_o and ext_1 plugin.
>>>>
>>>>
>>>> I should upset you: fibration plugins are about mapping of a semantic
>>>> tree to the storage tree. Simply speaking, they manage mapping
>>>> object-> key, which has nothing common with real locations on diТак ты
>>>> уже не ищешь? sk.
>>>>
>>>> This is a block allocator, who assigns disk addresses to nodes of the
>>>> storage tree (right before writing them to disk at flush time).
>>>> And I am sure that block allocator doesn't care about fibration groups.
>>>>
>>>> I strongly not recommend you to experiment with block allocator.
>>>> Simply because I know how many people killed a lot of time without
>>>> results.
>>> Then what is this comment in the beginning of kassign.c about:
>>>
>>>
>>> * In reiser4 every piece of file system data and meta-data has a key. Keys
>>> * are used to store information in and retrieve it from reiser4 internal
>>> * tree. In addition to this, keys define _ordering_ of all file system
>>> * information: things having close keys are placed into the same or
>>> * neighboring (in the tree order) nodes of the tree. As our block
>>> allocator
>>> * tries to respect tree order (see flush.c), keys also define order in
>>> which
>>> * things are laid out on the disk, and hence, affect performance directly.
>>
>> I can not find where in the code block allocator respects key ordering.
>> Once you find it, then let me know..
>>
> Let me prove it in a way that is possible for me without investing
> years in learning R4 internals ;)
>
> krshina3 test # mkfs.reiser4 -o create=reg40,fibration=ext_1_fibre /dev/md123
>
> krshina3 test # ls -la /home/dusan/test/
> total 261
> drwxr-xr-x  2 root  root      6 Jan  7 17:51 .
> drwxr-xr-x 46 dusan dusan    73 Jan  7 17:48 ..
> -rw-r--r--  1 root  root   4096 Jan  7 17:49 1.a
> -rw-r--r--  1 root  root   8192 Jan  7 17:49 2.b
> -rw-r--r--  1 root  root  12288 Jan  7 17:50 3.a
> -rw-r--r--  1 root  root  16384 Jan  7 17:51 4.b
>
> krshina3 test # mount /dev/md123 /mnt/test
>
> krshina3 test # cp /home/dusan/test/* /mnt/test
>
> krshina3 test # umount /dev/md123
>
> krshina3 test # debugfs.reiser4 -t /dev/md123
> debugfs.reiser4 1.1.0
> Format release: 4.0.1
> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
> NODE (25) LEVEL=2 ITEMS=11 SPACE=3562 MKFS ID=0x51a268e2 FLUSH=0x0
> #0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF=28, LEN=8, flags=0x0 [24]
> ------------------------------------------------------------------------------
> #1  NPTR (nodeptr40): [2a:4(FB):c2312e6100000000:10000:c6e] OFF=36,
> LEN=8, flags=0x0 [26]
> ------------------------------------------------------------------------------
> #2  NPTR (nodeptr40): [2a:4(FB):c2332e6100000000:10002:c06] OFF=44,
> LEN=8, flags=0x0 [27]
> ------------------------------------------------------------------------------
> #3  NPTR (nodeptr40): [2a:4(FB):c2332e6100000000:10002:1bc4] OFF=52,
> LEN=8, flags=0x0 [28]
> ------------------------------------------------------------------------------
> #4  NPTR (nodeptr40): [2a:4(FB):c2332e6100000000:10002:2b82] OFF=60,
> LEN=8, flags=0x0 [29]
> ------------------------------------------------------------------------------
> #5  NPTR (nodeptr40): [2a:4(FB):c4322e6200000000:10001:b1a] OFF=68,
> LEN=8, flags=0x0 [30]
> ------------------------------------------------------------------------------
> #6  NPTR (nodeptr40): [2a:4(FB):c4322e6200000000:10001:1ad8] OFF=76,
> LEN=8, flags=0x0 [31]
> ------------------------------------------------------------------------------
> #7  NPTR (nodeptr40): [2a:4(FB):c4342e6200000000:10003:a70] OFF=84,
> LEN=8, flags=0x0 [32]
> ------------------------------------------------------------------------------
> #8  NPTR (nodeptr40): [2a:4(FB):c4342e6200000000:10003:1a2e] OFF=92,
> LEN=8, flags=0x0 [33]
> ------------------------------------------------------------------------------
> #9  NPTR (nodeptr40): [2a:4(FB):c4342e6200000000:10003:29ec] OFF=100,
> LEN=8, flags=0x0 [34]
> ------------------------------------------------------------------------------
> #10  NPTR (nodeptr40): [2a:4(FB):c4342e6200000000:10003:39aa] OFF=108,
> LEN=8, flags=0x0 [35]
> ==============================================================================
> NODE (24) LEVEL=1 ITEMS=7 SPACE=0 MKFS ID=0x51a268e2 FLUSH=0x0
> #0  SD (stat40): [29:1(SD):0:2a:0] OFF=28, LEN=94, flags=0x0
> exts:        3
> mask:        0x13
> plugin:        sdext_lw
> offset:        2
> len:        14
> mode:        drwxr-xr-x
> nlink:        3
> size:        6
> plugin:        sdext_unix
> offset:        16
> len:        28
> uid:        0
> gid:        0
> atime:        Sat Jan  7 17:59:37 2017
> mtime:        Sat Jan  7 18:03:59 2017
> ctime:        Sat Jan  7 18:03:59 2017
> rdev:        300
> bytes:        300
> plugin:        sdext_plugin_set
> offset:        44
> len:        50
> Pset count:     12
>          permission : id = 0
>          formatting : id = 2 (smart)
>                hash : id = 1 (r5_hash)
>           fibration : id = 2 (ext_1_fibre)
>            statdata : id = 0 (stat40)
>             diritem : id = 2 (cde40)
>              crypto : id = 0
>              digest : id = 0
>            compress : id = 0 (lzo1)
>        compressMode : id = 4 (conv)
>             cluster : id = 0 (64K)
>              create : id = 0 (reg40)
> ------------------------------------------------------------------------------
> #1  DIRITEM (cde40): [2a:0(NAME):0:0:0] OFF=122, LEN=302, flags=0x0
> NR(6)  NAME                                  OFFSET HASH
>                 SDKEY
>    0 .                                        158
> 0000000000000000:0000000000000000 0000291:000002a
>    1 ..                                       182
> 0000000000000000:0000000000000000 0000291:000002a
>    2 1.a                                      206
> 0000000000000000:0000000000000000 00002a1:0010000
>    3 3.a                                      230
> 0000000000000000:0000000000000000 00002a1:0010002
>    4 2.b                                      254
> 0000000000000000:0000000000000000 00002a1:0010001
>    5 4.b                                      278
> 0000000000000000:0000000000000000 00002a1:0010003
> ------------------------------------------------------------------------------
> #2  SD (stat40): [2a:1(SD):c2312e6100000000:10000:0] OFF=424, LEN=56, flags=0x0
> exts:        3
> mask:        0x7
> plugin:        sdext_lw
> offset:        2
> len:        14
> mode:        -rw-r--r--
> nlink:        1
> size:        4096
> plugin:        sdext_unix
> offset:        16
> len:        28
> uid:        0
> gid:        0
> atime:        Sat Jan  7 18:03:59 2017
> mtime:        Sat Jan  7 18:03:59 2017
> ctime:        Sat Jan  7 18:03:59 2017
> rdev:        4096
> bytes:        4096
> plugin:        sdext_lt
> offset:        44
> len:        12
> atime:        652286102
> mtime:        652286102
> ctime:        652286102
> ------------------------------------------------------------------------------
> #3  SD (stat40): [2a:1(SD):c2332e6100000000:10002:0] OFF=480, LEN=56, flags=0x0
> exts:        3
> mask:        0x7
> plugin:        sdext_lw
> offset:        2
> len:        14
> mode:        -rw-r--r--
> nlink:        1
> size:        12288
> plugin:        sdext_unix
> offset:        16
> len:        28
> uid:        0
> gid:        0
> atime:        Sat Jan  7 18:03:59 2017
> mtime:        Sat Jan  7 18:03:59 2017
> ctime:        Sat Jan  7 18:03:59 2017
> rdev:        12288
> bytes:        12288
> plugin:        sdext_lt
> offset:        44
> len:        12
> atime:        656286256
> mtime:        656286256
> ctime:        656286256
> ------------------------------------------------------------------------------
> #4  SD (stat40): [2a:1(SD):c4322e6200000000:10001:0] OFF=536, LEN=56, flags=0x0
> exts:        3
> mask:        0x7
> plugin:        sdext_lw
> offset:        2
> len:        14
> mode:        -rw-r--r--
> nlink:        1
> size:        8192
> plugin:        sdext_unix
> offset:        16
> len:        28
> uid:        0
> gid:        0
> atime:        Sat Jan  7 18:03:59 2017
> mtime:        Sat Jan  7 18:03:59 2017
> ctime:        Sat Jan  7 18:03:59 2017
> rdev:        8192
> bytes:        8192
> plugin:        sdext_lt
> offset:        44
> len:        12
> atime:        652286102
> mtime:        656286256
> ctime:        656286256
> ------------------------------------------------------------------------------
> #5  SD (stat40): [2a:1(SD):c4342e6200000000:10003:0] OFF=592, LEN=56, flags=0x0
> exts:        3
> mask:        0x7
> plugin:        sdext_lw
> offset:        2
> len:        14
> mode:        -rw-r--r--
> nlink:        1
> size:        16384
> plugin:        sdext_unix
> offset:        16
> len:        28
> uid:        0
> gid:        0
> atime:        Sat Jan  7 18:03:59 2017
> mtime:        Sat Jan  7 18:03:59 2017
> ctime:        Sat Jan  7 18:03:59 2017
> rdev:        16384
> bytes:        16384
> plugin:        sdext_lt
> offset:        44
> len:        12
> atime:        656286256
> mtime:        656286256
> ctime:        656286256
> ------------------------------------------------------------------------------
> #6  TAIL (plain40): [2a:4(FB):c2312e6100000000:10000:0] OFF=648,
> LEN=3182, flags=0x0
> ==============================================================================
> NODE (26) LEVEL=1 ITEMS=2 SPACE=0 MKFS ID=0x51a268e2 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):c2312e6100000000:10000:c6e] OFF=28,
> LEN=914, flags=0x0
> ------------------------------------------------------------------------------
> #1  TAIL (plain40): [2a:4(FB):c2332e6100000000:10002:0] OFF=942,
> LEN=3078, flags=0x0
> ==============================================================================
> NODE (27) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x51a268e2 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):c2332e6100000000:10002:c06] OFF=28,
> LEN=4030, flags=0x0
> ==============================================================================
> NODE (28) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x51a268e2 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):c2332e6100000000:10002:1bc4] OFF=28,
> LEN=4030, flags=0x50
> ==============================================================================
> NODE (29) LEVEL=1 ITEMS=2 SPACE=0 MKFS ID=0x51a268e2 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):c2332e6100000000:10002:2b82] OFF=28,
> LEN=1150, flags=0x54
> ------------------------------------------------------------------------------
> #1  TAIL (plain40): [2a:4(FB):c4322e6200000000:10001:0] OFF=1178,
> LEN=2842, flags=0x0
> ==============================================================================
> NODE (30) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x51a268e2 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):c4322e6200000000:10001:b1a] OFF=28,
> LEN=4030, flags=0x0
> ==============================================================================
> NODE (31) LEVEL=1 ITEMS=2 SPACE=0 MKFS ID=0x51a268e2 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):c4322e6200000000:10001:1ad8] OFF=28,
> LEN=1320, flags=0x0
> ------------------------------------------------------------------------------
> #1  TAIL (plain40): [2a:4(FB):c4342e6200000000:10003:0] OFF=1348,
> LEN=2672, flags=0x0
> ==============================================================================
> NODE (32) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x51a268e2 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):c4342e6200000000:10003:a70] OFF=28,
> LEN=4030, flags=0x0
> ==============================================================================
> NODE (33) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x51a268e2 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):c4342e6200000000:10003:1a2e] OFF=28,
> LEN=4030, flags=0x63
> ==============================================================================
> NODE (34) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x51a268e2 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):c4342e6200000000:10003:29ec] OFF=28,
> LEN=4030, flags=0xbf
> ==============================================================================
> NODE (35) LEVEL=1 ITEMS=1 SPACE=2408 MKFS ID=0x51a268e2 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):c4342e6200000000:10003:39aa] OFF=28,
> LEN=1622, flags=0x1b7
> ==============================================================================
>
> krshina3 test # mkfs.reiser4 -o create=reg40,fibration=dot_o_fibre /dev/md123
>
> krshina3 test # mount /dev/md123 /mnt/test
>
> krshina3 test # cp /home/dusan/test/* /mnt/test
>
> krshina3 test # umount /dev/md123
>
> krshina3 test # debugfs.reiser4 -t /dev/md123
> debugfs.reiser4 1.1.0
> Format release: 4.0.1
> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
> NODE (25) LEVEL=2 ITEMS=11 SPACE=3562 MKFS ID=0x1bb9bd27 FLUSH=0x0
> #0  NPTR (nodeptr40): [29:1(SD):0:2a:0] OFF=28, LEN=8, flags=0x0 [24]
> ------------------------------------------------------------------------------
> #1  NPTR (nodeptr40): [2a:4(FB):312e6100000000:10000:c6e] OFF=36,
> LEN=8, flags=0x0 [26]
> ------------------------------------------------------------------------------
> #2  NPTR (nodeptr40): [2a:4(FB):322e6200000000:10001:c06] OFF=44,
> LEN=8, flags=0x0 [27]
> ------------------------------------------------------------------------------
> #3  NPTR (nodeptr40): [2a:4(FB):322e6200000000:10001:1bc4] OFF=52,
> LEN=8, flags=0x0 [28]
> ------------------------------------------------------------------------------
> #4  NPTR (nodeptr40): [2a:4(FB):332e6100000000:10002:b5c] OFF=60,
> LEN=8, flags=0x0 [29]
> ------------------------------------------------------------------------------
> #5  NPTR (nodeptr40): [2a:4(FB):332e6100000000:10002:1b1a] OFF=68,
> LEN=8, flags=0x0 [30]
> ------------------------------------------------------------------------------
> #6  NPTR (nodeptr40): [2a:4(FB):332e6100000000:10002:2ad8] OFF=76,
> LEN=8, flags=0x0 [31]
> ------------------------------------------------------------------------------
> #7  NPTR (nodeptr40): [2a:4(FB):342e6200000000:10003:a70] OFF=84,
> LEN=8, flags=0x0 [32]
> ------------------------------------------------------------------------------
> #8  NPTR (nodeptr40): [2a:4(FB):342e6200000000:10003:1a2e] OFF=92,
> LEN=8, flags=0x0 [33]
> ------------------------------------------------------------------------------
> #9  NPTR (nodeptr40): [2a:4(FB):342e6200000000:10003:29ec] OFF=100,
> LEN=8, flags=0x0 [34]
> ------------------------------------------------------------------------------
> #10  NPTR (nodeptr40): [2a:4(FB):342e6200000000:10003:39aa] OFF=108,
> LEN=8, flags=0x0 [35]
> ==============================================================================
> NODE (24) LEVEL=1 ITEMS=7 SPACE=0 MKFS ID=0x1bb9bd27 FLUSH=0x0
> #0  SD (stat40): [29:1(SD):0:2a:0] OFF=28, LEN=94, flags=0x0
> exts:        3
> mask:        0x13
> plugin:        sdext_lw
> offset:        2
> len:        14
> mode:        drwxr-xr-x
> nlink:        3
> size:        6
> plugin:        sdext_unix
> offset:        16
> len:        28
> uid:        0
> gid:        0
> atime:        Sat Jan  7 18:05:26 2017
> mtime:        Sat Jan  7 18:06:31 2017
> ctime:        Sat Jan  7 18:06:31 2017
> rdev:        300
> bytes:        300
> plugin:        sdext_plugin_set
> offset:        44
> len:        50
> Pset count:     12
>          permission : id = 0
>          formatting : id = 2 (smart)
>                hash : id = 1 (r5_hash)
>           fibration : id = 1 (dot_o_fibre)
>            statdata : id = 0 (stat40)
>             diritem : id = 2 (cde40)
>              crypto : id = 0
>              digest : id = 0
>            compress : id = 0 (lzo1)
>        compressMode : id = 4 (conv)
>             cluster : id = 0 (64K)
>              create : id = 0 (reg40)
> ------------------------------------------------------------------------------
> #1  DIRITEM (cde40): [2a:0(NAME):0:0:0] OFF=122, LEN=302, flags=0x0
> NR(6)  NAME                                  OFFSET HASH
>                 SDKEY
>    0 .                                        158
> 0000000000000000:0000000000000000 0000291:000002a
>    1 ..                                       182
> 0000000000000000:0000000000000000 0000291:000002a
>    2 1.a                                      206
> 0000000000000000:0000000000000000 00002a1:0010000
>    3 2.b                                      230
> 0000000000000000:0000000000000000 00002a1:0010001
>    4 3.a                                      254
> 0000000000000000:0000000000000000 00002a1:0010002
>    5 4.b                                      278
> 0000000000000000:0000000000000000 00002a1:0010003
> ------------------------------------------------------------------------------
> #2  SD (stat40): [2a:1(SD):312e6100000000:10000:0] OFF=424, LEN=56, flags=0x0
> exts:        3
> mask:        0x7
> plugin:        sdext_lw
> offset:        2
> len:        14
> mode:        -rw-r--r--
> nlink:        1
> size:        4096
> plugin:        sdext_unix
> offset:        16
> len:        28
> uid:        0
> gid:        0
> atime:        Sat Jan  7 18:06:31 2017
> mtime:        Sat Jan  7 18:06:31 2017
> ctime:        Sat Jan  7 18:06:31 2017
> rdev:        4096
> bytes:        4096
> plugin:        sdext_lt
> offset:        44
> len:        12
> atime:        778212799
> mtime:        778212799
> ctime:        778212799
> ------------------------------------------------------------------------------
> #3  SD (stat40): [2a:1(SD):322e6200000000:10001:0] OFF=480, LEN=56, flags=0x0
> exts:        3
> mask:        0x7
> plugin:        sdext_lw
> offset:        2
> len:        14
> mode:        -rw-r--r--
> nlink:        1
> size:        8192
> plugin:        sdext_unix
> offset:        16
> len:        28
> uid:        0
> gid:        0
> atime:        Sat Jan  7 18:06:31 2017
> mtime:        Sat Jan  7 18:06:31 2017
> ctime:        Sat Jan  7 18:06:31 2017
> rdev:        8192
> bytes:        8192
> plugin:        sdext_lt
> offset:        44
> len:        12
> atime:        778212799
> mtime:        778212799
> ctime:        778212799
> ------------------------------------------------------------------------------
> #4  SD (stat40): [2a:1(SD):332e6100000000:10002:0] OFF=536, LEN=56, flags=0x0
> exts:        3
> mask:        0x7
> plugin:        sdext_lw
> offset:        2
> len:        14
> mode:        -rw-r--r--
> nlink:        1
> size:        12288
> plugin:        sdext_unix
> offset:        16
> len:        28
> uid:        0
> gid:        0
> atime:        Sat Jan  7 18:06:31 2017
> mtime:        Sat Jan  7 18:06:31 2017
> ctime:        Sat Jan  7 18:06:31 2017
> rdev:        12288
> bytes:        12288
> plugin:        sdext_lt
> offset:        44
> len:        12
> atime:        782212955
> mtime:        782212955
> ctime:        782212955
> ------------------------------------------------------------------------------
> #5  SD (stat40): [2a:1(SD):342e6200000000:10003:0] OFF=592, LEN=56, flags=0x0
> exts:        3
> mask:        0x7
> plugin:        sdext_lw
> offset:        2
> len:        14
> mode:        -rw-r--r--
> nlink:        1
> size:        16384
> plugin:        sdext_unix
> offset:        16
> len:        28
> uid:        0
> gid:        0
> atime:        Sat Jan  7 18:06:31 2017
> mtime:        Sat Jan  7 18:06:31 2017
> ctime:        Sat Jan  7 18:06:31 2017
> rdev:        16384
> bytes:        16384
> plugin:        sdext_lt
> offset:        44
> len:        12
> atime:        782212955
> mtime:        782212955
> ctime:        782212955
> ------------------------------------------------------------------------------
> #6  TAIL (plain40): [2a:4(FB):312e6100000000:10000:0] OFF=648,
> LEN=3182, flags=0x0
> ==============================================================================
> NODE (26) LEVEL=1 ITEMS=2 SPACE=0 MKFS ID=0x1bb9bd27 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):312e6100000000:10000:c6e] OFF=28,
> LEN=914, flags=0x0
> ------------------------------------------------------------------------------
> #1  TAIL (plain40): [2a:4(FB):322e6200000000:10001:0] OFF=942,
> LEN=3078, flags=0x0
> ==============================================================================
> NODE (27) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x1bb9bd27 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):322e6200000000:10001:c06] OFF=28,
> LEN=4030, flags=0x0
> ==============================================================================
> NODE (28) LEVEL=1 ITEMS=2 SPACE=0 MKFS ID=0x1bb9bd27 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):322e6200000000:10001:1bc4] OFF=28,
> LEN=1084, flags=0x0
> ------------------------------------------------------------------------------
> #1  TAIL (plain40): [2a:4(FB):332e6100000000:10002:0] OFF=1112,
> LEN=2908, flags=0x0
> ==============================================================================
> NODE (29) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x1bb9bd27 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):332e6100000000:10002:b5c] OFF=28,
> LEN=4030, flags=0x0
> ==============================================================================
> NODE (30) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x1bb9bd27 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):332e6100000000:10002:1b1a] OFF=28,
> LEN=4030, flags=0xc
> ==============================================================================
> NODE (31) LEVEL=1 ITEMS=2 SPACE=0 MKFS ID=0x1bb9bd27 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):332e6100000000:10002:2ad8] OFF=28,
> LEN=1320, flags=0x1cf
> ------------------------------------------------------------------------------
> #1  TAIL (plain40): [2a:4(FB):342e6200000000:10003:0] OFF=1348,
> LEN=2672, flags=0x0
> ==============================================================================
> NODE (32) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x1bb9bd27 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):342e6200000000:10003:a70] OFF=28,
> LEN=4030, flags=0x0
> ==============================================================================
> NODE (33) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x1bb9bd27 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):342e6200000000:10003:1a2e] OFF=28,
> LEN=4030, flags=0x21
> ==============================================================================
> NODE (34) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x1bb9bd27 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):342e6200000000:10003:29ec] OFF=28,
> LEN=4030, flags=0x1cf
> ==============================================================================
> NODE (35) LEVEL=1 ITEMS=1 SPACE=2408 MKFS ID=0x1bb9bd27 FLUSH=0x0
> #0  TAIL (plain40): [2a:4(FB):342e6200000000:10003:39aa] OFF=28,
> LEN=1622, flags=0x16
> ==============================================================================
>
>
> As we can see with ext_1_fibre files were sorted:
> 1.a
> 3.a
> 2.b
> 4.b
>
> With dot_o_fibre:
>
> 1.a
> 2.b
> 3.a
> 4.b
>

Thus, respect for fibration groups is also under a big question.
TBH, I prefer to not kill time for projects basing on questionable
assumptions and deductions. Just because there is a lot of
interesting TODOs with tangible results.

Thanks,
Edward.
