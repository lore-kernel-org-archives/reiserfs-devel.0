From: Andreas Otto <aotto1968@onlinehome.de>
Subject: once a Week the FS crashes
Date: Mon, 7 Jun 2004 08:20:10 +0200
Message-ID: <200406070820.10391.aotto1968@onlinehome.de>
Reply-To: aotto1968@t-online.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19052-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi,

 1. after 5 times booting my Linux-Box with Reiser-Fs crashes:
       => unabel to read BITMAP at ######
     and the kernel PANIC

  to solve the problem I boot from the rescue disc of my SuSe Linux 9.0
 and do: fsck.reiserfs --rebuild-tree /dev/hda2

 after that everything is OK:

 Question:
   a) is this a HW or a SW problem
   b) if HW: is this a DISK or a CHIPSET problem
   c) if SW: is this a REISER or a DRIVER problem

  I'll provide you with every data needed

  thank you for help ....  
 

  2. I'm using:

Linux linux02 2.4.21-215-athlon #1 Tue Apr 27 00:53:38 UTC 2004 i686 athlon 
i386 GNU/Linux

linux02:~ # fsck.reiserfs -V
reiserfsck 3.6.9 (2003 www.namesys.com)

linux02:~ # cat /proc/partitions
major minor  #blocks  name     rio rmerge rsect ruse wio wmerge wsect wuse 
running use aveq

  22     0    4117472 hdc 0 0 0 0 0 0 0 0 0 0 0
   3     0  117246528 hda 8889 17413 209632 2701232 2089 4870 56280 683559 0 
50759 3384870
   3     1     795186 hda1 2 3 16 1 0 0 0 0 0 1 1
   3     2  116439120 hda2 8880 17381 209560 2701121 2089 4870 56280 683559 0 
50667 3384759
   3    64   40209120 hdb 14 44 106 127 0 0 0 0 0 127 127
   3    65          1 hdb1 1 0 2 1 0 0 0 0 0 1 1
   3    69      16002 hdb5 1 3 8 0 0 0 0 0 0 0 0
   3    70     514048 hdb6 2 3 16 3 0 0 0 0 0 3 3
   3    71   39672486 hdb7 1 3 8 11 0 0 0 0 0 11 11

linux02:~ # hdparm /dev/hda

/dev/hda:
 multcount    = 16 (on)
 IO_support   =  0 (default 16-bit)
 unmaskirq    =  0 (off)
 using_dma    =  1 (on)
 keepsettings =  0 (off)
 readonly     =  0 (off)
 readahead    =  8 (on)
 geometry     = 14596/255/63, sectors = 234493056, start = 0

linux02:~ # cat /proc/ide/hda/model 
SAMSUNG SP1203N

linux02:~ # cat /proc/ide/hda/settings 
name                    value           min             max             mode
----                    -----           ---             ---             ----
acoustic                0               0               254             rw
address                 1               0               2               rw
bios_cyl                14596           0               65535           rw
bios_head               255             0               255             rw
bios_sect               63              0               63              rw
breada_readahead        8               0               255             rw
bswap                   0               0               1               r
current_speed           68              0               70              rw
failures                0               0               65535           rw
file_readahead          508             0               16384           rw
init_speed              69              0               70              rw
io_32bit                0               0               3               rw
keepsettings            0               0               1               rw
lun                     0               0               7               rw
max_failures            1               0               65535           rw
max_kb_per_request      128             1               255             rw
multcount               16              0               16              rw
nice1                   1               0               1               rw
nowerr                  0               0               1               rw
number                  0               0               3               rw
pio_mode                write-only      0               255             w
slow                    0               0               1               rw
unmaskirq               0               0               1               rw
using_dma               1               0               1               rw
wcache                  0               0               1               rw
linux02:~ # cat /proc/ide/sis 

SiS 5513 Ultra 100 chipset
--------------- Primary Channel ---------------- Secondary Channel 
-------------
Channel Status: On                               On 
Operation Mode: Compatible                       Compatible 
Cable Type:     80 pins                          80 pins
Prefetch Count: 512                              512
Drive 0:        Postwrite Enabled                Postwrite Disabled
                Prefetch  Enabled                Prefetch  Disabled
                UDMA Enabled                     UDMA Enabled
                UDMA Cycle Time    3 CLK         UDMA Cycle Time    6 CLK
                Data Active Time   3 PCICLK      Data Active Time   3 PCICLK
                Data Recovery Time 1 PCICLK      Data Recovery Time 1 PCICLK
Drive 1:        Postwrite Enabled                Postwrite Disabled
                Prefetch  Enabled                Prefetch  Disabled
                UDMA Enabled                     UDMA Disabled
                UDMA Cycle Time    6 CLK         UDMA Cycle Time    Reserved
                Data Active Time   3 PCICLK      Data Active Time   3 PCICLK
                Data Recovery Time 1 PCICLK      Data Recovery Time 1 PCICLK

mfg

  aotto
-- 
=================================================================
(C) Compiler-Factory, Dipl.-Ing Andreas Otto, Business Solutions
C, C++, Java, Tcl, Perl, HTML, DB, Sql, Shell, M4, GUI, Package
Remedy, Xetra, Eurex, Kondor, NetSnmp, Apache, Ldap, Tcl-Compiler
Sun-Solaris, Linux, Windows XP, Mac-OSX

