From: Laurynas Biveinis <Laurynas.Biveinis@mif.vu.lt>
Subject: Re: Partial data loss with reiserfs3
Date: Mon, 14 Feb 2005 17:16:54 +0200
Message-ID: <1108394214.4210c0e62a52c@webmail.vu.lt>
References: <1108315756.420f8e6ce67b0@webmail.vu.lt> <200502141544.34513.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502141544.34513.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Laurynas Biveinis <Laurynas.Biveinis@mif.vu.lt>, reiserfs-list@namesys.com

And I have just found following syslog entries:

Feb 13 17:59:31 laurynas-pc kernel: ReiserFS: hda6: warning: vs-4080:
reiserfs_free_block: free_block (hda6:491640)[dev:blocknr]: bit already
cleared
---
The message above repeats several hundred timws with different
blocknr's.
---
Feb 13 17:59:58 laurynas-pc kernel: ReiserFS: hda6: warning: vs-13060:
reiserfs_update_sd: stat data of object [2 12 0x0 SD] (nlink == 1) not
found (pos 0)
Feb 13 17:59:58 laurynas-pc kernel: ReiserFS: hda6: warning: vs-13060:
reiserfs_update_sd: stat data of object [2 12 0x0 SD] (nlink == 1) not
found (pos 1)
Feb 13 17:59:58 laurynas-pc kernel: ReiserFS: hda6: warning: vs-4080:
reiserfs_free_block: free_block (hda6:32781)[dev:blocknr]: bit already
cleared
Feb 13 17:59:58 laurynas-pc kernel: ReiserFS: hda6: warning: vs-5150:
search_by_key: invalid format found in block 32769. Fsck?
Feb 13 17:59:58 laurynas-pc kernel: ReiserFS: hda6: warning: vs-13050:
reiserfs_update_sd: i/o failure occurred trying to update [2 105 0x0
SD] stat data
Feb 13 17:59:59 laurynas-pc kernel: ReiserFS: hda6: warning: vs-5150:
search_by_key: invalid format found in block 32769. Fsck?
Feb 13 17:59:59 laurynas-pc kernel: ReiserFS: hda6: warning: vs-13050:
reiserfs_update_sd: i/o failure occurred trying to update [2 105 0x0
SD] stat data
Feb 13 17:59:59 laurynas-pc kernel: ReiserFS: hda6: warning: vs-13060:
reiserfs_update_sd: stat data of object [2 12 0x0 SD] (nlink == 1) not
found (pos 1)
Feb 13 17:59:59 laurynas-pc kernel: ReiserFS: hda6: warning: vs-5150:
search_by_key: invalid format found in block 32769. Fsck?
Feb 13 17:59:59 laurynas-pc kernel: ReiserFS: hda6: warning: vs-13050:
reiserfs_update_sd: i/o failure occurred trying to update [2 106 0x0
SD] stat data
Feb 13 17:59:59 laurynas-pc kernel: ReiserFS: hda6: warning: vs-5150:
search_by_key: invalid format found in block 32769. Fsck?
Feb 13 17:59:59 laurynas-pc kernel: ReiserFS: hda6: warning: vs-5657:
reiserfs_do_truncate: i/o failure occurred trying to truncate [2 106
0xfffffffffffffff DIRECT]
Feb 13 17:59:59 laurynas-pc kernel: ReiserFS: hda6: warning: vs-5150:
search_by_key: invalid format found in block 32769. Fsck?
Feb 13 17:59:59 laurynas-pc kernel: ReiserFS: hda6: warning: zam-7001:
io error in reiserfs_find_entry
Feb 13 17:59:59 laurynas-pc kernel: ReiserFS: hda6: warning: vs-5150:
search_by_key: invalid format found in block 32769. Fsck?
----
The last two lines repeat many times
----
Feb 13 18:00:07 laurynas-pc kernel: ReiserFS: hda6: warning: zam-7001:
io error in reiserfs_find_entry
Feb 13 18:00:07 laurynas-pc kernel: ReiserFS: hda6: warning: clm-2100:
nesting info a different FS
Feb 13 18:08:05 laurynas-pc kernel: ReiserFS: hda6: warning: vs-4080:
reiserfs_free_block: free_block (hda6:32998)[dev:blocknr]: bit already
cleared


--
Thanks,
Laurynas

