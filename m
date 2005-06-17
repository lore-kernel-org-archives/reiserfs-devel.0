From: mross@rs-net.org
Subject: reiser4 corruption
Date: Fri, 17 Jun 2005 11:26:49 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506171108440.6542@localhost>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24400-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I recently experimented using reiser4 on a backup system that processes 
millions of files (most hard links to a main pool of files) every night. I 
installed it on a spare machine by patching a vanilla 2.6.11.11 with the 
reiser4 patches. Everything keep working for a few days, but I suddenly 
noticed this message displayed multiple times:

reiser4[ktxnmgrd:md0:ru(1754)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384

as well as:

reiser4[pdflush(28040)]: commit_current_atom 
(fs/reiser4/txnmgr.c:1147)[nikita-3176]:
WARNING: Flushing like mad: 16384

Would someone mind explaining to me what this means? Upon fscking, it 
complained about one node containing an unrecognizable module, or 
something similar. Unfortunately, I don't have the exact output. Also, the 
semantic checks would have taken 2-3 full days to finish, so I didn't even 
let fsck finish. I just moved back to reiserfs, which is a shame since 
reiser4 was incredibly faster. (Simultaneous backups were going at a rate 
of ~20MB/s compared to ~8MB/s on reiserfs)

Thanks,

-Ross
