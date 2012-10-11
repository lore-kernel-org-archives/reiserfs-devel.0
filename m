From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 05/10] debugreiserfs: fix dereferencing type-punned pointer
 warning
Date: Thu, 11 Oct 2012 13:23:18 -0400
Message-ID: <20121011200115.D1818200A4@oldboy.suse.de>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

This patch fixes the following warning:
unpack.c:536:2: warning: dereferencing type-punned pointer will break strict-aliasing rules [-Wstrict-aliasing]

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 debugreiserfs/unpack.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/debugreiserfs/unpack.c b/debugreiserfs/unpack.c
index fb93b6b..e71306a 100644
--- a/debugreiserfs/unpack.c
+++ b/debugreiserfs/unpack.c
@@ -532,9 +532,8 @@ void unpack_partition (int fd, int jfd)
 	    continue;
 	}
 
-	fread (c + 1, 1, 1, stdin);
-	magic16 = le16_to_cpu(*(__u16 *)c);
-	/*fread16 (&magic16);*/
+	fread16 (&magic16);
+	magic16 = le16_to_cpu(magic16);
 	
 	switch (magic16 & 0xff) {
 	case LEAF_START_MAGIC:
-- 
1.7.10.4


