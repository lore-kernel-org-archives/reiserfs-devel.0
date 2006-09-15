From: "=?ISO-8859-2?Q?Grzegorz_Ja=B6kiewicz?=" <gryzman@gmail.com>
Subject: v3 rebuild-tree left system in unusable state because of space shortage
Date: Fri, 15 Sep 2006 10:25:24 +0200
Message-ID: <2f4958ff0609150125w123284b0if6f59ca0a6df8d05@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29895-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

I had little problem, deleted a 4GB file, but this space was never
freed , but file was gone. So I decided to run -check - no problems
found, next step was to rebuild tree:

root@gj1box:~# fsck.reiserfs --rebuild-tree  -y /dev/hda3
reiserfsck 3.6.19 (2003 www.namesys.com)

*************************************************************
** Do not  run  the  program  with  --rebuild-tree  unless **
** something is broken and MAKE A BACKUP  before using it. **
** If you have bad sectors on a drive  it is usually a bad **
** idea to continue using it. Then you probably should get **
** a working hard drive, copy the file system from the bad **
** drive  to the good one -- dd_rescue is  a good tool for **
** that -- and only then run this program.                 **
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will rebuild the filesystem (/dev/hda3) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
Replaying journal..
Reiserfs journal '/dev/hda3' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Fri Sep 15 09:14:59 2006
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 31232367 blocks marked used
Skipping 9164 blocks (super block, journal, bitmaps) 31223203 blocks
will be read
0%....20%....40%....60%....80%....100%                       left 0, 10725 /sec
383576 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 31223203
                Leaves among those 214478
                Objectids found 383578

Pass 1 (will try to insert 214478 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....Not enough allocable blocks,
checking bitmap...there are 1 allocable blocks, btw

out of disk space
Aborted


root@gj1box:~# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 8
model name      : Pentium III (Coppermine)
stepping        : 6
cpu MHz         : 797.453
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 mmx fxsr sse
bogomips        : 1581.05

root@gj1box:~# lspci
0000:00:00.0 Host bridge: Intel Corp. 82815 815 Chipset Host Bridge
and Memory Controller Hub (rev 02)
0000:00:02.0 VGA compatible controller: Intel Corp. 82815 CGC [Chipset
Graphics Controller] (rev 02)
0000:00:1e.0 PCI bridge: Intel Corp. 82801 PCI Bridge (rev 01)
0000:00:1f.0 ISA bridge: Intel Corp. 82801BA ISA Bridge (LPC) (rev 01)
0000:00:1f.1 IDE interface: Intel Corp. 82801BA IDE U100 (rev 01)
0000:00:1f.4 USB Controller: Intel Corp. 82801BA/BAM USB (Hub #2) (rev 01)
0000:02:08.0 Ethernet controller: Intel Corp. 82801BA/BAM/CA/CAM
Ethernet Controller (rev 01)
0000:02:09.0 FireWire (IEEE 1394): VIA Technologies, Inc. IEEE 1394
Host Controller (rev 80)
root@gj1box:~# dmesg|grep hda
[4294673.965000]     ide0: BM-DMA at 0x2020-0x2027, BIOS settings:
hda:DMA, hdb:pio
[4294674.229000] hda: ST3160812A, ATA DISK drive
[4294677.878000] hda: max request size: 1024KiB
[4294677.921000] hda: 312581808 sectors (160041 MB) w/8192KiB Cache,
CHS=19457/255/63, UDMA(100)

 fsck.reiserfs -V
reiserfsck 3.6.19 (2003 www.namesys.com)

Linux gj1box 2.6.12-10-386 #1 Thu Sep 14 09:34:39 UTC 2006 i686 GNU/Linux

what shall I do?

-- 
GJ
