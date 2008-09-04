From: Mat <jackdachef@gmail.com>
Subject: Re: Re: reiserfs =?utf-8?b?ZG9fam91cm5hbF9lbmQ=?= unnecessary hd wake up?
Date: Thu, 4 Sep 2008 21:16:49 +0000 (UTC)
Message-ID: <loom.20080904T211127-782@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

ok, then try the following:

you at least should have noatime,nodiratime,commit=600 

enabled for the reiserfs or >=ext3 filesystems

you can also try data=writeback (but beware this might put your data at risk !)


select the anticipatory i/o scheduler 
and set following stuff

echo "16" > /proc/sys/vm/page-cluster
# default: 3
#

echo "60" > /proc/sys/vm/swappiness
# default: 60
# By default, Linux will aggressively swap processes out of physical memory onto
disk in order to keep the disk cache as large as possible. 
# This means that pages that haven't been used recently will be pushed into swap
long before the system even comes close to running out of memory, which is an
unexpected behavior compared to some operating systems. 
# The /proc/sys/vm/swappiness parameter controls how aggressive Linux is in this
area. 

echo "3000" > /proc/sys/vm/dirty_expire_centisecs
# default: 3000 (30 seconds)
#2 how long data can be in the page cache before it is considered expired and
must be written at the next opportunity. Note that this default is very long: a
full 30 seconds. That means that under normal circumstances, unless you write
enough to trigger the other pdflush method, Linux won't actually commit anything
you write until 30 seconds later.

echo "6000"  > /proc/sys/vm/dirty_writeback_centisecs
# default: 500 (5 seconds)
#1 how often pdflush wakes up to write data to disk. The default wakes up the
two (or more) active threads every five seconds.
# suggestion: 6000 (every 60 seconds)

echo "15" > /proc/sys/vm/dirty_background_ratio
# default: 10
#3 Maximum percentage of active memory that can be filled with dirty pages
before pdflush begins to write them

echo "50"   > /proc/sys/vm/dirty_ratio #modified
# default: 40
#4 Maximum percentage of total memory that can be filled with dirty pages before
processes are forced to write dirty buffers themselves during their time slice
instead of being allowed to do more writes.
# modified: 50

echo "25" > /proc/sys/vm/vfs_cache_pressure

for i in /sys/block/sd*; do
         /bin/echo "anticipatory" >  $i/queue/scheduler
done

for i in /sys/block/sd*; do
         /bin/echo "0" >  $i/queue/iosched/antic_expire
done

for i in /sys/block/sd*; do
         /bin/echo "150" >  $i/queue/iosched/read_expire
done

for i in /sys/block/sd*; do
         /bin/echo "750" >  $i/queue/iosched/read_batch_expire
done

for i in /sys/block/sd*; do
         /bin/echo "1200" >  $i/queue/iosched/write_batch_expire
done

for i in /sys/block/sd*; do
         /bin/echo "1024" >  $i/queue/nr_requests
done

for i in /sys/block/sd*; do
         /bin/echo "256" >  $i/queue/read_ahead_kb
done

for i in /sys/block/sd*; do
         /bin/echo "256" >  $i/queue/max_sectors_kb
done

for i in /sys/class/scsi_host/host*; do
         /bin/echo "min_power" >  $i/link_power_management_policy
done




try to disable each and every unneeded daemon or applets, programs, etc.

by using:

* powertop
* iotop
* htop
* top
* lsof | grep /home
* ...



