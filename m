From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Re: When is a defragmenting tool expected to be released?
Date: Sat, 26 Apr 2003 08:14:47 +0200
Message-ID: <000e01c30bbb$23ca3470$0200a8c0@xpstation>
References: <569438017.20030425213516@tnonline.net> <200304261414.00860._nasturtium@bigpond.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13818-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

In the article you pointed out I could read this :



3. What is the fragmentation policy of ReiserFS and how is it dealing with
it?

Hans Reiser: This is an area we are still experimenting with. We currently
do what ext2 does, and preallocate blocks. What XFS does is much better,
they allocate blocknrs to blocks at the time they are flushed to disk, and
this allows a much more efficient and optimal allocation to occur. We knew
we couldn't do it the XFS way and make code freeze for 2.4, but reiser4 is
being built around delayed allocation, and I'd like to thank the XFS
developers for taking the time to personally explain to me why delayed
allocation is the way to go.



Hans said Reiser4 would use data preallocate blocks as ext2 does, and the
Reiser4 feature paper is speaking about a "repacker" that should be fully
functionnal at 4.1 release. How do you feel about that ?

Fred

----- Original Message ----- 
From: "_nasturtium" <_nasturtium@bigpond.com>
To: "Anders Widman" <andewid@tnonline.net>; <reiserfs-list@namesys.com>
Sent: Saturday, April 26, 2003 6:14 AM
Subject: Re: When is a defragmenting tool expected to be released?


> On Sat, 26 Apr 2003 05:35 am, Anders Widman wrote:
> >    I  am  curious  about  if/when  a  defragmenting  tool that support
> >    reiserfs  will  be  available.  Please  do  not  say  to  tar/untar
> >    everything. I simply do not have enough storage for that.
>
> No defragmenting tools that I know of, or mentioned on the list.
>
> You might like to check out what Hans Reiser wrote at
> http://www.osnews.com/story.php?news_id=69.
> Basically, reiser4 will have delayed allocation, like XFS, rather than the
> current ext2-like system of preallocating blocks, so it'll be a lot more
> fragmentation-resistant.
>
> However, if you just want to check fragmentation there's a program called
> mongo, it's a benchmarking package and you can see if your filesystem (or
> even individual files) are fragmented.
>
> Regards,
> _nasturtium
>

