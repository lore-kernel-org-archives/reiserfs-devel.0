From: Will Smith <will@willsmith.org>
Subject: Repacker for reiser4?
Date: Sun, 12 Sep 2004 23:12:11 +0800
Message-ID: <4144674B.5070705@willsmith.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21704-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Is the repacker available for reiser4?  I can see code in
the kernel but no userspace tool.  The FAQ says 'not implemented'
but the reiser4 page says 'Reiser4.1 will modify the repacker'
which implies something may already be available.

I am gradually migrating my ext3 disks to reiser4, starting
at the less critical.  No problems seen so far.


I have a suggestion for the repacker:

The repacker should benchmark the disk surface and work out
which areas are fastest (bandwidth and/or track->track seek).
Then this could be combined with a usage count on each file
to gradually move the more-accessed data to faster areas
of the disk.

This would work particularly well with LVM - you could put
one logical volume on two physical volumes - one expensive,
fast and small (e.g. 74Gb RAPTOR @ 10,000rpm) and one
big, slower and cheap (e.g. any 200Gb drive).  With typical
"90:10" file access patterns, the combined disk would soon
approach the speeds of the faster disk.


Will Smith




-- 
1400 high resolution textures - http://www.mayang.com/textures
Panoramic travel photos       - http://www.willsmith.org/pano





