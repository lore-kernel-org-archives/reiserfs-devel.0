From: Scott A Crosby <scrosby@cs.rice.edu>
Subject: Terrible performance (<100kb/sec) in a cp -Raf
Date: 14 Jun 2004 08:25:24 -0500
Sender: scrosby@cs.rice.edu
Message-ID: <oyd4qpee0fv.fsf@bert.cs.rice.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19177-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello, as part of a planned migration of my computer from ext3 to
reiserfs I experienced terrible performance. I was running a stock
linux 2.6.6 kernel on AMD XP-2500+ CPU with 1.5gb of RAM.

I was copying about 26 gigabytes from an IDE hard drive to an external
USB HD when the bulk copy (cp -Raf) appeared to freeze. The HD did
nothing other than grind itself back and forth. Stracing the copy
operation showed the write() syscall blocking.

'vmstat 1' during the freeze reported:

 0  2  97716   9504  81208 1353328    0    0     0  1824 1989  2147  0  0  0 100
 0  2  97716   9504  81208 1353328    0    0     0  2132 2018  2235  0  3  0 97
 0  2  97716   9504  81208 1353328    0    0     0  1844 2019  2222  0  0  0 100
 0  2  97716   9520  81208 1353328    0    0     0  2108 2012  2239  0  0  0 100
 0  2  97716   9520  81208 1353328    0    0     0  1916 2037  2263  0  1  0 99

The result of running 'df' on the partitian every 10 seconds was:

/dev/sda1             26683112   4470492  22212620  17% /mnt/tmp
/dev/sda1             26683112   4484316  22198796  17% /mnt/tmp
/dev/sda1             26683112   4485976  22197136  17% /mnt/tmp
/dev/sda1             26683112   4486616  22196496  17% /mnt/tmp
/dev/sda1             26683112   4488252  22194860  17% /mnt/tmp
/dev/sda1             26683112   4488884  22194228  17% /mnt/tmp
/dev/sda1             26683112   4489524  22193588  17% /mnt/tmp
/dev/sda1             26683112   4489524  22193588  17% /mnt/tmp
/dev/sda1             26683112   4793412  21889700  18% /mnt/tmp
/dev/sda1             26683112   4873236  21809876  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873620  21809492  19% /mnt/tmp
/dev/sda1             26683112   4873748  21809364  19% /mnt/tmp

Notice I was getting under 100kb of writes/second out of the partitian
for about 30 seconds near the beginning of this log. before it seemed
to freeze completely. Normal performance for the drive under ext3 is
about 18mb/sec reading and 12mb/sec reading.

I considered that the problem might be hash collisions, so I
reformatted the partitian restarted the copy from scratch. I got about
the same freezing behavior at about the same spot in the copy
operation. A reformat for ext3 and a third copy had none of these
problems. I also checked the dmesg log for any IO errors and saw none.

After control-C'ing the copy and waiting for 5 minutes for the
grinding to stop I examined the destination to look for unique
properties at the point it appeared to freeze. The destination
filesystem tree showed an almost complete copy of the TIGER dataset
(3gb of data in 3000 files and 30 directories)

System version is:
    Linux version 2.6.6 (root@dragonlight) (gcc version 3.3.3 (Debian 20040401)) #12 Wed Jun 2 19:59:39 CDT 2004

I'm available for testing potential patches if the developers consider
this worth tracking down. If not, I'll wait for Reiser4.

Scott
