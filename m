From: Adam Nielsen <a.nielsen@shikadi.net>
Subject: Segfault on nonexistent journal device
Date: Sun, 17 Apr 2005 11:38:56 +1000
Message-ID: <20050417113856.155b8166.a.nielsen@shikadi.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23889-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

Further to my previous message, I've found that if you try to mount a reiserfs device and tell it to use a nonexistent log device, you get a segfault and a kernel NULL pointer dereference - in case this hasn't already been fixed in a newer release, this is what I did:

$ mount -t reiserfs /dev/cdrom /mnt/cdrom -o ro,nolog,jdev=t
Segmentation fault

kernel: ReiserFS: hdc: warning: journal_init_dev: Cannot open 't': -2
kernel: Unable to handle kernel NULL pointer dereference at virtual address 00000000
kernel:  printing eip:
kernel: c018b5b2
kernel: *pde = 00000000
kernel: Oops: 0000 [#1]
...
kernel: Call Trace:
kernel:  [<c01b27b0>] journal_init_dev+0x140/0x1b0
kernel:  [<c01af2ba>] allocate_bitmap_node+0x3a/0xa0
kernel:  [<c01af3ce>] allocate_bitmap_nodes+0x1e/0x50
...

It seems that after this I can no longer mount any reiserfs volumes - time for a restart I think.

Cheers,
Adam.
