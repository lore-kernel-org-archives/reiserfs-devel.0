From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: patch [3/4] reiser4progs: print_objects fixup
Date: Fri, 09 Jan 2009 03:16:24 +0300
Message-ID: <49669758.3070905@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090701070708060308050904"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090701070708060308050904
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit




--------------090701070708060308050904
Content-Type: text/x-patch;
 name="reiser4progs-print-objects-fixup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4progs-print-objects-fixup.patch"

Fixup in ctail40_print:
Do print ctail40 shift, instead of cluster size.

Signed-off-by: Edward Shishkin<edward.shishkin@gmail.com>
---
 reiser4progs-1.0.6-orig/plugin/item/ctail40/ctail40_repair.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- reiser4progs-1.0.6-orig/plugin/item/ctail40/ctail40_repair.c.orig
+++ reiser4progs-1.0.6-orig/plugin/item/ctail40/ctail40_repair.c
@@ -20,7 +20,7 @@ void ctail40_print(reiser4_place_t *plac
 	aal_assert("vpf-1893", stream != NULL);
 	
 	aal_stream_format(stream, " shift=%lu\n", 
-			  1ul << ct40_get_shift(place->body));
+			  ct40_get_shift(place->body));
 }
 
 #endif


--------------090701070708060308050904--
