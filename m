From: Bill Rees <mtfbwy_1968@yahoo.com>
Subject: Re: Large Partition Performance Test
Date: Fri, 12 Apr 2002 06:21:33 -0700 (PDT)
Message-ID: <20020412132133.2596.qmail@web10007.mail.yahoo.com>
References: <20020412133937.A21820@namesys.com>
Reply-To: bill@billrees.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10057-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020412133937.A21820@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>, bill@billrees.com
Cc: reiserfs-list@namesys.com

Oleg,

That seems to have done the trick.  Which is the most
stable release that you would recommend that would
include this fix?

thanks!
Bill

--- Oleg Drokin <green@namesys.com> wrote:
> Hello!
> 
> On Thu, Apr 11, 2002 at 11:14:59AM -0700, Bill Rees
> wrote:
> > I upgraded my kernel to 2.4.19-pre6 with the
> speedup
> > patch installed and still see similiar results as
> > before.  As the amount of data on the partition
> > increases, my write performance slows.  This time,
> I
> > simply modified a previously posted script to
> mimic my
> > production application.  The test is still running
> and
> > will take quite awhile to fill the disk.  Each
> line of
> > the output represents 1.68gb of disk space.
> 
> Ok, I see the problem now. You create a lot of small
> files, and when a lot
> of disk space is used, a lot of unnecesary
> blockfinding is performed on
> each file creation.
> if you mount your partition with -o
> no_unhashed_relocation option,
> effect of that will be much lighter. With this
> option that's what I see:
> day/hour 00 00 seconds = 285
> day/hour 00 01 seconds = 288
> day/hour 00 02 seconds = 290
> day/hour 00 03 seconds = 289
> day/hour 00 04 seconds = 290
> day/hour 00 05 seconds = 292
> day/hour 00 06 seconds = 292
> day/hour 00 07 seconds = 292
> 
> 
> Also new block allocator that I posted to the list
> recently should not excibit
> this behavior at all in any of modes. (I am just
> going to verify this theory ;)
> )
> 
> Bye,
>     Oleg


=====
Bill Rees - bill@billrees.com - http://billrees.com

__________________________________________________
Do You Yahoo!?
Yahoo! Tax Center - online filing with TurboTax
http://taxes.yahoo.com/
