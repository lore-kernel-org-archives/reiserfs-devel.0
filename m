From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: v3 rebuild-tree left system in unusable state because of space shortage
Date: Fri, 15 Sep 2006 13:43:39 +0400
Message-ID: <200609151343.39692.vs@namesys.com>
References: <2f4958ff0609150125w123284b0if6f59ca0a6df8d05@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29896-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff0609150125w123284b0if6f59ca0a6df8d05@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Grzegorz =?utf-8?q?Ja=C5=9Bkiewicz?= <gryzman@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Friday 15 September 2006 12:25, Grzegorz Ja=C5=9Bkiewicz wrote:
> I had little problem, deleted a 4GB file, but this space was never
> freed , but file was gone. So I decided to run -check - no problems
> found, next step was to rebuild tree:
>=20
> root@gj1box:~# fsck.reiserfs --rebuild-tree  -y /dev/hda3
> reiserfsck 3.6.19 (2003 www.namesys.com)
>=20
> *************************************************************
> ** Do not  run  the  program  with  --rebuild-tree  unless **
> ** something is broken and MAKE A BACKUP  before using it. **
> ** If you have bad sectors on a drive  it is usually a bad **
> ** idea to continue using it. Then you probably should get **
> ** a working hard drive, copy the file system from the bad **
> ** drive  to the good one -- dd_rescue is  a good tool for **
> ** that -- and only then run this program.                 **
> ** If you are using the latest reiserfsprogs and  it fails **
> ** please  email bug reports to reiserfs-list@namesys.com, **
> ** providing  as  much  information  as  possible --  your **
> ** hardware,  kernel,  patches,  settings,  all reiserfsck **
> ** messages  (including version),  the reiserfsck logfile, **
> ** check  the  syslog file  for  any  related information. **
> ** If you would like advice on using this program, support **
> ** is available  for $25 at  www.namesys.com/support.html. **
> *************************************************************
>=20
> Will rebuild the filesystem (/dev/hda3) tree
> Will put log info to 'stdout'
>=20
> Do you want to run this program?[N/Yes] (note need to type Yes if you do)=
:Yes
> Replaying journal..
> Reiserfs journal '/dev/hda3' in blocks [18..8211]: 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Fri Sep 15 09:14:59 2006
> ###########
>=20
> Pass 0:
> ####### Pass 0 #######
> Loading on-disk bitmap .. ok, 31232367 blocks marked used
> Skipping 9164 blocks (super block, journal, bitmaps) 31223203 blocks
> will be read
> 0%....20%....40%....60%....80%....100%                       left 0, 1072=
5 /sec
> 383576 directory entries were hashed with "r5" hash.
>         "r5" hash is selected
> Flushing..finished
>         Read blocks (but not data blocks) 31223203
>                 Leaves among those 214478
>                 Objectids found 383578
>=20
> Pass 1 (will try to insert 214478 leaves):
> ####### Pass 1 #######
> Looking for allocable blocks .. finished
> 0%....20%....40%....60%....80%....Not enough allocable blocks,
> checking bitmap...there are 1 allocable blocks, btw
>=20
> out of disk space
> Aborted
>=20
>=20
> root@gj1box:~# cat /proc/cpuinfo
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 8
> model name      : Pentium III (Coppermine)
> stepping        : 6
> cpu MHz         : 797.453
> cache size      : 256 KB
> fdiv_bug        : no
> hlt_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 2
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
> mca cmov pat pse36 mmx fxsr sse
> bogomips        : 1581.05
>=20
> root@gj1box:~# lspci
> 0000:00:00.0 Host bridge: Intel Corp. 82815 815 Chipset Host Bridge
> and Memory Controller Hub (rev 02)
> 0000:00:02.0 VGA compatible controller: Intel Corp. 82815 CGC [Chipset
> Graphics Controller] (rev 02)
> 0000:00:1e.0 PCI bridge: Intel Corp. 82801 PCI Bridge (rev 01)
> 0000:00:1f.0 ISA bridge: Intel Corp. 82801BA ISA Bridge (LPC) (rev 01)
> 0000:00:1f.1 IDE interface: Intel Corp. 82801BA IDE U100 (rev 01)
> 0000:00:1f.4 USB Controller: Intel Corp. 82801BA/BAM USB (Hub #2) (rev 01)
> 0000:02:08.0 Ethernet controller: Intel Corp. 82801BA/BAM/CA/CAM
> Ethernet Controller (rev 01)
> 0000:02:09.0 FireWire (IEEE 1394): VIA Technologies, Inc. IEEE 1394
> Host Controller (rev 80)
> root@gj1box:~# dmesg|grep hda
> [4294673.965000]     ide0: BM-DMA at 0x2020-0x2027, BIOS settings:
> hda:DMA, hdb:pio
> [4294674.229000] hda: ST3160812A, ATA DISK drive
> [4294677.878000] hda: max request size: 1024KiB
> [4294677.921000] hda: 312581808 sectors (160041 MB) w/8192KiB Cache,
> CHS=3D19457/255/63, UDMA(100)
>=20
>  fsck.reiserfs -V
> reiserfsck 3.6.19 (2003 www.namesys.com)
>=20
> Linux gj1box 2.6.12-10-386 #1 Thu Sep 14 09:34:39 UTC 2006 i686 GNU/Linux
>=20
> what shall I do?
>=20

while there is no fix currently for this problem you can solve the problem =
by expanding underlaying device.
One possible solution is to setup a linear array. In the example below I ha=
d "out of disk space" with rebuild-tree /dev/loop0,=20
created 1000 block extention file and losetup-ed it as /dev/loop1,=20
created linear array /dev/md0 of /dev/loop0 and /dev/loop1
and ran reiserfsck --rebuild-sb /dev/md0 to fix number of blocks in the fil=
esystem=20
and reiserfsck --rebuild-tree /dev/md0.

1) dd if=3D/dev/zero of=3Dext-1000 count=3D1000 bs=3D4096
loseup /dev/loop1 ext-1000

2) create linear raid
mdadm -B /dev/md0 --level=3Dlinear --raid-devices=3D2 /dev/loop0 /dev/loop1

3) rebuild super block on /dev/md0
reiserfsck --rebuild-sb /dev/md0
Did you use resizer(y/n)[n]:n
=2E..
rebuild-sb: wrong block count occured (100000), fixed (100992)
=2E..
Is this ok ? (y/n)[n]: y

4) rebuild filesystem
reiserfsck --rebuild-tree /dev/md0


