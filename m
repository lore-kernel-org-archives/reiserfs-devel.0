From: Samuel Liddicott <sam@liddicott.com>
Subject: reiserfs oops
Date: Tue, 22 Feb 2005 12:22:44 +0000
Message-ID: <421B2414.2080500@liddicott.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I'm not looking for you to rescue me or anything, just doing my bit to 
help keep reiserfs solid by reporting bugs.

I've been using qtparted to resize some reiserfs and ntfs partitions 
while making the final migration to linux. I've since abandoned this 
approach and borrow a large disk instead.
However, you may be interested to know that my file systems are left in 
a state where copying from one untainted file system to another grown 
(only) file system causes rsync and mv to segfault.

uname -ar reports: Linux ting 2.6.9-1-686-smp #1 SMP Sun Oct 31 02:18:55 
EST 2004 i686 GNU/Linux

I built the kernel myself from debian-unstable source packages.

Here is something from /var/log/messages:


Feb 22 10:18:37 ting kernel: ReiserFS: hdb2: found reiserfs format "3.6" 
with standard journal
Feb 22 10:18:41 ting kernel: ReiserFS: hdb2: using ordered data mode
Feb 22 10:18:41 ting kernel: ReiserFS: hdb2: journal params: device 
hdb2, size 8192, journal first block 18, max trans len 1024, max batch 
900, max commit age 30, max trans age 30
Feb 22 10:18:41 ting kernel: ReiserFS: hdb2: checking transaction log (hdb2)
Feb 22 10:18:41 ting kernel: ReiserFS: hdb2: Using r5 hash to sort names
Feb 22 10:18:43 ting kernel: ReiserFS: hdb4: found reiserfs format "3.6" 
with standard journal
Feb 22 10:18:44 ting kernel: ReiserFS: hdb4: using ordered data mode
Feb 22 10:18:44 ting kernel: ReiserFS: hdb4: journal params: device 
hdb4, size 8192, journal first block 18, max trans len 1024, max batch 
900, max commit age 30, max trans age 30
Feb 22 10:18:44 ting kernel: ReiserFS: hdb4: checking transaction log (hdb4)
Feb 22 10:18:44 ting kernel: ReiserFS: hdb4: Using r5 hash to sort names
Feb 22 10:19:20 ting kernel: ------------[ cut here ]------------
Feb 22 10:19:20 ting kernel: PREEMPT SMP
Feb 22 10:19:20 ting kernel: Modules linked in: ipv6 parport_pc lp 
parport binfmt_misc autofs4 thermal fan button processor ac battery 
hfsplus hfs sn9c102 videodev joydev ir_usb usbserial irda_usb irda 
crc_ccitt ipt_limit ipt_state ipt_LOG ipt_REJECT ip_conntrack_irc 
ip_conntrack_ftp ip_conntrack iptable_filter ip_tables tsdev usbhid 
ehci_hcd usblp eth1394 uhci_hcd via_rhine mii crc32 sbp2 scsi_mod 
ohci1394 ieee1394 nls_iso8859_1 nls_cp437 capability commoncap ide_cd 
cdrom snd_intel8x0 snd_ac97_codec snd_pcm_oss snd_mixer_oss snd_pcm 
snd_timer snd_page_alloc gameport snd_mpu401_uart snd_rawmidi 
snd_seq_device snd soundcore evdev mousedev usbmouse usbcore minix ntfs 
isofs vfat msdos fat ext2 ext3 jbd mbcache reiserfs ide_generic ide_disk 
piix ide_core unix fbcon font vesafb cfbcopyarea cfbimgblt cfbfillrect
Feb 22 10:19:20 ting kernel: CPU:    0
Feb 22 10:19:20 ting kernel: EIP:    0060:[pg0+545804692/1069900800]    
Not tainted VLI
Feb 22 10:19:20 ting kernel: EFLAGS: 00010282   (2.6.9-1-686-smp)
Feb 22 10:19:20 ting kernel: EIP is at reiserfs_in_journal+0x134/0x1a0 
[reiserfs]
Feb 22 10:19:20 ting kernel: eax: 00000000   ebx: e106811c   ecx: 
00001710   edx: e10f73a8
Feb 22 10:19:20 ting kernel: esi: 00c60000   edi: 00000000   ebp: 
da0e2400   esp: cbd11bd8
Feb 22 10:19:20 ting kernel: ds: 007b   es: 007b   ss: 0068
Feb 22 10:19:20 ting kernel: Process mv (pid: 7654, threadinfo=cbd10000 
task=ca660810)
Feb 22 10:19:20 ting kernel: Stack: cbd11c60 da0e2400 00000001 d258cd80 
00000000 e0f6ac60 cbd11c60 da0e2400
Feb 22 10:19:20 ting kernel:        e0c0823c da0e2400 0000018c 00000000 
00000001 cbd11c18 00000000 00000000
Feb 22 10:19:20 ting kernel:        00000000 0000018c cbd11c60 00001000 
da0e2400 e0c0848a cbd11ebc 0000018c
Feb 22 10:19:20 ting kernel: Call Trace:
Feb 22 10:19:20 ting kernel:  [pg0+545653308/1069900800] 
scan_bitmap_block+0x23c/0x280 [reiserfs]
Feb 22 10:19:20 ting kernel:  [pg0+545653898/1069900800] 
scan_bitmap+0x12a/0x230 [reiserfs]
Feb 22 10:19:20 ting kernel:  [pg0+545658886/1069900800] 
reiserfs_allocate_blocknrs+0x256/0x5a0 [reiserfs]
Feb 22 10:19:20 ting kernel:  [pg0+545712290/1069900800] 
reiserfs_allocate_blocks_for_region+0x262/0x1620 [reiserfs]
Feb 22 10:19:20 ting kernel:  [pg0+545784067/1069900800] 
search_for_position_by_key+0x1d3/0x400 [reiserfs]
Feb 22 10:19:20 ting kernel:  [pg0+545687562/1069900800] 
make_cpu_key+0x5a/0x70 [reiserfs]
Feb 22 10:19:20 ting kernel:  [pg0+545778051/1069900800] 
pathrelse+0x23/0x40 [reiserfs]
Feb 22 10:19:20 ting kernel:  [pg0+545720572/1069900800] 
reiserfs_prepare_file_region_for_write+0x3bc/0x9d0 [reiserfs]
Feb 22 10:19:20 ting kernel:  [pg0+545723518/1069900800] 
reiserfs_file_write+0x56e/0x7d0 [reiserfs]
Feb 22 10:19:20 ting kernel:  [__generic_file_aio_read+530/592] 
__generic_file_aio_read+0x212/0x250
Feb 22 10:19:20 ting kernel:  [vfs_write+237/352] vfs_write+0xed/0x160
Feb 22 10:19:20 ting kernel:  [sys_write+81/128] sys_write+0x51/0x80
Feb 22 10:19:20 ting kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Feb 22 10:19:20 ting kernel: Code: e1 ff 1f 00 00 8b 04 8b 85 c0 74 17 
8d 74 26 00 8d bc 27 00 00 00 00 39 70 08 74 1e 8b 40 20 85 c0 75 f4 31 
d2 31 c0 85 d2 74 a7 <0f> 0b 0c 02 e7 b2 c3 e0 b8 01 00 00 00 eb 98 39 
68 04 75 dd 89


