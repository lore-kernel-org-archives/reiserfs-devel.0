From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: [PATCH] reiserfs: on-demand bitmap loading (testing only)
Date: Fri, 8 Jul 2005 09:35:28 +0400
Message-ID: <200507080935.28944.zam@namesys.com>
References: <42CC4B7F.2070506@suse.com> <42CC5F1E.6060505@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25051-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CC5F1E.6060505@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Elena Gryaznova <grev@namesys.com>
Cc: reiserfs-list@namesys.com, Jeff Mahoney <jeffm@suse.com>

On Thursday 07 July 2005 02:45, Hans Reiser wrote:
> Jeff, are you sure that you need this code to exist?  Here are the
> problems I see:
>
>     for the average case, it is suboptimal.  The seeks to the bitmaps
> are far more expensive than the averaged cost of keeping them in ram.

It would be good to see the benchmark results which your opinion is based on.

I know that on-demand bitmap loading in reiser4 was under suspicion 
several times but I don't remember any benchmark results which showed a
slowdown regarding that.  

>
>     for 16TB filesystems, they will have plenty of budget for ram
>
>     it complicates code if it has to worry about such things as not
> enough clean memory for holding bitmaps, etc.
>
>     It is more appropriate to write this kind of code for the
> development branch which is V4.  This kind of code is likely to have
> hard to test and hit bugs.
>

Lena, may you check how the bitmap on-demand loading patch affects, say,
mongo results for reiserfs?

Thanks, 
Alex.

