From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: R4 problem started with 2.6.39 and still there with 3.6.6
Date: Sun, 9 Dec 2012 18:54:44 +0100
Message-ID: <CADW=+3kz__Rd_29Sx8mdiA0b_S11pEsXLYG5AGzjAVBC4Hck8w@mail.gmail.com>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com>
	<CADW=+3nitbqPWJCaJyjax+tno9esS3wKfj7kFcyhfdsY6MwiFQ@mail.gmail.com>
	<CADW=+3n6tx0q5qD_WN6c9TLJLFiB1Sa=jvgM3j_6XiUST5aMnQ@mail.gmail.com>
	<39867443.uySorikH8H@intelfx-laptop>
	<CADW=+3m2s9Yyi7Da1nieTXjFx=KcfLch+mwoRTB50vGj+mZA=w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=8IBglmic4v/eCJEUqmd26uyc/jTxhwbYooT7/TwpHGM=;
        b=Rwk/ktBBxSj3mkMqxrpgbsUfeffgF5sraxDyiSqc4fWWReM05RlGAGJlt0Ncya0TW9
         cpGcJG2qMG+kgerTJma83GBa/8D+PfCa+yMlLSnmZJev5t0N6pQdyFj/M2XvQCgeZop4
         +g2y2NVau32RY4m6CWxLGkwRifa9gF5Pmh8BSi5FBaqA9vUycN2TSD1HOpNLDN3YFs7w
         jSrH5W79+KlKy9yZ8TUKQXQAVwmV1W9PDZR7dyeEe/Yi3poCbvVzhPEHq1yVInna1vig
         voc0GYQB4WpiWPvmdhtoKXP7N6fkFo2GkmmeElIbky4q5oADmjus3ruZ5KG+Ca6uV1rJ
         7G0g==
In-Reply-To: <CADW=+3m2s9Yyi7Da1nieTXjFx=KcfLch+mwoRTB50vGj+mZA=w@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Sun, Dec 9, 2012 at 6:12 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmai=
l.com> wrote:
> On Sun, Dec 9, 2012 at 4:38 PM, Ivan Shapovalov <intelfx100@gmail.com=
> wrote:
>> On 09 December 2012 17:29:58 Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>> On Sun, Dec 9, 2012 at 5:19 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@=
gmail.com> wrote:
>>> > On Sun, Dec 9, 2012 at 4:17 PM, Ivan Shapovalov <intelfx100@gmail=
=2Ecom>
>> wrote:
>>> >> On 07 December 2012 19:34:45 Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>> >>> Ok, on just fscked partition I now get:
>>> >>>
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584096] reiser4[sshd(50=
58)]:
>>> >>> find_cluster_item
>>> >>> (fs/reiser4/plugin/file/cryptcompress.c:781)[edward-1608]:
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584096] WARNING: Expect=
ed item
>>> >>> not found. Fsck?
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584104] reiser4[sshd(50=
58)]:
>>> >>> dc_check_checksum
>>> >>> (fs/reiser4/plugin/file/cryptcompress.c:1023)[edward-156]:
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584104] WARNING: Bad di=
sk
>>> >>> cluster checksum 1869768224, (should be 950540942) Fsck?
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584104]
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584109] reiser4[sshd(50=
58)]:
>>> >>> reiser4_inflate_cluster
>>> >>> (fs/reiser4/plugin/file/cryptcompress.c:1190)[edward-1460]:
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.584109] WARNING: Inode
>>> >>> 14592305: disk cluster 0 looks corrupted
>>> >>> Dec  7 19:31:43 krshina3 sshd[5056]: Accepted keyboard-interact=
ive/pam
>>> >>> for root from 192.168.1.10 port 7531 ssh2
>>> >>> Dec  7 19:31:43 krshina3 sshd[5056]: pam_unix(sshd:session): se=
ssion
>>> >>> opened for user root by (uid=3D0)
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637085] reiser4[bash(50=
66)]:
>>> >>> find_cluster_item
>>> >>> (fs/reiser4/plugin/file/cryptcompress.c:781)[edward-1608]:
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637085] WARNING: Expect=
ed item
>>> >>> not found. Fsck?
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637094] reiser4[bash(50=
66)]:
>>> >>> dc_check_checksum
>>> >>> (fs/reiser4/plugin/file/cryptcompress.c:1023)[edward-156]:
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637094] WARNING: Bad di=
sk
>>> >>> cluster checksum -1945338855, (should be 944271739) Fsck?
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637094]
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637098] reiser4[bash(50=
66)]:
>>> >>> reiser4_inflate_cluster
>>> >>> (fs/reiser4/plugin/file/cryptcompress.c:1190)[edward-1460]:
>>> >>> Dec  7 19:31:43 krshina3 kernel: [ 2069.637098] WARNING: Inode
>>> >>> 15185444: disk cluster 0 looks corrupted
>>> >>> tail: unrecognized file system type 0x52345362 for
>>> >>> '/var/log/messages'. please report this to bug-coreutils@gnu.or=
g.
>>> >>> reverting to polling
>>> >>>
>>> >>> This is getting bad, I'm going back to 2.6.39 :D
>>> >>
>>> >> This is exactly what I have here on 3.<anything>.<anything> with=
 a plain
