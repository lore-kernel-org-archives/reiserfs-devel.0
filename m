From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: R4 problem started with 2.6.39 and still there with 3.6.6
Date: Sun, 9 Dec 2012 17:12:52 +0000
Message-ID: <CADW=+3m2s9Yyi7Da1nieTXjFx=KcfLch+mwoRTB50vGj+mZA=w@mail.gmail.com>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com>
	<CADW=+3nitbqPWJCaJyjax+tno9esS3wKfj7kFcyhfdsY6MwiFQ@mail.gmail.com>
	<CADW=+3n6tx0q5qD_WN6c9TLJLFiB1Sa=jvgM3j_6XiUST5aMnQ@mail.gmail.com>
	<39867443.uySorikH8H@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=Uky8nUfTOK3Tta5Q4IuGGZXqswdlUB+hS1NTBAZtBwE=;
        b=DPx4bzC8u8aF/Mkp1vgYJV/mw5VpQKg4SUPnJEqFsJCyzh1c6gAR3q3+vge6xTB0mr
         UbseDFAzVDpWT83zuA4IRywbzK0uaOMcSpFD9nuzlPpZHnrfIw2UlooHU4y24ysSlSje
         J4MWtFl9B94Gm4+EYMkiHYJCsAQZPBDqWOoDQME0v3Bt5TrzHyC4iDN2Kmo4vP3HEKUI
         CYDZwQ1RBCOYeyRcGJfqPgFvaPKdlHLpUqZ8Xuj1Qdq5NUPvezboHxpQH1Rlm+TZMXwy
         x3FHZfs28AcACNXNQwgYf8wyz3pjPnGVV92kKqwqszXZ4XF3ocXs9C1pehHB3EZa3+04
         t+vg==
In-Reply-To: <39867443.uySorikH8H@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Sun, Dec 9, 2012 at 4:38 PM, Ivan Shapovalov <intelfx100@gmail.com> =
wrote:
> On 09 December 2012 17:29:58 Du=C5=A1an =C4=8Coli=C4=87 wrote:
>> On Sun, Dec 9, 2012 at 5:19 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@g=
mail.com> wrote:
>> > On Sun, Dec 9, 2012 at 4:17 PM, Ivan Shapovalov <intelfx100@gmail.=
com>
> wrote:
>> >> On 07 December 2012 19:34:45 Du=C5=A1an =C4=8Coli=C4=87 wrote:
>> >>> Ok, on just fscked partition I now get:
>> >>>
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584096] reiser4[sshd(505=
8)]:
>> >>> find_cluster_item
>> >>> (fs/reiser4/plugin/file/cryptcompress.c:781)[edward-1608]:
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584096] WARNING: Expecte=
d item
>> >>> not found. Fsck?
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584104] reiser4[sshd(505=
8)]:
>> >>> dc_check_checksum
>> >>> (fs/reiser4/plugin/file/cryptcompress.c:1023)[edward-156]:
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584104] WARNING: Bad dis=
k
>> >>> cluster checksum 1869768224, (should be 950540942) Fsck?
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584104]
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584109] reiser4[sshd(505=
8)]:
>> >>> reiser4_inflate_cluster
>> >>> (fs/reiser4/plugin/file/cryptcompress.c:1190)[edward-1460]:
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584109] WARNING: Inode
>> >>> 14592305: disk cluster 0 looks corrupted
>> >>> Dec  7 19:31:43 krshina3 sshd[5056]: Accepted keyboard-interacti=
ve/pam
>> >>> for root from 192.168.1.10 port 7531 ssh2
>> >>> Dec  7 19:31:43 krshina3 sshd[5056]: pam_unix(sshd:session): ses=
sion
>> >>> opened for user root by (uid=3D0)
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637085] reiser4[bash(506=
6)]:
>> >>> find_cluster_item
>> >>> (fs/reiser4/plugin/file/cryptcompress.c:781)[edward-1608]:
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637085] WARNING: Expecte=
d item
>> >>> not found. Fsck?
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637094] reiser4[bash(506=
6)]:
>> >>> dc_check_checksum
>> >>> (fs/reiser4/plugin/file/cryptcompress.c:1023)[edward-156]:
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637094] WARNING: Bad dis=
k
>> >>> cluster checksum -1945338855, (should be 944271739) Fsck?
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637094]
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637098] reiser4[bash(506=
6)]:
>> >>> reiser4_inflate_cluster
>> >>> (fs/reiser4/plugin/file/cryptcompress.c:1190)[edward-1460]:
>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637098] WARNING: Inode
>> >>> 15185444: disk cluster 0 looks corrupted
>> >>> tail: unrecognized file system type 0x52345362 for
>> >>> '/var/log/messages'. please report this to bug-coreutils@gnu.org=
=2E
>> >>> reverting to polling
>> >>>
>> >>> This is getting bad, I'm going back to 2.6.39 :D
>> >>
>> >> This is exactly what I have here on 3.<anything>.<anything> with =
a plain
>> >> KDE desktop and "a bit of everything" workload. It seems not to b=
e
>> >> related to QEMU or loopbacks or something - just intensive random=
 I/O is
