From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Segfault in fsck.reiser4
Date: Tue, 23 Mar 2010 21:26:53 +0100
Message-ID: <4BA9240D.4080705@gmail.com>
References: <op.u906wjlkhogzsi@g17b>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <op.u906wjlkhogzsi@g17b>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Cc: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

Jon=C3=A1=C5=A1 Vidra wrote:
> Hello!

Hello.

>
> I found a bug in fsck.reiser4 from reiser4progs-1.0.7. It segfaults=20
> when I try to check my storage partition.
> The FS is currently mounted read-only, as I need the data and I don't=
=20
> have a spare disk.
> I haven't noticed any other problems so far, the fsck was just a=20
> weekly check.
>
> I recompiled reiser4progs with debug statements and made a backtrace,
> but I'm not skilled in these things, so let me know if additional inf=
o=20
> is needed.
> I've also packed the filesystem metadata, I can post them somewhere i=
f=20
> you want.

Packed metadata won't help in this case.

The most efficient way is to provide me with a root access to your mach=
ine.
You have encountered a rare case of corruption, and it is important to=20
fix this
fsck bug properly.

>
> By the way, how do I find a filename by node number or key?

find - inum 64881

> Debugfs allows me to search for nodes when I type a filename, but not=
=20
> vice versa.
> I'd like to know which file caused the corruption.

What do you want to do with this file?

Thanks,
Edward.