>>> >> KDE desktop and "a bit of everything" workload. It seems not to =
be
>>> >> related to QEMU or loopbacks or something - just intensive rando=
m I/O is
>>> >> what triggers this, no specific patterns I've got so far.
>>> >> Please tell if it stops happening on 2.6.39 (but remember that i=
t may be
>>> >> silent for a while) so I can bisect with precision :)
>>> >
>>> > It happens with 2.6.39 now too, but with 2.6.39 computer hangs wh=
ile
>>> > with 3.6.6 it still works after 24hrs
>>>
>>> Sorry I messed up, now with 2.6.39 I get same errors on I/O, but fi=
les
>>> look OK. I only got files in lost+found when system oopsed.
>>> Funny thing is I never had these errors until now and i used 2.6.39
>>> from Nov 2011.
>>
>> So what did change from Nov 2011? Have you had the QEMU image on a r=
4
>> partition back to then?
> Yeah same usage scenario, Gentoo machine with months of uptime with
> lots of recompiling and QEMU-KVM virtual machine with WinXP
> Did a small change in kernel config in July 2012, same kernel 2.6.39.=
4
>
>> And... try to revert to piix, maybe.
>>

Ok I reverted back to old kernel that worked, 2.6.39 from july, and am
currently compiling GCC and using QEMU and everything works fine so
far.
I looked at the configs and looks like I did some more messing than
switching from piix to ahci, look for yourself if anything jumps as
buggy:

 diff -uprN config.old config.new
--- config.old	2012-12-09 18:41:04.372679078 +0100
+++ config.new	2012-12-09 18:41:57.359007631 +0100
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux/x86_64 2.6.39.4 Kernel Configuration
-# Sat Jun 23 20:57:39 2012
+# Tue Dec  4 16:56:13 2012
 #
 CONFIG_64BIT=3Dy
 # CONFIG_X86_32 is not set
@@ -284,9 +284,9 @@ CONFIG_SWIOTLB=3Dy
 CONFIG_IOMMU_HELPER=3Dy
 # CONFIG_IOMMU_API is not set
 # CONFIG_MAXSMP is not set
-CONFIG_NR_CPUS=3D2
-# CONFIG_SCHED_SMT is not set
-# CONFIG_SCHED_MC is not set
+CONFIG_NR_CPUS=3D4
+CONFIG_SCHED_SMT=3Dy
+CONFIG_SCHED_MC=3Dy
 # CONFIG_IRQ_TIME_ACCOUNTING is not set
 # CONFIG_PREEMPT_NONE is not set
 CONFIG_PREEMPT_VOLUNTARY=3Dy
@@ -324,7 +324,8 @@ CONFIG_HAVE_MEMBLOCK=3Dy
 # CONFIG_MEMORY_HOTPLUG is not set
 CONFIG_PAGEFLAGS_EXTENDED=3Dy
 CONFIG_SPLIT_PTLOCK_CPUS=3D4
-# CONFIG_COMPACTION is not set
+CONFIG_COMPACTION=3Dy
+CONFIG_MIGRATION=3Dy
 CONFIG_PHYS_ADDR_T_64BIT=3Dy
 CONFIG_ZONE_DMA_FLAG=3D1
 CONFIG_BOUNCE=3Dy