>> >> what triggers this, no specific patterns I've got so far.
>> >> Please tell if it stops happening on 2.6.39 (but remember that it=
 may be
>> >> silent for a while) so I can bisect with precision :)
>> >
>> > It happens with 2.6.39 now too, but with 2.6.39 computer hangs whi=
le
>> > with 3.6.6 it still works after 24hrs
>>
>> Sorry I messed up, now with 2.6.39 I get same errors on I/O, but fil=
es
>> look OK. I only got files in lost+found when system oopsed.
>> Funny thing is I never had these errors until now and i used 2.6.39
>> from Nov 2011.
>
> So what did change from Nov 2011? Have you had the QEMU image on a r4
> partition back to then?
Yeah same usage scenario, Gentoo machine with months of uptime with
lots of recompiling and QEMU-KVM virtual machine with WinXP
Did a small change in kernel config in July 2012, same kernel 2.6.39.4

> And... try to revert to piix, maybe.
>
I'll try.
I;m currently fscking the /fs and I got:
=46SCK: node.c: 108: repair_node_items_check: Node (3205815), items (27=
)
and (28): Wrong order of keys.
=46SCK: filter.c: 407: repair_filter_update_traverse: Node (3205815):
the node is broken. Pointed from the node (2871633), item (12), unit
(0). The whole subtree is skipped.

--build-fs did:
=46SCK: node.c: 108: repair_node_items_check: Node (3205815), items (27=
)
and (28): Wrong order of keys.
=46SCK: filter.c: 407: repair_filter_update_traverse: Node (3205815):
the node is unrecoverable. Pointed from the node (2871633), item (12),
unit (0). Removed.
=46SCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (100919),
item (17), [12e38:76785f68775361:fd23c2] (stat40): wrong bytes
(634880), Fixed to (0).
=46SCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (100919), item
(17), [12e38:76785f68775361:fd23c2] (stat40): wrong size (633454),
=46ixed to (0).
=46SCK: ccreg40_repair.c: 77: ccreg40_check_item: The file
[12e38:767465364b4534:1185752] (ccreg40), node [1795], item [0]: item
of the wrong cluster size (8192) found, Should be (65536). Fixed.
=46SCK: ccreg40_repair.c: 77: ccreg40_check_item: The file
[12e38:767465364d4534:1185753] (ccreg40), node [3211856], item [1]:
item of the wrong cluster size (2048) found, Should be (65536). Fixed.
=46SCK: ccreg40_repair.c: 77: ccreg40_check_item: The file
[12e38:76746538463156:118493e] (ccreg40), node [3211856], item [2]:
item of the wrong cluster size (268435456) found, Should be (65536).
=46ixed.

