From: grobe@gmx.net
Subject: corrupted fs: bitmap does not match to the correct one....
Date: Wed, 15 May 2002 14:59:37 +0200 (MEST)
Message-ID: <3066.1021467577@www49.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10308-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Hi,

I have a bad problem with my reiserfs. I got a lot of SCSI-errors in the
logs, and did a reiserfsck --rebuild-tree. Than, I checked the (hopefuly) fixed
fs, and now I get errors:

[...]
node (9614688) with wrong level (1) found in the tree (should be 3)
[...a lot of this]
free block count 70151604 mismatches with a correct one 70141253
on-disk bitmap des not match to the correct one. 8134442 bytes differ

If I try to mount the fs, mount tells me "no directory"...

I have resized the fs in the past, some months ago... is it possible that
these errors result from a bad resize action? The fs was up for quite a long
time, is it possible that an obviously working fs with errors gives errors
after that long time?

Ok, I am getting a coffe... having a bunch of angry users behind me ;-) I
just would like to know if there is a chance to restore the fs, or should I
just take the backup and build a new fs?

Thank You, CU, Lars.

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net

