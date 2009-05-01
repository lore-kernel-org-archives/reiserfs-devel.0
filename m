From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 5/6] kill-the-BKL/reiserfs: release the write lock
	inside reiserfs_read_bitmap_block()
Date: Fri, 1 May 2009 15:19:55 +0200
Message-ID: <20090501131955.GC6011@nowhere>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com> <1241145862-21700-6-git-send-email-fweisbec@gmail.com> <20090501054734.GE5983@elte.hu>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=Msm2lZMRIXd9pG2fDvjiiwIcFzIKmc6QD/Uq0VKbu9E=;
        b=HFKQwacTmIF+RpDapTMPSEBtIOekSnlQiUrtVm08SVwl7Av22K/o6ddcd8H3H2isbJ
         O+oBy7E8OYgfc+bs3WiK+2Hm7s2ADbmxjzA/UvuwRXSQNReNHf1gHKRweu4XVBEp56q0
         gJhgbM1AOHgblXqgYVKz8cnx+ghYqppHXa+Hg=
Content-Disposition: inline
In-Reply-To: <20090501054734.GE5983@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On Fri, May 01, 2009 at 07:47:34AM +0200, Ingo Molnar wrote:
> 
> * Frederic Weisbecker <fweisbec@gmail.com> wrote:
> 
> > reiserfs_read_bitmap_block() uses sb_bread() to read the bitmap block. This
> > helper might sleep.
> > 
> > Then, when the bkl was used, it was released at this point. We can then
> > relax the write lock too here.
> > 
> > [ Impact: release the reiserfs write lock when it is not needed ]
> > 
> > Cc: Jeff Mahoney <jeffm@suse.com>
> > Cc: Chris Mason <chris.mason@oracle.com>
> > Cc: Alexander Beregalov <a.beregalov@gmail.com>
> > Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
> > ---
> >  fs/reiserfs/bitmap.c |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
> > index 1470334..6854957 100644
> > --- a/fs/reiserfs/bitmap.c
> > +++ b/fs/reiserfs/bitmap.c
> > @@ -1249,7 +1249,9 @@ struct buffer_head *reiserfs_read_bitmap_block(struct super_block *sb,
> >  	else if (bitmap == 0)
> >  		block = (REISERFS_DISK_OFFSET_IN_BYTES >> sb->s_blocksize_bits) + 1;
> >  
> > +	reiserfs_write_unlock(sb);
> >  	bh = sb_bread(sb, block);
> > +	reiserfs_write_lock(sb);
> >  	if (bh == NULL)
> >  		reiserfs_warning(sb, "sh-2029: %s: bitmap block (#%u) "
> >  		                 "reading failed", __func__, block);
> 
> Note, there's a side-effect here: the access to sb->b_blocksize is 
> moved outside of the lock. Previously it was accessed via the BKL. 
> On a mounted filesystem sb->b_blocksize is not supposed to change, 
> so it's probably not an issue - but wanted to mention it.
> 
> 	Ingo


Indeed. Well I guess it can't be dynamically changed.
This is something that can be chosen with mkfs on filesystem creation
but I guess it can't be changed, at least not while the filesystem
is mounted. I hope...

Frederic.