And previous to that:
Feb 22 09:29:43 ting kernel: ReiserFS: hdb2: found reiserfs format "3.6" 
with standard journal
Feb 22 09:29:47 ting kernel: ReiserFS: hdb2: using ordered data mode
Feb 22 09:29:47 ting kernel: ReiserFS: hdb2: journal params: device 
hdb2, size 8192, journal first block 18, max trans len 1024, max batch 
900, max commit age 30, max trans age 30
Feb 22 09:29:47 ting kernel: ReiserFS: hdb2: checking transaction log (hdb2)
Feb 22 09:29:47 ting kernel: ReiserFS: hdb2: Using r5 hash to sort names
Feb 22 09:29:49 ting kernel: ReiserFS: hdb4: found reiserfs format "3.6" 
with standard journal
Feb 22 09:29:50 ting kernel: ReiserFS: hdb4: using ordered data mode
Feb 22 09:29:50 ting kernel: ReiserFS: hdb4: journal params: device 
hdb4, size 8192, journal first block 18, max trans len 1024, max batch 
900, max commit age 30, max trans age 30
Feb 22 09:29:50 ting kernel: ReiserFS: hdb4: checking transaction log (hdb4)
Feb 22 09:29:50 ting kernel: ReiserFS: hdb4: Using r5 hash to sort names
Feb 22 09:30:17 ting kernel: ------------[ cut here ]------------
Feb 22 09:30:17 ting kernel: PREEMPT SMP
Feb 22 09:30:17 ting kernel: Modules linked in: ipv6 parport_pc lp 
parport binfmt_misc autofs4 thermal fan button processor ac battery 
sn9c102 videodev hfsplus hfs ir_usb usbserial irda_usb irda crc_ccitt 
ipt_limit ipt_state ipt_LOG ipt_REJECT ip_conntrack_irc ip_conntrack_ftp 
ip_conntrack iptable_filter ip_tables joydev tsdev usbhid ehci_hcd usblp 
eth1394 uhci_hcd via_rhine mii crc32 sbp2 scsi_mod ohci1394 ieee1394 
nls_iso8859_1 nls_cp437 capability commoncap ide_cd cdrom snd_intel8x0 
snd_ac97_codec snd_pcm_oss snd_mixer_oss snd_pcm snd_timer 
snd_page_alloc gameport snd_mpu401_uart snd_rawmidi snd_seq_device snd 
soundcore evdev mousedev usbmouse usbcore minix ntfs isofs vfat msdos 
fat ext2 ext3 jbd mbcache reiserfs ide_generic ide_disk piix ide_core 
unix fbcon font vesafb cfbcopyarea cfbimgblt cfbfillrect
Feb 22 09:30:17 ting kernel: CPU:    0
Feb 22 09:30:17 ting kernel: EIP:    0060:[pg0+545804692/1069900800]    
Not tainted VLI
Feb 22 09:30:17 ting kernel: EFLAGS: 00010286   (2.6.9-1-686-smp)
Feb 22 09:30:17 ting kernel: EIP is at reiserfs_in_journal+0x134/0x1a0 
[reiserfs]
Feb 22 09:30:17 ting kernel: eax: 00000000   ebx: e106a11c   ecx: 
00001890   edx: e10f93f0
Feb 22 09:30:17 ting kernel: esi: 00c60000   edi: 00000000   ebp: 
df57d400   esp: dd7bfbd8
Feb 22 09:30:17 ting kernel: ds: 007b   es: 007b   ss: 0068
Feb 22 09:30:17 ting kernel: Process rsync (pid: 7482, 
threadinfo=dd7be000 task=d9af4b70)
Feb 22 09:30:17 ting kernel: Stack: dd7bfc60 df57d400 00004cc4 dbe4a180 
00000000 e0fd8c60 dd7bfc60 df57d400
Feb 22 09:30:17 ting kernel:        e0c0823c df57d400 0000018c 00000000 
00000001 dd7bfc18 00000000 00000000
Feb 22 09:30:17 ting kernel:        00000000 0000018c dd7bfc60 00001000 
df57d400 e0c0848a dd7bfebc 0000018c
Feb 22 09:30:17 ting kernel: Call Trace:
Feb 22 09:30:17 ting kernel:  [pg0+545653308/1069900800] 
scan_bitmap_block+0x23c/0x280 [reiserfs]
Feb 22 09:30:17 ting kernel:  [pg0+545653898/1069900800] 
scan_bitmap+0x12a/0x230 [reiserfs]
Feb 22 09:30:17 ting kernel:  [pg0+545658886/1069900800] 
reiserfs_allocate_blocknrs+0x256/0x5a0 [reiserfs]
Feb 22 09:30:17 ting kernel:  [pg0+545712290/1069900800] 
reiserfs_allocate_blocks_for_region+0x262/0x1620 [reiserfs]
Feb 22 09:30:17 ting kernel:  [pg0+545784067/1069900800] 
search_for_position_by_key+0x1d3/0x400 [reiserfs]
Feb 22 09:30:17 ting kernel:  [pg0+545687562/1069900800] 
make_cpu_key+0x5a/0x70 [reiserfs]
Feb 22 09:30:17 ting kernel:  [pg0+545778051/1069900800] 
pathrelse+0x23/0x40 [reiserfs]
Feb 22 09:30:17 ting kernel:  [pg0+545720572/1069900800] 
reiserfs_prepare_file_region_for_write+0x3bc/0x9d0 [reiserfs]
Feb 22 09:30:17 ting kernel:  [pg0+545723518/1069900800] 
reiserfs_file_write+0x56e/0x7d0 [reiserfs]
Feb 22 09:30:17 ting kernel:  [schedule_timeout+118/192] 
schedule_timeout+0x76/0xc0
Feb 22 09:30:17 ting kernel:  [vfs_write+237/352] vfs_write+0xed/0x160
Feb 22 09:30:17 ting kernel:  [sys_write+81/128] sys_write+0x51/0x80
Feb 22 09:30:17 ting kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Feb 22 09:30:17 ting kernel: Code: e1 ff 1f 00 00 8b 04 8b 85 c0 74 17 
8d 74 26 00 8d bc 27 00 00 00 00 39 70 08 74 1e 8b 40 20 85 c0 75 f4 31 
d2 31 c0 85 d2 74 a7 <0f> 0b 0c 02 e7 b2 c3 e0 b8 01 00 00 00 eb 98 39 
68 04 75 dd 89



The file systems will be intact for another 10 hours or so if you 
contact me soon I will preserve them for longer if you want to examine them.

Sam
