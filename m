From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: Calling stat with millions of files
Date: Tue, 08 Jun 2004 11:58:46 -0700
Message-ID: <1086721127.20554.24.camel@ipso.snappymail.ca>
References: <Pine.LNX.4.58.0406071735290.30177@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0406071735290.30177@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ross Skaliotis <mross@rs-net.org>
Cc: reiserfs-list@namesys.com

I'm currently using the "Rsync Snapshot" 

http://www.mikerubel.org/computers/rsync_snapshots/

backup method with a 340Gb RAID5 array on a PIII-800 with 256mb RAM.
Currently used is about 200gb in 68 million files. I would guess over
75% are hard links.

My mount options are: notail,noatime,nodiratime
Kernel: 2.6.3-7mdk

The Performance I'm seeing is pretty good, I don't have any complaints. 

My directory structure looks like this:

backup/ <-- main directory, no hard links at all
backup_May_22_2004-12_11_23/ 
backup_May_22_2004-19_09_15/
backup_May_23_2004-12_06_29/
backup_May_23_2004-19_07_10/
backup_May_24_2004-12_06_11/
backup_May_24_2004-19_07_05/
backup_May_25_2004-12_14_06/
backup_May_25_2004-19_17_25/
...

Now I'll pick the main directory (backup) the oldest directory, and the
newest directory to do "ls -lR" tests on:

[backup/]# time ls -lR | wc
13.41user 11.89system 1:12.13elapsed 35%CPU (0avgtext+0avgdata
0maxresident)k
0inputs+0outputs (0major+4316minor)pagefaults 0swaps
 384035 3170729 22214505

[backup_February_01_2004-19_06_01/]# time ls -lR | wc
9.33user 8.98system 0:39.44elapsed 46%CPU (0avgtext+0avgdata
0maxresident)k
0inputs+0outputs (0major+2855minor)pagefaults 0swaps
 278517 2271694 15731940

[backup_June_07_2004-12_19_57/]# time ls -lR | wc
13.57user 12.14system 1:15.01elapsed 34%CPU (0avgtext+0avgdata
0maxresident)k
0inputs+0outputs (0major+4317minor)pagefaults 0swaps
 383918 3169608 22207182

~60 seconds to "ls -lR" over 300,000 files seems pretty decent. Much
better then 45 seconds to do 1000 files that for sure.

Hope this helps to at least give you another data point. 


On Mon, 2004-06-07 at 17:54 -0400, Ross Skaliotis wrote:
> We have a backup system (backupPC) that is responsible for backing up
> millions of files and holding over 2 TB of data. The backup system saves
> space by creating hard links where it can. This actually reduces the total
> size down to 200 GB, however there are still millions of files/hard links.
> 
> What does this have to do with reiserfs? Well, the partition runs reiserfs
> 3.6. Over the course of a few months (and the addition of millions more
> files/hard links) the performance of the filesystem has become painfully
> slow.
> 
> In a directory of ~1000 files, running 'ls -l' or 'stat *' takes 45
> seconds to complete (assuming nothing is previously cached). We are using
> the r5 hash, and mount the filesystem with noatime. No one directory has
> (or will ever have) more than about 2000 files and hard links inside.
> 
> Is this performance decrease when calling stat to be expected with
> increasing millions of files/hard links? Would XFS or another filesystem
> get around this somehow? I'd rather not use reiserfs4, as this is a
> production backup server and needs to be as stable as possible.
> 
> Thanks very much for your help,
> 
> -Ross Skaliotis
-- 
Mike Benoit <ipso@snappymail.ca>

