From: Chris Mason <mason@suse.com>
Subject: Re: Quota and reiserfs status
Date: 17 Jun 2002 18:16:06 -0400
Message-ID: <1024352166.20149.100.camel@tiny>
References: <3D00B880.E3A7B770@cri74.org> 
	<20020607162010.GI27843@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10762-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020607162010.GI27843@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@ucw.cz>
Cc: Fabien Salvi <fabien@cri74.org>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

On Fri, 2002-06-07 at 12:20, Jan Kara wrote:
>   Hello,
>   
> > I've tried some tests with quota using reiserfs filesystems.
> > It works very well...
> > 
> > I have attached a very little documentation (2 ascii texts) about simple
> > configuration.
> > Hope it can help somebody.
>   The text is nice :)
>   
> > I have one question :
> > Now, you must patch linux kernel to have quota with reiserfs enabled.
> > 
> > Is it provided to the near future, or maybe not before the next stable
> > release of lk ?
>   Currently VFS side of the patches is in 2.5 kernel and I
> suppose Chris will commit Reiserfs part soon. I plan to backport patches
> from 2.5 kernel to 2.4 (but it's not certain Marcello will agree with it
> and I'm also not sure about Reiserfs part of the patches).

I think the 2.4 patches are stable enough that we can include them if
and when Jan's new quota code is included.

For 2.5.x, I want to put in the data logging code first (it is actually
based on pieces of the quota support).  This is non-trivial, but will
make the total time to merge both features easier.

-chris