>
> The output from GDB is below.
>
>
> (gdb) run
> Starting program: /sbin/fsck.reiser4 /dev/sda7
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
>
> Fscking the /dev/sda7 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> Continue?
> (Yes/No): y
> ***** fsck.reiser4 started at Tue Mar 23 16:32:33 2010
> Reiser4 fs was detected on /dev/sda7.
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           7e3c26ff-e382-4f6f-9686-ca06ff31c615
> label:          data
>
> Format super block (17):
> plugin:         format40
> description:    Disk-format plugin.
> version:        0
> magic:          ReIsEr40FoRmAt
> mkfs id:        0x7c89491a
> flushes:        0
> blocks:         47640736
> free blocks:    9067517
> root block:     36345512
> tail policy:    0x2 (smart)
> next oid:       0x64883
> file count:     6842
> tree height:    5
> key policy:     LARGE
>
>
> CHECKING THE STORAGE TREE
>         Read nodes 3394397
>         Nodes left in the tree 3394397
>                 Leaves of them 3354276, Twigs of them 39373
>         Time interval: Tue Mar 23 16:32:53 2010 - Tue Mar 23 16:46:58=
=20
> 2010
> CHECKING EXTENT REGIONS.
> FSCK: extent40_repair.c: 96: extent40_check_layout: Node (36296453),=20
> item (31), unit (7), [64744:4(FB):4d4f563042422e:6487d:0]: points to=20
> the already used blocks,  region [38491215..38497535].
> FSCK: extent40_repair.c: 96: extent40_check_layout: Node (36296453),=20
> item (35), unit (0), [64744:4(FB):4d4f563042442e:64881:0]: points to=20
> the already used blocks,  region [32036064..32036064].
> FSCK: extent40_repair.c: 96: extent40_check_layout: Node (36296453),=20
> item (35), unit (1), [64744:4(FB):4d4f563042442e:64881:0]: points to=20
> the already used blocks,  region [36296457..36296457].
> FSCK: extent40_repair.c: 96: extent40_check_layout: Node (36296453),=20
> item (35), unit (2), [64744:4(FB):4d4f563042442e:64881:0]: points to=20
> the already used blocks,  region [36345512..36345512].
> FSCK: extent40_repair.c: 96: extent40_check_layout: Node (36296453),=20
> item (35), unit (3), [64744:4(FB):4d4f563042442e:64881:0]: points to=20
> the already used blocks,  region [36425556..36425556].
> FSCK: extent40_repair.c: 96: extent40_check_layout: Node (36296453),=20
> item (35), unit (4), [64744:4(FB):4d4f563042442e:64881:0]: points to=20
> the already used blocks,  region [38293910..38293910].
>         Read twigs 39373
>         Invaid extent pointers 6
>         Time interval: Tue Mar 23 16:46:58 2010 - Tue Mar 23 16:50:25=
=20
> 2010
> CHECKING THE SEMANTIC TREE
> FSCK: ccreg40_repair.c: 77: ccreg40_check_item: The file=20
> [64744:4d4f563042442e:64882] (ccreg40), node [38551031], item [0]:=20
> item of the wrong cluster size (-2147483648) found, Should be (65536)=
=2E
>
> Program received signal SIGSEGV, Segmentation fault.
> 0xb7f6f7d2 in aux_adler32 (adler=3D<value optimized out>,=20
> buff=3D0xbffe22ca "", n=3D4294839597) at aux.c:194
>
> (gdb) bt
> #0  0xb7f6f7d2 in aux_adler32 (adler=3D<value optimized out>,=20
> buff=3D0xbffe22ca "", n=3D4294839597) at aux.c:194
> #1  0xb7f9ceb2 in ccreg40_check_crc (cc=3D0x8edf5f0, func=3D0,=20
> data=3D0xbfffeb1c, mode=3D1 '\001') at ccreg40_repair.c:130
> #2  ccreg40_check_cluster (cc=3D0x8edf5f0, func=3D0, data=3D0xbfffeb1=
c,=20
> mode=3D1 '\001') at ccreg40_repair.c:174
> #3  ccreg40_check_struct (cc=3D0x8edf5f0, func=3D0, data=3D0xbfffeb1c=
,=20
> mode=3D1 '\001') at ccreg40_repair.c:271
> #4  0xb7f34a4a in repair_object_check_struct (object=3D0x8edf5f0,=20
> place_func=3D0, mode=3D<value optimized out>, data=3D0xbfffeb1c) at o=
bject.c:19
> #5  0xb7f391ab in repair_semantic_check_struct (sem=3D0xbfffeb1c,=20
> object=3D0x8edf5f0) at semantic.c:68
> #6  0xb7f3ae26 in cb_object_traverse (parent=3D0x8e5ef40,=20
> entry=3D0xbfff4410, data=3D0xbfffeb1c) at semantic.c:352
> #7  0xb7f6791d in reiser4_object_traverse (object=3D0x8e5ef40,=20
> open_func=3D0xb7f3abb7 <cb_object_traverse>, data=3D0xbfffeb1c) at=20
> object.c:723
> #8  0xb7f67959 in reiser4_object_traverse (object=3D0x8e614a0,=20
> open_func=3D0xb7f3abb7 <cb_object_traverse>, data=3D0xbfffeb1c) at=20
> object.c:731
> #9  0xb7f67959 in reiser4_object_traverse (object=3D0x8e5baf0,=20
> open_func=3D0xb7f3abb7 <cb_object_traverse>, data=3D0xbfffeb1c) at=20
> object.c:731
> #10 0xb7f67959 in reiser4_object_traverse (object=3D0x8e479e0,=20
> open_func=3D0xb7f3abb7 <cb_object_traverse>, data=3D0xbfffeb1c) at=20
> object.c:731
> #11 0xb7f67959 in reiser4_object_traverse (object=3D0x80628e0,=20
> open_func=3D0xb7f3abb7 <cb_object_traverse>, data=3D0xbfffeb1c) at=20
> object.c:731
> #12 0xb7f3a202 in repair_semantic (sem=3D0xbfffeb1c) at semantic.c:84=
5
> #13 0xb7f3cee8 in repair_check (repair=3D0xbfffee04) at repair.c:799
> #14 0x0804b242 in main (argc=3D2, argv=3DCannot access memory at addr=
ess=20
> 0x8608
> ) at fsck.c:566
>
>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
