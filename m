From: Volker Armin Hemmann <volkerarmin@googlemail.com>
Subject: Bug with KDE 4.5 and reiser4 2.6.34
Date: Sun, 31 Oct 2010 04:06:07 +0100
Message-ID: <201010310406.07767.volkerarmin@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:from:subject:date:user-agent
         :mime-version:to:content-type:content-transfer-encoding:message-id;
        bh=GYLaEwlcLbZPfNjGs3NgDaBDIHndbC7M0A+1qS4EdQk=;
        b=VQM6caaevG3dlKQq5io7BEsM+jAAYxjCDcI8oBr1reZcyVO6sEp+CfALDate3No5jB
         IXvkU7gM5VB7uXZgPa4ha/olgf2Dm0DRPfpCZjR4XSiCEg/h/2Ut1thg61iHGZT2yffb
         rLQQSRx3VTZ8r79MZeTe8xxN1suP/4AwiOTzM=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org

Hi,
I copied everything of the disk, to a partition with some errors, but t=
here=20
were none on when I copied, remade the fs with =20
mkfs.reiser4 -o create=3Dccreg40,compress=3Dgzip1
and copied everything back, again, without problems or anything suspici=
ous in=20
dmesg.

Before and after th exercise I get this whenever I open a directory in=20
konqueror containing pictures;