@@ -334,7 +335,9 @@ CONFIG_MMU_NOTIFIER=3Dy
 CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
 CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
 # CONFIG_MEMORY_FAILURE is not set
-# CONFIG_TRANSPARENT_HUGEPAGE is not set
+CONFIG_TRANSPARENT_HUGEPAGE=3Dy
+CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
+# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
 # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
 CONFIG_X86_RESERVE_LOW=3D64
 CONFIG_MTRR=3Dy
@@ -840,97 +843,18 @@ CONFIG_SCSI_CONSTANTS=3Dy
 CONFIG_ATA=3Dy
 # CONFIG_ATA_NONSTANDARD is not set
 CONFIG_ATA_VERBOSE_ERROR=3Dy
-# CONFIG_ATA_ACPI is not set
+CONFIG_ATA_ACPI=3Dy
 # CONFIG_SATA_PMP is not set

 #
 # Controllers with non-SFF native interface
 #
-# CONFIG_SATA_AHCI is not set
+CONFIG_SATA_AHCI=3Dy
 # CONFIG_SATA_AHCI_PLATFORM is not set
 # CONFIG_SATA_INIC162X is not set
 # CONFIG_SATA_ACARD_AHCI is not set
 # CONFIG_SATA_SIL24 is not set
-CONFIG_ATA_SFF=3Dy
-
-#
-# SFF controllers with custom DMA interface
-#
-# CONFIG_PDC_ADMA is not set
-# CONFIG_SATA_QSTOR is not set
-# CONFIG_SATA_SX4 is not set
-CONFIG_ATA_BMDMA=3Dy
-
-#
-# SATA SFF controllers with BMDMA
-#
-CONFIG_ATA_PIIX=3Dy
-# CONFIG_SATA_MV is not set
-# CONFIG_SATA_NV is not set
-# CONFIG_SATA_PROMISE is not set
-# CONFIG_SATA_SIL is not set
-# CONFIG_SATA_SIS is not set
-# CONFIG_SATA_SVW is not set
-# CONFIG_SATA_ULI is not set
-# CONFIG_SATA_VIA is not set
-# CONFIG_SATA_VITESSE is not set
-
-#
-# PATA SFF controllers with BMDMA
-#
-# CONFIG_PATA_ALI is not set
-# CONFIG_PATA_AMD is not set
-# CONFIG_PATA_ARASAN_CF is not set
-# CONFIG_PATA_ARTOP is not set
-# CONFIG_PATA_ATIIXP is not set
-# CONFIG_PATA_ATP867X is not set
-# CONFIG_PATA_CMD64X is not set
-# CONFIG_PATA_CS5520 is not set
-# CONFIG_PATA_CS5530 is not set
-# CONFIG_PATA_CS5536 is not set
-# CONFIG_PATA_CYPRESS is not set
-# CONFIG_PATA_EFAR is not set
-# CONFIG_PATA_HPT366 is not set
-# CONFIG_PATA_HPT37X is not set
-# CONFIG_PATA_HPT3X2N is not set
-# CONFIG_PATA_HPT3X3 is not set
-# CONFIG_PATA_IT8213 is not set
-# CONFIG_PATA_IT821X is not set
-# CONFIG_PATA_JMICRON is not set
-# CONFIG_PATA_MARVELL is not set
-# CONFIG_PATA_NETCELL is not set
-# CONFIG_PATA_NINJA32 is not set
-# CONFIG_PATA_NS87415 is not set
-# CONFIG_PATA_OLDPIIX is not set
-# CONFIG_PATA_OPTIDMA is not set
-# CONFIG_PATA_PDC2027X is not set
-# CONFIG_PATA_PDC_OLD is not set
-# CONFIG_PATA_RADISYS is not set
-# CONFIG_PATA_RDC is not set
-# CONFIG_PATA_SC1200 is not set
-# CONFIG_PATA_SCH is not set
-# CONFIG_PATA_SERVERWORKS is not set
-# CONFIG_PATA_SIL680 is not set
-# CONFIG_PATA_SIS is not set
-# CONFIG_PATA_TOSHIBA is not set
-# CONFIG_PATA_TRIFLEX is not set
-# CONFIG_PATA_VIA is not set
-# CONFIG_PATA_WINBOND is not set
-
-#
-# PIO-only SFF controllers
-#
-# CONFIG_PATA_CMD640_PCI is not set
-# CONFIG_PATA_MPIIX is not set
-# CONFIG_PATA_NS87410 is not set
-# CONFIG_PATA_OPTI is not set
-# CONFIG_PATA_RZ1000 is not set
-
-#
-# Generic fallback / legacy drivers
-#
-# CONFIG_ATA_GENERIC is not set
-# CONFIG_PATA_LEGACY is not set
+# CONFIG_ATA_SFF is not set
 CONFIG_MD=3Dy
 CONFIG_BLK_DEV_MD=3Dy
 CONFIG_MD_AUTODETECT=3Dy
