From: K.Morikawa <k-morikawa@stage.gr.jp>
Subject: Re: kernel panic with PAP-8252
Date: Tue, 30 Jul 2002 21:52:40 +0900
Message-ID: <20020730214311.2D32.K-MORIKAWA@stage.gr.jp>
References: <20020730211933.2D2F.K-MORIKAWA@stage.gr.jp> <20020730162633.A16872@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020730162633.A16872@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-2022-jp"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hello!!
Sorry, I was mistaking a code.
The correct code is as follows.

PAP-8285: get_neighbors : invalid rdkey<0> kernel panic:
REISERFS: panic (device 08:31): PAP-8285: get_neighbors

Please support.
Regards.

Kohji Morikawa <k-morikawa@stage.gr.jp>
----------------------------------------------------------------------->
On Tue, 30 Jul 2002 16:26:33 +0400
Oleg Drokin <green@namesys.com> wrote:

> Hello!
> 
>    There is no PAP-8252 assertion in our code (And there was no such
>    assertion in 3.5.29 version either (just checked)).
>    Can you please verify what assertion you are getting?
> 
> Bye,
>     Oleg
> On Tue, Jul 30, 2002 at 09:20:33PM +0900, K. Morikawa wrote:
> > Hello.
> > Thank you for your reply.
> > 
> > I understand that kernel-2.2.18 and reiserfs-3.5.29 is old.
> > Also reiserfs-3.5.35(latest) is fixed many bugs too.
> > However, it is unable to up the version immediately.
> > because cause of this problem is indistinct and
> > It's necessary the inspection of the middleware and application related.
> > 
> > Please investigate and advice me.
> > Regards
> > 
> > Kohji Morikawa <k-morikawa@stage.gr.jp>
> > ----------------------------------------------------------------------->
> > On Tue, 30 Jul 2002 15:03:40 +0400
> > Oleg Drokin <green@namesys.com> wrote:
> > 
> > > Hello!
> > > 
> > > On Tue, Jul 30, 2002 at 03:11:33PM +0900, K. Morikawa wrote:
> > > 
> > > > TurboLinux 6.5 Server (kernel-2.2.18 , reiserfs-3.5.29)
> > > 
> > > You should consider upgrading if not whole kernel than at least the reiserfs
> > > part to version 3.5.35.
> > > Patch can be obtained from ouf ftp site ftp.namesys.com.
> > > 
> > > Bye,
> > >     Oleg
> > 

森川 <k-morikawa@stage.gr.jp>
----------------------------------------------------------------------->

