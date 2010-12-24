From: Jesper Juhl <jj@chaosbits.net>
Subject: [PATCH] reiserfs: Make sure va_end() is always called after
 va_start().
Date: Fri, 24 Dec 2010 19:37:11 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1012241933390.28973@swampdragon.chaosbits.net>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Greetings,

A call to va_start() must always be followed by a call to va_end() in the 
same function. In fs/reiserfs/prints.c::print_block() this is not always 
the case. If 'bh' is NULL we'll return without calling va_end().
One could add a call to va_end() before the 'return' statement, but it's 
nicer to just move the call to va_start() after the test for 'bh' being 
NULL.

Signed-off-by: Jesper Juhl <jj@chaosbits.net>
---
 prints.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
index adbc6f5..45de98b 100644
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -586,13 +586,13 @@ void print_block(struct buffer_head *bh, ...)	//int print_mode, int first, int l
 	va_list args;
 	int mode, first, last;
 
-	va_start(args, bh);
-
 	if (!bh) {
 		printk("print_block: buffer is NULL\n");
 		return;
 	}
 
+	va_start(args, bh);
+
 	mode = va_arg(args, int);
 	first = va_arg(args, int);
 	last = va_arg(args, int);



-- 
Jesper Juhl <jj@chaosbits.net>            http://www.chaosbits.net/
Don't top-post http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please.

