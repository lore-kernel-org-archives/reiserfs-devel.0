From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Working Reiser4 patch for kernel 2.6.6(-mm2)?
Date: Thu, 3 Jun 2004 19:22:08 +0400
Message-ID: <20040603152207.GO8091@backtop.namesys.com>
References: <200406021554.11690.rmeijer@internet.gr> <200406031417.51895.rmeijer@internet.gr> <200406031551.43093.rmeijer@internet.gr> <200406031704.09685.rmeijer@internet.gr> <20040603143057.GN8091@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18996-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040603143057.GN8091@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

On Thu, Jun 03, 2004 at 06:30:57PM +0400, Alex Zarochentcev wrote:
> On Thu, Jun 03, 2004 at 05:04:09PM +0300, Raymond A. Meijer wrote:
> > On Thu 3 June 2004 15:51, Raymond A. Meijer wrote:
> > 
> > > So, I'll recompile a vanilla kernel with no optimisations and only the mm
> > > and Reiser4 patches applied...
> > 
> > No, still the same: Oops errors when the kernel tries to mount Reiser4 
> > filesystems...
> > 
> > ...but then I converted most of the system partitions (/var, /home, /usr) to 
> > ReiserFS and kept some other partitions in Reiser4 format (/backup, /tmp,
> > /var/spool/squid) and now it DOES work properly!
> > 
> > 2.6.6-mm2 boots up fine, mounts everything and starts everything. I'm actually 
> > sending this mail with KMail on KDE 3.2.2 on kernel 2.6.6-mm2...
> > 
> > Any ideas as to what happened?! :)
> 
> Seems we made a disk format change accidentally.  
> details later. or a fix may be.

please try this patch:
=================================================
# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2004/06/03 19:04:55+04:00 zam@crimson.namesys.com 
#   enum item_id: restore disk format. 
# 
# forward.h
#   2004/06/03 19:04:51+04:00 zam@crimson.namesys.com +10 -9
#   enum item_id: restore disk format. 
# 
diff -Nru a/forward.h b/forward.h
--- a/forward.h	Thu Jun  3 19:20:36 2004
+++ b/forward.h	Thu Jun  3 19:20:36 2004
@@ -174,16 +174,17 @@
 	SQUEEZE_CONTINUE = 3
 } squeeze_result;
 
+/* Do not change items ids. If you do - there will be format change */
 typedef enum {
-	STATIC_STAT_DATA_ID,
-	SIMPLE_DIR_ENTRY_ID,
-	COMPOUND_DIR_ID,
-	NODE_POINTER_ID,
-	EXTENT_POINTER_ID,
-	FORMATTING_ID,
-	CTAIL_ID,
-	BLACK_BOX_ID,
-	LAST_ITEM_ID
+	STATIC_STAT_DATA_ID = 0x0,
+	SIMPLE_DIR_ENTRY_ID = 0x1,
+	COMPOUND_DIR_ID     = 0x2,
+	NODE_POINTER_ID     = 0x3,
+	EXTENT_POINTER_ID   = 0x5,
+	FORMATTING_ID       = 0x6,
+	CTAIL_ID            = 0x7,
+	BLACK_BOX_ID        = 0x8,
+	LAST_ITEM_ID        = 0x9
 } item_id;
 
 /* Flags passed to jnode_flush() to allow it to distinguish default settings based on
=================================================

> 
> > Ray
> 
> -- 
> Alex.

-- 
Alex.
