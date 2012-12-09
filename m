From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: R4 problem started with 2.6.39 and still there with 3.6.6
Date: Sun, 09 Dec 2012 20:38:44 +0400
Message-ID: <39867443.uySorikH8H@intelfx-laptop>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <CADW=+3nitbqPWJCaJyjax+tno9esS3wKfj7kFcyhfdsY6MwiFQ@mail.gmail.com> <CADW=+3n6tx0q5qD_WN6c9TLJLFiB1Sa=jvgM3j_6XiUST5aMnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=W5bR7U7QjKTJ/aJE6b2GEaX3FsE6ncewoGa8wn/d9Yw=;
        b=yq+Wf/Xl2jaHABX0fXfYg4UgJG0yskNITT4nmDQB7sXcHmId+bPGdLmZs+WBm+aXBg
         V3H1Doo8uVq5t6FHskJCr0pUKhL+zsAACIhIF0hl7memGV2DapH2DEh9kRjPoxk5j0zj
         MmWtZyEmZJHmRyYoMFfsmGa4z/sSeBk0MqJTGr6lGaQ9u1l72+AFAFhsT/Q8jEQ5LaXj
         sIdFnyVk9mJGVdlG4KnJ73Hum2/oD69d5Qd7Rp177xz75ih4/Ly7n6C7X8hTbsSyPrdZ
         n7bW9MMBVT9hOAXj8YG3DSnpOzwWvM0Bow3p46tRLfBYySx0by6Oa181j7FykcfsqLhm
         zzVQ==
In-Reply-To: <CADW=+3n6tx0q5qD_WN6c9TLJLFiB1Sa=jvgM3j_6XiUST5aMnQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 09 December 2012 17:29:58 Du=C5=A1an =C4=8Coli=C4=87 wrote:
> On Sun, Dec 9, 2012 at 5:19 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gm=
ail.com> wrote:
> > On Sun, Dec 9, 2012 at 4:17 PM, Ivan Shapovalov <intelfx100@gmail.c=
om>=20
wrote:
> >> On 07 December 2012 19:34:45 Du=C5=A1an =C4=8Coli=C4=87 wrote:
> >>> Ok, on just fscked partition I now get:
> >>>=20
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584096] reiser4[sshd(5058=
)]:
> >>> find_cluster_item
> >>> (fs/reiser4/plugin/file/cryptcompress.c:781)[edward-1608]:
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584096] WARNING: Expected=
 item
> >>> not found. Fsck?
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584104] reiser4[sshd(5058=
)]:
> >>> dc_check_checksum
> >>> (fs/reiser4/plugin/file/cryptcompress.c:1023)[edward-156]:
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584104] WARNING: Bad disk
> >>> cluster checksum 1869768224, (should be 950540942) Fsck?
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584104]
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584109] reiser4[sshd(5058=
)]:
> >>> reiser4_inflate_cluster
> >>> (fs/reiser4/plugin/file/cryptcompress.c:1190)[edward-1460]:
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584109] WARNING: Inode
> >>> 14592305: disk cluster 0 looks corrupted
> >>> Dec  7 19:31:43 krshina3 sshd[5056]: Accepted keyboard-interactiv=
e/pam
> >>> for root from 192.168.1.10 port 7531 ssh2
> >>> Dec  7 19:31:43 krshina3 sshd[5056]: pam_unix(sshd:session): sess=
ion
> >>> opened for user root by (uid=3D0)
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637085] reiser4[bash(5066=
)]:
> >>> find_cluster_item
> >>> (fs/reiser4/plugin/file/cryptcompress.c:781)[edward-1608]:
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637085] WARNING: Expected=
 item
