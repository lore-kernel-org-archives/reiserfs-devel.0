From: <doiggl@velocitynet.com.au>
Subject: Re: Why patch reiser4-for-3.17.3.patch does not apply ?
Date: Mon, 19 Jan 2015 19:43:34 +1100
Message-ID: <cbc97abd54743413f78cc37b6046244d@mail.velocitynet.com.au>
References: <9cc275035b16b88c3bd4ada2aa9786f0@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <9cc275035b16b88c3bd4ada2aa9786f0@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

hello,
found the following.
What change will fix this ?
--Glenn

# cd /tmp/linux-3.17.1 

# patch -s -F0 -E -p1 --no-backup-if-mismatch -i
/reiser4-for-3.17.3.patch1 out of 1 hunk FAILED -- saving rejects to file
include/linux/mm.h.rej

# cat include/linux/mm.h.rej
--- include/linux/mm.h  2014-11-14 19:10:57.000000000 +0100
+++ include/linux/mm.h  2015-01-11 23:39:42.874076564 +0100
@@ -1235,6 +1235,7 @@
 void account_page_dirtied(struct page *page, struct address_space
*mapping);
 int set_page_dirty(struct page *page);
 int set_page_dirty_lock(struct page *page);
+int set_page_dirty_notag(struct page *page);
 int clear_page_dirty_for_io(struct page *page);
 int get_cmdline(struct task_struct *task, char *buffer, int buflen);
 

