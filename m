From: Robert August Vincent II <bobvin@pillars.net>
Subject: Re: Reiser4 and linux 2.6.0
Date: Fri, 1 Aug 2003 12:15:20 -0400
Message-ID: <20030801161520.GA17083@pillars.net>
References: <3F1EF7DB.2010805@namesys.com> <3F1F6005.4060307@tupshin.com> <1059021113.7911.13.camel@localhost> <3F1F66F0.1050406@tupshin.com> <1059024090.9728.22.camel@localhost> <16159.48809.812634.455756@laputa.namesys.com> <3F1FF6DB.2090104@tupshin.com> <20030724152649.GB12647@work.bitmover.com> <3F1FFBF9.2050308@tupshin.com> <20030724155432.GE12647@work.bitmover.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15120-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030724155432.GE12647@work.bitmover.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry McVoy <lm@work.bitmover.com>, reiserfs mailing list <reiserfs-list@Namesys.COM>

Could you explain, in simple terms, to somebody who is unfamiliar with
bitkeeper, how to pull the latest 2.6.0 and reiser4 code and do
whatever you did to merge them?

I'm not working on any SCM, and therefore downloaded bitkeeper using
the "free" license.

But I'm unclear (even after perusing the FAQ and docs) on how to do
what you just described.

Perhaps it would be as simple as:

bk clone http://linux.bkbits.net/linux-2.5
bk clone bk://bk.namesys.com/bk/reiser4-linux-2.5 linux-2.5
cd linux-2.5/fs
bk clone bk://bk.namesys.com/bk/reiser4

But I doubt it...

On Thu, Jul 24, 2003 at 08:54:32AM -0700, Larry McVoy wrote:
> On Thu, Jul 24, 2003 at 08:26:49AM -0700, Larry McVoy wrote:
> > > >http://www.namesys.com/code.html (requires bitkeeper)?                     
> >                                                                               
> > If someone can tell me what it is that you need and I'll do it and send you   
> > a patch.  I'm cloning that tree now.                                          
>    
> I pulled the r4 tree into linux-2.5 (2.6) top of trunk, merged it (it all
> automerged, ya gotta love that, see below), and sent out a patch.  If someone
> else needs that patch let me know.
> 
> takepatch: 2782 new revisions, 8 conflicts in 357 files
> 440459 bytes uncompressed to 2455963, 5.58X expansion
> Running resolve to apply new work ...
> resolve: found 25 renames in pass 1
> resolve: resolved 25 renames in pass 2
> Content merge of Makefile OK
> Content merge of arch/um/drivers/ubd_kern.c OK
> Content merge of fs/jbd/transaction.c OK
> Content merge of fs/proc/proc_misc.c OK
> Content merge of include/linux/sched.h OK
> Content merge of kernel/ksyms.c OK
> Content merge of kernel/sched.c OK
> resolve: resolved 7 conflicts in pass 3
> -- 
> ---
> Larry McVoy              lm at bitmover.com          http://www.bitmover.com/lm
