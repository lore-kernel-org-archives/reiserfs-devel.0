From: Joachim Wagner <jwagner@computing.dcu.ie>
Subject: Re: reiserfs panic with kernel 2.6.19
Date: Tue, 26 Dec 2006 15:09:44 +0100
Message-ID: <200612261509.44499.jwagner@computing.dcu.ie>
References: <200612222044.23690.jwagner@computing.dcu.ie> <200612260018.52682.vs@namesys.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_o0SkFrU2pFiFS7I"
Return-path: <reiserfs-list-return-30343-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200612260018.52682.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--Boundary-00=_o0SkFrU2pFiFS7I
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks for looking into this Vladimir!

> reiserfs panic labeled PAP-5680 which you encountered indicates that file
> truncate did not complete. Actually, reiserfs does not have to panic, it
> has to return EIO or something suitable.
Indeed, that would be much better behaviour. Maybe the attached patch is okay. 
It compiles fine with 2.6.19.1. However, I don't see how to test it. 

> Could it be hardware fault?
In case you saw the smartd warnings concerning /dev/hda, the reiserfs panic 
occurred with a reiserfs on an S-ATA software raid 5 (/dev/sd[a-g]1) I got a 
few months ago. The P-ATA boot disk is the only old component. I don't 
remember any worrying S-ATA or raid messages in my syslog. Unfortunately, I 
cannot have a closer look at the moment as I'm away on holiday.

Regards,
Joachim

--Boundary-00=_o0SkFrU2pFiFS7I
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="stree.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="stree.patch"

--- stree.orig	2006-12-11 20:32:53.000000000 +0100
+++ stree.c	2006-12-26 14:53:48.000000000 +0100
@@ -1898,9 +1898,30 @@
 				goto out;
 			reiserfs_update_inode_transaction(p_s_inode);
 		}
-	} while (n_file_size > ROUND_UP(n_new_file_size) &&
-		 search_for_position_by_key(p_s_inode->i_sb, &s_item_key,
-					    &s_search_path) == POSITION_FOUND);
+	if (n_file_size > ROUND_UP(n_new_file_size)) {
+		retval = search_for_position_by_key(p_s_inode->i_sb,
+						  &s_item_key, &s_search_path);
+		if (retval == IO_ERROR) {
+			reiserfs_warning(p_s_inode->i_sb,
+				 	"jw-5670: reiserfs_do_truncate: "
+				 	"i/o failure occurred searching for %K",
+				 	&s_item_key);
+			err = -EIO;
+			goto out;
+		}
+		if (retval == FILE_NOT_FOUND) {
+			reiserfs_warning(p_s_inode->i_sb,
+				 	"jw-5672: reiserfs_do_truncate: "
+				 	"file not found searching for %K",
+				 	&s_item_key);
+			err = -EIO;
+			goto out;
+		}
+	}
+	else
+		retval = POSITION_NOT_FOUND;
+
+	} while (retval == POSITION_FOUND);
 
 	RFALSE(n_file_size > ROUND_UP(n_new_file_size),
 	       "PAP-5680: truncate did not finish: new_file_size %Ld, current %Ld, oid %d",

--Boundary-00=_o0SkFrU2pFiFS7I--
