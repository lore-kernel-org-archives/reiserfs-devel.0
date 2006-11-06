From: "Danny Milosavljevic" <danny_milo@yahoo.com>
Subject: reiser4 cryptcompress test setup: bug
Date: Mon, 6 Nov 2006 19:27:57 +0000 (UTC)
Message-ID: <eio2bt$hdj$1@sea.gmane.org>
Reply-To: danny.milo@scratchpost.org
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30108-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi Edward,

I finally tried your cryptcompress setup (2.6.18-mm3) and just did the
first evil thing I could think of:

the reiser4 partition with ccreg40 enabled is /dev/sda1 (/mnt/tmp/)
(mkfs'ed, thus empty).

dannym@pyramid: /mnt/tmp/dannym/> du -m ~/doc/literatur
2609    /home/dannym/doc/literatur/

dannym@pyramid: /mnt/tmp/dannym/> cp -R ~/doc/literatur .
(hangs indefinitely)

(note that 2609 MB is way too much to fit on the 250 MB memory stick, but
that was the point, right :))

dannym@pyramid: /mnt/tmp/dannym/> df /dev/sda1
/dev/sda1               242948    242824       124 100% /mnt/tmp

'ps aux |grep cp' hangs.

dmesg says:
[   84.597446] reiser4: sda1: found disk format 4.0.0.
[   88.544450] Bluetooth: Core ver 2.10
[   88.544529] NET: Registered protocol family 31
[   88.544531] Bluetooth: HCI device and connection manager initialized
[   88.544535] Bluetooth: HCI socket layer initialized
[   88.581518] Bluetooth: L2CAP ver 2.8
[   88.581523] Bluetooth: L2CAP socket layer initialized
[   88.648403] Bluetooth: RFCOMM socket layer initialized
[   88.648422] Bluetooth: RFCOMM TTY layer initialized
[   88.648424] Bluetooth: RFCOMM ver 1.8
[  372.564228] BUG: unable to handle kernel paging request at virtual address 4b1b5d0b
[  372.564235]  printing eip:
[  372.564237] c01c498b
[  372.564238] *pde = 00000000
[  372.564242] Oops: 0000 [#1]
[  372.564243] PREEMPT 
[  372.564246] last sysfs file: /block/sda/removable
[  372.564248] Modules linked in: rfcomm l2cap bluetooth binfmt_misc reiserfs hfs nls_utf8 hfsplus nls_cp437 ntfs vfat fat isofs udf capability commoncap cpufreq_userspace cpufreq_stats cpufreq_powersave cpufreq_ondemand freq_table cpufreq_conservative video thermal sony_acpi backlight processor fan container button battery asus_acpi ac reiser4 zlib_deflate ext2 configfs dm_mod md_mod fusion fuse lp snd_seq_dummy snd_seq_oss snd_seq_midi snd_seq_midi_event snd_seq tuner i2c_viapro sg sd_mod ipv6 af_packet tsdev usbhid generic snd_via82xx snd_ac97_codec snd_ac97_bus snd_pcm_oss snd_mixer_oss snd_pcm snd_timer snd_page_alloc snd_mpu401 snd_mpu401_uart usb_storage snd_rawmidi snd_seq_device bttv via_ircc video_buf ir_common snd ide_cd ehci_hcd irda analog compat_ioctl32 btcx_risc tveeprom parport_pc parport crc_ccitt aic7xxx rtc soundcore serio_raw cdrom floppy evdev psmouse pcspkr gameport
  videodev v4l1_compat v4l2_common via_agp agpgart scsi_transport_spi scsi_mod via_rhine uhci_hcd mii usbcore
[  372.564307] CPU:    0
[  372.564307] EIP:    0060:[<c01c498b>]    Not tainted VLI
[  372.564309] EFLAGS: 00010282   (2.6.18-mm3 #4)
[  372.564316] EIP is at journal_start+0x3b/0x100
[  372.564319] eax: 4b1b5d0b   ebx: f5fa0d20   ecx: f7dee400   edx: 00000002
[  372.564322] esi: f7c23960   edi: f5ab1990   ebp: 00000002   esp: f514dec0
[  372.564324] ds: 007b   es: 007b   ss: 0068
[  372.564327] Process cp (pid: 4186, ti=f514c000 task=f57cc550 task.ti=f514c000)
[  372.564329] Stack: 00000001 ffffffd8 c0170e86 f514df34 f514df34 f5fa0d20 f5ab1990 f5fa0d20 
[  372.564335]        f5ab1990 00000001 c01b6400 c016b4b9 f514df68 f5ab1990 f562b620 00030000 
[  372.564340]        c0186914 c011fb66 3b9aca00 f7dee400 f5ab1990 f562b620 00030000 f7dee400 
[  372.564346] Call Trace:
[  372.564350]  [<c0170e86>] may_open+0x66/0x260
[  372.564358]  [<c01b6400>] ext3_dirty_inode+0x30/0x90
[  372.564364]  [<c016b4b9>] cp_new_stat64+0xf9/0x110
[  372.564371]  [<c0186914>] __mark_inode_dirty+0x34/0x1c0
[  372.564377]  [<c011fb66>] current_fs_time+0x46/0x50
[  372.564386]  [<c017d4ad>] touch_atime+0x5d/0xb0
[  372.564394]  [<c014681b>] generic_file_mmap+0x3b/0x40
[  372.564399]  [<c01594b9>] do_mmap_pgoff+0x429/0x770
[  372.564414]  [<c01077ce>] sys_mmap2+0xbe/0xe0
[  372.564424]  [<c0103065>] sysenter_past_esp+0x56/0x79
[  372.564435]  =======================
[  372.564436] Code: 85 f6 89 5c 24 18 bb e2 ff ff ff 89 6c 24 24 89 d5 89 7c 24 20 8b 00 8b 80 bc 04 00 00 89 44 24 14 74 3e 85 c0 74 50 89 c3 8b 00 <3b> 30 74 2e c7 44 24 10 3c 9b 34 c0 c7 44 24 0c 0f 01 00 00 c7 
[  372.564456] EIP: [<c01c498b>] journal_start+0x3b/0x100 SS:ESP 0068:f514dec0
[  372.564461]  

I'll leave the /dev/sda1 untouched in case we need it
(well, I'll unmount it since I can't sleep with the fan noise :))

Tell me if you need anything...

cheers,
  Danny