That's the damage after using 2.6.39 with light workload - compilation
of few small packages with -j3

> Thanks,
> Ivan.
>
>>
>> mount options noatime,onerror=3Dremount-ro, partition type ccreg40
>>
>> > If I reformat partition and restore everything from backup do you
>> > think it would stop?
>> >
>> >> Thanks,
>> >> Ivan.
>> >
>> > Thanks,
>> > Dushan
>> >
>> >>> On Fri, Dec 7, 2012 at 6:56 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusa=
nc@gmail.com> wrote:
>> >>> > Hello
>> >>> >
>> >>> > I'm using KVM for windows emulation and I have a ~3GB image fi=
le that
>> >>> > I run it from.
>> >>> > I started having problems with it lately on regular and ccreg4=
0
>> >>> > partitions (I tried same file on both)  using 3.6.6.
>> >>> > Spammed output with a lot of these:
>> >>> >
>> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133047] reiser4[find(5=
806)]:
>> >>> > parse_node40 (fs/reiser4/plugin/node/node40.c:672)[nikita-494]=
:
>> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133047] WARNING: Wrong=
 level
>> >>> > found in node: 2 !=3D 1
>> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133048] reiser4[find(5=
806)]:
>> >>> > key_warning (fs/reiser4/plugin/file_plugin_common.c:512)[nikit=
a-717]:
>> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133048] WARNING: Error=
 for
>> >>> > inode 17802378 (-5)
>> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133056] reiser4[find(5=
806)]:
>> >>> > parse_node40 (fs/reiser4/plugin/node/node40.c:672)[nikita-494]=
:
>> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133056] WARNING: Wrong=
 level
