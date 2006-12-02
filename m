From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 9/10] Reiser4: remove unnecessary config.h includes.
Date: Sat,  2 Dec 2006 14:16:30 +0100
Message-ID: <11650653921081-git-send-email-laurent.riffard@free.fr>
References: <1165065391908-git-send-email-laurent.riffard@free.fr> <1165065391122-git-send-email-laurent.riffard@free.fr> <1165065391534-git-send-email-laurent.riffard@free.fr> <11650653912299-git-send-email-laurent.riffard@free.fr> <11650653921903-git-send-email-laurent.riffard@free.fr> <11650653921405-git-send-email-laurent.riffard@free.fr> <11650653923297-git-send-email-laurent.riffard@free.fr> <11650653921199-git-send-email-laurent.riffard@free.fr> <11650653923903-git-send-email-laurent.riffard@free.fr>
Return-path: <reiserfs-list-return-30277-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <11650653923903-git-send-email-laurent.riffard@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Laurent Riffard <laurent.riffard@free.fr>

---
 fs/reiser4/plugin/compress/compress.c |    1 -
 fs/reiser4/reiser4.h                  |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/fs/reiser4/plugin/compress/compress.c b/fs/reiser4/plugin/compress/compress.c
index 25d4dea..1a7122d 100644
--- a/fs/reiser4/plugin/compress/compress.c
+++ b/fs/reiser4/plugin/compress/compress.c
@@ -6,7 +6,6 @@
 #include "../plugin.h"
 #include "minilzo.h"
 
-#include <linux/config.h>
 #include <linux/zlib.h>
 #include <linux/types.h>
 #include <linux/hardirq.h>
diff --git a/fs/reiser4/reiser4.h b/fs/reiser4/reiser4.h
index ec94eec..cdae341 100644
--- a/fs/reiser4/reiser4.h
+++ b/fs/reiser4/reiser4.h
@@ -6,7 +6,6 @@
 #if !defined( __REISER4_H__ )
 #define __REISER4_H__
 
-#include <linux/config.h>
 #include <asm/param.h>		/* for HZ */
 #include <linux/errno.h>
 #include <linux/types.h>
-- 
1.4.4.1.gaed4

