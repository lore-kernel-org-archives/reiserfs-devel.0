From: Lars Segelken <lars.segelken@web.de>
Subject: reiserfs partition unmountable
Date: Sat, 02 Apr 2005 16:46:47 +0200
Message-ID: <1112453207.7750.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: lars.segelken@web.de
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,
i have a reiserfs partition which can't be mounted under Suse 9.2 and
Unbuntu 5.04 (Linux 2.6.8 and 2.6.10, i think) after there was a system
crash.
Same partition can still be mounted with Knoppix 3.2.

output of reiserfsck:
============================================
reiserfsck 3.6.19 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on /dev/hdb3
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
###########
reiserfsck --check started at Sat Apr  2 11:34:49 2005
###########
Replaying journal..
Reiserfs journal '/dev/hdb3' in blocks [18..8211]: 0 transactions
replayed
Checking internal tree..finished
Comparing bitmaps..finished
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem:
        Leaves 34491
        Internal nodes 228
        Directories 7394
        Other files 71957
        Data block pointers 18565865 (2894361 of them are zero)
        Safe links 0
###########
reiserfsck finished at Sat Apr  2 11:36:50 2005
###########
=================================================
To me this seems to be OK.

This is a part of the syslog after i have tried to mount the partition:
=================================================
Apr  2 11:42:30 localhost kernel: ReiserFS: hdb3: found reiserfs format
"3.6" with standard journal
Apr  2 11:42:36 localhost kernel: ReiserFS: hdb3: using ordered data
mode
Apr  2 11:42:36 localhost kernel: ReiserFS: hdb3: journal params: device
hdb3, size 8192, journal first block 18, max trans len 1024, max batch
900, max commit age 30, max trans age 30
Apr  2 11:42:36 localhost kernel: ReiserFS: hdb3: checking transaction
log (hdb3)
Apr  2 11:42:36 localhost kernel: ReiserFS: hdb3: Using r5 hash to sort
names
Apr  2 11:42:36 localhost kernel: ------------[ cut here ]------------
Apr  2 11:42:36 localhost kernel: kernel BUG at
fs/reiserfs/journal.c:2872!
Apr  2 11:42:36 localhost kernel: invalid operand: 0000 [#1]
Apr  2 11:42:36 localhost kernel: PREEMPT 
Apr  2 11:42:36 localhost kernel: Modules linked in: reiserfs proc_intf
freq_table cpufreq_userspace cpufreq_ondemand cpufreq_powersave radeon
drm video sony_acpi pcc_acpi button battery container ac ipv6 af_packet
sis900 ehci_hcd ohci_hcd usbcore snd_intel8x0 snd_ac97_codec snd_pcm_oss
snd_mixer_oss snd_pcm snd_timer snd soundcore snd_page_alloc i2c_sis96x
i2c_core shpchp pci_hotplug sis_agp agpgart analog gameport floppy
pcspkr rtc md evdev tsdev dm_mod capability commoncap psmouse mousedev
parport_pc lp parport ide_cd cdrom ext3 jbd ide_generic sis5513 ide_disk
ide_core unix thermal processor fan fbcon font bitblit vesafb
cfbcopyarea cfbimgblt cfbfillrect
Apr  2 11:42:36 localhost kernel: CPU:    0
Apr  2 11:42:36 localhost kernel: EIP:    0060:[pg0
+814563588/1070015488]    Not tainted VLI
Apr  2 11:42:36 localhost kernel: EFLAGS: 00010246   (2.6.10-4-386) 
Apr  2 11:42:36 localhost kernel: EIP is at journal_mark_dirty
+0x2a/0x208 [reiserfs]
Apr  2 11:42:36 localhost kernel: eax: 00000000   ebx: d005c800   ecx:
cda81694   edx: dcd8be30
Apr  2 11:42:36 localhost kernel: esi: d005c800   edi: f0c01000   ebp:
cda81694   esp: dcd8bdd4
Apr  2 11:42:36 localhost kernel: ds: 007b   es: 007b   ss: 0068
Apr  2 11:42:36 localhost kernel: Process mount (pid: 7826,
threadinfo=dcd8a000 task=e32185e0)
Apr  2 11:42:36 localhost kernel: Stack: ec0f2080 00000000 dcd8be30
d005c800 d51e0d8c d005c800 f0c52bab dcd8be30 
Apr  2 11:42:36 localhost kernel:        d005c800 cda81694 ec0f2080
00000000 e4a47000 00000000 00000002 00000001 
Apr  2 11:42:36 localhost kernel:        00000000 00000000 00000000
dcd8be88 eff73c10 eff73c00 c019da90 d005c800 
Apr  2 11:42:36 localhost kernel: Call Trace:
Apr  2 11:42:36 localhost kernel:  [pg0+814508971/1070015488]
reiserfs_fill_super+0x4f3/0x63f [reiserfs]
Apr  2 11:42:36 localhost kernel:  [snprintf+22/26] snprintf+0x16/0x1a
Apr  2 11:42:36 localhost kernel:  [get_sb_bdev+196/261] get_sb_bdev
+0xc4/0x105
Apr  2 11:42:36 localhost kernel:  [pg0+814509407/1070015488]
get_super_block+0x1a/0x1f [reiserfs]
Apr  2 11:42:36 localhost kernel:  [pg0+814507704/1070015488]
reiserfs_fill_super+0x0/0x63f [reiserfs]
Apr  2 11:42:36 localhost kernel:  [do_kern_mount+133/288] do_kern_mount
+0x85/0x120
Apr  2 11:42:36 localhost kernel:  [do_new_mount+103/164] do_new_mount
+0x67/0xa4
Apr  2 11:42:36 localhost kernel:  [do_mount+339/365] do_mount
+0x153/0x16d
Apr  2 11:42:36 localhost kernel:  [__alloc_pages+691/703] __alloc_pages
+0x2b3/0x2bf
Apr  2 11:42:36 localhost kernel:  [copy_mount_options+76/153]
copy_mount_options+0x4c/0x99
Apr  2 11:42:36 localhost kernel:  [sys_mount+120/185] sys_mount
+0x78/0xb9
Apr  2 11:42:36 localhost kernel:  [sysenter_past_esp+82/117]
sysenter_past_esp+0x52/0x75
Apr  2 11:42:36 localhost kernel: Code: c3 55 57 56 53 50 50 8b 5c 24 20
8b 54 24 1c 8b 6c 24 24 8b 83 50 01 00 00 8b 78 0c c7 44 24 04 00 00 00
00 8b 42 10 85 c0 75 08 <0f> 0b 38 0b 7b 68 c6 f0 8b 57 1c 39 d0 74 12
52 50 68 60 b4 c6 
===================================================================

Why isn't reiserfsck reporting anything?
What can be done to make the partition mountable again?

greetings Lars