> >>> not found. Fsck?
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637094] reiser4[bash(5066=
)]:
> >>> dc_check_checksum
> >>> (fs/reiser4/plugin/file/cryptcompress.c:1023)[edward-156]:
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637094] WARNING: Bad disk
> >>> cluster checksum -1945338855, (should be 944271739) Fsck?
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637094]
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637098] reiser4[bash(5066=
)]:
> >>> reiser4_inflate_cluster
> >>> (fs/reiser4/plugin/file/cryptcompress.c:1190)[edward-1460]:
> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637098] WARNING: Inode
> >>> 15185444: disk cluster 0 looks corrupted
> >>> tail: unrecognized file system type 0x52345362 for
> >>> '/var/log/messages'. please report this to bug-coreutils@gnu.org.
> >>> reverting to polling
> >>>=20
> >>> This is getting bad, I'm going back to 2.6.39 :D
> >>=20
> >> This is exactly what I have here on 3.<anything>.<anything> with a=
 plain
> >> KDE desktop and "a bit of everything" workload. It seems not to be
> >> related to QEMU or loopbacks or something - just intensive random =
I/O is
> >> what triggers this, no specific patterns I've got so far.
> >> Please tell if it stops happening on 2.6.39 (but remember that it =
may be
> >> silent for a while) so I can bisect with precision :)
> >=20
> > It happens with 2.6.39 now too, but with 2.6.39 computer hangs whil=
e
> > with 3.6.6 it still works after 24hrs
>=20
> Sorry I messed up, now with 2.6.39 I get same errors on I/O, but file=
s
> look OK. I only got files in lost+found when system oopsed.
> Funny thing is I never had these errors until now and i used 2.6.39
> from Nov 2011.

So what did change from Nov 2011? Have you had the QEMU image on a r4=20
partition back to then?
And... try to revert to piix, maybe.

Thanks,
Ivan.

>=20
> mount options noatime,onerror=3Dremount-ro, partition type ccreg40
>=20
> > If I reformat partition and restore everything from backup do you
> > think it would stop?
> >=20
> >> Thanks,
> >> Ivan.
> >=20
> > Thanks,
> > Dushan
> >=20
> >>> On Fri, Dec 7, 2012 at 6:56 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusan=
c@gmail.com> wrote:
> >>> > Hello
> >>> >=20
> >>> > I'm using KVM for windows emulation and I have a ~3GB image fil=
e that
> >>> > I run it from.
> >>> > I started having problems with it lately on regular and ccreg40
> >>> > partitions (I tried same file on both)  using 3.6.6.
> >>> > Spammed output with a lot of these:
> >>> >=20
> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133047] reiser4[find(58=
06)]:
> >>> > parse_node40 (fs/reiser4/plugin/node/node40.c:672)[nikita-494]:
> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133047] WARNING: Wrong =
level
> >>> > found in node: 2 !=3D 1
> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133048] reiser4[find(58=
06)]:
> >>> > key_warning (fs/reiser4/plugin/file_plugin_common.c:512)[nikita=
-717]:
> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133048] WARNING: Error =
for
> >>> > inode 17802378 (-5)
> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133056] reiser4[find(58=
06)]:
> >>> > parse_node40 (fs/reiser4/plugin/node/node40.c:672)[nikita-494]:
> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133056] WARNING: Wrong =
level
> >>> > found in node: 2 !=3D 1
> >>> >=20
> >>> >=20
> >>> > Dec  7 17:26:23 krshina3 kernel: [38539.089191] reiser4[gdm(267=
6)]:
> >>> > cbk_level_lookup (fs/reiser4/search.c:963)[vs-3533]:
> >>> > Dec  7 17:26:23 krshina3 kernel: [38539.089194] reiser4[gdm(267=
6)]:
> >>> > key_warning (fs/reiser4/plugin/file_plugin_common.c:512)[nikita=
-717]:
> >>> > Dec  7 17:26:23 krshina3 kernel: [38539.090837]
> >>> > reiser4[gnome-screensav(3503)]: cbk_level_lookup
> >>> > (fs/reiser4/search.c:963)[vs-3533]:
> >>> > Dec  7 17:26:23 krshina3 kernel: [38539.090840]
> >>> > reiser4[gnome-screensav(3503)]: key_warning
> >>> >=20
> >>> > (fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717]:
> >>> >  I fscked the FSes and had some errors that were corrected.
> >>> >=20
> >>> > Now I started geting these and I can't kill the offending proce=
ss:
> >>> >=20
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274343] INFO: task
> >>> > qemu-system-x86:4156 blocked for more than 120 seconds.
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274347] "echo 0 >
> >>> > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274349] qemu-system-x86=
 D
