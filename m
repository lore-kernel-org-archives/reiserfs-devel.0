From: Dorin Popa <dp@i51.org>
Subject: fsck.reiser4 assertion failure
Date: Thu, 25 Dec 2003 18:39:55 +0200
Message-ID: <3FEB12DB.30703@i51.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020900080205030000080105"
Return-path: <reiserfs-list-return-16398-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------020900080205030000080105
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I use reiser4progs 0.4.20 with repair_fs_open.patch (I had the same 
problem as David Masover, but the patch fixed it). It seems that 
fsck.reiser4 encounters some internal error condition. Please see the 
fsck.reiser4 output in the attached file.

-- 
Thanks,
Dorin Popa


--------------020900080205030000080105
Content-Type: text/plain;
 name="fsck.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fsck.txt"

Fscking the /dev/hda8 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will build the Reiser4 FileSystem.
Continue? 
(Yes/No): ***** Openning the fs.
Reiser4 fs was detected on the /dev/hda8.
Master super block (16):
magic:		R4Sb
blksize:	4096
format:		0x0 (format40)
label:		usr

Format super block (17):
plugin:		format40
description:	Disk-format for reiser4, ver. 0.4.20
magic:		R4Sb-Default
flushes:	0
mkfs id:	0x1f15877c
blocks:		985981
free blocks:	255430
root block:	30
tail policy:	0x4 (smart)
next oid:	0xebc9f
file count:	126144
tree height:	4
key policy:	LARGE



***** Tree Traverse Pass: scanning the reiser4 internal tree.


	Read nodes 94104
	Nodes left in the tree 94104
		Leaves of them 92356, Twigs of them 1717
	Time interval: Thu Dec 25 18:16:44 2003 - Thu Dec 25 18:18:05 2003
***** TwigScan Pass: checking extent pointers of all twigs.


	Read twigs 1717
	Time interval: Thu Dec 25 18:18:05 2003 - Thu Dec 25 18:18:08 2003
***** DiskScan Pass: scanning the partition for unconnected nodes.


	Read nodes 21732
	Good nodes 45
		Leaves of them 37, Twigs of them 8
	Time interval: Thu Dec 25 18:18:09 2003 - Thu Dec 25 18:18:11 2003
***** TwigScan Pass: checking extent pointers of all twigs.
vpf-796: Assertion (length == place->len || res) at item.c:84 in function 
repair_item_check_layout() failed. 

--------------020900080205030000080105--

