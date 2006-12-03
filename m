From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 9/10] Reiser4: remove unnecessary config.h includes.
Date: Sun, 03 Dec 2006 14:51:29 +0100
Message-ID: <4572D661.9080500@free.fr>
References: <4571D852.3080401@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30289-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4571D852.3080401@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

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
-- 1.4.4.1.gaed4 