@@ -985,9 +909,9 @@ CONFIG_R8169=3Dy
 # CONFIG_BNX2 is not set
 # CONFIG_CNIC is not set
 # CONFIG_QLA3XXX is not set
-# CONFIG_ATL1 is not set
-# CONFIG_ATL1E is not set
-# CONFIG_ATL1C is not set
+CONFIG_ATL1=3Dy
+CONFIG_ATL1E=3Dy
+CONFIG_ATL1C=3Dy
 # CONFIG_JME is not set
 # CONFIG_STMMAC_ETH is not set
 # CONFIG_PCH_GBE is not set
@@ -1126,6 +1050,8 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
 #
 # Non-8250 serial port support
 #
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX3107 is not set
 # CONFIG_SERIAL_MFD_HSU is not set
 CONFIG_SERIAL_CORE=3Dy
 CONFIG_SERIAL_CORE_CONSOLE=3Dy
@@ -1208,7 +1134,25 @@ CONFIG_I2C_PIIX4=3Dy
 # CONFIG_I2C_DEBUG_CORE is not set
 # CONFIG_I2C_DEBUG_ALGO is not set
 # CONFIG_I2C_DEBUG_BUS is not set
-# CONFIG_SPI is not set
+CONFIG_SPI=3Dy
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=3Dy
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_ALTERA is not set
+# CONFIG_SPI_BITBANG is not set
+# CONFIG_SPI_PXA2XX_PCI is not set
+# CONFIG_SPI_TOPCLIFF_PCH is not set
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set

 #
 # PPS support
@@ -1241,6 +1185,7 @@ CONFIG_HWMON=3Dy
 # CONFIG_SENSORS_ABITUGURU3 is not set
 # CONFIG_SENSORS_AD7414 is not set
 # CONFIG_SENSORS_AD7418 is not set
+# CONFIG_SENSORS_ADCXX is not set
 # CONFIG_SENSORS_ADM1021 is not set
 # CONFIG_SENSORS_ADM1025 is not set
 # CONFIG_SENSORS_ADM1026 is not set
@@ -1272,6 +1217,7 @@ CONFIG_HWMON=3Dy
 # CONFIG_SENSORS_JC42 is not set
 # CONFIG_SENSORS_LINEAGE is not set
 # CONFIG_SENSORS_LM63 is not set
+# CONFIG_SENSORS_LM70 is not set
 # CONFIG_SENSORS_LM73 is not set
 # CONFIG_SENSORS_LM75 is not set
 # CONFIG_SENSORS_LM77 is not set
@@ -1288,6 +1234,7 @@ CONFIG_HWMON=3Dy
 # CONFIG_SENSORS_LTC4245 is not set
 # CONFIG_SENSORS_LTC4261 is not set
 # CONFIG_SENSORS_LM95241 is not set
+# CONFIG_SENSORS_MAX1111 is not set
 # CONFIG_SENSORS_MAX1619 is not set
 # CONFIG_SENSORS_MAX6639 is not set
 # CONFIG_SENSORS_MAX6650 is not set
@@ -1307,6 +1254,7 @@ CONFIG_HWMON=3Dy
 # CONFIG_SENSORS_SCH5627 is not set
 # CONFIG_SENSORS_ADS1015 is not set
 # CONFIG_SENSORS_ADS7828 is not set
+# CONFIG_SENSORS_ADS7871 is not set
 # CONFIG_SENSORS_AMC6821 is not set
 # CONFIG_SENSORS_THMC50 is not set
 # CONFIG_SENSORS_TMP102 is not set
@@ -1353,7 +1301,7 @@ CONFIG_AGP=3Dy
 # CONFIG_AGP_SIS is not set
 # CONFIG_AGP_VIA is not set
 CONFIG_VGA_ARB=3Dy
