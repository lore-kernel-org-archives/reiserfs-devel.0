From: Detlef Grittner <detlef.grittner@t-online.de>
Subject: reiserfs in cryptoloop file is corrupt: all data lost?
Date: Wed, 19 Oct 2005 21:27:04 +0200
Message-ID: <43569E08.8000405@t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26572-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I used a cryptoloop device with an reiserfs and made a copy/backup of 
the file containing the data.
I'm not completely sure, but I think it was mounted, when I copied it. 
Maybe this was a mistake.
Now I need the data from the backup and I can't mount the reiserfs using 
the cryptoloop device.
dmesg tells me the following:

ReiserFS: loop0: found reiserfs format "3.6" with standard journal
ReiserFS: loop0: using ordered data mode
reiserfs: using flush barriers
ReiserFS: loop0: journal params: device loop0, size 8192, journal first 
block 18, max trans len 1024, max batch 900, max commit age 30, max 
trans age 30
ReiserFS: loop0: checking transaction log (loop0)
ReiserFS: warning: is_tree_node: node level 123 does not match to the 
expected one 3
ReiserFS: loop0: warning: vs-5150: search_by_key: invalid format found 
in block 2195471. Fsck?
ReiserFS: loop0: warning: vs-13070: reiserfs_read_locked_inode: i/o 
failure occurred trying to find stat data of [1 2 0x0 SD]
ReiserFS: loop0: Using r5 hash to sort names
ReiserFS: loop0: warning: xattrs/ACLs enabled and couldn't find/create 
.reiserfs_priv. Failing mount.

An appropriate fstab entry, so a user is allowed to mount the device 
looks like this:
/home/userX/data         /home/userX/crypto  reiserfs   
user,noauto,loop=/dev/loop0,encryption=twofish256,phash=sha512,itercountk=100 
0 0

I have done a reiserfsck --check, which told me I should run reiserfsck 
--rebuild-sb and then a reiserfsck --rebuild-tree. The last one 
obviously failed and just told me that there is no reiserfs meta data.

Is there any hope to recover the data or is the filesystem already 
completely corrupted?
I want to know, if it is worth a try, otherwise I won't spend time and 
money on it.

Regards,

Detlef Grittner
