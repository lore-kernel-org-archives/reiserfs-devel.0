From: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Subject: Re: Feature request: online fsync disable
Date: Wed, 04 Sep 2002 13:39:30 +0200
Message-ID: <3D75F0F2.77AF5FDA@baldauf.org>
References: <3D661C89.C8A805D7@baldauf.org>
		<15718.8710.244926.960377@laputa.namesys.com>
		<20020823155658.A962@namesys.com> <3D6623BE.4040500@namesys.com> 
		<15718.9718.736822.978374@laputa.namesys.com>
		<1030108119.17778.8.camel@tiny>  <3D667A7D.5BD60783@baldauf.org> <1030216521.17780.83.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11367-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: Nikita Danilov <Nikita@namesys.com>, Hans Reiser <reiser@namesys.com>, Oleg Drokin <green@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>, zam@thebsh.namesys.com



Chris Mason wrote:

> On Fri, 2002-08-23 at 14:10, Xuan Baldauf wrote:
>
> > > Xuan, you could try the data logging patches in either data=3Dwrite=
back or
> > > data=3Djournal.  Either one will be significantly faster than stock=

> > > 2.4.19.
> >
> > Thank you. I guess "data=3Dwriteback" will result in the desired beha=
viour.
> >
> > Are these patches tested?
>
> Yes, although I've now got 3 or 4 bug fixes from testing in the suse
> kernel that I need to put into the pure 2.4.19 patch.  I'm doing the
> last of the fixes today, and I'll start merging back into the main code=

> on monday.  This was all supposed to happen last week, but I got
> diverted by some important other suse work.
>
> If your application is very fsync heavy and doesn't do many non-fsync
> writes data=3Djournal will probably be much faster.
>
> -chris

Hello Chris,

I've been searching for the loggin patches at ftp://ftp.namesys.com/ and =
below,
but could not find any patch named "logging" or containg the word "writeb=
ack".
Can you point me to the logging patches?

Thank you. :-)

Xu=E2n.


