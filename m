From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: mount throws a nikita-3228 on me
Date: Wed, 26 May 2004 09:20:53 +0400
Message-ID: <20040526052052.GO1583@backtop.namesys.com>
References: <20040525080001.GF4990@nysv.org> <1085473856.1915.99.camel@tribesman.namesys.com> <20040525211133.GG4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18852-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040525211133.GG4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

On Wed, May 26, 2004 at 12:11:33AM +0300, Markus T=F6rnqvist wrote:
> On Tue, May 25, 2004 at 12:30:57PM +0400, Vladimir Saveliev wrote:
>=20
> >> It says only small keys are supported. I think it was a Nikita-3228.[1]
> >You seem to get reiser4 with an error which makes reiser4 to not compile
> >properly.
>=20
> Ok...
>=20
> >Please try to add the below=20
> >#include <linux/types.h>
> >#include <linux/fs.h>
> >#include <asm/hardirq.h>
> >#include <linux/sched.h>
> >
> >to reiser4.h right after line:
> >#include <linux/errno.h>
> >
> >and remote
> >/* for __u?? types */
> >#include <linux/types.h>
> >/* for struct super_block, etc */
> >#include <linux/fs.h>
> >/* for in_interrupt() */
> >#include <asm/hardirq.h>
> >
> >#include <linux/sched.h>
> >
> >
> >from debug.h=20
>=20
> Do you mean remove?
>=20
> I took a new BK pull but it still has the same problem..

There is a delay (up to 24h) in the public BK update.=20

> I will try this one more time today, but probably not report until
> tomorrow morning. I need sleep ;)
>=20
> BTW, just in case some other people are wondering the same as I, some
> Reiser4 patch set kernels like -love5 are ported from older Namesys
> code. I thought to let people know, because I thought otherwise :)
>=20
> And thanks for the help, guys!
>=20
> --=20
> mjt
>=20

--=20
Alex.
