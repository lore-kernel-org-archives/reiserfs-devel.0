From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 2/6] kill-the-BKL/reiserfs: release the write lock
	before rescheduling on do_journal_end()
Date: Fri, 1 May 2009 15:31:48 +0200
Message-ID: <20090501133147.GF6011@nowhere>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com> <1241145862-21700-3-git-send-email-fweisbec@gmail.com> <20090501070911.GG5983@elte.hu>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=q44FWtjwpyPGuCC6ntCVNSdg97EfEjsfGuhFITJ6Fh4=;
        b=oVLvptrWrjgkbzGMLxGxgUP0EN4WHKwOMxHBz2vlHpIcvdNDQiEh9pmLmuQtwtbQz4
         RLsDEs+/0MXvdraFgB+r9N9erahKKPG4iT2YvgW3mkePBfXBMToM8zSRUhoa55VcY27X
         iz90LrvX4k3wmO7iLaREQbYLmq5Q3FniIqBYg=
Content-Disposition: inline
In-Reply-To: <20090501070911.GG5983@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On Fri, May 01, 2009 at 09:09:11AM +0200, Ingo Molnar wrote:
> 
> * Frederic Weisbecker <fweisbec@gmail.com> wrote:
> 
> > When do_journal_end() copies data to the journal blocks buffers in memory,
> > it reschedules if needed between each block copied and dirtyfied.
> > 
> > We can also release the write lock at this rescheduling stage,
> > like did the bkl implicitly.
> > 
> > [ Impact: release the reiserfs write lock when it is not needed ]
> > 
> > Cc: Jeff Mahoney <jeffm@suse.com>
> > Cc: Chris Mason <chris.mason@oracle.com>
> > Cc: Alexander Beregalov <a.beregalov@gmail.com>
> > Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
> > ---
> >  fs/reiserfs/journal.c |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> > index 7976d7d..373d080 100644
> > --- a/fs/reiserfs/journal.c
> > +++ b/fs/reiserfs/journal.c
> > @@ -4232,7 +4232,9 @@ static int do_journal_end(struct reiserfs_transaction_handle *th,
> >  		next = cn->next;
> >  		free_cnode(sb, cn);
> >  		cn = next;
> > +		reiserfs_write_unlock(sb);
> >  		cond_resched();
> > +		reiserfs_write_lock(sb);
> 
> There's 8 cond_resched()'s in the code - i'd suggest to introduce a 
> helper for this - reiserfs_write_cond_resched(sb) or so?
> 
> 	Ingo

Indeed, that + the pattern suggested by Al.

Thanks.