> >>> > 0000000000000001     0  4156   3654 0x00000000
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274354]  ffff880206dd79=
90
> >>> > 0000000000000086 ffff8801def2fc38 ffff88022ca38cf0
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274357]  00000000000112=
40
> >>> > ffff8801def2ffd8 0000000000004000 ffff8801def2ffd8
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274361]  00000000000112=
40
> >>> > ffff880206dd7990 0000000000011240 ffff8801def2e000
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274364] Call Trace:
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274372]  [<ffffffff810a=
ec97>]
> >>> > ? pagevec_lookup_tag+0x18/0x21
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274375]  [<ffffffff810a=
528a>]
> >>> > ? filemap_fdatawait_range+0xff/0x144
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274380]  [<ffffffff8114=
6b09>]
> >>> > ? writepages_unix_file+0x36e/0x3ce
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274384]  [<ffffffff810a=
b9f9>]
> >>> > ? global_dirtyable_memory+0xd/0x2c
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274389]  [<ffffffff8148=
9dac>]
> >>> > ? __mutex_lock_slowpath+0xd0/0x116
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274392]  [<ffffffff8148=
a096>]
> >>> > ? mutex_lock+0x1a/0x2d
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274396]  [<ffffffff8114=
3b73>]
> >>> > ? reiser4_sync_file_common+0x58/0xcd
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274400]  [<ffffffff8114=
7a81>]
> >>> > ? write_unix_file+0x442/0x4b7
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274404]  [<ffffffff8114=
98b9>]
> >>> > ? reiser4_write_careful+0xb8/0x450
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274409]  [<ffffffff810d=
a90f>]
> >>> > ? vfs_write+0xaf/0x149
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274412]  [<ffffffff810d=
ab49>]
> >>> > ? sys_pwrite64+0x53/0x71
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274415]  [<ffffffff8148=
c3e2>]
> >>> > ? system_call_fastpath+0x16/0x1b
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274418] INFO: task
> >>> > qemu-system-x86:4162 blocked for more than 120 seconds.
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274419] "echo 0 >
> >>> > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274420] qemu-system-x86=
 D
> >>> > 0000000000000000     0  4162   3654 0x00000000
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274423]  ffff88020f7cac=
f0
> >>> > 0000000000000086 ffff8801e007fe18 ffffffff816ab3f0
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274426]  00000000000112=
40
> >>> > ffff8801e007ffd8 0000000000004000 ffff8801e007ffd8
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274429]  00000000000112=
40
> >>> > ffff88020f7cacf0 0000000000011240 ffff8801e007e000
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274432] Call Trace:
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274437]  [<ffffffff810a=
ec97>]
> >>> > ? pagevec_lookup_tag+0x18/0x21
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274439]  [<ffffffff810a=
528a>]
> >>> > ? filemap_fdatawait_range+0xff/0x144
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274443]  [<ffffffff8114=
6b09>]
> >>> > ? writepages_unix_file+0x36e/0x3ce
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274447]  [<ffffffff8148=
9dac>]
> >>> > ? __mutex_lock_slowpath+0xd0/0x116
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274450]  [<ffffffff8148=
a096>]
> >>> > ? mutex_lock+0x1a/0x2d
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274453]  [<ffffffff8114=
3b73>]
> >>> > ? reiser4_sync_file_common+0x58/0xcd
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274457]  [<ffffffff810f=
a6d8>]
> >>> > ? do_fsync+0x29/0x47
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274460]  [<ffffffff810f=
a716>]
> >>> > ? sys_fdatasync+0xe/0x15
> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274462]  [<ffffffff8148=
c3e2>]
> >>> > ? system_call_fastpath+0x16/0x1b
> >>> > tail: unrecognized file system type 0x52345362 for
> >>> > '/var/log/messages'. please report this to bug-coreutils@gnu.or=
g.
> >>> > reverting to polling
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266595] INFO: task
> >>> > qemu-system-x86:4156 blocked for more than 120 seconds.
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266599] "echo 0 >
> >>> > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266601] qemu-system-x86=
 D
