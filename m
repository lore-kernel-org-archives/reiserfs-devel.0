From: Will Smith <will@willsmith.org>
Subject: [patch]  measurefs.reiser4 --data-frag does not run
Date: Mon, 13 Sep 2004 16:53:56 +0800
Message-ID: <41456024.8070103@willsmith.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000809030400050200060001"
Return-path: <reiserfs-list-return-21709-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------000809030400050200060001
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Minor patch, measurefs.reiser4-v1.0.0's --data-frag
was always returning -ENOMEM and not running, due to missing
curly brackets.



Will Smith


-- 
1400 high resolution textures - http://www.mayang.com/textures
Panoramic travel photos       - http://www.willsmith.org/pano






--------------000809030400050200060001
Content-Type: text/plain;
 name="measurefs_datafrag_enomem_bug.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="measurefs_datafrag_enomem_bug.patch"

--- measurefs.c.orig	2004-09-13 16:38:00.128518704 +0800
+++ measurefs.c	2004-09-13 16:35:36.695323864 +0800
@@ -653,9 +653,10 @@ errno_t measurefs_data_frag(reiser4_fs_t
 			aal_gauge_create(aux_gauge_handlers[GT_PROGRESS],
 					 NULL, NULL, 0, "Data fragmentation "
 					 "... ");
-		if (!frag_hint.gauge)
+		if (!frag_hint.gauge) {
 			aal_fatal("Out of memory!");
 			return -ENOMEM;
+		}
 	}
 
 	frag_hint.flags = flags;

--------------000809030400050200060001--

