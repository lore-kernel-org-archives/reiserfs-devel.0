From: Andrey Savochkin <saw@saw.sw.com.sg>
Subject: Re: question about a possible deadlock
Date: Fri, 26 Apr 2002 17:01:29 +0400
Message-ID: <20020426170129.A26325@castle.nmd.msu.ru>
References: <20020426150726.A25444@castle.nmd.msu.ru> <1019822456.6770.59.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10185-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1019822456.6770.59.camel@tiny>; from "Chris Mason" on Fri, Apr 26, 2002 at 08:00:56AM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

On Fri, Apr 26, 2002 at 08:00:56AM -0400, Chris Mason wrote:
> On Fri, 2002-04-26 at 07:07, Andrey Savochkin wrote:
> > Hi,
> > 
> > I've found a call sequence leading to what looks like a deadlock:
> > open
> >   reiserfs_create
> >     journal_begin
> >     reiserfs_new_inode
> >       failure by one of multiple reasons
> >       iput [note that inode->i_nlink == 0]
> >         reiserfs_delete_inode
> >           journal_begin
> >             deadlock, waiting for previous journal_begin to end
> > The code was checked by the mainstream 2.4.18 kernel.
> > Any reasons why this deadlock can't happen?
> 
> Nope, you are exactly right.  We've got a patch in testing that should
> fix this, let me know if you are interested in trying it out.

Yes, I'm interested :-)

	Andrey
