From: "Sewell, Cassandra D (Cassandra)" <csewell@avaya.com>
Subject: reiserfs messages on root partition at system boot time
Date: Thu, 19 Dec 2002 09:04:34 -0700
Message-ID: <0E18D85A21D2874080456C3B8A12E83E01009F9C@cof110avexu4.global.avaya.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2A778.52844A24"
Return-path: <reiserfs-list-return-12174-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C2A778.52844A24
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I am seeing the following messages on a system I have at boot time.  =
This system=20
is running the 2.2.17 kernel w/ RFS 3.5.32.  I am awaiting delivery of =
the harddrive &=20
will be executing the fsck on this drive (along with some hw =
diagnostics) but was hoping to get an indication as to what these =
messages may be indicating.  I do not see any hardware errors in the=20
system log file. =20

************************/var/log/messages********************************=
*****

Dec 31 19:35:32 **** kernel: Checking ReiserFS transaction log (device =
03:06) ...=20
Dec 31 19:35:32 **** kernel: Warning, log recovery starting on readonly =
filesystem=20
Dec 31 19:35:32 **** kernel: Replayed 6 transactions in 6 seconds=20
Dec 31 19:35:32 **** kernel: Using r5 hash to sort names=20
Dec 31 19:35:32 **** kernel: Primary Sponsor thresholdnetworks.com=20
Dec 31 19:35:32 **** kernel: Raid Tuning sponsored by emusic.com=20
Dec 31 19:35:32 **** kernel: HSM sponsored by bigstorage.com=20
Dec 31 19:35:32 **** kernel: Alpha port and SMP sponsored by =
www.api-networks.com, alpha port by www.innovative-software.com and =
www.quant-x.com.=20
Dec 31 19:35:32 **** kernel: ReiserFS version 3.5.32=20
Dec 31 19:35:32 **** kernel: VFS: Mounted root (reiserfs filesystem) =
readonly.=20
Dec 31 19:35:32 **** kernel: Freeing unused kernel memory: 72k freed=20
Dec 31 19:35:32 **** kernel: Adding Swap: 530136k swap-space (priority =
-1)=20
.....
Dec 31 19:35:32 **** kernel: i2c-core.o: i2c core module=20
Dec 31 19:35:32 **** kernel: sensors.o version 2.5.5 (20010115)=20
Dec 31 19:35:32 **** kernel: piix4.o version 2.5.5 (20010115)=20
Dec 31 19:35:32 **** kernel: i2c-core.o: adapter SMBus PIIX4 adapter at =
1040 registered as adapter 0.=20
Dec 31 19:35:32 **** kernel: i2c-piix4.o: PIIX4 bus detected and =
initialized=20
Dec 31 19:35:32 **** kernel: adm1021.o version 2.5.5 (20010115)=20
Dec 31 19:35:32 **** kernel: i2c-core.o: driver ADM1021, MAX1617 sensor =
driver registered.=20
Dec 31 19:35:32 **** kernel: i2c-core.o: client [LM84 chip] registered =
to adapter [SMBus PIIX4 adapter at 1040](pos. 0).=20
Dec 31 19:35:32 **** kernel: usb.c: registered new driver acm=20

