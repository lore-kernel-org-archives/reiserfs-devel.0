From: rwhron@earthlink.net
Subject: 2.5.9 kreiserfsd and sync hung in D state
Date: Tue, 23 Apr 2002 07:33:27 -0400
Message-ID: <20020423073327.A21535@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10143-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I didn't notice any of the 2.5.8.pending fixes in 
ChangeLog-2.5.9, and I haven't tried them with 2.5.9 yet.

Linux 2.5.9 without any patches.

Uninteruptable sleep created by:
mkreiserfs /dev/sdc2
mount -t reiserfs -o defaults,noatime /dev/sdc2 /fs2
cpio -pdm filenames |  /fs2
sync			# this is what has hung

ps aux
USER       PID %CPU %MEM   VSZ  RSS TTY      STAT START   TIME COMMAND
root      1113  0.0  0.0     0    0 ?        DW   03:49   0:00 [kreiserfsd]
root      1265  0.0  0.0  1636  488 ttyp0    D    03:52   0:00 sync

A similar mke2fs;mount;cpio;sync on ext2 did not hang.

The SCSI drivers for this machine were recently fixed in 2.5.9.  
They may not be bulletproof yet.

lspci
00:00.0 Host bridge: ServerWorks CNB20HE Host Bridge (rev 21)
00:00.1 Host bridge: ServerWorks CNB20HE Host Bridge (rev 01)
00:00.2 Host bridge: ServerWorks: Unknown device 0006
00:00.3 Host bridge: ServerWorks: Unknown device 0006
00:01.0 SCSI storage controller: Adaptec AIC-7880U (rev 02)
00:04.0 Ethernet controller: Intel Corp. 82557 [Ethernet Pro 100] (rev 08)
00:0c.0 VGA compatible controller: ATI Technologies Inc 3D Rage IIC 215IIC [Mach64 GT IIC] (rev 7a)
00:0f.0 ISA bridge: ServerWorks OSB4 South Bridge (rev 50)
00:0f.1 IDE interface: ServerWorks OSB4 IDE Controller
00:0f.2 USB Controller: ServerWorks OSB4/CSB5 OHCI USB Controller (rev 04)
01:05.0 PCI Hot-plug controller: Compaq Computer Corporation PCI Hotplug Controller (rev 11)
01:06.0 SCSI storage controller: Adaptec 7899P (rev 01)
01:06.1 SCSI storage controller: Adaptec 7899P (rev 01)
01:08.0 Ethernet controller: Intel Corp. 82557 [Ethernet Pro 100] (rev 08)
01:09.0 Ethernet controller: Intel Corp. 82557 [Ethernet Pro 100] (rev 08)
01:0a.0 Ethernet controller: Netgear GA620 (rev 01)
01:0b.0 Ethernet controller: Netgear GA620 (rev 01)
07:07.0 PCI Hot-plug controller: Compaq Computer Corporation PCI Hotplug Controller (rev 11)
07:0e.0 PCI bridge: Digital Equipment Corporation DECchip 21154 (rev 05)
09:04.0 SCSI storage controller: QLogic Corp. QLA2200 (rev 05)
09:05.0 SCSI storage controller: QLogic Corp. QLA2200 (rev 05)

I would like to get reiserfs on 2.5.9 working on this machine.
Any suggestions appreciated.


-- 
Randy Hron

