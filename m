From: luferbu@fluidsignal.com (Luis Bustamante)
Subject: reiserfsck aborts when rebuilding filesystem tree
Date: Fri, 13 Sep 2002 16:17:53 -0500
Message-ID: <87admlk2ri.fsf@zealot.fluidsignal.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11439-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi list,

I got my partition table deleted, but I knew the exact size of each
partition, so I created again the table. But I was unable to mount one
ReiserFS partition (/home duh!), I got the error "read_super_block:
can't find a reiserfs file system", so I rebuilded the superblock with
--rebuild-sb option without problems. After that I'm trying to rebuild
the entire filesystem tree using:
reiserfsck --logfile rebuild.log --rebuild-tree /dev/hda8
but it aborts with the message "No reiserfs metadata found". I'm able to
dump the metadata with the command: 
debugreiserfs -p /dev/hda8 |gzip -c > metadata.gz
and it's about 33Mb compressed. Any ideas why I can't rebuild the
filesystem tree? it seems metadata is still there, if you want I can
put the dump of debugreiserfs somewhere so you can have a look. I'm
using reiserfsprogs 3.6.3 (default Debian unstable package) and kernel
2.4.18.

Cheers,

-- 
Luis Bustamante                       mailto:luferbu@debian.org
The Debian Project            http://people.debian.org/~luferbu



Output from reiserfsck:
Replaying journal..
0 transactions replayed
###########
reiserfsck --rebuild-tree started at Fri Sep 13 15:59:11 2002
###########

Pass 0:
Loading on-disk bitmap .. ok, 8266 blocks marked used
Skipping 8266 blocks (super block, journal, bitmaps) 0 blocks will be
read

        "r5" hash is selected
Flushing..done
        Read blocks (but not data blocks) 0
                Leaves among those 0
                Objectids found 2

Pass 1 (will try to insert 0 leaves):
Looking for allocable blocks .. ok

Flushing..done
        0 leaves read
                0 inserted
Flushing..done



No reiserfs metadata found


Aborted

