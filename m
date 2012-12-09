From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: R4 problem started with 2.6.39 and still there with 3.6.6
Date: Sun, 09 Dec 2012 19:17:36 +0400
Message-ID: <7702122.pk2Xoi0MLP@intelfx-laptop>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <CADW=+3m0X8cSfUFzwijaWX_1v0J0NFLZDtZea0ExPhX5+Mm-Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=aADNLqRrJEMAbkrNTvjjGjwynxVrSe0akNNQ4Vv1BZk=;
        b=ORgIV9NRdfsSRf5yt2V8r4xI/s7KAhQJ44XvpFTwhgRp6Bb4grG+iWJ7M6XxwiI4fB
         deRoSueoQLGo3ExzBhvD5V+GCdVFGqm4/uDSsddBpAkyu8UhxvmXdxUL9k22CM4dS3HJ
         y6uE/DomNAoiYfOi83TpXSBmdO3DsWPaK+LdyaTVNbsyGXw5wRyDyRnkqjmjsK4VhB7k
         A4/4eLJadgX9SsaH6z+kjkcEv2OMmJ3zIPHeUmy6PLD3oidPtPZh/3GTvueNS9GvW07z
         S678Pub51KgyjIowmwo/LUHt7k75TTtZvC8fnJ+ofaL4Vhw5fmrQx9om7MsDPzqxu0eV
         JZWA==
In-Reply-To: <CADW=+3m0X8cSfUFzwijaWX_1v0J0NFLZDtZea0ExPhX5+Mm-Nw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 07 December 2012 19:34:45 Du=C5=A1an =C4=8Coli=C4=87 wrote:
> Ok, on just fscked partition I now get:
>=20
> Dec  7 19:31:43 krshina3 kernel: [ 2069.584096] reiser4[sshd(5058)]:
> find_cluster_item
> (fs/reiser4/plugin/file/cryptcompress.c:781)[edward-1608]:
> Dec  7 19:31:43 krshina3 kernel: [ 2069.584096] WARNING: Expected ite=
m
> not found. Fsck?
> Dec  7 19:31:43 krshina3 kernel: [ 2069.584104] reiser4[sshd(5058)]:
> dc_check_checksum
> (fs/reiser4/plugin/file/cryptcompress.c:1023)[edward-156]:
> Dec  7 19:31:43 krshina3 kernel: [ 2069.584104] WARNING: Bad disk
> cluster checksum 1869768224, (should be 950540942) Fsck?
> Dec  7 19:31:43 krshina3 kernel: [ 2069.584104]
> Dec  7 19:31:43 krshina3 kernel: [ 2069.584109] reiser4[sshd(5058)]:
> reiser4_inflate_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:1190)[edward-1460]:
> Dec  7 19:31:43 krshina3 kernel: [ 2069.584109] WARNING: Inode
> 14592305: disk cluster 0 looks corrupted
> Dec  7 19:31:43 krshina3 sshd[5056]: Accepted keyboard-interactive/pa=
m
> for root from 192.168.1.10 port 7531 ssh2
> Dec  7 19:31:43 krshina3 sshd[5056]: pam_unix(sshd:session): session
> opened for user root by (uid=3D0)
> Dec  7 19:31:43 krshina3 kernel: [ 2069.637085] reiser4[bash(5066)]:
> find_cluster_item
> (fs/reiser4/plugin/file/cryptcompress.c:781)[edward-1608]:
> Dec  7 19:31:43 krshina3 kernel: [ 2069.637085] WARNING: Expected ite=
m
> not found. Fsck?
> Dec  7 19:31:43 krshina3 kernel: [ 2069.637094] reiser4[bash(5066)]:
> dc_check_checksum
> (fs/reiser4/plugin/file/cryptcompress.c:1023)[edward-156]:
> Dec  7 19:31:43 krshina3 kernel: [ 2069.637094] WARNING: Bad disk
> cluster checksum -1945338855, (should be 944271739) Fsck?
> Dec  7 19:31:43 krshina3 kernel: [ 2069.637094]
> Dec  7 19:31:43 krshina3 kernel: [ 2069.637098] reiser4[bash(5066)]:
> reiser4_inflate_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:1190)[edward-1460]:
> Dec  7 19:31:43 krshina3 kernel: [ 2069.637098] WARNING: Inode
> 15185444: disk cluster 0 looks corrupted
> tail: unrecognized file system type 0x52345362 for
> '/var/log/messages'. please report this to bug-coreutils@gnu.org.
> reverting to polling
>=20
> This is getting bad, I'm going back to 2.6.39 :D

This is exactly what I have here on 3.<anything>.<anything> with a plai=
n KDE=20
desktop and "a bit of everything" workload. It seems not to be related =
to QEMU=20
or loopbacks or something - just intensive random I/O is what triggers =
this,=20
no specific patterns I've got so far.
Please tell if it stops happening on 2.6.39 (but remember that it may b=
e=20
silent for a while) so I can bisect with precision :)

