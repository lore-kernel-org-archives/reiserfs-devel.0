From: "Matheus Izvekov" <mizvekov@gmail.com>
Subject: reiser4 panic
Date: Sun, 11 Mar 2007 16:12:02 -0300
Message-ID: <305c16960703111212m3494130em409969e20e0f310@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30599-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        b=atkM8eFnYt6CFUR+1clLfBTIcdw4mMX8INU0K97ZSErwiDO7U/slmWRnIbQjpR/aNbzshmYX62i1xb8LJRbE7PzbhusWDva8f/qjL+w0ZGF8gG1+ZLX/0C4dl40CrIodO+UzTLM0vDmeW5MT/QjbHY6u0pQE1k5HhwK1HcwT72Y=
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Got this oops message while using reiser4:

reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[q(3866)]: cbk_level_lookup (fs/reiser4/search.c:961)[vs-3533]:
WARNING: Keys are inconsistent. Fsck?
reiser4[update-eix(3889)]: key_warning
(fs/reiser4/plugin/file_plugin_common.c:513)[nikita-717]:
WARNING: Error for inode 315366 (-2)
reiser4[emerge(4574)]: plugin_by_unsafe_id
(fs/reiser4/plugin/plugin.c:276)[nikita-2913]:
WARNING: Invalid plugin id: [2:60484]
BUG: unable to handle kernel NULL pointer dereference at virtual
address 00000004
 printing eip:
f9c9a970
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
Modules linked in: ntfs bridge ipx p8022 psnap llc p8023 udf isofs
zlib_inflate snd_rtctimer pppoe pppox ppp_generic slhc af_packet
w83627hf hwmon_vid hwmon eeprom i2c_isa iptable_raw ipt_MASQUERADE
iptable_nat ip_nat ipt_tos xt_CLASSIFY xt_mark iptable_mangle
xt_tcpudp ipt_set xt_length xt_limit ipt_REJECT xt_conntrack
ip_conntrack nfnetlink ipt_ULOG iptable_filter ip_tables x_tables
ip_set_portmap fuse snd_pcm_oss snd_mixer_oss snd_seq_oss
snd_seq_midi_event snd_seq snd_seq_device rtc reiser4 ext2 mbcache
configfs i2c_dev fan button ip_set loop fbcon crc32 font bitblit
softcursor vesafb_tng fb vesafb_thread mousedev joydev eth1394
usb_storage usbhid ff_memless nvidia(P) evdev tuner snd_intel8x0
cx8800 snd_ac97_codec sr_mod cx88xx ac97_bus cdrom ir_common
i2c_algo_bit snd_pcm video_buf snd_timer psmouse tveeprom
compat_ioctl32 btcx_risc videodev snd nvidia_agp i2c_nforce2 serio_raw
ohci1394 ieee1394 v4l1_compat ohci_hcd soundcore snd_page_alloc
agpgart 8250_pnp 8250 serial_core ehci_hcd uhci_hcd i2c_core pata_amd
v4l2_common forcedeth usbcore sg unix
CPU:    0
EIP:    0060:[<f9c9a970>]    Tainted: P      VLI
EFLAGS: 00210282   (2.6.19.2 #4)
EIP is at obtain_item_plugin+0x10/0x20 [reiser4]
eax: 00000000   ebx: d54f0bc4   ecx: c1803040   edx: 00000000
esi: d54f0bc4   edi: e3888300   ebp: d54f0c5c   esp: d54f0b14
ds: 007b   es: 007b   ss: 0068
Process emerge (pid: 4574, ti=d54f0000 task=efc3faa0 task.ti=d54f0000)
Stack: d54f0bc4 f9c9ab99 d54f0bc4 f9c7caee 00000000 efc3faa0 d83e7920 f9c5bed2
       d83e7920 d83e7920 f9c5b70a 00000000 e3888300 d54f0bc4 f9cb1ca0 d54f0c5c
       f9c6fb5f 00000000 00000050 dc0936c4 00000002 d54f0dfc 62696e69 006c6962
Call Trace:
 [<f9c9ab99>] item_type_by_coord+0x29/0x30 [reiser4]
 [<f9c7caee>] owns_item_common_dir+0x1e/0x80 [reiser4]
 [<f9c5bed2>] zparse+0x52/0x70 [reiser4]
 [<f9c5b70a>] jload_gfp+0x6a/0x1b0 [reiser4]
 [<f9c6fb5f>] coord_by_handle+0x2bf/0xde0 [reiser4]
 [<f9c70928>] object_lookup+0xc8/0x110 [reiser4]
 [<f9c879da>] find_entry+0xba/0x290 [reiser4]
 [<f9c5ab6f>] jrelse+0xf/0x20 [reiser4]
 [<f9c75ab2>] init_inode_ordering+0x92/0xa0 [reiser4]
 [<f9c60e7e>] longterm_unlock_znode+0x7e/0x1e0 [reiser4]
 [<f9c87c4d>] lookup_name+0x9d/0x110 [reiser4]
 [<f9c7a7b5>] lookup_common+0x55/0x100 [reiser4]
 [<c017aaad>] d_alloc+0x1d/0x1e0
 [<c016fd98>] do_lookup+0x148/0x190
 [<c0171f5e>] __link_path_walk+0x7ee/0xfc0
 [<c0134cf8>] slice+0x8/0x20
 [<c0134d63>] staircase_normal_prio+0x53/0x90
 [<c017277f>] link_path_walk+0x4f/0xe0
 [<c0115c3a>] do_page_fault+0x4ca/0x610
 [<c0172a1a>] do_path_lookup+0xaa/0x280
 [<c01714db>] getname+0x9b/0xf0
 [<c017347b>] __user_walk_fd+0x3b/0x60
 [<c0166ec5>] sys_faccessat+0x95/0x160
 [<c0115c3a>] do_page_fault+0x4ca/0x610
 [<c0166faf>] sys_access+0x1f/0x30
 [<c0102fa1>] sysenter_past_esp+0x56/0x79
 =======================
Code: 03 42 24 c3 8d b4 26 00 00 00 00 8b 10 8b 92 84 00 00 00 ff 52
30 0f b7 c0 c3 90 53 89 c3 8b 00 8b 90 84 00 00 00 89 d8 ff 52 34 <0f>
be 40 04 88 43 08 5b c3 8d b4 26 00 00 00 00 8b 08 8b 89 84
EIP: [<f9c9a970>] obtain_item_plugin+0x10/0x20 [reiser4] SS:ESP 0068:d54f0b14


Any other information i should provide?
