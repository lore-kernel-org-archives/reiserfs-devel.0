From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 1/6] kill-the-BKL/reiserfs: release write lock on
	fs_changed()
Date: Fri, 1 May 2009 15:28:25 +0200
Message-ID: <20090501132825.GE6011@nowhere>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com> <1241145862-21700-2-git-send-email-fweisbec@gmail.com> <878wlhpc5r.fsf@basil.nowhere.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=+kAcSeUGa/zeQ1PtPP8kSf807lNkXsu+/Pjfq5IJQ0U=;
        b=Te7yXNNIqQxGT01c8EwfG22wZIwrLtqKQIjHd7ZYcQKcqbgJwurVTpSS71Dd9rD5fe
         vI5Q6qV74mNNznLx1bqlwRCiVEsQf9IoYACZbOhYk0mok1gSaOfRmsE5r7JEhYSX6ZLO
         wUI0IrKgmi+twhMBuxQyt7kE0CkQ0coSTgeQs=
Content-Disposition: inline
In-Reply-To: <878wlhpc5r.fsf@basil.nowhere.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <andi@firstfloor.org>
Cc: Ingo Molnar <mingo@elte.hu>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On Fri, May 01, 2009 at 08:31:12AM +0200, Andi Kleen wrote:
> Frederic Weisbecker <fweisbec@gmail.com> writes:
> >
> > diff --git a/include/linux/reiserfs_fs.h b/include/linux/reiserfs_fs.h
> > index 6587b4e..397d281 100644
> > --- a/include/linux/reiserfs_fs.h
> > +++ b/include/linux/reiserfs_fs.h
> > @@ -1302,7 +1302,13 @@ static inline loff_t max_reiserfs_offset(struct inode *inode)
> >  #define get_generation(s) atomic_read (&fs_generation(s))
> >  #define FILESYSTEM_CHANGED_TB(tb)  (get_generation((tb)->tb_sb) != (tb)->fs_gen)
> >  #define __fs_changed(gen,s) (gen != get_generation (s))
> > -#define fs_changed(gen,s) ({cond_resched(); __fs_changed(gen, s);})
> > +#define fs_changed(gen,s)		\
> > +({					\
> > +	reiserfs_write_unlock(s);	\
> > +	cond_resched();			\
> > +	reiserfs_write_lock(s);		\
> 
> Did you try writing that 
> 
>     if (need_resched()) {               \
> 	reiserfs_write_unlock(s);	\
> 	cond_resched();			\  (or schedule(), but cond_resched does a loop)
> 	reiserfs_write_lock(s);		\
>     }				
> 
> ? That might give better performance under load because users will be better
> batched and you don't release the lock unnecessarily in the unloaded case.



Good catch!
And I guess this pattern matches most of the cond_resched()
all over the code (the only condition is that we must already hold
the write lock).

I will merge your idea and Ingo's one, write a
reiserfs_cond_resched() to have a helper which
factorizes this pattern.

Thanks.


 
> -Andi
> 
> -- 
> ak@linux.intel.com -- Speaking for myself only.