Dec 31 19:35:32 **** kernel: Checking ReiserFS transaction log (device =
03:01) ...=20
Dec 31 19:35:32 **** kernel: Using r5 hash to sort names=20
Dec 31 19:35:32 **** kernel: ReiserFS version 3.5.32=20
Dec 31 19:35:32 **** kernel: attempt to access beyond end of device=20
Dec 31 19:35:32 **** kernel: 03:0c: rw=3D0, want=3D65, limit=3D0=20
Dec 31 19:35:32 **** kernel: dev 03:0c blksize=3D1024 blocknr=3D64 =
sector=3D128 size=3D1024 count=3D1=20
Dec 31 19:35:32 **** kernel: reiserfs_read_super: unable to read =
superblock on dev 03:0c=20
Dec 31 19:35:32 **** kernel: reiserfs_read_super: try to find super =
block in old location=20
Dec 31 19:35:32 **** kernel: attempt to access beyond end of device=20
Dec 31 19:35:32 **** kernel: 03:0c: rw=3D0, want=3D12, limit=3D0=20
Dec 31 19:35:32 **** kernel: dev 03:0c blksize=3D4096 blocknr=3D2 =
sector=3D16 size=3D4096 count=3D1=20
Dec 31 19:35:32 **** kernel: reiserfs_read_super: unable to read =
superblock on dev 03:0c=20
Dec 31 19:35:32 **** kernel: attempt to access beyond end of device=20
Dec 31 19:35:32 **** kernel: 03:0d: rw=3D0, want=3D65, limit=3D0=20
Dec 31 19:35:32 **** kernel: dev 03:0d blksize=3D1024 blocknr=3D64 =
sector=3D128 size=3D1024 count=3D1=20
Dec 31 19:35:32 **** kernel: reiserfs_read_super: unable to read =
superblock on dev 03:0d=20
Dec 31 19:35:32 **** kernel: reiserfs_read_super: try to find super =
block in old location=20
Dec 31 19:35:32 **** kernel: attempt to access beyond end of device=20
Dec 31 19:35:32 **** kernel: 03:0d: rw=3D0, want=3D12, limit=3D0=20
Dec 31 19:35:32 **** kernel: dev 03:0d blksize=3D4096 blocknr=3D2 =
sector=3D16 size=3D4096 count=3D1=20
Dec 31 19:35:32 **** kernel: reiserfs_read_super: unable to read =
superblock on dev 03:0d=20
Dec 31 19:35:32 **** kernel: attempt to access beyond end of device=20
Dec 31 19:35:32 **** kernel: 03:0e: rw=3D0, want=3D65, limit=3D0=20
Dec 31 19:35:32 **** kernel: dev 03:0e blksize=3D1024 blocknr=3D64 =
sector=3D128 size=3D1024 count=3D1=20
Dec 31 19:35:32 **** kernel: reiserfs_read_super: unable to read =
superblock on dev 03:0e=20
Dec 31 19:35:32 **** kernel: reiserfs_read_super: try to find super =
block in old location=20
Dec 31 19:35:32 **** kernel: attempt to access beyond end of device=20
Dec 31 19:35:32 **** kernel: 03:0e: rw=3D0, want=3D12, limit=3D0=20
Dec 31 19:35:32 **** kernel: dev 03:0e blksize=3D4096 blocknr=3D2 =
sector=3D16 size=3D4096 count=3D1=20
Dec 31 19:35:32 **** kernel: reiserfs_read_super: unable to read =
superblock on dev 03:0e=20
Dec 31 19:35:32 **** kernel: Checking ReiserFS transaction log (device =
03:08) ...=20
Dec 31 19:35:32 **** kernel: Using r5 hash to sort names=20
Dec 31 19:35:32 **** kernel: ReiserFS version 3.5.32=20
Dec 31 19:35:32 **** kernel: Checking ReiserFS transaction log (device =
03:09) ...=20
Dec 31 19:35:32 **** kernel: Using r5 hash to sort names=20
Dec 31 19:35:32 **** kernel: ReiserFS version 3.5.32=20
Dec 31 19:35:32 **** kernel: Checking ReiserFS transaction log (device =
03:0a) ...=20
Dec 31 19:35:32 **** kernel: Using r5 hash to sort names=20
Dec 31 19:35:32 **** kernel: ReiserFS version 3.5.32=20
Dec 31 19:35:32 **** kernel: reiserfs_read_super: can't find a reiserfs =
filesystem on dev 03:0b.=20
Dec 31 19:35:32 **** kernel: reiserfs_read_super: try to find super =
block in old location=20
Dec 31 19:35:32 **** kernel: reiserfs_read_super: can't find a reiserfs =
filesystem on dev 03:0b.=20
Dec 31 19:35:32 **** kernel: Checking ReiserFS transaction log (device =
03:05) ...=20
Dec 31 19:35:32 **** kernel: Replayed 127 transactions in 3 seconds=20
Dec 31 19:35:32 **** kernel: Using r5 hash to sort names=20
Dec 31 19:35:32 **** kernel: ReiserFS version 3.5.32=20
Dec 31 19:35:32 **** kernel: Intel(R) PRO/100 Fast Ethernet Adapter - =
Loadable driver, ver 1.5.5=20
.......

Thanks,=20

C. Sewell


