From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 1.0.0, segmentation fault
Date: Fri, 13 Aug 2004 01:43:08 +0400
Message-ID: <200408130143.09138.vitaly@namesys.com>
References: <411BDC03.3090105@free.fr>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_sR+GBi6dmJ9E/qa"
Return-path: <reiserfs-list-return-20246-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <411BDC03.3090105@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vince <fuzzy77@free.fr>, reiserfs-list@namesys.com

--Boundary-00=_sR+GBi6dmJ9E/qa
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 13 August 2004 01:07, Vince wrote:
> Hi,
>
> I got a segmentation fault while converting my reiser4 partition to the
> new format:
>
> 1) I first launched "debugfs.reiser4 -C /mydevice"
>
> (sidenote: il looks like the conversion requires really a lot -- too
> much ? -- memory. It ate up to 450MB in my case and I had to shut down
> almost all my running programs in order for it to finish...)
>
> 2) fsck.reiser4 asks to do a --build-fs 

you did not run fsck before convertion so it is difficult to say if these 
corruptions existed then, did not you? have you run fsck with logfile? 
may I have a look at it if so?

> and then fails with a
> segmentation fault:
> ---------------------------------------------------------------------
> [...]
> INSERTING UNCONNECTED NODES
> 1. Twigs: done
> 2. Twigs by item: done
> 3. Leaves: done
> 4. Leaves by item: done
>          Twigs: read 0, inserted 0, by item 0, empty 0
>          Leaves: read 0, inserted 0, by item 0
>          Time interval: Thu Aug 12 23:00:11 2004 - Thu Aug 12 23:00:11 2004
> CHECKING SEMANTIC TREE
> FSCK: Node (8803157), item (4), [d43d0:6d6174685f696e:d447b] (stat40):
> wrong size (12478), Fixed to (16384).
> [=================================================- ] 99%zsh:
> segmentation fault  fsck.reiser4 --build-fs /dev/hdc3
> ----------------------------------------------------------------------
>
> I'm attaching a gdb backtrace of this failure (and can send the packed
> metadata on request).

oh, sorry, a stupid mistake in the recent changes. try this fix please.

-- 
Thanks,
Vitaly Fertman

--Boundary-00=_sR+GBi6dmJ9E/qa
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiser4progs-1.0.0-tree_scan.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiser4progs-1.0.0-tree_scan.patch"

===== libreiser4/tree.c 1.739 vs edited =====
--- 1.739/libreiser4/tree.c	Mon Aug  9 20:58:28 2004
+++ edited/libreiser4/tree.c	Fri Aug 13 01:15:48 2004
@@ -3198,11 +3198,13 @@
 
 		pos = &place.pos;
 
-		if ((res = pre_func(place.node, data)) < 0)
-			return res;
+		if (pre_func) {
+			if ((res = pre_func(place.node, data)) < 0)
+				return res;
 		
-		/* If res != 0, lookup is needed. */
-		if (res) continue;
+			/* If res != 0, lookup is needed. */
+			if (res) continue;
+		}
 		
                 for (; pos->item < reiser4_node_items(place.node); pos->item++)	{
                         if ((res = reiser4_place_fetch(&place)))
@@ -3216,12 +3218,17 @@
 					return -EIO;
 				}
 		
-				if ((res = pre_func(place.node, data)) < 0)
-					return res;
-				
-				/* If res != 0, lookup is needed. */
-				if (res) break;
-				
+				if (pre_func) {
+					if ((res = pre_func(place.node, 
+							    data)) < 0)
+					{
+						return res;
+					}
+
+					/* If res != 0, lookup is needed. */
+					if (res) break;
+				}
+
 				count = reiser4_node_items(place.node);
 				place.pos.item = -1;
 				

--Boundary-00=_sR+GBi6dmJ9E/qa--

