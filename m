From: Bernhard Sadlowski <sadlowsk@mathematik.Uni-Bielefeld.DE>
Subject: Stress test failure for reiserfs, but ext3 ok on Linux 2.4.20
Date: Wed, 15 Jan 2003 03:35:59 +0100
Sender: Bernhard Sadlowski <sadlowsk@Mathematik.Uni-Bielefeld.DE>
Message-ID: <20030115023559.GA14694@mathematik.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="oC1+HKm2/end4ao3"
Return-path: <reiserfs-list-return-12349-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I am using the attached stess.sh script (probably from this mailinglist)
for creating load on a reiserfs filesystem, which forks 100
(read,write,delete) processes: 

# mkreiserfs /dev/sda4
# mount /dev/sda4 /backup
# stress.sh -c /usr -n 100 /backup 

Then wait until /backup fills up.

# mount |grep sda
/dev/sda3 on / type ext3 (rw,errors=remount-ro)
/dev/sda2 on /boot type ext3 (rw,errors=remount-ro)
/dev/sda4 on /backup type reiserfs (rw)

# df -k / /boot /backup
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/sda3              4134932   3355468    569416  86% /
/dev/sda2               132221     72896     52498  59% /boot
/dev/sda4             12530312  12530312         0 100% /backup

# gcc -v
Reading specs from /usr/lib/gcc-lib/i386-linux/2.95.4/specs
gcc version 2.95.4 20011002 (Debian prerelease)

# uname -a
Linux dematl06 2.4.20-p4-debug #1 SMP Wed Jan 15 00:48:49 CET 2003 i686 unknown

The Machine is Debian woody box with 2 x 2.40 GHz Intel Xeon (4 virtual
CPUs). 

# uptime
 03:04:18 up  1:02,  1 user,  load average: 100.99, 100.83, 89.56

This happens on reiserfs:

# iostat 1
avg-cpu:  %user   %nice    %sys   %idle
           0.00    0.00    0.00  100.00

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
dev8-0            0.00         0.00         0.00          0          0
dev8-1            0.00         0.00         0.00          0          0

# vmstat 1
   procs                      memory    swap          io     system       cpu
 r  b  w   swpd   free   buff  cache  si  so    bi    bo   in    cs   us  sy  id
 0 100  1   4932   8404 117916 1559292   0   1   206   950   81   211   0   6  94
 0 100  1   4932   8404 117916 1559292   0   0     0     0  107     6   0   0 100
 0 100  1   4932   8404 117916 1559292   0   0     0     0  106    10   0   0 100
 0 100  1   4932   8404 117916 1559292   0   0     0     0  105     6   0   0 10
...

Any I/O freezes and even after killing the script, the remaining cp and
mv commands don't terminate. They are in status "D". A simle "ls
/backup" never comes back. Only a hard powerdown fixes this situation,
because "init 6" etc. doesn't work. I have even activated the reiserfs
debug, but I don't see any additional info.

# ls -l /backup &
[2] 1432

# ps ax|grep ls
 1432 pts/0    D      0:00 ls -l /backup
 1445 pts/0    S      0:00 grep ls
 
# kill -9 1432

# ps ax|grep ls
 1432 pts/0    D      0:00 ls -l /backup
 1450 pts/0    S      0:00 grep ls

If I use the jfs Filesystem, the same thing happens.

If I use ext3, everything is fine, and the cp/mv/rm processes proceed
even with full filesystem /backup and load = 100. iostat and vmstat
still show I/O on filesystem /backup.

The Kernel is a Standard 2.4.20 Kernel only with one additional patch
for the SK9Dxx Gigabit Ethernet Adapter from Syskonnect. During the
Tests this module (sk9dlin) is not loaded.

I used several kernels.... 2.4.19, 2.4.20, 2.4.20-ac2, 2.4.21-pre3. All
with same results.

Is something wrong? What is wrong? 

# lsmod
Module                  Size  Used by    Not tainted
reiserfs              250656   1  (autoclean)
nfs                    67676   1  (autoclean)
lockd                  47680   1  (autoclean) [nfs]
sunrpc                 64692   1  (autoclean) [nfs lockd]
eepro100               18380   1  (autoclean)
mii                     2400   0  (autoclean) [eepro100]
md                     57344   0  (autoclean)
lvm-mod                59360   0 
rtc                     6492   0  (autoclean)
unix                   15716  62  (autoclean)