------_=_NextPart_001_01C2A778.52844A24
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.5770.91">
<TITLE>reiserfs messages on root partition at system boot time</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Courier New">I am seeing the following =
messages on a system I have at boot time.&nbsp; This system </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">is running the 2.2.17 kernel w/ =
RFS 3.5.32.&nbsp; I am awaiting delivery of the harddrive &amp; </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">will be executing the fsck on =
this drive (along with some hw diagnostics) but was hoping to get an =
indication as to what these messages may be indicating.&nbsp; I do not =
see any hardware errors in the </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">system log file.&nbsp; </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier =
New">************************/var/log/messages***************************=
**********</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Checking ReiserFS transaction log (device 03:06) ... </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Warning, log recovery starting on readonly filesystem </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Replayed 6 transactions in 6 seconds </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Using r5 hash to sort names </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Primary Sponsor thresholdnetworks.com </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Raid Tuning sponsored by emusic.com </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: HSM =
sponsored by bigstorage.com </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Alpha port and SMP sponsored by www.api-networks.com, alpha port by =
www.innovative-software.com and www.quant-x.com. </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
ReiserFS version 3.5.32 </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
VFS: Mounted root (reiserfs filesystem) readonly. </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Freeing unused kernel memory: 72k freed </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Adding Swap: 530136k swap-space (priority -1) </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">.....</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
i2c-core.o: i2c core module </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
sensors.o version 2.5.5 (20010115) </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
piix4.o version 2.5.5 (20010115) </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
i2c-core.o: adapter SMBus PIIX4 adapter at 1040 registered as adapter 0. =
</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
i2c-piix4.o: PIIX4 bus detected and initialized </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
adm1021.o version 2.5.5 (20010115) </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
i2c-core.o: driver ADM1021, MAX1617 sensor driver registered. </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
i2c-core.o: client [LM84 chip] registered to adapter [SMBus PIIX4 =
adapter at 1040](pos. 0). </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
usb.c: registered new driver acm </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Checking ReiserFS transaction log (device 03:01) ... </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Using r5 hash to sort names </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
ReiserFS version 3.5.32 </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
attempt to access beyond end of device </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
03:0c: rw=3D0, want=3D65, limit=3D0 </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: dev =
03:0c blksize=3D1024 blocknr=3D64 sector=3D128 size=3D1024 count=3D1 =
</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
reiserfs_read_super: unable to read superblock on dev 03:0c </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
reiserfs_read_super: try to find super block in old location </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
attempt to access beyond end of device </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
03:0c: rw=3D0, want=3D12, limit=3D0 </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: dev =
03:0c blksize=3D4096 blocknr=3D2 sector=3D16 size=3D4096 count=3D1 =
</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
reiserfs_read_super: unable to read superblock on dev 03:0c </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
attempt to access beyond end of device </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
03:0d: rw=3D0, want=3D65, limit=3D0 </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: dev =
03:0d blksize=3D1024 blocknr=3D64 sector=3D128 size=3D1024 count=3D1 =
</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
reiserfs_read_super: unable to read superblock on dev 03:0d </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
reiserfs_read_super: try to find super block in old location </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
attempt to access beyond end of device </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
03:0d: rw=3D0, want=3D12, limit=3D0 </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: dev =
03:0d blksize=3D4096 blocknr=3D2 sector=3D16 size=3D4096 count=3D1 =
</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
reiserfs_read_super: unable to read superblock on dev 03:0d </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
attempt to access beyond end of device </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
03:0e: rw=3D0, want=3D65, limit=3D0 </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: dev =
03:0e blksize=3D1024 blocknr=3D64 sector=3D128 size=3D1024 count=3D1 =
</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
reiserfs_read_super: unable to read superblock on dev 03:0e </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
reiserfs_read_super: try to find super block in old location </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
attempt to access beyond end of device </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
03:0e: rw=3D0, want=3D12, limit=3D0 </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: dev =
03:0e blksize=3D4096 blocknr=3D2 sector=3D16 size=3D4096 count=3D1 =
</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
reiserfs_read_super: unable to read superblock on dev 03:0e </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Checking ReiserFS transaction log (device 03:08) ... </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Using r5 hash to sort names </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
ReiserFS version 3.5.32 </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Checking ReiserFS transaction log (device 03:09) ... </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Using r5 hash to sort names </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
ReiserFS version 3.5.32 </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Checking ReiserFS transaction log (device 03:0a) ... </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Using r5 hash to sort names </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
ReiserFS version 3.5.32 </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
reiserfs_read_super: can't find a reiserfs filesystem on dev 03:0b. =
</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
reiserfs_read_super: try to find super block in old location </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
reiserfs_read_super: can't find a reiserfs filesystem on dev 03:0b. =
</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Checking ReiserFS transaction log (device 03:05) ... </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Replayed 127 transactions in 3 seconds </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Using r5 hash to sort names </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
ReiserFS version 3.5.32 </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">Dec 31 19:35:32 **** kernel: =
Intel(R) PRO/100 Fast Ethernet Adapter - Loadable driver, ver 1.5.5 =
</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Courier New">.......</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">Thanks, </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">C. Sewell</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2A778.52844A24--