[   84.131089] reiser4[kio_thumbnail(2347)]: do_readpage_ctail=20
(fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
[   84.131090] WARNING: orphan unprepped cluster 0 (inode 11052573). Fs=
ck?
[   84.131116] reiser4[kio_thumbnail(2347)]: do_readpage_ctail=20
(fs/reiser4/plugin/item/ctail.c:677)[edward-1563]:
[   84.131117] WARNING: orphan unprepped cluster 0 (inode 11052573). Fs=
ck?


which completely floods dmesg, but seems to be harmless compared to the=
=20
clusterfuck when I try to install icons or plasma themes via system-set=
tings.

As soon as I click the install button and the download starts, I get a =
kio_file=20
crashed notification and find this gem in dmesg:

[  144.883228] BUG: unable to handle kernel NULL pointer dereference at=
=20
0000000000000050
[  144.883234] IP: [<ffffffff8135628f>] _raw_spin_lock+0x9/0x1a
[  144.883241] PGD 1f80b1067 PUD 1f80f2067 PMD 0=20
[  144.883244] Oops: 0002 [#1] SMP=20
[  144.883247] last sysfs file:=20
/sys/devices/pci0000:00/0000:00:11.0/host3/target3:0:0/3:0:0:0/block/sd=
d/dev
[  144.883250] CPU 0=20
[  144.883251] Modules linked in: snd_seq_midi snd_emu10k1_synth=20
snd_emux_synth snd_seq_virmidi snd_seq_midi_emul snd_seq_dummy snd_seq_=
oss=20
snd_seq_midi_event snd_seq snd_pcm_oss snd_mixer_oss snd_emu10k1 snd_ra=
wmidi=20
snd_ac97_codec ac97_bus snd_pcm snd_seq_device snd_timer snd_page_alloc=
=20
snd_util_mem snd_hwdep snd asus_atk0110 usb_storage k10temp isl6421=20
b2c2_flexcop_pci b2c2_flexcop dvb_core cx24123 cx24113 s5h1420 ehci_hcd=
 r8169=20
mii
[  144.883273]=20
[  144.883277] Pid: 2516, comm: kio_file Tainted: G        W  2.6.34.7r=
4 #2=20
M4A79XTD EVO/System Product Name
[  144.883280] RIP: 0010:[<ffffffff8135628f>]  [<ffffffff8135628f>]=20
_raw_spin_lock+0x9/0x1a
[  144.883284] RSP: 0018:ffff8801f80f1a28  EFLAGS: 00010292
[  144.883286] RAX: 0000000000000100 RBX: ffff8801f80f1af8 RCX: 0000000=
000000010
[  144.883288] RDX: 0000000000000000 RSI: ffff880205872c08 RDI: 0000000=
000000050
[  144.883290] RBP: ffff8801f80f1a28 R08: dead000000100100 R09: ffff880=
1f80f17e0
[  144.883293] R10: ffff880212ab02c8 R11: ffff88020a388c40 R12: ffff880=
205872c08
[  144.883295] R13: ffffea000716a080 R14: 0000000000000000 R15: 0000000=
000000000
[  144.883298] FS:  00007fbea3634760(0000) GS:ffff880001800000(0000)=20
knlGS:0000000000000000
[  144.883300] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  144.883302] CR2: 0000000000000050 CR3: 00000001f80de000 CR4:=20
00000000000006f0
[  144.883304] DR0: 0000000000000000 DR1: 0000000000000000 DR2:=20
0000000000000000
[  144.883306] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000=
000000400
[  144.883309] Process kio_file (pid: 2516, threadinfo ffff8801f80f0000=
, task=20
ffff88022ed011a0)
[  144.883311] Stack:
[  144.883312]  ffff8801f80f1a78 ffffffff81122712 0000000000000000 0000=
0000000080d0
[  144.883315] <0> ffff8801f80f1a98 ffff8801f80f1af8 ffff880205872c08 f=
fffea000716a080
[  144.883319] <0> 0000000000000000 0000000000000000 ffff8801f80f1ac8=20
ffffffff81124f7e
[  144.883324] Call Trace:
[  144.883329]  [<ffffffff81122712>] checkin_logical_cluster+0x24/0x1c3
[  144.883333]  [<ffffffff81124f7e>] capture_page_cluster+0xab/0xe2
[  144.883337]  [<ffffffff8112508f>] write_end_cryptcompress+0xda/0x15f
[  144.883341]  [<ffffffff811213bc>] reiser4_write_end_careful+0x10f/0x=
195
[  144.883345]  [<ffffffff810857bb>] pagecache_write_end+0x4e/0x57
[  144.883349]  [<ffffffff810cf9e8>] pipe_to_file+0x13e/0x14d
[  144.883352]  [<ffffffff8103936d>] ? current_fs_time+0x22/0x29
[  144.883356]  [<ffffffff810cf8aa>] ? pipe_to_file+0x0/0x14d
[  144.883359]  [<ffffffff810ced30>] splice_from_pipe_feed+0x53/0xe5
[  144.883362]  [<ffffffff810cf82f>] generic_file_splice_write+0xae/0x1=
29
[  144.883365]  [<ffffffff810cf3d1>] do_splice_from+0x74/0x80
[  144.883368]  [<ffffffff810cf3f8>] direct_splice_actor+0x1b/0x1d
[  144.883371]  [<ffffffff810cf668>] splice_direct_to_actor+0xd9/0x198
[  144.883375]  [<ffffffff810cf3dd>] ? direct_splice_actor+0x0/0x1d
[  144.883378]  [<ffffffff810cf76e>] do_splice_direct+0x47/0x5a
[  144.883381]  [<ffffffff810b34ba>] do_sendfile+0x131/0x182
[  144.883385]  [<ffffffff810b3558>] sys_sendfile64+0x4d/0x8d
[  144.883389]  [<ffffffff81001feb>] system_call_fastpath+0x16/0x1b
[  144.883391] Code: 0f b7 07 38 e0 8d 90 00 01 00 00 75 05 f0 66 0f b1=
 17 0f=20
94 c2 0f b6 c2 85 c0 c9 0f 95 c0 0f b6 c0 c3 55 b8 00 01 00 00 48 89 e5=
 <f0>=20
66 0f c1 07 38 e0 74 06 f3 90 8a 07 eb f6 c9 c3 55 48 89 e5=20
[  144.883413] RIP  [<ffffffff8135628f>] _raw_spin_lock+0x9/0x1a
[  144.883416]  RSP <ffff8801f80f1a28>
[  144.883418] CR2: 0000000000000050
[  144.883431] ---[ end trace e5efc81aa3e933fe ]---


of course afterwards everything that tries to write to that partition i=
s stuck=20
in D, which reduces the usability of the box to zero, since it contains=
 / and=20
/home.=20

There are no problems downloading to /tmp, which is on tempfs and movin=
g the=20
files to the partition, or when downloading stuff with chromium or fire=
fox.

Only kio_file and kio_thumbnail are hit. Hard.

Questions: if I copy stuff to a known bad partition and copy those file=
s back -=20
are there chances to copy file system corruption? Is that stuff contagi=
ous? And=20
the second question: has anybody else seen this problems?

Gl=FCck Auf,
Volker
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
