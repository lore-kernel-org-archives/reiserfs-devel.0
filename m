From: Jeff Breidenbach <jbreiden@parc.com>
Subject: disk or reiserfs problem?
Date: Wed, 28 May 2003 13:07:27 PDT
Message-ID: <E19L7Co-0002Sb-00@rode.parc.com>
Return-path: <reiserfs-list-return-14284-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


This is after a hard (power switch) reboot (due to I/O errors). The
disk in question has about 125 GB of data on a single 200GB reiserfs
partition. Do people think the disk is toast, or is this possibly some
correctable filesystem problem? The machine is remote, so I can't
tell if the disk is making funny grinding noises. Uptime was about
45 days with high disk load before the problem occurred.

Any suggestions appreciated.

-Jeff




root@toko:~# mount -t reiserfs /dev/hdb1 /data1
mount: wrong fs type, bad option, bad superblock on /dev/hdb1,
       or too many mounted file systems
       (could this be the IDE device where you in fact use
       ide-scsi so that sr0 or sda or so is needed?)


root@toko:~# reiserfsck /dev/hdb1
 
<-------------reiserfsck, 2002------------->
reiserfsprogs 3.6.3
 
Will read-only check consistency of the filesystem on /dev/hdb1
Will put log info to 'stdout'
 
Do you want to run this program?[N/Yes] (note need to type Yes):Yes
 
bread: Cannot read a block # 2.


root@toko:~# dmesg | tail
hdb1: bad access: block=35, count=5
end_request: I/O error, dev 03:41 (hdb), sector 35
hdb1: bad access: block=36, count=4
end_request: I/O error, dev 03:41 (hdb), sector 36
hdb1: bad access: block=37, count=3
end_request: I/O error, dev 03:41 (hdb), sector 37
hdb1: bad access: block=38, count=2
end_request: I/O error, dev 03:41 (hdb), sector 38
hdb1: bad access: block=39, count=1
end_request: I/O error, dev 03:41 (hdb), sector 39

root@toko:~# cat /proc/version
Linux version 2.4.20-xfs (knoppix@Knoppix) (gcc version 2.95.4 20011002 (Debian prerelease)) #1 SMP Die Dez 10 20:07:25 CET 2002
