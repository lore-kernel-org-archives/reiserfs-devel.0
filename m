From: Yury Umanets <umka@namesys.com>
Subject: Re: reiser4 snapshot
Date: Tue, 12 Aug 2003 11:31:57 +0400
Message-ID: <1060673517.21149.7.camel@haron.namesys.com>
References: <16183.48363.884605.564937@laputa.namesys.com>
	 <pan.2003.08.12.00.32.11.185228@math.ubc.ca>
	 <20030812060542.GA5363@namesys.com>  <20030812072220.GA29079@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15288-reiserfs=m.gmane.org@namesys.com>
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
Hello,
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
> --prefix when it comes to locating libaal.

--prefix is not the prefix libraries are looked at. It is the prefix of
where package libraries and includes will be installed.

>  I configured libaal with
> --prefix=3D/scratch/riesling/reiser4-inst and installed it there, then tr=
ied
> to configure reiserfs4progs with the same prefix, and it still fails to
> locate libaal.

You need to let dynamic linker know, that some interesting libraries lie
at some location.

Edit /etc/ld.so.conf and there line /scratch/riesling/reiser4-inst
Or set evn. variable LD_LIBRARY_PATH like the following:

export LD_LIBRARY_PATH=3D/scratch/riesling/reiser4-inst:$LD_LIBRARY_PATH


>  When I force it a little by prepending the call to
> ./configure with suitable CFLAGS and LDFLAGS, it goes past locating libaa=
l,
> but chokes on locating <aal/aal.h>.
This will be fixed. Thanks. temporary cure is to specify CFLAGS durring
make:

make CFLAGS=3D"-I/scratch/riesling/reiser4-inst/include/aal"

>=20
> I'll sure get past that, but it's a little annoying, and might get in the
> way of distributors (depending on the way they package libaal, ie separat=
ely
> or merged with the main reiserfs4progs package).
libaal is planed to be used with another similar projects to as it
contains useful utilities like device abstraction, etc.  So, it is
better to have it as separated package. But reiser4progs building may be
automated.=20
>=20
> 	-- Cyrille
--=20
We're flying high, we're watching the world passes by...

