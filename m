From: "Thomas Graham" <lkthomas@sml.dyndns.org>
Subject: Re: segmentation fault in fsck
Date: Tue, 19 Aug 2003 00:18:34 +0800 (HKT)
Message-ID: <33230.192.168.0.99.1061223514.squirrel@sml.dyndns.org>
References: <1061269852.19511.17.camel@ayanami>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15371-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1061269852.19511.17.camel@ayanami>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: aphelion@snet.net
Cc: reiserfs-list@namesys.com

I got same problem
> The reiser4 fsck from the aug 18th snapshot as well as 0.4.11 cause a
> segfault on my machine, in repair_filter_node_check. This is a clean
> filesystem being checked that has never before been mounted.
>
> ayanami root # cat /proc/cpuinfo | grep -e 'model name' -e flags -e
> vendor
> vendor_id       : GenuineIntel
> model name      : Intel(R) Celeron(R) CPU 1.80GHz
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
> mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
>
> ayanami root # lspci
> 00:00.0 Host bridge: Silicon Integrated Systems [SiS] SiS645DX Host &
> Memory & AGP Controller
> 00:01.0 PCI bridge: Silicon Integrated Systems [SiS] SiS 530 Virtual
> PCI-to-PCI bridge (AGP)
> 00:02.0 ISA bridge: Silicon Integrated Systems [SiS] 85C503/5513
> 00:02.1 SMBus: Silicon Integrated Systems [SiS]: Unknown device 0016
> 00:02.2 USB Controller: Silicon Integrated Systems [SiS] USB 1.0
> Controller (rev 07)
> 00:02.3 USB Controller: Silicon Integrated Systems [SiS] USB 1.0
> Controller (rev 07)
> 00:02.5 IDE interface: Silicon Integrated Systems [SiS] 5513 [IDE] (rev
> d0)
> 00:03.0 Ethernet controller: Silicon Integrated Systems [SiS] SiS900
> 10/100 Ethernet (rev 90)
> 00:0a.0 Multimedia video controller: Brooktree Corporation Bt878 Video
> Capture (rev 11)
> 00:0a.1 Multimedia controller: Brooktree Corporation Bt878 Audio Capture
> (rev 11)
> 00:0b.0 Ethernet controller: Lite-On Communications Inc LNE100TX (rev
> 20)
> 00:0c.0 Multimedia audio controller: Creative Labs SB Live! EMU10k1 (rev
> 07)
> 00:0c.1 Input device controller: Creative Labs SB Live! MIDI/Game Port
> (rev 07)
> 01:00.0 VGA compatible controller: Matrox Graphics, Inc. MGA G400 AGP
> (rev 04)
>
> ayanami root # hdparm /dev/hda
>
> /dev/hda:
>  multcount    =  0 (off)
>  IO_support   =  0 (default 16-bit)
>  unmaskirq    =  0 (off)
>  using_dma    =  1 (on)
>  keepsettings =  0 (off)
>  readonly     =  0 (off)
>  readahead    = 256 (on)
>  geometry     = 19929/255/63, sectors = 320173056, start = 0
>
> ayanami root # uname -a
> Linux ayanami 2.6.0-test3 #1 Mon Aug 18 22:20:08 EDT 2003 i686 Intel(R)
> Celeron(R) CPU 1.80GHz GenuineIntel GNU/Linux
>
> ayanami root # gcc --version
> gcc (GCC) 3.3.1  (Gentoo Linux 3.3.1, propolice)
>
>
> ayanami root # gdb --args fsck.reiser4 -f -v --fixable /dev/hda1
> GNU gdb 5.3
> Copyright 2002 Free Software Foundation, Inc.
> GDB is free software, covered by the GNU General Public License, and you
> are
> welcome to change it and/or distribute copies of it under certain
> conditions.
> Type "show copying" to see the conditions.
> There is absolutely no warranty for GDB.  Type "show warranty" for
> details.
> This GDB was configured as "i686-pc-linux-gnu"...
> (no debugging symbols found)...
> (gdb) run
> Starting program: /sbin/fsck.reiser4 -f -v --fixable /dev/hda1
> /sbin/fsck.reiser4 0.4.11
> Copyright (C) 2001, 2002, 2003 by Hans Reiser, licensing governed by
> reiser4progs/COPYING.
>
>   *************************************************************
>   ** If you are using the latest reiser4progs and  it fails **
>   ** please  email bug reports to reiserfs-list@namesys.com, **
>   ** providing  as  much  information  as  possible --  your **
>   ** hardware,  kernel,  patches,  settings,  all  reiserfsk **
>   ** messages  (including version), the reiser4fsck logfile, **
>   ** check  the  syslog file  for  any  related information. **
>   ** If you would like advice on using this program, support **
>   ** is available  for $25 at  www.namesys.com/support.html. **
>   *************************************************************
>
> Will check consistency of the filesystem on (/dev/hda1).
> Will fix corruptions which can be fixed without rebuilding the tree.
> Will use (default) profile.
> Information:
> Continue?
> (Yes/No): Yes
>
> ***** fsck.reiser4 started at Tue Aug 19 00:56:54 2003
>
> ***** Openning the fs.
> Reiser4 fs was detected on the /dev/hda1.
> Master super block:
> offset:         16
> blksize:        4096
> magic:          R4Sb
> format:         0
> label:          <none>
>
> Format super block:
> plugin:         format40
> description:    Disk-format for reiser4, ver. 0.4.11
> offset:         17
> magic:          R4Sb-Default
> flushes:        0
> stamp:          0x19bbe448
> blocks:         1002046
> free blocks:    1001993
> root block:     21
> tail policy:    4
> next oid:       0x10000
> file count:     0
> tree height:    2
> key policy:     LARGE
>
> (no debugging symbols found)...(no debugging symbols found)...
> Program received signal SIGSEGV, Segmentation fault.
> 0x400ad5ab in repair_filter_node_check () from
> /usr/lib/librepair-0.4.so.11
> (gdb)
>
> when I tell it to write a log, it doesnt. it creates an empty file. I
> also see nothing in my system logs.
>
> ayanami root # cat /proc/filesystems | grep reiser
>         reiser4


-- 
HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
Phone number: 852-93239670    (24hours a day, 7days a week non-stop phone)
Web site: http://sml.dyndns.org
Email: lkthomas@sml.dyndns.org


