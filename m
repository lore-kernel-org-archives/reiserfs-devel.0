From: "Lelsie Rhorer" <lrhorer@satx.rr.com>
Subject: Problem with reiserfs volume
Date: Sat, 4 Apr 2009 12:25:32 -0500
Message-ID: <20090404172534.YQIW19140.cdptpa-omta03.mail.rr.com@Leslie>
Reply-To: <lrhorer@satx.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


I know this is a development list, so if I am posting in the wrong list,
please forgive me and point me toward the correct one.

I'm having a severe problem whose root cause I cannot determine.  I have a
RAID 6 array managed by mdadm running on Debian "Lenny" with a 3.2GHz AMD
Athlon 64 x 2 processor and 8G of RAM.  The kernel is 2.6.26-1-amd64.  There
are ten 1 Terabyte SATA drives, unpartitioned, fully allocated to the
/dev/md0 device. The drive are served by 3 Silicon Image SATA port
multipliers and a Silicon Image 4 port eSATA controller.  The /dev/md0
device is also unpartitioned, and all 8T of active space is formatted as a
single Reiserfs file system.  The entire volume is mounted to /RAID.
Various directories on the volume are shared using both NFS and SAMBA.

Performance of the RAID system is very good.  The array can read and write
at over 450 Mbps, and I don't know if the limit is the array itself or the
network, but since the performance is more than adequate I really am not
concerned which is the case.

The issue is the entire array will occasionally pause completely for about
40 seconds when a file is created.  This does not always happen, but the
situation is easily reproducible.  The frequency at which the symptom occurs
seems to be somewhat related to the transfer load on the array.  If no other
transfers are in process, then the failure seems somewhat more rare, perhaps
accompanying less than 1 file creation in 10..  During heavy file transfer
activity, sometimes the system halts with every other file creation.
Although I have observed many dozens of these events, I have never once
observed it to happen except when a file creation occurs. 
Reading and writing existing files never triggers the event, although any
read or write occurring during the event is halted for the duration. 
(There is one cron jog which runs every half-hour that creates a tiny file;
this is the most common failure vector.)  There are other drives formatted
with other file systems on the machine, but the issue has never been seen on
any of the other drives.  When the array runs its regularly scheduled health
check, the problem is much worse.  Not only does it lock up with almost
every single file creation, but the lock-up time is much longer - sometimes
in excess of 2 minutes.

Transfers via Linux based utilities (ftp, NFS, cp, mv, rsync, etc) all
recover after the event, but SAMBA based transfers frequently fail, both
reads and writes.

I discussed the matter over on the linux-raid list, but so far none of the
suggestions there have yielded any great progress in fixing the issue.

