From: Oleg Drokin <green@namesys.com>
Subject: Re: kernel panic with PAP-8252
Date: Tue, 30 Jul 2002 17:02:31 +0400
Message-ID: <20020730170231.A18417@namesys.com>
References: <20020730211933.2D2F.K-MORIKAWA@stage.gr.jp> <20020730162633.A16872@namesys.com> <20020730214311.2D32.K-MORIKAWA@stage.gr.jp>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11100-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020730214311.2D32.K-MORIKAWA@stage.gr.jp>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "K. Morikawa" <k-morikawa@stage.gr.jp>
Cc: reiserfs-list@namesys.com

Hello!

   This check is invalid and newer reiserfs patches are no longer checking
   this stuff, since it is unneeded. You should upgrade your kernel,
   or alternatively you can rebuild your kernel with CONFIG_REISERFS_CHECK
   config option turned off, it will disable these kind of checks, but other
   bugs won't go away, though.

Bye,
    Oleg   
On Tue, Jul 30, 2002 at 09:52:40PM +0900, K. Morikawa wrote:
> Hello!!
> Sorry, I was mistaking a code.
> The correct code is as follows.
> 
> PAP-8285: get_neighbors : invalid rdkey<0> kernel panic:
> REISERFS: panic (device 08:31): PAP-8285: get_neighbors
> 
> Please support.
> Regards.
> 
> Kohji Morikawa <k-morikawa@stage.gr.jp>
> ----------------------------------------------------------------------->
> On Tue, 30 Jul 2002 16:26:33 +0400
> Oleg Drokin <green@namesys.com> wrote:
> 
> > Hello!
> > 
> >    There is no PAP-8252 assertion in our code (And there was no such
> >    assertion in 3.5.29 version either (just checked)).
> >    Can you please verify what assertion you are getting?
> > 
> > Bye,
> >     Oleg
> > On Tue, Jul 30, 2002 at 09:20:33PM +0900, K. Morikawa wrote:
> > > Hello.
> > > Thank you for your reply.
> > > 
> > > I understand that kernel-2.2.18 and reiserfs-3.5.29 is old.
> > > Also reiserfs-3.5.35(latest) is fixed many bugs too.
> > > However, it is unable to up the version immediately.
> > > because cause of this problem is indistinct and
> > > It's necessary the inspection of the middleware and application related.
> > > 
> > > Please investigate and advice me.
> > > Regards
> > > 
> > > Kohji Morikawa <k-morikawa@stage.gr.jp>
> > > ----------------------------------------------------------------------->
> > > On Tue, 30 Jul 2002 15:03:40 +0400
> > > Oleg Drokin <green@namesys.com> wrote:
> > > 
> > > > Hello!
> > > > 
> > > > On Tue, Jul 30, 2002 at 03:11:33PM +0900, K. Morikawa wrote:
> > > > 
> > > > > TurboLinux 6.5 Server (kernel-2.2.18 , reiserfs-3.5.29)
> > > > 
> > > > You should consider upgrading if not whole kernel than at least the reiserfs
> > > > part to version 3.5.35.
> > > > Patch can be obtained from ouf ftp site ftp.namesys.com.
> > > > 
> > > > Bye,
> > > >     Oleg
> > > 
> 
> ?$B?9@n <k-morikawa@stage.gr.jp>
> ----------------------------------------------------------------------->
> 
