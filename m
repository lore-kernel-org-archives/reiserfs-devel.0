From: Tahsin Erdogan <tahsin@google.com>
Subject: Re: [PATCH 28/28] quota: add extra inode count to dquot transfer functions
Date: Tue, 20 Jun 2017 02:53:22 -0700
Message-ID: <CAAeU0aMPZdG9r-en9qKLHcYwPbm-4=uTrZunXngj9WztCCoPgQ@mail.gmail.com>
References: <20170531081517.11438-1-tahsin@google.com> <20170531081517.11438-28-tahsin@google.com>
 <20170615075735.GB1764@quack2.suse.cz> <CAAeU0aNgon_ERWyUNmAGaBCuk3dU9qAxA7QnZ4D8cb5g6JZcPg@mail.gmail.com>
 <20170619090329.GE11837@quack2.suse.cz> <CAAeU0aM=QDb-iCnr5KVatQmmbQy8A7XmbyFBttK72SGt3oNTUg@mail.gmail.com>
 <20170619123614.GA20405@quack2.suse.cz>
Mime-Version: 1.0
Return-path: <linux-ext4-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=9eh+gwXgU7WKletL2+cwyKX+YoPVrrbF33bKfIzoL7o=;
        b=Uuo11S7ALGFn2rcRIqe0yetwGtOSxAnaxMUbb35kawPXbSeEJHYByak3BXxkNpUHQ4
         ns6UlstQhsnMNytvC537j91LulSEc9eaHziCAOSx3wIY6KXrSQBbWIXgW2RbWQnCoN+k
         Nz3DWTfby6mnT9RZriPEObICIYeu8KfN+haq8brbtVBeynvxunsypA1k+1lpqTbYHNHs
         OzdAHz099RoN3OIQZ8DUb8XrNtqncsfdwSCDjL1OTZrdT+p+YePb1i6PmeU9ovfNCu7k
         U3Y0dFaocvUuX4R/ZqXhJEyS9ZVEbI6AE7O6k9Fw2ET88DrIZck//QB8H/y55vwcwK+9
         BStQ==
In-Reply-To: <20170619123614.GA20405@quack2.suse.cz>
Sender: linux-ext4-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org

On Mon, Jun 19, 2017 at 5:36 AM, Jan Kara <jack@suse.cz> wrote:
> Heh, this "pushing of responsibility" looks like a silly game. If an error
> can happen in a function, it is better to report it as far as easily
> possible (unless we can cleanly handle it which we cannot here). I'm guilty
> of making dquot_free_inode() ignore errors from mark_all_dquot_dirty() and
> in retrospect it would have been better if these were propagated to the
> caller as well. And eventually we can fix this if we decide we care enough.
> I'm completely fine with just returning an error from dquot_free_inode()
> and ignore it in all the callers except for ext4. Then filesystems which
> care enough can try to handle the error. That way we at least don't
> increase the design debt from the past.

I sent an update but since patch title changed it landed in a new
email thread I think ("[PATCH v2 28/31] quota: add get_inode_usage
callback to transfer multi-inode charges"). I will respond to your
comment in that thread.
