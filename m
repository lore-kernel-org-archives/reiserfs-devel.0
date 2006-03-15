From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: kernel BUG at /usr/src/sources/linux-2.6.16-rc5/fs/reiser4/plugin/file/tail_conversion.c:29
Date: Wed, 15 Mar 2006 11:11:49 +0300
Message-ID: <200603151111.49826.zam@namesys.com>
References: <20060315075034.GC17577@zeus.uziel.local>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_Fx8FEw2RP/IrXZM"
Return-path: <reiserfs-list-return-28261-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060315075034.GC17577@zeus.uziel.local>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Christian Trefzer <ctrefzer@gmx.de>

--Boundary-00=_Fx8FEw2RP/IrXZM
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

please try the attached patch.

On Wednesday 15 March 2006 10:50, Christian Trefzer wrote:
> Hi everyone,
>
> I got this half an hour ago, with some processes left in D state,
> namely ooffice.bin and two instances of procmail, as this happened on
> my /home LV:
>
> kernel BUG at
> /usr/src/sources/linux-2.6.16-rc5/fs/reiser4/plugin/file/tail_convers
>ion.c:29! invalid opcode: 0000 [#1]
> PREEMPT
> Modules linked in: mga drm w83781d hwmon_vid hwmon i2c_isa
> snd_seq_midi snd_pcm_oss snd_mixer_oss snd_seq_oss snd_seq_midi_event
> snd_seq snd_cmipci snd_opl3_lib snd_hwdep snd_mpu401_uart ohci_hcd
> floppy sr_mod cdrom pata_via i2c_viapro aic7xxx scsi_transport_spi
> ehci_hcd uhci_hcd 3c59x mii snd_ens1370 gameport snd_rawmidi
> snd_seq_device snd_pcm snd_timer snd_ak4531_codec snd soundcore
> snd_page_alloc via_agp agpgart usbcore xfs exportfs reiser4 ext2 loop
> lp parport_pc parport rtc psmouse reiserfs dm_mod raid5 raid1 xor
> md_mod pata_pdc2027x libata sd_mod scsi_mod unix CPU:    0
> EIP:    0060:[<f2daa02d>]    Not tainted VLI
> EFLAGS: 00010286   (2.6.16-rc5 #10)
> EIP is at get_exclusive_access+0x31/0x44 [reiser4]
> eax: b26d6c04   ebx: 00000000   ecx: ec54bbf4   edx: b736fdc0
> esi: 3dbf3000   edi: 00006c85   ebp: 00006c85   esp: ded36f0c
> ds: 007b   es: 007b   ss: 0068
> Process soffice.bin (pid: 12533, threadinfo=ded36000 task=b3b7b070)
> Stack: <0>f2da83da 00000000 c52ca544 e52935a8 00007000 b014c75f
> c52ca544 e7b3cc80 b0151cd1 b6b54354 b6b5434c 3dbf3000 ed113360
> e6a02160 b26d6bc0 ec54bc4c ec54bbf4 00000000 00006c85 00000001
> 00000000 ec54bc00 00000000 00006c85 Call Trace:
> [<f2da83da>] write_unix_file+0x1ba/0x60c [reiser4]
> [<f2da8220>] write_unix_file+0x0/0x60c [reiser4]
> [<b0101135>] syscall_call+0x7/0xb
> Code: ff 21 e0 8b 00 8b 80 b0 04 00 00 8b 40 40 8b 50 08 85 d2 75 16
> ba 01 00 ff ff 89 c8 0f c1 10 85 d2 75 12 c7 41 24 01 00 00 00 c3
> <0f> 0b 1d 00 04 8c dc f2 eb e0 51 e8 13 ac 35 bd 59 eb e5 55 89
>
>
> I had another occurrence of something looking similar at first
> glance, repeatedly grinding my laptop to halt when I was on a trip.
> The only way to make it go away was to wipe the device by dd'ing
> /dev/zero to it. Not even tar-backup and mkfs did the job - otherwise
> I could have left out the word "repeatedly"...
>
> The only thing I could imagine other than a serious problem wrt.
> reiser4 code is a "soft" bad block relocated by the drive upon write,
> but there was nothing like a read error in the logs. Furthermore I
> wanted the gurus to know since it occured to me more than once.
>
>
> Thanks for your time!
> Chris
>
>
>
> FYI, here comes something about the disk, including SMART error log:
>
>
> /dev/sda:
>
> ATA device, with non-removable media
> 	Model Number:       SAMSUNG SV1203N
> 	Serial Number:      S01CJ10Y410901
> 	Firmware Revision:  TQ100-30
> Standards:
> 	Supported: 7 6 5 4
> 	Likely used: 7
> Configuration:
> 	Logical		max	current
> 	cylinders	16383	16383
> 	heads		16	16
> 	sectors/track	63	63
> 	--
> 	CHS current addressable sectors:   16514064
> 	LBA    user addressable sectors:  234493056
> 	LBA48  user addressable sectors:  234493056
> 	device size with M = 1024*1024:      114498 MBytes
> 	device size with M = 1000*1000:      120060 MBytes (120 GB)
> Capabilities:
> 	LBA, IORDY(can be disabled)
> 	Queue depth: 1
> 	Standby timer values: spec'd by Standard, no device specific minimum
> 	R/W multiple sector transfer: Max = 16	Current = 16
> 	Recommended acoustic management value: 254, current value: 254
> 	DMA: mdma0 mdma1 mdma2 udma0 udma1 udma2 udma3 udma4 udma5 *udma6
> 	     Cycle time: min=120ns recommended=120ns
> 	PIO: pio0 pio1 pio2 pio3 pio4
> 	     Cycle time: no flow control=240ns  IORDY flow control=120ns
> Commands/features:
> 	Enabled	Supported:
> 	   *	READ BUFFER cmd
> 	   *	WRITE BUFFER cmd
> 	   *	Host Protected Area feature set
> 	   *	Look-ahead
> 	   *	Write cache
> 	   *	Power Management feature set
> 		Security Mode feature set
> 	   *	SMART feature set
> 	   *	FLUSH CACHE EXT command
> 	   *	Mandatory FLUSH CACHE command
> 	   *	Device Configuration Overlay feature set
> 	   *	48-bit Address feature set
> 	   *	Automatic Acoustic Management feature set
> 		SET MAX security extension
> 	   *	DOWNLOAD MICROCODE cmd
> 	   *	SMART self-test
> 	   *	SMART error logging
> Security:
> 	Master password revision code = 65534
> 		supported
> 	not	enabled
> 	not	locked
> 	not	frozen
> 	not	expired: security count
> 		supported: enhanced erase
> 	56min for SECURITY ERASE UNIT. 56min for ENHANCED SECURITY ERASE
> UNIT. HW reset results:
> 	CBLID- above Vih
> 	Device num = 0 determined by the jumper
> Checksum: correct
>
>
>
> smartctl version 5.33 [i386-pc-linux-gnu] Copyright (C) 2002-4 Bruce
> Allen Home page is http://smartmontools.sourceforge.net/
>
> === START OF READ SMART DATA SECTION ===
> SMART Error Log Version: 1
> ATA Error Count: 8 (device log contains only the most recent five
> errors) CR = Command Register [HEX]
> 	FR = Features Register [HEX]
> 	SC = Sector Count Register [HEX]
> 	SN = Sector Number Register [HEX]
> 	CL = Cylinder Low Register [HEX]
> 	CH = Cylinder High Register [HEX]
> 	DH = Device/Head Register [HEX]
> 	DC = Device Command Register [HEX]
> 	ER = Error register [HEX]
> 	ST = Status register [HEX]
> Powered_Up_Time is measured from power on, and printed as
> DDd+hh:mm:SS.sss where DD=days, hh=hours, mm=minutes,
> SS=sec, and sss=millisec. It "wraps" after 49.710 days.
>
> Error 8 occurred at disk power-on lifetime: 1595 hours (66 days + 11
> hours) When the command that caused the error occurred, the device
> was active or idle.
>
>   After command completion occurred, registers were:
>   ER ST SC SN CL CH DH
>   -- -- -- -- -- -- --
>   04 51 00 00 00 00 a0  Error: ABRT
>
>   Commands leading to the command that caused the error were:
>   CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
>   -- -- -- -- -- -- -- --  ----------------  --------------------
>   b1 c0 00 00 00 00 a0 00      16:23:07.813  DEVICE CONFIGURATION
> RESTORE b1 c2 00 00 00 00 a0 00      16:23:07.813  DEVICE
> CONFIGURATION IDENTIFY 9a 23 04 00 02 00 a0 00      16:23:07.813 
> [VENDOR SPECIFIC] 9a 23 04 00 02 00 a0 00      16:23:07.750  [VENDOR
> SPECIFIC] 9a 23 01 00 02 00 a0 00      16:23:07.750  [VENDOR
> SPECIFIC]
>
> Error 7 occurred at disk power-on lifetime: 1595 hours (66 days + 11
> hours) When the command that caused the error occurred, the device
> was active or idle.
>
>   After command completion occurred, registers were:
>   ER ST SC SN CL CH DH
>   -- -- -- -- -- -- --
>   02 51 3f 00 00 00 e0  Error: TK0NF
>
>   Commands leading to the command that caused the error were:
>   CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
>   -- -- -- -- -- -- -- --  ----------------  --------------------
>   10 00 3f 00 00 00 e0 00      16:10:46.563  RECALIBRATE [OBS-4]
>   91 00 3f 3f ff 3f e0 00      16:10:46.563  INITIALIZE DEVICE
> PARAMETERS [OBS-6] ef 03 45 01 00 00 a0 00      16:10:46.563  SET
> FEATURES [Set transfer mode] ef 03 0c 01 00 00 a0 00     
> 16:10:46.563  SET FEATURES [Set transfer mode] ec 00 00 01 00 00 a0
> 00      16:10:45.813  IDENTIFY DEVICE
>
> Error 6 occurred at disk power-on lifetime: 1595 hours (66 days + 11
> hours) When the command that caused the error occurred, the device
> was active or idle.
>
>   After command completion occurred, registers were:
>   ER ST SC SN CL CH DH
>   -- -- -- -- -- -- --
>   02 51 00 00 00 00 e0  Error: TK0NF
>
>   Commands leading to the command that caused the error were:
>   CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
>   -- -- -- -- -- -- -- --  ----------------  --------------------
>   10 00 00 00 00 00 e0 00      16:10:32.625  RECALIBRATE [OBS-4]
>   00 00 01 01 00 00 a0 00      16:10:32.625  NOP [Abort queued
> commands]
>
> Error 5 occurred at disk power-on lifetime: 1595 hours (66 days + 11
> hours) When the command that caused the error occurred, the device
> was active or idle.
>
>   After command completion occurred, registers were:
>   ER ST SC SN CL CH DH
>   -- -- -- -- -- -- --
>   02 51 00 00 00 00 e0  Error: TK0NF
>
>   Commands leading to the command that caused the error were:
>   CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
>   -- -- -- -- -- -- -- --  ----------------  --------------------
>   10 00 00 00 00 00 e0 00      16:10:32.063  RECALIBRATE [OBS-4]
>   00 da 01 01 00 00 a0 00      16:10:32.063  NOP [Reserved
> subcommand] b0 da 10 01 4f c2 a0 00      16:10:25.688  SMART RETURN
> STATUS b0 d8 10 01 4f c2 a0 00      16:10:25.625  SMART ENABLE
> OPERATIONS c6 03 10 01 00 00 a0 00      16:10:25.625  SET MULTIPLE
> MODE
>
> Error 4 occurred at disk power-on lifetime: 483 hours (20 days + 3
> hours) When the command that caused the error occurred, the device
> was active or idle.
>
>   After command completion occurred, registers were:
>   ER ST SC SN CL CH DH
>   -- -- -- -- -- -- --
>   04 51 00 00 4f c2 e0  Error: ABRT
>
>   Commands leading to the command that caused the error were:
>   CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
>   -- -- -- -- -- -- -- --  ----------------  --------------------
>   b0 da 00 00 4f c2 e0 00  21d+14:59:16.250  SMART RETURN STATUS
>   ec 00 00 ac 87 e4 e0 00  21d+14:59:16.188  IDENTIFY DEVICE
>   ef 82 00 00 00 00 e0 00  21d+14:47:39.438  SET FEATURES [Disable
> write cache] ef 02 00 00 00 00 e0 00  21d+14:44:35.625  SET FEATURES
> [Enable write cache] ef 42 fe 00 00 00 e0 00  21d+09:37:08.125  SET
> FEATURES [Enable AAM]

-- 
Alex.

--Boundary-00=_Fx8FEw2RP/IrXZM
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiser4-have-get_exclusive_access-restart-transaction.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="reiser4-have-get_exclusive_access-restart-transaction.diff"

From: Alexander Zarochentsev <zam@namesys.com>

Have get_exclusive_access() restart transaction before taking r/w semaphore.

There are several places in write_unix_file and extent_balance_dirty_pages
where transaction may be open before calling get_exclusive_access.  It triggers
the "deadlock detection" BUG_ON inside get_exclusive_access().

This patch fixes the bug by embedding txn_restart into the
get_exclusive_access() code and cleanes up other places where txn_restart() was
called right before get_eclusive_access(). 

Signed-off-by: zam@namesys.com

 fs/reiser4/plugin/file/file.c            |   13 -------------
 fs/reiser4/plugin/file/tail_conversion.c |    5 ++---
 2 files changed, 2 insertions(+), 16 deletions(-)

Index: linux-2.6.16-rc4-mm2/fs/reiser4/plugin/file/file.c
===================================================================
--- linux-2.6.16-rc4-mm2.orig/fs/reiser4/plugin/file/file.c
+++ linux-2.6.16-rc4-mm2/fs/reiser4/plugin/file/file.c
@@ -1451,9 +1451,6 @@ static int commit_file_atoms(struct inod
 	int result;
 	unix_file_info_t *uf_info;
 
-	/* close current transaction */
-	txn_restart_current();
-
 	uf_info = unix_file_inode_data(inode);
 
 	/*
@@ -2174,7 +2171,6 @@ append_and_or_overwrite(hint_t * hint, s
 				done_lh(&hint->lh);
 				if (!exclusive) {
 					drop_nonexclusive_access(uf_info);
-					txn_restart_current();
 					get_exclusive_access(uf_info);
 				}
 				result = tail2extent(uf_info);
@@ -2964,15 +2960,6 @@ int delete_object_unix_file(struct inode
 	unix_file_info_t *uf_info;
 	int result;
 
-	/*
-	 * transaction can be open already. For example:
-	 * writeback_inodes->sync_sb_inodes->reiser4_sync_inodes->
-	 * generic_sync_sb_inodes->iput->generic_drop_inode->
-	 * generic_delete_inode->reiser4_delete_inode->delete_object_unix_file.
-	 * So, restart transaction to avoid deadlock with file rw semaphore.
-	 */
-	txn_restart_current();
-
 	if (inode_get_flag(inode, REISER4_NO_SD))
 		return 0;
 
Index: linux-2.6.16-rc4-mm2/fs/reiser4/plugin/file/tail_conversion.c
===================================================================
--- linux-2.6.16-rc4-mm2.orig/fs/reiser4/plugin/file/tail_conversion.c
+++ linux-2.6.16-rc4-mm2/fs/reiser4/plugin/file/tail_conversion.c
@@ -20,13 +20,12 @@ void get_exclusive_access(unix_file_info
 	assert("nikita-3047", LOCK_CNT_NIL(inode_sem_w));
 	assert("nikita-3048", LOCK_CNT_NIL(inode_sem_r));
 	/*
-	 * "deadlock detection": sometimes we commit a transaction under
+	 * "deadlock avoidance": sometimes we commit a transaction under
 	 * rw-semaphore on a file. Such commit can deadlock with another
 	 * thread that captured some block (hence preventing atom from being
 	 * committed) and waits on rw-semaphore.
 	 */
-	assert("nikita-3361", get_current_context()->trans->atom == NULL);
-	BUG_ON(get_current_context()->trans->atom != NULL);
+	txn_restart_current();
 	LOCK_CNT_INC(inode_sem_w);
 	down_write(&uf_info->latch);
 	uf_info->exclusive_use = 1;

--Boundary-00=_Fx8FEw2RP/IrXZM--
