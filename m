From: Helge Hielscher <hhielscher@unternehmen.com>
Subject: fsck.reiser4 segfault with one partition
Date: Tue, 01 Jun 2004 07:57:10 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <pan.2004.06.01.11.57.09.230448@unternehmen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-18947-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hallo,

fsck.reiser4 segfaulted when I tried to check /dev/hda6 (see below).

HTH,
Helge

# fsck.reiser4 /dev/hda6
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read REAMDE first.
*******************************************************************

Fscking the /dev/hda6 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): yes
***** Openning the fs.
Reiser4 journal (journal40) on /dev/hda6: 0 transactions replaied of the total 0
blocks.
Reiser4 fs was detected on the /dev/hda6.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.5.3
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x6bb3bacf
blocks:         1534672
free blocks:    983639
root block:     476311
tail policy:    0x4 (smart)
next oid:       0x2ca9c
file count:     110117
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
        Read nodes 84931
        Nodes left in the tree 84931
                Leaves of them 83682, Twigs of them 1225
        Time interval: Tue Jun  1 07:48:12 2004 - Tue Jun  1 07:49:19 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 1225
        Time interval: Tue Jun  1 07:49:19 2004 - Tue Jun  1 07:49:20 2004
***** Semantic Traverse Pass: reiser4 semantic tree checking.
Segmentation fault


