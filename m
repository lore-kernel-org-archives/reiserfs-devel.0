From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 and laptop_mode
Date: Wed, 19 Oct 2005 12:33:47 +0400
Message-ID: <200510191233.48315.zam@namesys.com>
References: <19812996093.20051017162429@usu.ru> <43545DCF.1070301@namesys.com> <e692861c0510171934m56e2a41dw8a780eb6ddb02f6e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26564-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c0510171934m56e2a41dw8a780eb6ddb02f6e@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: reiserfs-list@namesys.com

On Tuesday 18 October 2005 06:34, Gregory Maxwell wrote:
> On 10/17/05, Hans Reiser <reiser@namesys.com> wrote:
> > > In fact, if you have enough RAM, you won't ever touch the
> > >disk -- deleting a file before it's committed means it never touches
> > > disk.
> > >
> > >It is not as spindown-friendly as laptop_mode, which notices when the
> > >drive has to spin up anyway (maybe through a read) and flushes all
> > >writes.  Don't know if they are compatible.
> >
> > We should work to integrate well with it.  Zam, can you look at that?
> > Thanks.
>
> Actually, laptop mode flushes when there is a write and sync all
> pending transactions just before spindown. (delaying the write as long
> as possible to hopefully get as much in one pass as possible).

Does the kernel really know when the disk spins down? 

> In the future when enough API is exposed to make a nice interface for
> multi-syscall transactions with partial sync (i.e. only forced syncs
> of blocks related to transactions which demand physical fixation), it
> would be nice if the commit logic were smart enough to grab other
> nearby small transactions and batch them into the same commit.

If there is a fs-specific 'prepare-to-disk-spindown' hook we can scan the atom 
list and commit all atoms which may cause the disk to be woken up too early.

-- 
Alex.
