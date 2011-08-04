From: Carsten Ralle <cr@i4yoo.de>
Subject: rebuild-tree fails on large volume
Date: Thu, 04 Aug 2011 12:49:41 +0200
Message-ID: <4E3A7945.9090404@i4yoo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi,

on our 64bit RAID system reiserfsck segfaults (3.6.19) or stops (3.6.21)
reliably on Pass2 on a 12 TB volume.

On January 11th Jeff Mahoney posted a patch on this list fixing a couple
of type overflow errors on reiserfsck on large volumes which pretty much
sound like mine here.

http://www.spinics.net/lists/reiserfs-devel/msg02679.html

I looked all over the place but couldn't find any infos about the
version to patch.

Does anyone have the source code with these patches included or is there
an unknown test or release version having those patches included or does
anyone have any idea on how to fix this?

Sincerely,

Carsten



reiserfsck output (summary):
-------------------------------

reiserfsck 3.6.21
...
Pass 1 (will try to insert 2734366 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....100%                         left 0,
296 /sec
Flushing..finished
        2734366 leaves read
                2732070 inserted
                2296 not inserted
####### Pass 2 #######

Pass 2:
0%bread: Cannot read the block (18446744072362557648): (Invalid
argument). /sec
bread: Cannot read the block (18446744072362557649): (Invalid argument).
fix_node.c 838 are_items_mergeable
vs-16070: are_items_mergeable: left [1451761 1452800 0x1 DRCT (2)],
right [1128542 1128573 0x0 SD (0)]
Aborted


system info:
------------
Linux gate 2.6.37.6-0.7-xen #1 SMP 2011-07-21 02:17:24 +0200 x86_64
x86_64 x86_64 GNU/Linux

