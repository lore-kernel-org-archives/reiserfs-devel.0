From: Chris Mason <mason@suse.com>
Subject: Re: Problems with journal size option on mkfs
Date: 16 May 2002 09:02:41 -0400
Message-ID: <1021554161.16587.776.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10332-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CE39F5D.6010604@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Steve Pratt <slpratt@us.ibm.com>, reiserfs-list@namesys.com

On Thu, 2002-05-16 at 08:00, Hans Reiser wrote:
>
> Yes, I admit I was thinking as I pressed send about just how much stuff 
> would be going into pre1 and wondering if it should be broken into pre1, 
> pre2, and pre3.
> 
> Probably the journal relocation stuff, being the most tested in 2.5 (do 
> any reiserfs users use it in 2.5 though?), should go into pre3.
> 
> The bitmap code and the file write code should go into pre1, along with 
> the cleanups.
> 
> Feel free to suggest different orderings, though maybe we should only 
> think about this when it is time for it....

I think we should start with the speedups only.  Lets get the bitmap
code in 2.5.x (ASAP, I'm willing to merge if Oleg is busy) and the file
write changes seem to have a little ways to go.

I believe the relocation stuff should be tested in andrea's and/or
Alan's kernels before we submit for 2.4.21preX.  We shouldn't mix
must-have speedups with nice to have features (as large as the
relocation anyway) in the same 2.4.x series.

-chris


