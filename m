From: Thorsten Mauch <mauch@imkenberg.de>
Subject: rebuild fs
Date: Tue, 5 Aug 2003 12:02:02 +0200
Message-ID: <E5A63F34D141D111A6F4080009D70ACA346D62@imkedv_pdc>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15138-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Hi all
I have a raid5 system where two hard disks were turned out. One of the
failed drive was
Still accessible. I made a copy with:
 dd  if=/dev/sba  of=/dev/sdb conv=noerror,sync

With the copied drive I could access the array again. Unfortunately I
couldn't mount
My reiserfs anymore. I try to rebuild the fs structure with:
reiserfsck  --rebuild-db
reiserfsck  --rebuild-tree

But while rebuilding the tree, I got a segmentation fault. Because I didn't
want to continue work on the original raid system, I copied the entire raid
disk to the IDE disk.

dd  if=/dev/rd/c0d0  of=/dev/hda conv=noerror,sync

I tried to rebuild the fs structure again, and  I was able to access many
files, but not that are important to me :(
Does there is anyting I can do in this state ? does other tools then
resierfsck exist ?

