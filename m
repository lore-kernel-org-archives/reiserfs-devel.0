From: Yury Umanets <umka@namesys.com>
Subject: Re: reiser4 snapshot
Date: Tue, 12 Aug 2003 12:25:58 +0400
Message-ID: <1060676758.21147.23.camel@haron.namesys.com>
References: <16183.48363.884605.564937@laputa.namesys.com>
	 <pan.2003.08.12.00.32.11.185228@math.ubc.ca>
	 <20030812060542.GA5363@namesys.com> <20030812072220.GA29079@chepelov.org>
	 <1060673517.21149.7.camel@haron.namesys.com>
	 <20030812080212.GA23206@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15292-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030812080212.GA23206@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

On Tue, 2003-08-12 at 12:02, Cyrille Chepelov wrote:
> Le Tue, Aug 12, 2003, =E0 11:31:57AM +0400, Yury Umanets a =E9crit:
>=20
> > > I have a problem: reiserfs4progs doesn't seem to pay attention to the
> > > --prefix when it comes to locating libaal.
> >=20
> > --prefix is not the prefix libraries are looked at. It is the prefix of
> > where package libraries and includes will be installed.
>=20
> yes, of course. However, you saw that it's not the only problem.
>=20
> > >  When I force it a little by prepending the call to
> > > ./configure with suitable CFLAGS and LDFLAGS, it goes past locating l=
ibaal,
> > > but chokes on locating <aal/aal.h>.
> > This will be fixed. Thanks. temporary cure is to specify CFLAGS durring
> > make:
> >=20
> > make CFLAGS=3D"-I/scratch/riesling/reiser4-inst/include/aal"
>=20
> can't be done, as there is no Makefile until configure completes -- and it
> can't complete as it doesnt pay attention to things like
> 	CFLAGS=3D"-I/.../include" ./configure=20
>=20
> I got past that, though.
>=20
> Another little glitch is that the configure.in explicitly checks for 0.4.8
> while the provided libaal is 0.4.9. No biggie, just requires modifying the
> configure.in and re-running autoconf (you might want to add a check again=
st
> that condition in your pre-upload QA scripts).

Hello,

Everything is fixed and new snapshot is in
http://thebsh.namesys.com/snapshots/2003.08.11/.

See ./configure --help for new option --with-libaal.


Thanks for reports one more time.