> >>> > 0000000000000001     0  4156   3654 0x00000000
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266605]  ffff880206dd79=
90
> >>> > 0000000000000086 ffff8801def2fc38 ffff88022ca38cf0
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266609]  00000000000112=
40
> >>> > ffff8801def2ffd8 0000000000004000 ffff8801def2ffd8
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266613]  00000000000112=
40
> >>> > ffff880206dd7990 0000000000011240 ffff8801def2e000
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266616] Call Trace:
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266625]  [<ffffffff810a=
ec97>]
> >>> > ? pagevec_lookup_tag+0x18/0x21
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266629]  [<ffffffff810a=
528a>]
> >>> > ? filemap_fdatawait_range+0xff/0x144
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266634]  [<ffffffff8114=
6b09>]
> >>> > ? writepages_unix_file+0x36e/0x3ce
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266638]  [<ffffffff810a=
b9f9>]
> >>> > ? global_dirtyable_memory+0xd/0x2c
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266643]  [<ffffffff8148=
9dac>]
> >>> > ? __mutex_lock_slowpath+0xd0/0x116
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266646]  [<ffffffff8148=
a096>]
> >>> > ? mutex_lock+0x1a/0x2d
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266650]  [<ffffffff8114=
3b73>]
> >>> > ? reiser4_sync_file_common+0x58/0xcd
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266654]  [<ffffffff8114=
7a81>]
> >>> > ? write_unix_file+0x442/0x4b7
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266658]  [<ffffffff8114=
98b9>]
> >>> > ? reiser4_write_careful+0xb8/0x450
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266664]  [<ffffffff810d=
a90f>]
> >>> > ? vfs_write+0xaf/0x149
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266666]  [<ffffffff810d=
ab49>]
> >>> > ? sys_pwrite64+0x53/0x71
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266670]  [<ffffffff8148=
c3e2>]
> >>> > ? system_call_fastpath+0x16/0x1b
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266672] INFO: task
> >>> > qemu-system-x86:4162 blocked for more than 120 seconds.
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266674] "echo 0 >
> >>> > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266675] qemu-system-x86=
 D
> >>> > 0000000000000000     0  4162   3654 0x00000000
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266678]  ffff88020f7cac=
f0
> >>> > 0000000000000086 ffff8801e007fe18 ffffffff816ab3f0
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266681]  00000000000112=
40
> >>> > ffff8801e007ffd8 0000000000004000 ffff8801e007ffd8
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266684]  00000000000112=
40
> >>> > ffff88020f7cacf0 0000000000011240 ffff8801e007e000
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266687] Call Trace:
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266691]  [<ffffffff810a=
ec97>]
> >>> > ? pagevec_lookup_tag+0x18/0x21
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266694]  [<ffffffff810a=
528a>]
> >>> > ? filemap_fdatawait_range+0xff/0x144
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266698]  [<ffffffff8114=
6b09>]
> >>> > ? writepages_unix_file+0x36e/0x3ce
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266702]  [<ffffffff8148=
9dac>]
> >>> > ? __mutex_lock_slowpath+0xd0/0x116
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266705]  [<ffffffff8148=
a096>]
> >>> > ? mutex_lock+0x1a/0x2d
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266708]  [<ffffffff8114=
3b73>]
> >>> > ? reiser4_sync_file_common+0x58/0xcd
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266712]  [<ffffffff810f=
a6d8>]
> >>> > ? do_fsync+0x29/0x47
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266714]  [<ffffffff810f=
a716>]
> >>> > ? sys_fdatasync+0xe/0x15
> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266717]  [<ffffffff8148=
c3e2>]
> >>> > ? system_call_fastpath+0x16/0x1b
> >>> >=20
> >>> >=20
> >>> > File runs fine from FAT32 partition
> >>> >=20
> >>> > If I can do something, or you need any info tell me please
> >>> >=20
> >>> > Thanks
> >>> > Dushan
> >>>=20
> >>> --
> >>> To unsubscribe from this list: send the line "unsubscribe
> >>> reiserfs-devel" in the body of a message to majordomo@vger.kernel=
=2Eorg
> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.htm=
l
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