-CONFIG_VGA_ARB_MAX_GPUS=3D2
+CONFIG_VGA_ARB_MAX_GPUS=3D3
 # CONFIG_VGA_SWITCHEROO is not set
 CONFIG_DRM=3Dy
 CONFIG_DRM_KMS_HELPER=3Dy
@@ -1431,7 +1379,12 @@ CONFIG_FB_CFB_IMAGEBLIT=3Dy
 # CONFIG_FB_BROADSHEET is not set
 CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
 CONFIG_LCD_CLASS_DEVICE=3Dy
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_TDO24M is not set
+# CONFIG_LCD_VGG2432A4 is not set
 # CONFIG_LCD_PLATFORM is not set
+# CONFIG_LCD_S6E63M0 is not set
+# CONFIG_LCD_LD9040 is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
 CONFIG_BACKLIGHT_GENERIC=3Dy
 # CONFIG_BACKLIGHT_PROGEAR is not set
@@ -1571,6 +1524,7 @@ CONFIG_SND_HDA_GENERIC=3Dy
 # CONFIG_SND_VIRTUOSO is not set
 # CONFIG_SND_VX222 is not set
 # CONFIG_SND_YMFPCI is not set
+CONFIG_SND_SPI=3Dy
 CONFIG_SND_USB=3Dy
 CONFIG_SND_USB_AUDIO=3Dy
 # CONFIG_SND_USB_UA101 is not set
@@ -1769,7 +1723,26 @@ CONFIG_USB_STORAGE=3Dy
 # CONFIG_NFC_DEVICES is not set
 # CONFIG_ACCESSIBILITY is not set
 # CONFIG_INFINIBAND is not set
-# CONFIG_EDAC is not set
+CONFIG_EDAC=3Dy
+
+#
+# Reporting subsystems
+#
+# CONFIG_EDAC_DEBUG is not set
+CONFIG_EDAC_DECODE_MCE=3Dy
+# CONFIG_EDAC_MCE_INJ is not set
+CONFIG_EDAC_MM_EDAC=3Dy
+# CONFIG_EDAC_AMD64 is not set
+# CONFIG_EDAC_E752X is not set
+# CONFIG_EDAC_I82975X is not set
+# CONFIG_EDAC_I3000 is not set
+# CONFIG_EDAC_I3200 is not set
+# CONFIG_EDAC_X38 is not set
+# CONFIG_EDAC_I5400 is not set
+# CONFIG_EDAC_I7CORE is not set
+# CONFIG_EDAC_I5000 is not set
+# CONFIG_EDAC_I5100 is not set
+# CONFIG_EDAC_I7300 is not set
 CONFIG_RTC_LIB=3Dy
 CONFIG_RTC_CLASS=3Dy
 CONFIG_RTC_HCTOSYS=3Dy
@@ -1809,6 +1782,14 @@ CONFIG_RTC_INTF_DEV=3Dy
 #
 # SPI RTC drivers
 #
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
+# CONFIG_RTC_DRV_PCF2123 is not set

 #
 # Platform RTC drivers

Thanks a lot for the help

Dushan

