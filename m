From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: "WARNING: Wrong master super block magic" message on boot only
Date: Sun, 12 Sep 2004 17:07:56 +0400
Message-ID: <20040912130755.GT6294@backtop.namesys.com>
References: <676b8ab0409102026251feacd@mail.gmail.com> <20040911193217.GR6294@backtop.namesys.com> <676b8ab0409120102326e5b16@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21703-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <676b8ab0409120102326e5b16@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Thomas <linuxsense@gmail.com>
Cc: reiserfs-list@namesys.com

On Sun, Sep 12, 2004 at 01:02:37AM -0700, Dave Thomas wrote:
> On Sat, 11 Sep 2004 23:32:17 +0400, Alex Zarochentsev <zam@namesys.com> wrote:
> > > This message only shows up on boot...if I unmount the partition then
> > > mount it again I do not get that error. I ran a 'fsck' on the
> > > partition and everything looked OK...output is at end of message. I
> > > have re-run 'mkfs.reiser4' on the partition but this did not stop the
> > > 'warning' message on boot.
> > 
> > do you mean that the system could not mount reiser4 volume at boot time?
> > or it was only reiser4 warning?
> 
> 
> The partition mounts and functions just fine...I just get the warning.

the warning means that the mount attempt fails.
fs/reiser4/init_super.c:  
...
	} else {
		if (!silent) {
			warning("nikita-2608", "Wrong master super block magic.");
		}

		/* no standard reiser4 super block found */
		brelse(super_bh);
		/* FIXME-VS: call guess method for all available layout
		   plugins */
		/* umka (2002.06.12) Is it possible when format-specific super
		   block exists but there no master super block? */
		return RETERR(-EINVAL);
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
...

I think the warning was printed in a failed mount attempt, then reiser4 volume
gets mounted in another (successful) attempt.

Please apply the following patch to see what device was tried:
===== init_super.c 1.35 vs edited =====
--- 1.35/init_super.c	Fri Aug  6 20:51:08 2004
+++ edited/init_super.c	Sun Sep 12 16:55:22 2004
@@ -195,7 +195,7 @@
 		brelse(super_bh);
 	} else {
 		if (!silent) {
-			warning("nikita-2608", "Wrong master super block magic.");
+			warning("nikita-2608", "%s: wrong master super block magic.", s->s_id);
 		}
 
 		/* no standard reiser4 super block found */
======================= 


> > 
> > I can only guess that software raid was not started at the moment of first
> > attempt to mount it.  
> 
> 
> Interesting point. I'll setup the system so the reiser4 volume is
> mounted later in the boot.
> 
> 
> > Do other fs work well with the same device?
> 
> 
> Yes, the ext3 volumes do not give any errors.

the message should be 
"VFS: Can't find ext3 filesystem on dev %s.\n"

> 
> Thanks Alex, I appreciate your response.
> 
> Dave

-- 
Alex.
