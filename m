From: "David Dabbs" <david@dabbs.net>
Subject: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Thu, 5 Aug 2004 23:54:38 -0500
Message-ID: <20040806045809.E195B15C9F@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20032-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'ReiserFS List' <reiserfs-list@namesys.com>


Ran 

./mongo.pl INFO_R4=rc2-mm2 FSTYPE=reiser4 LOG=/home/ddabbs/mongo/reiser4.log
dev=/dev/hdb1 dir=/mnt/testfs file_size=8000 bytes=512000000 NPROC=3
REP_COUNTER=3 SYNC=off WRITE_BUFFER=4096 GAMMA=0.0 DD_MBCOUNT=768
PHASE_MKDIRS=on PHASE_MKFILES=on PHASE_COPY=cp PHASE_OVERWRITE=on
PHASE_APPEND=on PHASE_READ=find PHASE_DELETE=rm PHASE_MODIFY=on
MAX_FNAME_LEN=23 RUN

Somewhere during PHASE_COPY, errors similar to the following (the ones I saw
the other day) spewed across the terminal:

cp: cannot stat
`/mnt/testfs/testdir0-0-0/d00000000/d000000000000000022/d0000000000023/f1461
8.d': Input/output error

I can cat and ls the file:

-rw-r--r--  1 root root 7512 2004-08-05 21:54
/mnt/testfs/testdir0-0-0/d00000000/d000000000000000022/d0000000000023/f14622
.c

Other than the following log items

...
Aug  5 22:06:09 linux kernel: reiser4[cp(1088)]: cbk_level_lookup
(fs/reiser4/search.c:1033)[vs-3533]:
Aug  5 22:06:09 linux kernel: WARNING: Keys are inconsistent. Fsck?
Aug  5 22:06:09 linux kernel: ]: key_warning
(fs/reiser4/plugin/object.c:97)[nikita-717]:
Aug  5 22:06:09 linux kernel: WARNING: Error for inode 137388 (-5)
Aug  5 22:06:09 linux kernel: reiser4[cp(1087)]: cbk_level_lookup
(fs/reiser4/search.c:1033)[vs-3533]:
Aug  5 22:06:09 linux kernel: WARNING: Keys are inconsistent. Fsck?
Aug  5 22:06:09 linux kernel: reiser4[cp(1087)]: key_warning
(fs/reiser4/plugin/object.c:97)[nikita-717]:
Aug  5 22:06:09 linux kernel: WARNING: Error for inode 137404 (-5)
Aug  5 22:06:09 linux kernel: reiser4[cp(1087)]: cbk_level_lookup
(fs/reiser4/search.c:1033)[vs-3533]:
Aug  5 22:06:09 linux kernel: WARNING: Keys are inconsistent. Fsck?
...

I could find nothing to indicate there was any sort of disk/ide hardware
error. Yes, there were some of the (apparently) innocuous driver artifacts
as Nikita called them.

All the relevant info I could pull together is available at
http://dabbs.net/reiser4/stat_error_mongo.tar.bz2. Other than gathering this
info, I have left the system as is. Let me know if you need more info, for
me to poke around or run commands, retest, etc.

BTW, built with yesterday's r4 snapshot.

David


