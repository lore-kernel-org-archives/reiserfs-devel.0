From: Michael Gaughen <mgaughen@polyserve.com>
Subject: Re: BUG in reiserfs_write_full_page().
Date: Thu, 17 Jul 2003 14:53:03 -0700
Message-ID: <3F171ABF.6080601@polyserve.com>
References: <3F1712F6.7080204@polyserve.com> <1058477610.4012.333.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14960-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1058477610.4012.333.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Chris Mason wrote:

>
>Hmmm, the allocation masks are supposed to be set such that writepage
>won't get called.  I'll take a look.  How easy is it to reproduce?  If
>you have any tests cases that can trigger it, please send them along.
>

Actually, the problem may have to do with the common journal_info kept
within the task structure.  Looking at ext3_writepage, they have this to 
say:

        /*
         * We give up here if we're reentered, because it might be
         * for a different filesystem.  One *could* look for a
         * nested transaction opportunity.
         */
        lock_kernel();
        if (ext3_journal_current_handle())
                goto out_fail;

and in the case of out_fail, they do:

        unlock_kernel();
        SetPageDirty(page);
        UnlockPage(page);
        return ret;

So, in the case of reiserfs_write_full_page(), the BUG() is falsely 
triggered
due to a transaction that was started on another filesystem (ext3).  And the
fix would simply be to do something along the lines of ext3...

Thanks,
-Mike

