From: Vijayan Prabhakaran <pvijayan@gmail.com>
Subject: Re: Bug in data journaling patch ?!
Date: Mon, 16 Aug 2004 11:23:54 -0500
Message-ID: <d68fdf7d040816092378a16ee9@mail.gmail.com>
References: <d68fdf7d04081608477fc84e06@mail.gmail.com> <1092672478.12138.245.camel@watt.suse.com>
Reply-To: Vijayan Prabhakaran <pvijayan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20340-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1092672478.12138.245.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiser@namesys.com, vijayan@cs.wisc.edu, reiserfs-list@namesys.com

Yes, this happens only on the first transaction after the mount. For
all other later transactions it works fine.

thanks,
vijayan

On Mon, 16 Aug 2004 12:07:59 -0400, Chris Mason <mason@suse.com> wrote:
> On Mon, 2004-08-16 at 11:47, Vijayan Prabhakaran wrote:
> 
> > Bug description:
> > ------------------
> > In journal.c there is a function called do_journal_end(). There is
> > line in that function that initializes commit_trans_id. It looks like:
> >
> > commit_trans_id = jl->j_trans_id;
> >
> > The value of jl->j_trans_id was 0 (this could be due to some memset()).
> >
> 
> This would indeed be a bug, but it's not clear how jl->j_trans_id
> becomes zero.
> 
> A little farther down in do_journal_end, we set
> SB_JOURNAL()->j_current_jl->j_trans_id to the transaction id of the next
> transaction.  It should be impossible for it to ever be zero.
> 
> The only exception looks like the very first transaction for each
> mount.  The journal_init function doesn't set j_current_jl->j_trans_id
> to a non-zero value.
> 
> Can you confirm that you're only seeing this problem on the first
> transaction?
> 
> -chris
> 
>