# dmesg | tail -9
reiserfs:warning: CONFIG_REISERFS_CHECK is set ON
reiserfs:warning: - it is slow mode for debugging.
reiserfs: checking transaction log (device 08:04) ...
journal-1153: found in header: first_unflushed_offset 6,
last_flushed_trans_id 11
journal-1206: Starting replay from offset 6, trans_id 12
journal-1299: Setting newest_mount_id to 11
Using r5 hash to sort names
ReiserFS version 3.6.25
vs-8301: reiserfs_kmalloc: allocated memory 200904

# lspci
00:00.0 Host bridge: Intel Corp. e7500 [Plumas] DRAM Controller (rev 03)
00:00.1 Class ff00: Intel Corp. e7500 [Plumas] DRAM Controller Error Reporting (rev 03)
00:02.0 PCI bridge: Intel Corp. e7500 [Plumas] HI_B Virtual PCI Bridge (F0) (rev 03)
00:1d.0 USB Controller: Intel Corp. 82801CA/CAM USB (Hub  (rev 02)
00:1d.1 USB Controller: Intel Corp. 82801CA/CAM USB (Hub  (rev 02)
00:1d.2 USB Controller: Intel Corp. 82801CA/CAM USB (Hub  (rev 02)
00:1e.0 PCI bridge: Intel Corp. 82801BA/CA/DB PCI Bridge (rev 42)
00:1f.0 ISA bridge: Intel Corp. 82801CA ISA Bridge (LPC) (rev 02)
00:1f.1 IDE interface: Intel Corp. 82801CA IDE U100 (rev 02)
00:1f.3 SMBus: Intel Corp. 82801CA/CAM SMBus (rev 02)
01:1c.0 PIC: Intel Corp. 82870P2 P64H2 I/OxAPIC (rev 03)
01:1d.0 PCI bridge: Intel Corp. 82870P2 P64H2 Hub PCI Bridge (rev 03)
01:1e.0 PIC: Intel Corp. 82870P2 P64H2 I/OxAPIC (rev 03)
01:1f.0 PCI bridge: Intel Corp. 82870P2 P64H2 Hub PCI Bridge (rev 03)
03:01.0 Ethernet controller: Syskonnect (Schneider & Koch) Gigabit Ethernet (rev 10)
03:02.0 SCSI storage controller: Adaptec AIC-7899P U160/m (rev 01)
03:02.1 SCSI storage controller: Adaptec AIC-7899P U160/m (rev 01)
03:04.0 Ethernet controller: Intel Corp. 82544GC Gigabit Ethernet Controller (LOM) (rev 02)
04:01.0 VGA compatible controller: ATI Technologies Inc Rage XL (rev 27)
04:02.0 Ethernet controller: Intel Corp. 82557/8/9 [Ethernet Pro 100] (rev 0d)

# cat /proc/cpuinfo 
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Xeon(TM) CPU 2.40GHz
stepping        : 7
cpu MHz         : 2395.954
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov 
bogomips        : 4784.12

same for processor 1, 2, 3...

Bernhard

--oC1+HKm2/end4ao3
Content-Type: application/x-sh
Content-Disposition: attachment; filename="stress.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/bash -=0A# -*- Shell-script -*-=0A#=0A# Copyright (C) 1999 Bibliotec=
h Ltd., 631-633 Fulham Rd., London SW6 5UQ.=0A#=0A# $Id: stress.sh,v 1.2 19=
99/02/10 10:58:04 rich Exp $=0A#=0A# Change log:=0A#=0A# $Log: stress.sh,v =
$=0A# Revision 1.2  1999/02/10 10:58:04  rich=0A# Use cp instead of tar to =
copy.=0A#=0A# Revision 1.1  1999/02/09 15:13:38  rich=0A# Added first versi=
on of stress test program.=0A#=0A=0A# Stress-test a file system by doing mu=
ltiple=0A# parallel disk operations. This does everything=0A# in MOUNTPOINT=
/stress.=0A=0Anconcurrent=3D50=0Acontent=3D/usr/share/doc=0Astagger=3Dyes=
=0A=0Awhile getopts "c:n:s" c; do=0A    case $c in=0A    c)=0A	content=3D$O=
PTARG=0A	;;=0A    n)=0A	nconcurrent=3D$OPTARG=0A	;;=0A    s)=0A	stagger=3Dn=
o=0A	;;=0A    *)=0A	echo 'Usage: stress.sh [-options] MOUNTPOINT'=0A	echo '=
Options: -c Content directory'=0A	echo '         -n Number of concurrent ac=
cesses (default: 4)'=0A	echo '         -s Avoid staggerring start times'=0A=
	exit 1=0A	;;=0A    esac=0Adone=0A=0Ashift $(($OPTIND-1))=0Aif [ $# -ne 1 ]=
; then=0A    echo 'For usage: stress.sh -?'=0A    exit 1=0Afi=0A=0Amountpoi=
nt=3D$1=0A=0Aecho 'Number of concurrent processes:' $nconcurrent=0Aecho 'Co=
ntent directory:' $content '(size:' `du -s $content | awk '{print $1}'` 'KB=
)'=0A=0A# Check the mount point is really a mount point.=0A=0A#if [ `df | a=
wk '{print $6}' | grep ^$mountpoint\$ | wc -l` -lt 1 ]; then=0A#    echo $m=
ountpoint: This doesn\'t seem to be a mountpoint. Try not=0A#    echo to us=
e a trailing / character.=0A#    exit 1=0A#fi=0A=0A# Create the directory, =
if it doesn't exist.=0A=0Aecho Warning: This will DELETE anything in $mount=
point/stress. Type yes to confirm.=0Aread line=0Aif [ "$line" !=3D "yes" ];=
 then=0A    echo "Script abandoned."=0A    exit 1=0Afi=0A=0Aif [ ! -d $moun=
tpoint/stress ]; then=0A    rm -rf $mountpoint/stress=0A    if ! mkdir $mou=
ntpoint/stress; then=0A	echo Problem creating $mountpoint/stress directory.=
 Do you have sufficient=0A	echo access permissions\?=0A	exit 1=0A    fi=0Af=
i=0A=0Aecho Created $mountpoint/stress directory.=0A=0A# Construct MD5 sums=
 over the content directory.=0A=0Aecho -n "Computing MD5 sums over content =
directory: "=0A( cd $content && find . -type f -print0 | xargs -0 md5sum | =
sort -k 2 -o $mountpoint/stress/content.sums )=0Aecho done.=0A=0A# Start th=
e stressing processes.=0A=0Aecho -n "Starting stress test processes: "=0A=
=0Apids=3D""=0A=0Ap=3D1=0Awhile [ $p -le $nconcurrent ]; do=0A    echo -n "=
$p "=0A=0A    (=0A=0A	# Wait for all processes to start up.=0A	if [ "$stagg=
er" =3D "yes" ]; then=0A	    sleep $((10*$p))=0A	else=0A	    sleep 10=0A	fi=
=0A=0A	while true; do=0A=0A	    # Remove old directories.=0A	    echo -n "D=
$p "=0A	    rm -rf $mountpoint/stress/$p=0A=0A	    # Copy content -> partit=
ion.=0A	    echo -n "W$p "=0A	    mkdir $mountpoint/stress/$p=0A	    #( cd =
$content && tar cf - . ) | ( cd $mountpoint/stress/$p && tar xf - )=0A	    =
cp -ax $content/* $mountpoint/stress/$p=0A=0A	    # Compare the content and=
 the copy.=0A	    echo -n "R$p "=0A	    ( cd $mountpoint/stress/$p && find =
. -type f -print0 | xargs -0 md5sum | sort -k 2 -o /tmp/stress.$$.$p )=0A	 =
   diff $mountpoint/stress/content.sums /tmp/stress.$$.$p=0A	    rm -f /tmp=
/stress.$$.$p=0A	done=0A    ) &=0A=0A    pids=3D"$pids $!"=0A=0A    p=3D$((=
$p+1))=0Adone=0A=0Aecho=0Aecho "Process IDs: $pids"=0Aecho "Press ^C to kil=
l all processes"=0A=0Atrap "kill $pids" SIGINT=0A=0Await=0A=0Akill $pids=0A
--oC1+HKm2/end4ao3--
