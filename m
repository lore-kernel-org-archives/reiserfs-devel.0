From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 4/6] kill-the-BKL/reiserfs: release the write lock
	inside get_neighbors()
Date: Fri, 1 May 2009 15:25:07 +0200
Message-ID: <20090501132506.GD6011@nowhere>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com> <1241145862-21700-5-git-send-email-fweisbec@gmail.com> <20090501055135.GF5983@elte.hu>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=HSWmj78yERM+6Yk9RbJpwGn8Li5e2M5qLhB0jFSm0qo=;
        b=NkaV2ikPzDjYxqkzOwFOWnzu8DSDrdLVHHzWz0Foiy2UH99rQ6Et2VPO5OVGyNWdb6
         wjvnmEaXswFqWDPH+B6iWzxvTImmL3hXUi9y0H9zIb/vj6wOfDjRtvqDKfrjoJ59BanY
         gEiv2zOzJPwZgde4Ss7o9LvPb7xK8hF2OK8lk=
Content-Disposition: inline
In-Reply-To: <20090501055135.GF5983@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On Fri, May 01, 2009 at 07:51:35AM +0200, Ingo Molnar wrote:
> 
> * Frederic Weisbecker <fweisbec@gmail.com> wrote:
> 
> > get_neighbors() is used to get the left and/or right blocks 
> > against a given one in order to balance a tree.
> > 
> > sb_bread() is used to read the buffer of these neighors blocks and 
> > while it waits for this operation, it might sleep.
> > 
> > The bkl was released at this point, and then we can also release 
> > the write lock before calling sb_bread().
> > 
> > This is safe because if the filesystem is changed after this lock 
> > release, the function returns REPEAT_SEARCH (aka SCHEDULE_OCCURRED 
> > in the function header comments) in order to repeat the neighbhor 
> > research.
> > 
> > [ Impact: release the reiserfs write lock when it is not needed ]
> 
> This should also be safe because under the BKL we _already_ dropped 
> the lock when sb_bread() blocked (which it really would in the 
> normal case).
> 
> There's one special case to consider though: sb_read() maps to 
> __bread() which can return without sleeping if the bh is already 
> uptodate. So if the filesystem _knows_ that the bh is already 
> uptodate and holds a reference to it (this is common pattern in 
> filesystems), it can have a locking assumption on that.
> 
> No such assumption seems to be present here though.
> 
> 	Ingo


Yeah, fortunately it doesn't base its check on the state of the
buffer but on the tree number of rebalancing.

But I have to remember this pattern, it could be present elsewhere
in reiserfs.

Thanks.

