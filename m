From: Chris Mason <mason@suse.com>
Subject: Re: Re: [PATCH CFT] tons of logging patches
Date: 02 Aug 2002 09:10:58 -0400
Message-ID: <1028293858.12670.229.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11113-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D4A823B.7040803@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, 2002-08-02 at 08:59, Hans Reiser wrote:
> >
> we just saw a benchmark in which data=ordered caused a major slowdown. 
>  Does this patch fix this?
> 
> Edward and Elena, I want thorough benchmarking of this.
> 

The last fract_tree benchmarks were on older patches, Manual Krause's
benchmark was more showing the difference between a used and a fresh
filesystem, and he was using -23 which had data=ordered performance
issues fixed in -24.

More benchmarking does need to be done, the patch isn't set in stone yet
;-)

-chris

