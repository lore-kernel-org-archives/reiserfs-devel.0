From: Marc-Christian Petersen <m.c.p@gmx.net>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 13:34:51 +0100
Message-ID: <200302281334.51153.m.c.p@gmx.net>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281225.21398.tdickenson@devmail.geminidataloggers.co.uk> <200302281434.23346.liviu.voicu@huji.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12980-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302281434.23346.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Voicu Liviu <liviu.voicu@huji.ac.il>, reiserfs-list@namesys.com

On Friday 28 February 2003 13:34, Voicu Liviu wrote:

Hi Voicu,

> On Friday 28 February 2003 14:25, Toby Dickenson wrote:
> > On Friday 28 February 2003 12:11 pm, Voicu Liviu wrote:
> > > Already using this :-)
> > > Any way, the system works great but if I change the "nice" value of
> > > some process then the CPU almost becomes slave of this process.....=
=2E...
> >
> > If that means the compile finishes faster (and you havent said whethe=
r or
> > not it does) then isnt using more of the cpu a good thing?
> It's ok but this killes my keyboard and really can't do anything else :=
-(
Hmm, this sounds too strange. I cannot see why ext3 does not have this pr=
oblem=20
where ReiserFS has a problem, during a kernel compilation.

I have a Celeron, 1,3GHz and it doesn't matter what FS I use, if I nice a=
=20
kernel compilation to -20, I can still work w/o any strangeness.

ciao, Marc
