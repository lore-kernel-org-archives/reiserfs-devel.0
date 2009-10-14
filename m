From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 3/3] kill-the-bkl/reiserfs: drop the fs race watchdog from _get_block_create_0()
Date: Thu, 15 Oct 2009 00:26:07 +0200
Message-ID: <1255559167-5554-4-git-send-email-fweisbec@gmail.com>
References: <1255559167-5554-1-git-send-email-fweisbec@gmail.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934303AbZJNW1A@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references;
        bh=hk2AT+WllkZg+P/0gd3yoAJR6JqtujRLnQDdH421Jf4=;
        b=wV+YgCpv+Rar93RQBPtPp+tS4+nrWzcF35Q7Key4DGfOiUkSaXk2hZ6UrK364ceOo0
         LOAtE8AwS5qssVCZd8BlMNKd7eSuH291Ht+qgqLklcWHgtjEmDQS1rLMybOly4sPWDHp
         YMEPgPxxRu8frSSaArZqVRM/iwcwQ1KSb+y5A=
In-Reply-To: <1255559167-5554-1-git-send-email-fweisbec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Chris Mason <chris.mason@oracle.com>, Roland Dreier <rdreier@cisco.com>, Ingo Molnar <mingo@elte.hu>, Andi Kleen <andi@firstfloor.org>, Jeff Mahoney <jeffm@suse.com>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>, Laurent Riffard <laurent.riffard@free.fr>, Thomas Gleixner <tglx@linutronix.de>

We had a watchdog in _get_block_create_0() that jumped to a fixup retry
path in case the bkl got relaxed while calling kmap().
This is not necessary anymore since we now have a reiserfs lock that is
not implicitly relaxed while sleeping.

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Chris Mason <chris.mason@oracle.com>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Laurent Riffard <laurent.riffard@free.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 fs/reiserfs/inode.c |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 965c8ea..0d493a3 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -251,7 +251,6 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 	struct cpu_key key;
 	struct buffer_head *bh;
 	struct item_head *ih, tmp_ih;
-	int fs_gen;
 	b_blocknr_t blocknr;
 	char *p = NULL;
 	int chars;
@@ -265,7 +264,6 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 		     (loff_t) block * inode->i_sb->s_blocksize + 1, TYPE_ANY,
 		     3);
 
-      research:
 	result = search_for_position_by_key(inode->i_sb, &key, &path);
 	if (result != POSITION_FOUND) {
 		pathrelse(&path);
@@ -340,7 +338,6 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 	}
 	// read file tail into part of page
 	offset = (cpu_key_k_offset(&key) - 1) & (PAGE_CACHE_SIZE - 1);
-	fs_gen = get_generation(inode->i_sb);
 	copy_item_head(&tmp_ih, ih);
 
 	/* we only want to kmap if we are reading the tail into the page.
@@ -348,13 +345,9 @@ static int _get_block_create_0(struct inode *inode, sector_t block,
 	 ** sure we need to.  But, this means the item might move if
 	 ** kmap schedules
 	 */
-	if (!p) {
+	if (!p)
 		p = (char *)kmap(bh_result->b_page);
-		if (fs_changed(fs_gen, inode->i_sb)
-		    && item_moved(&tmp_ih, &path)) {
-			goto research;
-		}
-	}
+
 	p += offset;
 	memset(p, 0, inode->i_sb->s_blocksize);
 	do {
-- 
1.6.2.3
