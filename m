From: "Henning Westerholt" <henning-04@die.informatik.uni-siegen.de>
Subject: fsck.reiser4 - can't find item plugin error
Date: Thu, 19 Feb 2004 00:03:04 +0100 (CET)
Message-ID: <47352.127.0.0.1.1077145384.squirrel@www.die.informatik.uni-siegen.de>
Reply-To: henning-04@die.informatik.uni-siegen.de
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16845-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

after three days with only minor load on this fs, fsck refuse to check my
/tmp partition. Fsck.reiser4 produce the following error message:

Fscking the /dev/hdd6 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue? Yes
***** Opening the fs.
Reiser4 was detected on the /dev/hdd6.
Master super block (16):
magic:       ReIsEr4
blksize:     4096
format:      0x0 (format40)
label:       <none>

Format super block (17):
plugin:      format40
magic:       ReIsEr40FoRmAt
flushes:     0
mkfs id:     0x373cff3b
blocks:      204820
free blocks: 204464
root block:  505
tail policy: 0x4 (smart)
next oid:    0x26a4d
file count:  37
tree hight:  2
key policy:  LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
Error: Can't find item plugin by its id 0x8.
Error: Node(501): Failed to open the item(1).
Error: Can't find item plugin by its id 0x8.
Read Nodes...


****** Twig Scan:

****** Semantic Traverse Pass:
Error: Can't find item plugin by its id 0x8.
Time...
Closing fs...done

Operational error occured while fscking.
-----

Oh, and the --auto or --preen option of fsck doesn't work for me. Is this
a know issue?


Best regards,

Henning


