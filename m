From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [2.6.0-test11] reiserfs io failures
Date: Wed, 10 Dec 2003 17:30:33 +0300
Message-ID: <16343.11785.149809.773666@laputa.namesys.com>
References: <freemail.20031110152024.4445@fm3.freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16319-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <freemail.20031110152024.4445@fm3.freemail.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Max Payne <"max..payne"@freemail.hu>
Cc: vitaly@namesys.com, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Max Payne writes:
 > Hi!

Please, send (or at least CC) reiserfs-related bug reports to the
Reiserfs-List@Namesys.COM.

 > 
 > I've got exactly same message on my machines with vanilla
 > 2.6.0-test11 kernel. On my IBM notebook and my desktop. Is
 > this reiserfs bug?  reiserfsck --rebuild-tree /dev/hdaX
 > resolved the problem. But very distressing. Any idea?
 > 
 > Thanks:
 > 
 > Max
 > 
 > | is_leaf: free space seems wrong: level=1, nr_items=41, 
 > free_space=65224 rdkey 
 > | vs-5150: search_by_key: invalid format found in block
 > 283191. Fsck?
 > | vs-13070: reiserfs_read_locked_inode: i/o failure occurred
 > trying to find stat data of [11 12795 0x0 SD]
 > | is_leaf: free space seems wrong: level=1, nr_items=41,
 > free_space=65224 rdkey 
 > | vs-5150: search_by_key: invalid format found in block
 > 283191. Fsck?
 > | vs-13070: reiserfs_read_locked_inode: i/o failure occurred
 > trying to find stat data of [11 12798 0x0 SD]
 > 

Nikita.

