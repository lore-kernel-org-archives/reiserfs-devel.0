From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: Working Reiser4 patch for kernel 2.6.6(-mm2)?
Date: Thu, 3 Jun 2004 14:17:51 +0300
Message-ID: <200406031417.51895.rmeijer@internet.gr>
References: <200406021554.11690.rmeijer@internet.gr> <20040602163444.GG8091@backtop.namesys.com> <200406031407.32025.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18991-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200406031407.32025.rmeijer@internet.gr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu 3 June 2004 14:07, Raymond A. Meijer wrote:

> ***** Semantic Traverse Pass: reiser4 semantic tree checking.
> Segmentation fault
> 
> I will try the reiser4progs-0.5.4_convertion.patch that Vitaly posted to
> see if that makes any difference...

Aha:

# fsck.reiser4 /dev/sys/usr
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sys/usr block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** Opening the fs.
Reiser4 journal (journal40) on /dev/sys/usr: 0 transactions replayed of the total 0 blocks.
Reiser4 fs was detected on /dev/sys/usr.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           0a8cc420-fbe3-4e91-97f4-f6748e0bc243
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.5.4
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x1b371ddb
blocks:         1048576
free blocks:    511894
root block:     47189
tail policy:    0x4 (smart)
next oid:       0x64322
file count:     127474
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
Error: Can't open node 186461.
Error: Node (186461): failed to open the node pointed by the node (179889), item (24), unit (0) on the level (2). The whole subtree is
skipped.
Error: Can't open node 187038.
Error: Node (187038): failed to open the node pointed by the node (179889), item (25), unit (0) on the level (2). The whole subtree is
skipped.
Error: Can't open node 187044.
Error: Node (187044): failed to open the node pointed by the node (179889), item (26), unit (0) on the level (2). The whole subtree is
skipped.
The tree height 4 found in the format is wrong. Should be 3.
        Read nodes 2387
        Nodes left in the tree 2387
                Leaves of them 2329, Twigs of them 57
        Invalid node pointers 3
        Time interval: Thu Jun  3 14:16:33 2004 - Thu Jun  3 14:16:35 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 57
        Time interval: Thu Jun  3 14:16:35 2004 - Thu Jun  3 14:16:35 2004

Fatal corruptions were found. Semantic pass is skipped.
Free block count 511894 found in the format is wrong. Sould be 1005780.
***** fsck.reiser4 finished at Thu Jun  3 14:16:35 2004
Closing fs...done

3 fatal corruptions were detected in FileSystem. Run with --build-fs option to fix them.

I'll reboot into single user mode, rebuild the FS and try again to boot into
2.6.6 and 2.6.7-rc1...

Keeping you posted...


Ray
