From: Yury Umanets <umka@namesys.com>
Subject: Re: reiser4 snapshot
Date: Tue, 12 Aug 2003 11:41:46 +0400
Message-ID: <1060674105.21147.10.camel@haron.namesys.com>
References: <16183.48363.884605.564937@laputa.namesys.com>
	 <pan.2003.08.12.00.32.11.185228@math.ubc.ca>
	 <20030812060542.GA5363@namesys.com>  <20030812072220.GA29079@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15289-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030812072220.GA29079@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

On Tue, 2003-08-12 at 11:22, Cyrille Chepelov wrote:
> Le Tue, Aug 12, 2003, =E0 10:05:42AM +0400, Oleg Drokin a =E9crit:
> > Hello!
> >=20
> > On Mon, Aug 11, 2003 at 05:32:25PM -0700, Boris Tschirschwitz wrote:
> >=20
> > > I thought I'd give it a try on 2.6.0-test3-mm1.
> > > Even with 'make mrproper' before compiling, I get the following error
> > > message:
> > > (Is there any interest in such error reports?)
> >=20
> > Yes, there is.
>=20
> I have a problem: reiserfs4progs doesn't seem to pay attention to the
> --prefix when it comes to locating libaal. I configured libaal with
> --prefix=3D/scratch/riesling/reiser4-inst and installed it there, then tr=
ied
> to configure reiserfs4progs with the same prefix, and it still fails to
> locate libaal. When I force it a little by prepending the call to
> ./configure with suitable CFLAGS and LDFLAGS, it goes past locating libaa=
l,
> but chokes on locating <aal/aal.h>.
>=20
> I'll sure get past that, but it's a little annoying, and might get in the
> way of distributors (depending on the way they package libaal, ie separat=
ely
> or merged with the main reiserfs4progs package).
>=20
> 	-- Cyrille

The problem can't be eliminated just by fixing dynamic linker.=20
Will be fixed soon.=20

Thanks for report.