>> >>> > found in node: 2 !=3D 1
>> >>> >
>> >>> >
>> >>> > Dec  7 17:26:23 krshina3 kernel: [38539.089191] reiser4[gdm(26=
76)]:
>> >>> > cbk_level_lookup (fs/reiser4/search.c:963)[vs-3533]:
>> >>> > Dec  7 17:26:23 krshina3 kernel: [38539.089194] reiser4[gdm(26=
76)]:
>> >>> > key_warning (fs/reiser4/plugin/file_plugin_common.c:512)[nikit=
a-717]:
>> >>> > Dec  7 17:26:23 krshina3 kernel: [38539.090837]
>> >>> > reiser4[gnome-screensav(3503)]: cbk_level_lookup
>> >>> > (fs/reiser4/search.c:963)[vs-3533]:
>> >>> > Dec  7 17:26:23 krshina3 kernel: [38539.090840]
>> >>> > reiser4[gnome-screensav(3503)]: key_warning
>> >>> >
>> >>> > (fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717]:
>> >>> >  I fscked the FSes and had some errors that were corrected.
>> >>> >
>> >>> > Now I started geting these and I can't kill the offending proc=
ess:
>> >>> >
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274343] INFO: task
>> >>> > qemu-system-x86:4156 blocked for more than 120 seconds.
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274347] "echo 0 >
>> >>> > /proc/sys/kernel/hung_task_timeout_secs" disables this message=
=2E
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274349] qemu-system-x8=
6 D
>> >>> > 0000000000000001     0  4156   3654 0x00000000
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274354]  ffff880206dd7=
990
>> >>> > 0000000000000086 ffff8801def2fc38 ffff88022ca38cf0
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274357]  0000000000011=
240
>> >>> > ffff8801def2ffd8 0000000000004000 ffff8801def2ffd8
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274361]  0000000000011=
240
>> >>> > ffff880206dd7990 0000000000011240 ffff8801def2e000
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274364] Call Trace:
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274372]  [<ffffffff810=
aec97>]
>> >>> > ? pagevec_lookup_tag+0x18/0x21
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274375]  [<ffffffff810=
a528a>]
>> >>> > ? filemap_fdatawait_range+0xff/0x144
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274380]  [<ffffffff811=
46b09>]
>> >>> > ? writepages_unix_file+0x36e/0x3ce
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274384]  [<ffffffff810=
ab9f9>]
>> >>> > ? global_dirtyable_memory+0xd/0x2c
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274389]  [<ffffffff814=
89dac>]
>> >>> > ? __mutex_lock_slowpath+0xd0/0x116
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274392]  [<ffffffff814=
8a096>]
>> >>> > ? mutex_lock+0x1a/0x2d
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274396]  [<ffffffff811=
43b73>]
>> >>> > ? reiser4_sync_file_common+0x58/0xcd
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274400]  [<ffffffff811=
47a81>]
>> >>> > ? write_unix_file+0x442/0x4b7
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274404]  [<ffffffff811=
498b9>]
>> >>> > ? reiser4_write_careful+0xb8/0x450
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274409]  [<ffffffff810=
da90f>]
>> >>> > ? vfs_write+0xaf/0x149
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274412]  [<ffffffff810=
dab49>]
>> >>> > ? sys_pwrite64+0x53/0x71
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274415]  [<ffffffff814=
8c3e2>]
>> >>> > ? system_call_fastpath+0x16/0x1b
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274418] INFO: task
>> >>> > qemu-system-x86:4162 blocked for more than 120 seconds.
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274419] "echo 0 >
>> >>> > /proc/sys/kernel/hung_task_timeout_secs" disables this message=
=2E
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274420] qemu-system-x8=
6 D
>> >>> > 0000000000000000     0  4162   3654 0x00000000
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274423]  ffff88020f7ca=
cf0
>> >>> > 0000000000000086 ffff8801e007fe18 ffffffff816ab3f0
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274426]  0000000000011=
240
>> >>> > ffff8801e007ffd8 0000000000004000 ffff8801e007ffd8
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274429]  0000000000011=
240
>> >>> > ffff88020f7cacf0 0000000000011240 ffff8801e007e000
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274432] Call Trace:
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274437]  [<ffffffff810=
aec97>]
>> >>> > ? pagevec_lookup_tag+0x18/0x21
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274439]  [<ffffffff810=
a528a>]
>> >>> > ? filemap_fdatawait_range+0xff/0x144
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274443]  [<ffffffff811=
46b09>]
>> >>> > ? writepages_unix_file+0x36e/0x3ce
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274447]  [<ffffffff814=
89dac>]
>> >>> > ? __mutex_lock_slowpath+0xd0/0x116
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274450]  [<ffffffff814=
8a096>]
>> >>> > ? mutex_lock+0x1a/0x2d
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274453]  [<ffffffff811=
43b73>]
>> >>> > ? reiser4_sync_file_common+0x58/0xcd
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274457]  [<ffffffff810=
fa6d8>]
>> >>> > ? do_fsync+0x29/0x47
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274460]  [<ffffffff810=
fa716>]
>> >>> > ? sys_fdatasync+0xe/0x15
>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274462]  [<ffffffff814=
8c3e2>]
>> >>> > ? system_call_fastpath+0x16/0x1b
>> >>> > tail: unrecognized file system type 0x52345362 for
>> >>> > '/var/log/messages'. please report this to bug-coreutils@gnu.o=
rg.
>> >>> > reverting to polling
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266595] INFO: task
>> >>> > qemu-system-x86:4156 blocked for more than 120 seconds.
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266599] "echo 0 >
>> >>> > /proc/sys/kernel/hung_task_timeout_secs" disables this message=
=2E
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266601] qemu-system-x8=
6 D
>> >>> > 0000000000000001     0  4156   3654 0x00000000
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266605]  ffff880206dd7=
990
>> >>> > 0000000000000086 ffff8801def2fc38 ffff88022ca38cf0
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266609]  0000000000011=
240
>> >>> > ffff8801def2ffd8 0000000000004000 ffff8801def2ffd8
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266613]  0000000000011=
240
>> >>> > ffff880206dd7990 0000000000011240 ffff8801def2e000
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266616] Call Trace:
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266625]  [<ffffffff810=
aec97>]
>> >>> > ? pagevec_lookup_tag+0x18/0x21
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266629]  [<ffffffff810=
a528a>]
>> >>> > ? filemap_fdatawait_range+0xff/0x144
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266634]  [<ffffffff811=
46b09>]
>> >>> > ? writepages_unix_file+0x36e/0x3ce
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266638]  [<ffffffff810=
ab9f9>]
>> >>> > ? global_dirtyable_memory+0xd/0x2c
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266643]  [<ffffffff814=
89dac>]
>> >>> > ? __mutex_lock_slowpath+0xd0/0x116
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266646]  [<ffffffff814=
8a096>]
>> >>> > ? mutex_lock+0x1a/0x2d
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266650]  [<ffffffff811=
43b73>]
>> >>> > ? reiser4_sync_file_common+0x58/0xcd
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266654]  [<ffffffff811=
47a81>]
>> >>> > ? write_unix_file+0x442/0x4b7
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266658]  [<ffffffff811=
498b9>]
>> >>> > ? reiser4_write_careful+0xb8/0x450
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266664]  [<ffffffff810=
da90f>]
>> >>> > ? vfs_write+0xaf/0x149
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266666]  [<ffffffff810=
dab49>]
>> >>> > ? sys_pwrite64+0x53/0x71
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266670]  [<ffffffff814=
8c3e2>]
>> >>> > ? system_call_fastpath+0x16/0x1b
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266672] INFO: task
>> >>> > qemu-system-x86:4162 blocked for more than 120 seconds.
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266674] "echo 0 >
>> >>> > /proc/sys/kernel/hung_task_timeout_secs" disables this message=
=2E
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266675] qemu-system-x8=
6 D
>> >>> > 0000000000000000     0  4162   3654 0x00000000
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266678]  ffff88020f7ca=
cf0
>> >>> > 0000000000000086 ffff8801e007fe18 ffffffff816ab3f0
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266681]  0000000000011=
240
>> >>> > ffff8801e007ffd8 0000000000004000 ffff8801e007ffd8
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266684]  0000000000011=
240
>> >>> > ffff88020f7cacf0 0000000000011240 ffff8801e007e000
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266687] Call Trace:
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266691]  [<ffffffff810=
aec97>]
>> >>> > ? pagevec_lookup_tag+0x18/0x21
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266694]  [<ffffffff810=
a528a>]
>> >>> > ? filemap_fdatawait_range+0xff/0x144
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266698]  [<ffffffff811=
46b09>]
>> >>> > ? writepages_unix_file+0x36e/0x3ce
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266702]  [<ffffffff814=
89dac>]
>> >>> > ? __mutex_lock_slowpath+0xd0/0x116
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266705]  [<ffffffff814=
8a096>]
>> >>> > ? mutex_lock+0x1a/0x2d
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266708]  [<ffffffff811=
43b73>]
>> >>> > ? reiser4_sync_file_common+0x58/0xcd
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266712]  [<ffffffff810=
fa6d8>]
>> >>> > ? do_fsync+0x29/0x47
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266714]  [<ffffffff810=
fa716>]
>> >>> > ? sys_fdatasync+0xe/0x15
>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266717]  [<ffffffff814=
8c3e2>]
>> >>> > ? system_call_fastpath+0x16/0x1b
>> >>> >
>> >>> >
>> >>> > File runs fine from FAT32 partition
>> >>> >
>> >>> > If I can do something, or you need any info tell me please
>> >>> >
>> >>> > Thanks
>> >>> > Dushan
>> >>>
>> >>> --
>> >>> To unsubscribe from this list: send the line "unsubscribe
>> >>> reiserfs-devel" in the body of a message to majordomo@vger.kerne=
l.org
>> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.ht=
ml
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
