From: "Bostjan Skufca @ domenca.com" <bostjan.skufca@domenca.com>
Subject: ReiserFS 2.4 patches need few fixes
Date: Mon, 24 Jan 2005 12:46:36 +0100
Message-ID: <200501241246.36757.bostjan.skufca@domenca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,


there are 3 fuzz warnings and one reject when applying patches from 
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/data-logging-2.4.24 
to vanilla 2.4.29 kernel.


Here is the patch output (irelevant output is omitted):

# cat ../linux-2.4.29-patches/reiserfs/02-akpm-b_journal_head.diff | patch -p1
patching file fs/buffer.c
Hunk #1 succeeded at 800 with fuzz 1 (offset 37 lines).

# cat ../linux-2.4.29-patches/reiserfs/04-data-logging-40.diff | patch -p1
patching file fs/buffer.c
Hunk #3 succeeded at 1388 with fuzz 2 (offset 38 lines).
patching file kernel/ksyms.c
Hunk #1 succeeded at 175 with fuzz 2 (offset 3 lines).

# cat ../linux-2.4.29-patches/reiserfs/07-kinode-10.diff | patch -p1
patching file fs/inode.c
Hunk #4 FAILED at 822.
1 out of 7 hunks FAILED -- saving rejects to file fs/inode.c.rej



Best regards,
Bostjan
