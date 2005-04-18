From: Edward Shishkin <edward@namesys.com>
Subject: Re: Segfault on nonexistent journal device
Date: Mon, 18 Apr 2005 16:56:42 +0400
Message-ID: <4263AE8A.5070101@namesys.com>
References: <20050417113856.155b8166.a.nielsen@shikadi.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040204090402020205030004"
Return-path: <reiserfs-list-return-23895-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050417113856.155b8166.a.nielsen@shikadi.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Adam Nielsen <a.nielsen@shikadi.net>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

--------------040204090402020205030004
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Adam Nielsen wrote:

>Hi all,
>
>Further to my previous message, I've found that if you try to mount a reiserfs device and tell it to use a nonexistent log device, you get a segfault and a kernel NULL pointer dereference - in case this hasn't already been fixed in a newer release, this is what I did:
>
>$ mount -t reiserfs /dev/cdrom /mnt/cdrom -o ro,nolog,jdev=t
>Segmentation fault
>
>kernel: ReiserFS: hdc: warning: journal_init_dev: Cannot open 't': -2
>kernel: Unable to handle kernel NULL pointer dereference at virtual address 00000000
>kernel:  printing eip:
>kernel: c018b5b2
>kernel: *pde = 00000000
>kernel: Oops: 0000 [#1]
>...
>kernel: Call Trace:
>kernel:  [<c01b27b0>] journal_init_dev+0x140/0x1b0
>kernel:  [<c01af2ba>] allocate_bitmap_node+0x3a/0xa0
>kernel:  [<c01af3ce>] allocate_bitmap_nodes+0x1e/0x50
>...
>
>It seems that after this I can no longer mount any reiserfs volumes - time for a restart I think.
>
>Cheers,
>Adam.
>
>
>  
>
The fix against 2.6.11 is attached
Edward.

--------------040204090402020205030004
Content-Type: text/x-patch;
 name="journal_init_dev_fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="journal_init_dev_fix.patch"

diff -urN linux-2.6.11.orig/fs/reiserfs/journal.c linux-2.6.11/fs/reiserfs/journal.c
--- linux-2.6.11.orig/fs/reiserfs/journal.c	2005-04-18 13:55:44.000000000 +0400
+++ linux-2.6.11/fs/reiserfs/journal.c	2005-04-18 14:52:25.471889996 +0400
@@ -2323,6 +2323,7 @@
 	}
 	if( result != 0 ) {
 		release_journal_dev( super, journal );
+		return result;
 	}
 	reiserfs_info(super, "journal_init_dev: journal device: %s\n",
 		bdevname(journal->j_dev_bd, b));

--------------040204090402020205030004--
