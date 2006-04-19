From: "majek" <majekreiser@forest.one.pl>
Subject: reiserfsck --rebuild-tree failure
Date: Wed, 19 Apr 2006 17:24:45 +0200 (CEST)
Message-ID: <51513.89.171.64.46.1145460285.squirrel@forest.one.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28509-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi

I have problem while rebuilding reiserfs (standing on lvm).
Lvm contains 3*400GB drives, ata. The device was 95% full - about 1.1TB.

[root@xxxx:/dev/devil-linux]# reiserfsck -y --rebuild-tree data
reiserfsck 3.6.19 (2003 www.namesys.com)
Pass 0:
Loading on-disk bitmap .. ok, 285948016 blocks marked used
Skipping 17152 blocks (super block, journal, bitmaps) 285930864 blocks
will be read
0%...             left 0, 14102 /seccc
"r5" hash is selected
Flushing..finished
Read blocks (but not data blocks) 285930864
Leaves among those 369793
Objectids found 1204513

Pass 1 (will try to insert 369793 leaves):
Looking for allocable blocks .. finished
0%....20%....40%....60%...pass1.c 424 pass1_correct_leaf  left 100292, 494
/sec
pass1_correct_leaf: block 195393764, item 0, pointer 42: The wrong pointer
(3960248820) in the file [1833688 1833834]. Must be fixed on pass0.
zsh: abort      reiserfsck -y --rebuild-tree -l /root/logggg data


This lvm was created and worked on devil-linux 1.2.5 with kernel 2.4.30.
And unsuccessful rebuild was done on debian-stable with custom 2.6.17-rc1.

The biggest problem is that now, after unsuccessful rebuild, we can't
mount this device. Are there any tools that can access this device?
(reiserfsdump exists?)

majek.




