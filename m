From: Christian Trefzer <ctrefzer@gmx.de>
Subject: kernel BUG at /usr/src/sources/linux-2.6.16-rc5/fs/reiser4/plugin/file/tail_conversion.c:29
Date: Wed, 15 Mar 2006 08:50:35 +0100
Message-ID: <20060315075034.GC17577@zeus.uziel.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <reiserfs-list-return-28260-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I got this half an hour ago, with some processes left in D state, namely
ooffice.bin and two instances of procmail, as this happened on my /home
LV:

kernel BUG at /usr/src/sources/linux-2.6.16-rc5/fs/reiser4/plugin/file/tail=
_conversion.c:29!
invalid opcode: 0000 [#1]
PREEMPT=20
Modules linked in: mga drm w83781d hwmon_vid hwmon i2c_isa snd_seq_midi snd=
_pcm_oss snd_mixer_oss snd_seq_oss snd_seq_midi_event snd_seq snd_cmipci sn=
d_opl3_lib snd_hwdep snd_mpu401_uart ohci_hcd floppy sr_mod cdrom pata_via =
i2c_viapro aic7xxx scsi_transport_spi ehci_hcd uhci_hcd 3c59x mii snd_ens13=
70 gameport snd_rawmidi snd_seq_device snd_pcm snd_timer snd_ak4531_codec s=
nd soundcore snd_page_alloc via_agp agpgart usbcore xfs exportfs reiser4 ex=
t2 loop lp parport_pc parport rtc psmouse reiserfs dm_mod raid5 raid1 xor m=
d_mod pata_pdc2027x libata sd_mod scsi_mod unix
CPU:    0
EIP:    0060:[<f2daa02d>]    Not tainted VLI
EFLAGS: 00010286   (2.6.16-rc5 #10)=20
EIP is at get_exclusive_access+0x31/0x44 [reiser4]
eax: b26d6c04   ebx: 00000000   ecx: ec54bbf4   edx: b736fdc0
esi: 3dbf3000   edi: 00006c85   ebp: 00006c85   esp: ded36f0c
ds: 007b   es: 007b   ss: 0068
Process soffice.bin (pid: 12533, threadinfo=3Dded36000 task=3Db3b7b070)
Stack: <0>f2da83da 00000000 c52ca544 e52935a8 00007000 b014c75f c52ca544 e7=
b3cc80=20
b0151cd1 b6b54354 b6b5434c 3dbf3000 ed113360 e6a02160 b26d6bc0 ec54bc4c=20
ec54bbf4 00000000 00006c85 00000001 00000000 ec54bc00 00000000 00006c85=20
Call Trace:
[<f2da83da>] write_unix_file+0x1ba/0x60c [reiser4]
[<f2da8220>] write_unix_file+0x0/0x60c [reiser4]
[<b0101135>] syscall_call+0x7/0xb
Code: ff 21 e0 8b 00 8b 80 b0 04 00 00 8b 40 40 8b 50 08 85 d2 75 16 ba 01 =
00 ff ff 89 c8 0f c1 10 85 d2 75 12 c7 41 24 01 00 00 00 c3 <0f> 0b 1d 00 0=
4 8c dc f2 eb e0 51 e8 13 ac 35 bd 59 eb e5 55 89=20


I had another occurrence of something looking similar at first glance,
repeatedly grinding my laptop to halt when I was on a trip. The only way
to make it go away was to wipe the device by dd'ing /dev/zero to it. Not
even tar-backup and mkfs did the job - otherwise I could have left out
the word "repeatedly"...

The only thing I could imagine other than a serious problem wrt. reiser4
code is a "soft" bad block relocated by the drive upon write, but there
was nothing like a read error in the logs. Furthermore I wanted the
gurus to know since it occured to me more than once.


Thanks for your time!
Chris



FYI, here comes something about the disk, including SMART error log:


/dev/sda:

ATA device, with non-removable media
	Model Number:       SAMSUNG SV1203N                        =20
	Serial Number:      S01CJ10Y410901     =20
	Firmware Revision:  TQ100-30
Standards:
	Supported: 7 6 5 4=20
	Likely used: 7
Configuration:
	Logical		max	current
	cylinders	16383	16383
	heads		16	16
	sectors/track	63	63
	--
	CHS current addressable sectors:   16514064
	LBA    user addressable sectors:  234493056
	LBA48  user addressable sectors:  234493056
	device size with M =3D 1024*1024:      114498 MBytes
	device size with M =3D 1000*1000:      120060 MBytes (120 GB)
Capabilities:
	LBA, IORDY(can be disabled)
	Queue depth: 1
	Standby timer values: spec'd by Standard, no device specific minimum
	R/W multiple sector transfer: Max =3D 16	Current =3D 16
	Recommended acoustic management value: 254, current value: 254
	DMA: mdma0 mdma1 mdma2 udma0 udma1 udma2 udma3 udma4 udma5 *udma6=20
	     Cycle time: min=3D120ns recommended=3D120ns
	PIO: pio0 pio1 pio2 pio3 pio4=20
	     Cycle time: no flow control=3D240ns  IORDY flow control=3D120ns
Commands/features:
	Enabled	Supported:
	   *	READ BUFFER cmd
	   *	WRITE BUFFER cmd
	   *	Host Protected Area feature set
	   *	Look-ahead
	   *	Write cache
	   *	Power Management feature set
		Security Mode feature set
	   *	SMART feature set
	   *	FLUSH CACHE EXT command
	   *	Mandatory FLUSH CACHE command=20
	   *	Device Configuration Overlay feature set=20
	   *	48-bit Address feature set=20
	   *	Automatic Acoustic Management feature set=20
		SET MAX security extension
	   *	DOWNLOAD MICROCODE cmd
	   *	SMART self-test=20
	   *	SMART error logging=20
Security:=20
	Master password revision code =3D 65534
		supported
	not	enabled
	not	locked
	not	frozen
	not	expired: security count
		supported: enhanced erase
	56min for SECURITY ERASE UNIT. 56min for ENHANCED SECURITY ERASE UNIT.
HW reset results:
	CBLID- above Vih
	Device num =3D 0 determined by the jumper
Checksum: correct



smartctl version 5.33 [i386-pc-linux-gnu] Copyright (C) 2002-4 Bruce Allen
Home page is http://smartmontools.sourceforge.net/

=3D=3D=3D START OF READ SMART DATA SECTION =3D=3D=3D
SMART Error Log Version: 1
ATA Error Count: 8 (device log contains only the most recent five errors)
	CR =3D Command Register [HEX]
	FR =3D Features Register [HEX]
	SC =3D Sector Count Register [HEX]
	SN =3D Sector Number Register [HEX]
	CL =3D Cylinder Low Register [HEX]
	CH =3D Cylinder High Register [HEX]
	DH =3D Device/Head Register [HEX]
	DC =3D Device Command Register [HEX]
	ER =3D Error register [HEX]
	ST =3D Status register [HEX]
Powered_Up_Time is measured from power on, and printed as
DDd+hh:mm:SS.sss where DD=3Ddays, hh=3Dhours, mm=3Dminutes,
SS=3Dsec, and sss=3Dmillisec. It "wraps" after 49.710 days.

Error 8 occurred at disk power-on lifetime: 1595 hours (66 days + 11 hours)
  When the command that caused the error occurred, the device was active or=
 idle.

  After command completion occurred, registers were:
  ER ST SC SN CL CH DH
  -- -- -- -- -- -- --
  04 51 00 00 00 00 a0  Error: ABRT

  Commands leading to the command that caused the error were:
  CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
  -- -- -- -- -- -- -- --  ----------------  --------------------
  b1 c0 00 00 00 00 a0 00      16:23:07.813  DEVICE CONFIGURATION RESTORE
  b1 c2 00 00 00 00 a0 00      16:23:07.813  DEVICE CONFIGURATION IDENTIFY
  9a 23 04 00 02 00 a0 00      16:23:07.813  [VENDOR SPECIFIC]
  9a 23 04 00 02 00 a0 00      16:23:07.750  [VENDOR SPECIFIC]
  9a 23 01 00 02 00 a0 00      16:23:07.750  [VENDOR SPECIFIC]

Error 7 occurred at disk power-on lifetime: 1595 hours (66 days + 11 hours)
  When the command that caused the error occurred, the device was active or=
 idle.

  After command completion occurred, registers were:
  ER ST SC SN CL CH DH
  -- -- -- -- -- -- --
  02 51 3f 00 00 00 e0  Error: TK0NF

  Commands leading to the command that caused the error were:
  CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
  -- -- -- -- -- -- -- --  ----------------  --------------------
  10 00 3f 00 00 00 e0 00      16:10:46.563  RECALIBRATE [OBS-4]
  91 00 3f 3f ff 3f e0 00      16:10:46.563  INITIALIZE DEVICE PARAMETERS [=
OBS-6]
  ef 03 45 01 00 00 a0 00      16:10:46.563  SET FEATURES [Set transfer mod=
e]
  ef 03 0c 01 00 00 a0 00      16:10:46.563  SET FEATURES [Set transfer mod=
e]
  ec 00 00 01 00 00 a0 00      16:10:45.813  IDENTIFY DEVICE

Error 6 occurred at disk power-on lifetime: 1595 hours (66 days + 11 hours)
  When the command that caused the error occurred, the device was active or=
 idle.

  After command completion occurred, registers were:
  ER ST SC SN CL CH DH
  -- -- -- -- -- -- --
  02 51 00 00 00 00 e0  Error: TK0NF

  Commands leading to the command that caused the error were:
  CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
  -- -- -- -- -- -- -- --  ----------------  --------------------
  10 00 00 00 00 00 e0 00      16:10:32.625  RECALIBRATE [OBS-4]
  00 00 01 01 00 00 a0 00      16:10:32.625  NOP [Abort queued commands]

Error 5 occurred at disk power-on lifetime: 1595 hours (66 days + 11 hours)
  When the command that caused the error occurred, the device was active or=
 idle.

  After command completion occurred, registers were:
  ER ST SC SN CL CH DH
  -- -- -- -- -- -- --
  02 51 00 00 00 00 e0  Error: TK0NF

  Commands leading to the command that caused the error were:
  CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
  -- -- -- -- -- -- -- --  ----------------  --------------------
  10 00 00 00 00 00 e0 00      16:10:32.063  RECALIBRATE [OBS-4]
  00 da 01 01 00 00 a0 00      16:10:32.063  NOP [Reserved subcommand]
  b0 da 10 01 4f c2 a0 00      16:10:25.688  SMART RETURN STATUS
  b0 d8 10 01 4f c2 a0 00      16:10:25.625  SMART ENABLE OPERATIONS
  c6 03 10 01 00 00 a0 00      16:10:25.625  SET MULTIPLE MODE

Error 4 occurred at disk power-on lifetime: 483 hours (20 days + 3 hours)
  When the command that caused the error occurred, the device was active or=
 idle.

  After command completion occurred, registers were:
  ER ST SC SN CL CH DH
  -- -- -- -- -- -- --
  04 51 00 00 4f c2 e0  Error: ABRT

  Commands leading to the command that caused the error were:
  CR FR SC SN CL CH DH DC   Powered_Up_Time  Command/Feature_Name
  -- -- -- -- -- -- -- --  ----------------  --------------------
  b0 da 00 00 4f c2 e0 00  21d+14:59:16.250  SMART RETURN STATUS
  ec 00 00 ac 87 e4 e0 00  21d+14:59:16.188  IDENTIFY DEVICE
  ef 82 00 00 00 00 e0 00  21d+14:47:39.438  SET FEATURES [Disable write ca=
che]
  ef 02 00 00 00 00 e0 00  21d+14:44:35.625  SET FEATURES [Enable write cac=
he]
  ef 42 fe 00 00 00 e0 00  21d+09:37:08.125  SET FEATURES [Enable AAM]


--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iQIVAwUBRBfHSl2m8MprmeOlAQLyCA//YFNNZDw6vhz99qC1TKa2wVoVyAAPq99B
l5slD7tgknFxqKBXYWIohqunD9v4VG8byWQ2wXYH80jAdDcqv2kSZbv+FMebNCtL
E7i0qWGS3UwasqDp4lgFmV5KJdF9JGojx970g8MQYaTJpTlGabn1OPaPH70GbyHi
EPX5CkijPSN3KsKmy1iPPPsuEGd2CPnEVus7oLQeYYw8fYFYICIpwd6fKh6W1JK6
K0R32RUg7aPWNr25Uo/Mkc25tY24aPyrHHOPVN31TBqJJtPdH2NC8vfp6M2tyvRY
lhA8z40z6q+2nRiBtWb5SNF7jY3LZQpjuleLjafrskrt3Q5Nrkm2MuSIoLNSEV2o
7FhOuXuxPk1VS1lc3Qx6JMD4LOuwsDm+jlREFkbXYi0zc6lT3pXjrKoE4DBpRwCL
/9UsvMrm9MWNHFj9I1icYA1p6pA2cyt/zivG9PPiW29FAraEGVxFD5R2d3BRMcVv
prMT/kSqt7ma67AWNjFaRkOxMwl4zi2R25Td+pvIlvuWxAHpaBrDSn6DwjiH3vQE
V7tAvSrA5+H5ywB8vtse1quCYgjJFQy0MTKsEMl4i72/QFOllLXKqoxB9qmxpwSG
AmBhcG8nV4Uea9d/XL/wMc5muQKtUzxmXslJdIP6M7Xu8FJFaPLvUIoQcy3u6IDL
2pHyyL2b8NM=
=ddmt
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--

