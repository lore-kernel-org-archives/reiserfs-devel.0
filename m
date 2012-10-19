From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH 3/7] update gitignore
Date: Fri, 19 Oct 2012 01:49:08 -0400
Message-ID: <1350625752-24944-3-git-send-email-vapier@gentoo.org>
References: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1350625752-24944-1-git-send-email-vapier@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 .gitignore | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/.gitignore b/.gitignore
index 0df7c35..cfc63d9 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,6 @@
+*~
+*.[ao]
+
 INSTALL
 Makefile.in
 aclocal.m4
@@ -19,3 +22,10 @@ config.status
 include/config.h
 include/credits.h
 include/stamp-h1
+
+reiserfsprogs-*.tar.*
+/debugreiserfs/debugreiserfs
+/fsck/reiserfsck
+/mkreiserfs/mkreiserfs
+/resize_reiserfs/resize_reiserfs
+/tune/reiserfstune
-- 
1.7.12

