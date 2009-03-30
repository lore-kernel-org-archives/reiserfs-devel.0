From: Jeff Mahoney <jeffm@suse.com>
Subject: [patch 08/35 error-handling] reiserfs: eliminate reiserfs_warning from uniqueness functions
Date: Mon, 30 Mar 2009 14:02:23 -0400
Message-ID: <20090330181010.295738430@suse.com>
References: <20090330180215.951354436@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline; filename=patches.suse/reiserfs_warning-reentrant
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

 uniqueness2type and type2uniquness issue a warning when the value is
 unknown. When called from reiserfs_warning, this causes a re-entrancy
 problem and deadlocks on the error buffer lock.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 include/linux/reiserfs_fs.h |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

--- a/include/linux/reiserfs_fs.h
+++ b/include/linux/reiserfs_fs.h
@@ -560,10 +560,8 @@ static inline int uniqueness2type(__u32
 		return TYPE_DIRECT;
 	case V1_DIRENTRY_UNIQUENESS:
 		return TYPE_DIRENTRY;
-	default:
-		reiserfs_warning(NULL, "vs-500", "unknown uniqueness %d",
-				 uniqueness);
 	case V1_ANY_UNIQUENESS:
+	default:
 		return TYPE_ANY;
 	}
 }
@@ -580,9 +578,8 @@ static inline __u32 type2uniqueness(int
 		return V1_DIRECT_UNIQUENESS;
 	case TYPE_DIRENTRY:
 		return V1_DIRENTRY_UNIQUENESS;
-	default:
-		reiserfs_warning(NULL, "vs-501", "unknown type %d", type);
 	case TYPE_ANY:
+	default:
 		return V1_ANY_UNIQUENESS;
 	}
 }