Thanks,
Ivan.

>=20
> On Fri, Dec 7, 2012 at 6:56 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gm=
ail.com> wrote:
> > Hello
> >=20
> > I'm using KVM for windows emulation and I have a ~3GB image file th=
at
> > I run it from.
> > I started having problems with it lately on regular and ccreg40
> > partitions (I tried same file on both)  using 3.6.6.
> > Spammed output with a lot of these:
> >=20
> > Dec  7 03:30:02 krshina3 kernel: [15135.133047] reiser4[find(5806)]=
:
> > parse_node40 (fs/reiser4/plugin/node/node40.c:672)[nikita-494]:
> > Dec  7 03:30:02 krshina3 kernel: [15135.133047] WARNING: Wrong leve=
l
> > found in node: 2 !=3D 1
> > Dec  7 03:30:02 krshina3 kernel: [15135.133048] reiser4[find(5806)]=
:
> > key_warning (fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717=
]:
> > Dec  7 03:30:02 krshina3 kernel: [15135.133048] WARNING: Error for
> > inode 17802378 (-5)
> > Dec  7 03:30:02 krshina3 kernel: [15135.133056] reiser4[find(5806)]=
:
> > parse_node40 (fs/reiser4/plugin/node/node40.c:672)[nikita-494]:
> > Dec  7 03:30:02 krshina3 kernel: [15135.133056] WARNING: Wrong leve=
l
> > found in node: 2 !=3D 1
> >=20
> >=20
> > Dec  7 17:26:23 krshina3 kernel: [38539.089191] reiser4[gdm(2676)]:
> > cbk_level_lookup (fs/reiser4/search.c:963)[vs-3533]:
> > Dec  7 17:26:23 krshina3 kernel: [38539.089194] reiser4[gdm(2676)]:
> > key_warning (fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717=
]:
> > Dec  7 17:26:23 krshina3 kernel: [38539.090837]
> > reiser4[gnome-screensav(3503)]: cbk_level_lookup
> > (fs/reiser4/search.c:963)[vs-3533]:
> > Dec  7 17:26:23 krshina3 kernel: [38539.090840]
> > reiser4[gnome-screensav(3503)]: key_warning
> >=20
> > (fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717]:
> >  I fscked the FSes and had some errors that were corrected.
> >=20
> > Now I started geting these and I can't kill the offending process:
> >=20
> > Dec  7 18:43:29 krshina3 kernel: [  720.274343] INFO: task
> > qemu-system-x86:4156 blocked for more than 120 seconds.
> > Dec  7 18:43:29 krshina3 kernel: [  720.274347] "echo 0 >
> > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > Dec  7 18:43:29 krshina3 kernel: [  720.274349] qemu-system-x86 D
> > 0000000000000001     0  4156   3654 0x00000000
> > Dec  7 18:43:29 krshina3 kernel: [  720.274354]  ffff880206dd7990
> > 0000000000000086 ffff8801def2fc38 ffff88022ca38cf0
> > Dec  7 18:43:29 krshina3 kernel: [  720.274357]  0000000000011240
> > ffff8801def2ffd8 0000000000004000 ffff8801def2ffd8
> > Dec  7 18:43:29 krshina3 kernel: [  720.274361]  0000000000011240
> > ffff880206dd7990 0000000000011240 ffff8801def2e000
> > Dec  7 18:43:29 krshina3 kernel: [  720.274364] Call Trace:
> > Dec  7 18:43:29 krshina3 kernel: [  720.274372]  [<ffffffff810aec97=
>]
> > ? pagevec_lookup_tag+0x18/0x21
> > Dec  7 18:43:29 krshina3 kernel: [  720.274375]  [<ffffffff810a528a=
>]
> > ? filemap_fdatawait_range+0xff/0x144
> > Dec  7 18:43:29 krshina3 kernel: [  720.274380]  [<ffffffff81146b09=
>]
> > ? writepages_unix_file+0x36e/0x3ce
> > Dec  7 18:43:29 krshina3 kernel: [  720.274384]  [<ffffffff810ab9f9=
>]
> > ? global_dirtyable_memory+0xd/0x2c
> > Dec  7 18:43:29 krshina3 kernel: [  720.274389]  [<ffffffff81489dac=
>]
> > ? __mutex_lock_slowpath+0xd0/0x116
> > Dec  7 18:43:29 krshina3 kernel: [  720.274392]  [<ffffffff8148a096=
>]
> > ? mutex_lock+0x1a/0x2d
> > Dec  7 18:43:29 krshina3 kernel: [  720.274396]  [<ffffffff81143b73=
>]
> > ? reiser4_sync_file_common+0x58/0xcd
> > Dec  7 18:43:29 krshina3 kernel: [  720.274400]  [<ffffffff81147a81=
>]
> > ? write_unix_file+0x442/0x4b7
> > Dec  7 18:43:29 krshina3 kernel: [  720.274404]  [<ffffffff811498b9=
>]
> > ? reiser4_write_careful+0xb8/0x450
> > Dec  7 18:43:29 krshina3 kernel: [  720.274409]  [<ffffffff810da90f=
>]
> > ? vfs_write+0xaf/0x149
> > Dec  7 18:43:29 krshina3 kernel: [  720.274412]  [<ffffffff810dab49=
>]
> > ? sys_pwrite64+0x53/0x71
> > Dec  7 18:43:29 krshina3 kernel: [  720.274415]  [<ffffffff8148c3e2=
>]
> > ? system_call_fastpath+0x16/0x1b
> > Dec  7 18:43:29 krshina3 kernel: [  720.274418] INFO: task
> > qemu-system-x86:4162 blocked for more than 120 seconds.
> > Dec  7 18:43:29 krshina3 kernel: [  720.274419] "echo 0 >
> > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > Dec  7 18:43:29 krshina3 kernel: [  720.274420] qemu-system-x86 D
> > 0000000000000000     0  4162   3654 0x00000000
> > Dec  7 18:43:29 krshina3 kernel: [  720.274423]  ffff88020f7cacf0
> > 0000000000000086 ffff8801e007fe18 ffffffff816ab3f0
> > Dec  7 18:43:29 krshina3 kernel: [  720.274426]  0000000000011240
> > ffff8801e007ffd8 0000000000004000 ffff8801e007ffd8
> > Dec  7 18:43:29 krshina3 kernel: [  720.274429]  0000000000011240
> > ffff88020f7cacf0 0000000000011240 ffff8801e007e000
> > Dec  7 18:43:29 krshina3 kernel: [  720.274432] Call Trace:
> > Dec  7 18:43:29 krshina3 kernel: [  720.274437]  [<ffffffff810aec97=
>]
> > ? pagevec_lookup_tag+0x18/0x21
> > Dec  7 18:43:29 krshina3 kernel: [  720.274439]  [<ffffffff810a528a=
>]
> > ? filemap_fdatawait_range+0xff/0x144
> > Dec  7 18:43:29 krshina3 kernel: [  720.274443]  [<ffffffff81146b09=
>]
> > ? writepages_unix_file+0x36e/0x3ce
> > Dec  7 18:43:29 krshina3 kernel: [  720.274447]  [<ffffffff81489dac=
>]
> > ? __mutex_lock_slowpath+0xd0/0x116
> > Dec  7 18:43:29 krshina3 kernel: [  720.274450]  [<ffffffff8148a096=
>]
> > ? mutex_lock+0x1a/0x2d
> > Dec  7 18:43:29 krshina3 kernel: [  720.274453]  [<ffffffff81143b73=
>]
> > ? reiser4_sync_file_common+0x58/0xcd
> > Dec  7 18:43:29 krshina3 kernel: [  720.274457]  [<ffffffff810fa6d8=
>]
> > ? do_fsync+0x29/0x47
> > Dec  7 18:43:29 krshina3 kernel: [  720.274460]  [<ffffffff810fa716=
>]
> > ? sys_fdatasync+0xe/0x15
> > Dec  7 18:43:29 krshina3 kernel: [  720.274462]  [<ffffffff8148c3e2=
>]
> > ? system_call_fastpath+0x16/0x1b
> > tail: unrecognized file system type 0x52345362 for
> > '/var/log/messages'. please report this to bug-coreutils@gnu.org.
> > reverting to polling
> > Dec  7 18:45:29 krshina3 kernel: [  840.266595] INFO: task
> > qemu-system-x86:4156 blocked for more than 120 seconds.
> > Dec  7 18:45:29 krshina3 kernel: [  840.266599] "echo 0 >
> > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > Dec  7 18:45:29 krshina3 kernel: [  840.266601] qemu-system-x86 D
> > 0000000000000001     0  4156   3654 0x00000000
> > Dec  7 18:45:29 krshina3 kernel: [  840.266605]  ffff880206dd7990
> > 0000000000000086 ffff8801def2fc38 ffff88022ca38cf0
> > Dec  7 18:45:29 krshina3 kernel: [  840.266609]  0000000000011240
> > ffff8801def2ffd8 0000000000004000 ffff8801def2ffd8
> > Dec  7 18:45:29 krshina3 kernel: [  840.266613]  0000000000011240
> > ffff880206dd7990 0000000000011240 ffff8801def2e000
> > Dec  7 18:45:29 krshina3 kernel: [  840.266616] Call Trace:
> > Dec  7 18:45:29 krshina3 kernel: [  840.266625]  [<ffffffff810aec97=
>]
> > ? pagevec_lookup_tag+0x18/0x21
> > Dec  7 18:45:29 krshina3 kernel: [  840.266629]  [<ffffffff810a528a=
>]
> > ? filemap_fdatawait_range+0xff/0x144
> > Dec  7 18:45:29 krshina3 kernel: [  840.266634]  [<ffffffff81146b09=
>]
> > ? writepages_unix_file+0x36e/0x3ce
> > Dec  7 18:45:29 krshina3 kernel: [  840.266638]  [<ffffffff810ab9f9=
>]
> > ? global_dirtyable_memory+0xd/0x2c
> > Dec  7 18:45:29 krshina3 kernel: [  840.266643]  [<ffffffff81489dac=
>]
> > ? __mutex_lock_slowpath+0xd0/0x116
> > Dec  7 18:45:29 krshina3 kernel: [  840.266646]  [<ffffffff8148a096=
>]
> > ? mutex_lock+0x1a/0x2d
> > Dec  7 18:45:29 krshina3 kernel: [  840.266650]  [<ffffffff81143b73=
>]
> > ? reiser4_sync_file_common+0x58/0xcd
> > Dec  7 18:45:29 krshina3 kernel: [  840.266654]  [<ffffffff81147a81=
>]
> > ? write_unix_file+0x442/0x4b7
> > Dec  7 18:45:29 krshina3 kernel: [  840.266658]  [<ffffffff811498b9=
>]
> > ? reiser4_write_careful+0xb8/0x450
> > Dec  7 18:45:29 krshina3 kernel: [  840.266664]  [<ffffffff810da90f=
>]
> > ? vfs_write+0xaf/0x149
> > Dec  7 18:45:29 krshina3 kernel: [  840.266666]  [<ffffffff810dab49=
>]
> > ? sys_pwrite64+0x53/0x71
> > Dec  7 18:45:29 krshina3 kernel: [  840.266670]  [<ffffffff8148c3e2=
>]
> > ? system_call_fastpath+0x16/0x1b
> > Dec  7 18:45:29 krshina3 kernel: [  840.266672] INFO: task
> > qemu-system-x86:4162 blocked for more than 120 seconds.
> > Dec  7 18:45:29 krshina3 kernel: [  840.266674] "echo 0 >
> > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > Dec  7 18:45:29 krshina3 kernel: [  840.266675] qemu-system-x86 D
> > 0000000000000000     0  4162   3654 0x00000000
> > Dec  7 18:45:29 krshina3 kernel: [  840.266678]  ffff88020f7cacf0
> > 0000000000000086 ffff8801e007fe18 ffffffff816ab3f0
> > Dec  7 18:45:29 krshina3 kernel: [  840.266681]  0000000000011240
> > ffff8801e007ffd8 0000000000004000 ffff8801e007ffd8
> > Dec  7 18:45:29 krshina3 kernel: [  840.266684]  0000000000011240
> > ffff88020f7cacf0 0000000000011240 ffff8801e007e000
> > Dec  7 18:45:29 krshina3 kernel: [  840.266687] Call Trace:
> > Dec  7 18:45:29 krshina3 kernel: [  840.266691]  [<ffffffff810aec97=
>]
> > ? pagevec_lookup_tag+0x18/0x21
> > Dec  7 18:45:29 krshina3 kernel: [  840.266694]  [<ffffffff810a528a=
>]
> > ? filemap_fdatawait_range+0xff/0x144
> > Dec  7 18:45:29 krshina3 kernel: [  840.266698]  [<ffffffff81146b09=
>]
> > ? writepages_unix_file+0x36e/0x3ce
> > Dec  7 18:45:29 krshina3 kernel: [  840.266702]  [<ffffffff81489dac=
>]
> > ? __mutex_lock_slowpath+0xd0/0x116
> > Dec  7 18:45:29 krshina3 kernel: [  840.266705]  [<ffffffff8148a096=
>]
> > ? mutex_lock+0x1a/0x2d
> > Dec  7 18:45:29 krshina3 kernel: [  840.266708]  [<ffffffff81143b73=
>]
> > ? reiser4_sync_file_common+0x58/0xcd
> > Dec  7 18:45:29 krshina3 kernel: [  840.266712]  [<ffffffff810fa6d8=
>]
> > ? do_fsync+0x29/0x47
> > Dec  7 18:45:29 krshina3 kernel: [  840.266714]  [<ffffffff810fa716=
>]
> > ? sys_fdatasync+0xe/0x15
> > Dec  7 18:45:29 krshina3 kernel: [  840.266717]  [<ffffffff8148c3e2=
>]
> > ? system_call_fastpath+0x16/0x1b
> >=20
> >=20
> > File runs fine from FAT32 partition
> >=20
> > If I can do something, or you need any info tell me please
> >=20
> > Thanks
> > Dushan
>=20
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