> I'll try.
> I;m currently fscking the /fs and I got:
> FSCK: node.c: 108: repair_node_items_check: Node (3205815), items (27=
)
> and (28): Wrong order of keys.
> FSCK: filter.c: 407: repair_filter_update_traverse: Node (3205815):
> the node is broken. Pointed from the node (2871633), item (12), unit
> (0). The whole subtree is skipped.
>
> --build-fs did:
> FSCK: node.c: 108: repair_node_items_check: Node (3205815), items (27=
)
> and (28): Wrong order of keys.
> FSCK: filter.c: 407: repair_filter_update_traverse: Node (3205815):
> the node is unrecoverable. Pointed from the node (2871633), item (12)=
,
> unit (0). Removed.
> FSCK: obj40_repair.c: 146: obj40_check_bytes_report: Node (100919),
> item (17), [12e38:76785f68775361:fd23c2] (stat40): wrong bytes
> (634880), Fixed to (0).
> FSCK: obj40_repair.c: 373: obj40_stat_lw_check: Node (100919), item
> (17), [12e38:76785f68775361:fd23c2] (stat40): wrong size (633454),
> Fixed to (0).
> FSCK: ccreg40_repair.c: 77: ccreg40_check_item: The file
> [12e38:767465364b4534:1185752] (ccreg40), node [1795], item [0]: item
> of the wrong cluster size (8192) found, Should be (65536). Fixed.
> FSCK: ccreg40_repair.c: 77: ccreg40_check_item: The file
> [12e38:767465364d4534:1185753] (ccreg40), node [3211856], item [1]:
> item of the wrong cluster size (2048) found, Should be (65536). Fixed=
=2E
> FSCK: ccreg40_repair.c: 77: ccreg40_check_item: The file
> [12e38:76746538463156:118493e] (ccreg40), node [3211856], item [2]:
> item of the wrong cluster size (268435456) found, Should be (65536).
> Fixed.
>
> That's the damage after using 2.6.39 with light workload - compilatio=
n
> of few small packages with -j3
>
>> Thanks,
>> Ivan.
>>
>>>
>>> mount options noatime,onerror=3Dremount-ro, partition type ccreg40
>>>
>>> > If I reformat partition and restore everything from backup do you
>>> > think it would stop?
>>> >
>>> >> Thanks,
>>> >> Ivan.
>>> >
>>> > Thanks,
>>> > Dushan
>>> >
>>> >>> On Fri, Dec 7, 2012 at 6:56 PM, Du=C5=A1an =C4=8Coli=C4=87 <dus=
anc@gmail.com> wrote:
>>> >>> > Hello
>>> >>> >
>>> >>> > I'm using KVM for windows emulation and I have a ~3GB image f=
ile that
>>> >>> > I run it from.
>>> >>> > I started having problems with it lately on regular and ccreg=
40
>>> >>> > partitions (I tried same file on both)  using 3.6.6.
>>> >>> > Spammed output with a lot of these:
>>> >>> >
>>> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133047] reiser4[find(=
5806)]:
>>> >>> > parse_node40 (fs/reiser4/plugin/node/node40.c:672)[nikita-494=
]:
>>> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133047] WARNING: Wron=
g level
>>> >>> > found in node: 2 !=3D 1
>>> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133048] reiser4[find(=
5806)]:
>>> >>> > key_warning (fs/reiser4/plugin/file_plugin_common.c:512)[niki=
ta-717]:
>>> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133048] WARNING: Erro=
r for
>>> >>> > inode 17802378 (-5)
>>> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133056] reiser4[find(=
5806)]:
>>> >>> > parse_node40 (fs/reiser4/plugin/node/node40.c:672)[nikita-494=
]:
>>> >>> > Dec  7 03:30:02 krshina3 kernel: [15135.133056] WARNING: Wron=
g level
>>> >>> > found in node: 2 !=3D 1
>>> >>> >
>>> >>> >
>>> >>> > Dec  7 17:26:23 krshina3 kernel: [38539.089191] reiser4[gdm(2=
676)]:
>>> >>> > cbk_level_lookup (fs/reiser4/search.c:963)[vs-3533]:
>>> >>> > Dec  7 17:26:23 krshina3 kernel: [38539.089194] reiser4[gdm(2=
676)]:
>>> >>> > key_warning (fs/reiser4/plugin/file_plugin_common.c:512)[niki=
ta-717]:
>>> >>> > Dec  7 17:26:23 krshina3 kernel: [38539.090837]
>>> >>> > reiser4[gnome-screensav(3503)]: cbk_level_lookup
>>> >>> > (fs/reiser4/search.c:963)[vs-3533]:
>>> >>> > Dec  7 17:26:23 krshina3 kernel: [38539.090840]
>>> >>> > reiser4[gnome-screensav(3503)]: key_warning
>>> >>> >
>>> >>> > (fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717]:
>>> >>> >  I fscked the FSes and had some errors that were corrected.
>>> >>> >
>>> >>> > Now I started geting these and I can't kill the offending pro=
cess:
>>> >>> >
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274343] INFO: task
>>> >>> > qemu-system-x86:4156 blocked for more than 120 seconds.
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274347] "echo 0 >
>>> >>> > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274349] qemu-system-x=
86 D
>>> >>> > 0000000000000001     0  4156   3654 0x00000000
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274354]  ffff880206dd=
7990
>>> >>> > 0000000000000086 ffff8801def2fc38 ffff88022ca38cf0
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274357]  000000000001=
1240
>>> >>> > ffff8801def2ffd8 0000000000004000 ffff8801def2ffd8
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274361]  000000000001=
1240
>>> >>> > ffff880206dd7990 0000000000011240 ffff8801def2e000
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274364] Call Trace:
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274372]  [<ffffffff81=
0aec97>]
>>> >>> > ? pagevec_lookup_tag+0x18/0x21
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274375]  [<ffffffff81=
0a528a>]
>>> >>> > ? filemap_fdatawait_range+0xff/0x144
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274380]  [<ffffffff81=
146b09>]
>>> >>> > ? writepages_unix_file+0x36e/0x3ce
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274384]  [<ffffffff81=
0ab9f9>]
>>> >>> > ? global_dirtyable_memory+0xd/0x2c
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274389]  [<ffffffff81=
489dac>]
>>> >>> > ? __mutex_lock_slowpath+0xd0/0x116
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274392]  [<ffffffff81=
48a096>]
>>> >>> > ? mutex_lock+0x1a/0x2d
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274396]  [<ffffffff81=
143b73>]
>>> >>> > ? reiser4_sync_file_common+0x58/0xcd
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274400]  [<ffffffff81=
147a81>]
>>> >>> > ? write_unix_file+0x442/0x4b7
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274404]  [<ffffffff81=
1498b9>]
>>> >>> > ? reiser4_write_careful+0xb8/0x450
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274409]  [<ffffffff81=
0da90f>]
>>> >>> > ? vfs_write+0xaf/0x149
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274412]  [<ffffffff81=
0dab49>]
>>> >>> > ? sys_pwrite64+0x53/0x71
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274415]  [<ffffffff81=
48c3e2>]
>>> >>> > ? system_call_fastpath+0x16/0x1b
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274418] INFO: task
>>> >>> > qemu-system-x86:4162 blocked for more than 120 seconds.
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274419] "echo 0 >
>>> >>> > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274420] qemu-system-x=
86 D
>>> >>> > 0000000000000000     0  4162   3654 0x00000000
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274423]  ffff88020f7c=
acf0
>>> >>> > 0000000000000086 ffff8801e007fe18 ffffffff816ab3f0
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274426]  000000000001=
1240
>>> >>> > ffff8801e007ffd8 0000000000004000 ffff8801e007ffd8
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274429]  000000000001=
1240
>>> >>> > ffff88020f7cacf0 0000000000011240 ffff8801e007e000
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274432] Call Trace:
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274437]  [<ffffffff81=
0aec97>]
>>> >>> > ? pagevec_lookup_tag+0x18/0x21
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274439]  [<ffffffff81=
0a528a>]
>>> >>> > ? filemap_fdatawait_range+0xff/0x144
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274443]  [<ffffffff81=
146b09>]
>>> >>> > ? writepages_unix_file+0x36e/0x3ce
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274447]  [<ffffffff81=
489dac>]
>>> >>> > ? __mutex_lock_slowpath+0xd0/0x116
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274450]  [<ffffffff81=
48a096>]
>>> >>> > ? mutex_lock+0x1a/0x2d
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274453]  [<ffffffff81=
143b73>]
>>> >>> > ? reiser4_sync_file_common+0x58/0xcd
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274457]  [<ffffffff81=
0fa6d8>]
>>> >>> > ? do_fsync+0x29/0x47
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274460]  [<ffffffff81=
0fa716>]
>>> >>> > ? sys_fdatasync+0xe/0x15
>>> >>> > Dec  7 18:43:29 krshina3 kernel: [  720.274462]  [<ffffffff81=
48c3e2>]
>>> >>> > ? system_call_fastpath+0x16/0x1b
>>> >>> > tail: unrecognized file system type 0x52345362 for
>>> >>> > '/var/log/messages'. please report this to bug-coreutils@gnu.=
org.
>>> >>> > reverting to polling
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266595] INFO: task
>>> >>> > qemu-system-x86:4156 blocked for more than 120 seconds.
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266599] "echo 0 >
>>> >>> > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266601] qemu-system-x=
86 D
>>> >>> > 0000000000000001     0  4156   3654 0x00000000
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266605]  ffff880206dd=
7990
>>> >>> > 0000000000000086 ffff8801def2fc38 ffff88022ca38cf0
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266609]  000000000001=
1240
>>> >>> > ffff8801def2ffd8 0000000000004000 ffff8801def2ffd8
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266613]  000000000001=
1240
>>> >>> > ffff880206dd7990 0000000000011240 ffff8801def2e000
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266616] Call Trace:
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266625]  [<ffffffff81=
0aec97>]
>>> >>> > ? pagevec_lookup_tag+0x18/0x21
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266629]  [<ffffffff81=
0a528a>]
>>> >>> > ? filemap_fdatawait_range+0xff/0x144
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266634]  [<ffffffff81=
146b09>]
>>> >>> > ? writepages_unix_file+0x36e/0x3ce
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266638]  [<ffffffff81=
0ab9f9>]
>>> >>> > ? global_dirtyable_memory+0xd/0x2c
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266643]  [<ffffffff81=
489dac>]
>>> >>> > ? __mutex_lock_slowpath+0xd0/0x116
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266646]  [<ffffffff81=
48a096>]
>>> >>> > ? mutex_lock+0x1a/0x2d
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266650]  [<ffffffff81=
143b73>]
>>> >>> > ? reiser4_sync_file_common+0x58/0xcd
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266654]  [<ffffffff81=
147a81>]
>>> >>> > ? write_unix_file+0x442/0x4b7
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266658]  [<ffffffff81=
1498b9>]
>>> >>> > ? reiser4_write_careful+0xb8/0x450
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266664]  [<ffffffff81=
0da90f>]
>>> >>> > ? vfs_write+0xaf/0x149
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266666]  [<ffffffff81=
0dab49>]
>>> >>> > ? sys_pwrite64+0x53/0x71
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266670]  [<ffffffff81=
48c3e2>]
>>> >>> > ? system_call_fastpath+0x16/0x1b
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266672] INFO: task
>>> >>> > qemu-system-x86:4162 blocked for more than 120 seconds.
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266674] "echo 0 >
>>> >>> > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266675] qemu-system-x=
86 D
>>> >>> > 0000000000000000     0  4162   3654 0x00000000
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266678]  ffff88020f7c=
acf0
>>> >>> > 0000000000000086 ffff8801e007fe18 ffffffff816ab3f0
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266681]  000000000001=
1240
>>> >>> > ffff8801e007ffd8 0000000000004000 ffff8801e007ffd8
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266684]  000000000001=
1240
>>> >>> > ffff88020f7cacf0 0000000000011240 ffff8801e007e000
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266687] Call Trace:
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266691]  [<ffffffff81=
0aec97>]
>>> >>> > ? pagevec_lookup_tag+0x18/0x21
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266694]  [<ffffffff81=
0a528a>]
>>> >>> > ? filemap_fdatawait_range+0xff/0x144
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266698]  [<ffffffff81=
146b09>]
>>> >>> > ? writepages_unix_file+0x36e/0x3ce
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266702]  [<ffffffff81=
489dac>]
>>> >>> > ? __mutex_lock_slowpath+0xd0/0x116
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266705]  [<ffffffff81=
48a096>]
>>> >>> > ? mutex_lock+0x1a/0x2d
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266708]  [<ffffffff81=
143b73>]
>>> >>> > ? reiser4_sync_file_common+0x58/0xcd
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266712]  [<ffffffff81=
0fa6d8>]
>>> >>> > ? do_fsync+0x29/0x47
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266714]  [<ffffffff81=
0fa716>]
>>> >>> > ? sys_fdatasync+0xe/0x15
>>> >>> > Dec  7 18:45:29 krshina3 kernel: [  840.266717]  [<ffffffff81=
48c3e2>]
>>> >>> > ? system_call_fastpath+0x16/0x1b
>>> >>> >
>>> >>> >
>>> >>> > File runs fine from FAT32 partition
>>> >>> >
>>> >>> > If I can do something, or you need any info tell me please
>>> >>> >
>>> >>> > Thanks
>>> >>> > Dushan
>>> >>>
>>> >>> --
>>> >>> To unsubscribe from this list: send the line "unsubscribe
>>> >>> reiserfs-devel" in the body of a message to majordomo@vger.kern=
el.org
>>> >>> More majordomo info at  http://vger.kernel.org/majordomo-info.h=
tml
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
