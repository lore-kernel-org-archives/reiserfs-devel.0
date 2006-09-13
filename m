From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser FS will not boot after crash
Date: Wed, 13 Sep 2006 18:52:00 +0400
Message-ID: <200609131852.00988.vs@namesys.com>
References: <Pine.LNX.4.04.10609041516380.4384-100000@nei15.nei1.nei.mv.com> <200609042333.27778.vs@namesys.com> <45080EE8.4050702@suse.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_QsBCFubyB1o6JXZ"
Return-path: <reiserfs-list-return-29870-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45080EE8.4050702@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: jmh5@nei.mv.com
Cc: reiserfs-list@namesys.com, Jeff Mahoney <jeffm@suse.com>

--Boundary-00=_QsBCFubyB1o6JXZ
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello

On Wednesday 13 September 2006 18:00, Jeff Mahoney wrote:
> Vladimir V. Saveliev wrote:
> > Hello
> >
> > On Monday 04 September 2006 23:26, jmh5@nei.mv.com wrote:
> >> Hi,
> >>
> >>   I am observing the following Reiser failure:
> >>
> >>   I am trying to use camorama with a Creative WebCam Live spca5xx driver
> >> (recently downloaded and compiled) . Camorama does not start and
> >> computer freezes (no response to mouse, or keyboard. Can't change to
> >> terminal window.
> >>
> >>   Reset or pull plug leaves Knoppix 5.0.1-DVD unbootable:
> >>
> >>   The actual message from GRUB is inconsistent filesystem?! From a boot
> >> loader?
> >
> > after unclean shutdown journal reply is necessary to return reiserfs to
> > consistent state. Maybe GRUB did not do that?
>
> Grub uses the journal in a read-only mode. It doesn't replay it in a
> writable fashion. When grub needs a block, it scans the blocks used in
> the journal, and uses the most recent copy it finds there before looking
> out to the rest of the file system.
>
> >>   The 'fix' is even stranger. I execute fsck.reiserfs from another OS
> >> partition on the Knoppix 5.0.1-DVD partition (takes forever).
> >
> > Did fsck complete? What did it report?
> >
> >> Somehow
> >> 'reading' the Knoppix filesystem 'fixes' whatever was preventing Knoppix
> >> 5.0.1-DVD from booting.
> >
> > fsck replayed the journal.
> > Does camorama work now?
> >
> > If it still causes computer freeze - can you please install serial or
> > network console and try to catch what does kernel output when it freezes.
>
> If the system doesn't work still, I believe grub has a debugging output
> mode that could yield more information. You'd need to rebuild and
> reinstall it.
>
knoppix 5.0.1 uses grub-0.97. John, can you, please, patch it with the 
attached patch, build and re-install as boot loader it and try to reproduce 
the problem. Hopefuly, added output will help us to understand why grub finds 
the filesystem is inconsistent.




> -Jeff

--Boundary-00=_QsBCFubyB1o6JXZ
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="reiserfs-debug.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfs-debug.patch"


diff -puN stage2/fsys_reiserfs.c~reiserfs-debug stage2/fsys_reiserfs.c
--- grub-0.97/stage2/fsys_reiserfs.c~reiserfs-debug	2006-09-13 18:41:43.000000000 +0400
+++ grub-0.97-vs/stage2/fsys_reiserfs.c	2006-09-13 18:45:40.000000000 +0400
@@ -22,7 +22,7 @@
 #include "shared.h"
 #include "filesys.h"
 
-#undef REISERDEBUG
+#define REISERDEBUG 1
 
 /* Some parts of this code (mainly the structures and defines) are
  * from the original reiser fs code, as found in the linux kernel.
@@ -664,6 +664,9 @@ reiserfs_mount (void)
   return 1;
 }
 
+#define fs_corrupted()							\
+  printf("%s: %d: %s: fs inconsistency is found\n", __FILE__, __LINE__, __FUNCTION__)
+
 /***************** TREE ACCESSING METHODS *****************************/
 
 /* I assume you are familiar with the ReiserFS tree, if not go to
@@ -713,6 +716,7 @@ read_tree_node (unsigned int blockNr, in
   /* Make sure it has the right node level */
   if (BLOCKHEAD (cache)->blk_level != depth)
     {
+      fs_corrupted();
       errnum = ERR_FSYS_CORRUPT;
       return 0;
     }
@@ -878,6 +882,7 @@ search_stat (__u32 dir_id, __u32 objecti
 	}
       ih++;
     }
+  fs_corrupted();
   errnum = ERR_FSYS_CORRUPT;
   return 0;
 }
@@ -1058,8 +1063,10 @@ reiserfs_dir (char *dirname)
 	  if (! next_key ()
 	      || reiserfs_read (linkbuf, filemax) != filemax)
 	    {
-	      if (! errnum)
+	      if (! errnum) {
+		fs_corrupted();
 		errnum = ERR_FSYS_CORRUPT;
+	      }
 	      return 0;
 	    }
 

_

--Boundary-00=_QsBCFubyB1o6JXZ--
