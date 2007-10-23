From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 13/8] debug.c cleanup
Date: Tue, 23 Oct 2007 15:51:45 +0200
Message-ID: <1193147506.6236.67.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- debug.c.orig	2007-10-23 15:48:32.000000000 +0200
+++ debug.c	2007-10-23 15:49:55.000000000 +0200
@@ -60,7 +60,7 @@ static DEFINE_SPINLOCK(panic_guard);
 
 /* Your best friend. Call it on each occasion.  This is called by
     fs/reiser4/debug.h:reiser4_panic(). */
-void reiser4_do_panic(const char *format /* format string */ , ... /*
rest */ )
+void reiser4_do_panic(const char *format/* format string */ , ... /*
rest */)
 {
 	static int in_panic = 0;
 	va_list args;

