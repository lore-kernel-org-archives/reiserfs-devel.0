From: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Subject: Re: Feature request: online fsync disable
Date: Fri, 23 Aug 2002 20:10:05 +0200
Message-ID: <3D667A7D.5BD60783@baldauf.org>
References: <3D661C89.C8A805D7@baldauf.org>
		<15718.8710.244926.960377@laputa.namesys.com>
		<20020823155658.A962@namesys.com> <3D6623BE.4040500@namesys.com> 
		<15718.9718.736822.978374@laputa.namesys.com> <1030108119.17778.8.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11314-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: Nikita Danilov <Nikita@namesys.com>, Hans Reiser <reiser@namesys.com>, Oleg Drokin <green@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, zam@thebsh.namesys.com



Chris Mason wrote:

> On Fri, 2002-08-23 at 08:09, Nikita Danilov wrote:
> > Hans Reiser writes:
> >  > It is a reasonable feature request I think.
> >  >
> >  > Zam, put it into reiser4.1.
> >  >
> >
> > I think, in stead of feature "disable fsync", better alternative would
> > be "disable journalling", or "journal meta-data only".
>
> Well, if the application doesn't really need fsync, it shouldn't call
> it.  I'd much rather fix whatever problem is making things too slow.

It's like that: Crashing with data loss creates trouble, but that trouble is
fixable. In our case, being slower than required for some time creates much
more trouble.

>
>
> Xuan, you could try the data logging patches in either data=writeback or
> data=journal.  Either one will be significantly faster than stock
> 2.4.19.

Thank you. I guess "data=writeback" will result in the desired behaviour.

Are these patches tested?

>
>
> -chris



