From: Helge Hielscher <hhielscher@unternehmen.com>
Subject: Re: fsck.reiser4 segfault with one partition
Date: Wed, 02 Jun 2004 06:19:43 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <pan.2004.06.02.10.19.28.403959@unternehmen.com>
References: <pan.2004.06.01.11.57.09.230448@unternehmen.com> <200406012240.33075.vitaly@namesys.com> <pan.2004.06.01.19.37.08.75221@unternehmen.com> <200406021658.17346.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-18974-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed, 02 Jun 2004 16:58:17 +0400, Vitaly Fertman wrote:

> On Tuesday 01 June 2004 23:37, Helge Hielscher wrote:
>> On Tue, 01 Jun 2004 22:40:33 +0400, Vitaly Fertman wrote:
>> > On Tuesday 01 June 2004 15:57, Helge Hielscher wrote:
>> >> fsck.reiser4 segfaulted when I tried to check /dev/hda6 (see below).
>> >
>> > which version do you have? the latest was 0.5.4 in
>> > www.namesys.com/snapshots/2004.04.21-internal.testing.fixed/ would you
>> > try it first?
>>
>> Tried it and got the same result: fsck.reiser4 segfaults at semantic
>> tree checking.
> 
> Can you provide the packed fs metadata for downloading? (debugfs.reiser4
> -P /dev/xxx | bzip2 -c > xxx.bz2)

The metadata is on its way. But what is strange, I have run fsck.reiser4
directly after fsck.reiser4 and here is what I get now (ups, just noticed
that I use the old version again, hope that it does not matter much)

# fsck.reiser4 /dev/hda6
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hda6 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): yes
***** Opening the fs.
Reiser4 journal (journal40) on /dev/hda6: 0 transactions replayed of the total 0
blocks.
Reiser4 fs was detected on /dev/hda6.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.5.4
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x6bb3bacf
blocks:         1534672
free blocks:    737364
root block:     1366
tail policy:    0x4 (smart)
next oid:       0x3651b
file count:     139486
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
Error: Node (409174), item (4): item has the wrong length (62). Should be (56).
Error: Node (409174), item (4): broken item found.
Error: Node (409174): the node is broken. Pointed from the node (430549), item
(7), unit (0). The whole subtree is skipped.
        Read nodes 104414
        Nodes left in the tree 104413
                Leaves of them 102798, Twigs of them 1583
        Broken of them 1
                Leaves of them 1, Twigs of them 0
        Time interval: Wed Jun  2 05:51:30 2004 - Wed Jun  2 05:53:04 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 1583
        Time interval: Wed Jun  2 05:53:04 2004 - Wed Jun  2 05:53:05 2004

Fatal corruptions were found. Semantic pass is skipped.
Free block count 737364 found in the format is wrong. Sould be 737365.
***** fsck.reiser4 finished at Wed Jun  2 05:53:05 2004
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs option to fix them.




