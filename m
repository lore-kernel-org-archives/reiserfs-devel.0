From: Chris Mason <mason@suse.com>
Subject: Re: question about a possible deadlock
Date: 26 Apr 2002 08:00:56 -0400
Message-ID: <1019822456.6770.59.camel@tiny>
References: <20020426150726.A25444@castle.nmd.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10184-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020426150726.A25444@castle.nmd.msu.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrey Savochkin <saw@saw.sw.com.sg>
Cc: reiserfs-list@namesys.com

On Fri, 2002-04-26 at 07:07, Andrey Savochkin wrote:
> Hi,
> 
> I've found a call sequence leading to what looks like a deadlock:
> open
>   reiserfs_create
>     journal_begin
>     reiserfs_new_inode
>       failure by one of multiple reasons
>       iput [note that inode->i_nlink == 0]
>         reiserfs_delete_inode
>           journal_begin
>             deadlock, waiting for previous journal_begin to end
> The code was checked by the mainstream 2.4.18 kernel.
> Any reasons why this deadlock can't happen?

Nope, you are exactly right.  We've got a patch in testing that should
fix this, let me know if you are interested in trying it out.

-chris


