From: Oleg Drokin <green@namesys.com>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Wed, 9 Oct 2002 12:18:11 +0400
Message-ID: <20021009121811.A22948@namesys.com>
References: <20021009094215.B11954@namesys.com> <Pine.LNX.4.44.0210091041350.880-100000@fii.fi.tartu.ee>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11625-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0210091041350.880-100000@fii.fi.tartu.ee>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Tiismus <robert@fi.tartu.ee>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Oct 09, 2002 at 11:06:36AM +0300, Robert Tiismus wrote:

> > Also you probably want to run reiserfsck on that disk to make sure
> > no other damage happened.
> Thank you. Reiserfsck said that all is ok. It's just that I have seen nothing

This is good.

> similar happening with other filesystems. I would prefer disappearing
> data to leaking data. Am I completely wrong, when I say that because of
> 'tail packing' in ReiserFS, it can leak information with more
> probability than, lets say ext2 or ufs or...? Will notails option give

No, tail packing should have no effect on leakign data.
Anyway tail packing is only takes effect for files less than 16K in size.

> me more secure FS? I have to assure company management, and myself, that this

notails will have no effect on that.

> incident happened not because I put ReiserFS on new server. It could
> have happened also with other filesystems :)

Indeed it seems that you've got either some metadata altered (block pointers)
or the block content swapped somehow, both of which could happen on any FS
with absolutely same results.
BTW, I just remembered that until you apply Chris' Mason "data logging" patches,
there is a certain window where system crash would lead to "deleted" 
data appearing at the end of files that were appended before the crash.
(that's it, metadata is already updated and list newly allocated blocknumbers,
but old content od those blocks is still intact since crash prevented system
from putting new content in there), but since you've got other file's data
in the middle of file, this is not the case.

Bye,
    Oleg
> 
> Robert Tiismus
> 
