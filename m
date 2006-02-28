From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Reiser4 unlink performance
Date: Wed, 1 Mar 2006 00:22:29 +0300
Message-ID: <200603010022.29721.zam@namesys.com>
References: <EE7B7176-15E7-43E9-937B-B084879E62A9@hilander.com> <200602282306.35488.zam@namesys.com> <4404B5C5.3090702@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28167-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4404B5C5.3090702@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, "Alec H. Peterson" <ahp@hilander.com>

On Tuesday 28 February 2006 23:42, Hans Reiser wrote:
> Alexander Zarochentsev wrote:
> >On Tuesday 28 February 2006 22:56, Hans Reiser wrote:
> >>Alexander Zarochentsev wrote:
> >>>On Tuesday 28 February 2006 22:11, Hans Reiser wrote:
> >>>>Alec H. Peterson wrote:
> >>>>>Hi Alexander,
> >>>>>
> >>>>>On Feb 26, 2006, at 13:42, Alexander Zarochentsev wrote:
> >>>>>>Which kernel version and reiser4 patches were used?
> >>>>>
> >>>>>2.6.15.4r4 kernel,
> >>>>>reiser4-for-2.6.15-1.patch
> >>>>>
> >>>>>>Is the system SMP?
> >>>>>
> >>>>>Yes.
> >>>>>
> >>>>>>No, "Flushing like mad" usually indicates a bug.
> >>>>
> >>>>Please describe it in more detail.
> >>>
> >>>The flush algorithm designed to make progress in any iteration.
> >>>"flushing like mad" messages usually indicates that the flush
> >>> can't make progress.
> >>
> >>Yet more detail please.
> >
> >the algorithm does not work as designed, it is a design bug or an
> >implementation bug ;)
>
> I seem to remember vs saying this message could be ignored safely at
> times in the past, which is why I am asking you for more details.

We have improved handling of truncate/flush races, especially if 
formatted nodes are deleted.  Now I think that any truncate/flush race 
can be resolved w/o having those too many useless iterations of 
jnode_flush.

> Hans

-- 
Alex.
