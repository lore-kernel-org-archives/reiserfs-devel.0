From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: Re: reiser4 snapshot
Date: Tue, 12 Aug 2003 09:22:20 +0200
Message-ID: <20030812072220.GA29079@chepelov.org>
References: <16183.48363.884605.564937@laputa.namesys.com> <pan.2003.08.12.00.32.11.185228@math.ubc.ca> <20030812060542.GA5363@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15287-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030812060542.GA5363@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Le Tue, Aug 12, 2003, =E0 10:05:42AM +0400, Oleg Drokin a =E9crit:
> Hello!
>=20
> On Mon, Aug 11, 2003 at 05:32:25PM -0700, Boris Tschirschwitz wrote:
>=20
> > I thought I'd give it a try on 2.6.0-test3-mm1.
> > Even with 'make mrproper' before compiling, I get the following error
> > message:
> > (Is there any interest in such error reports?)
>=20
> Yes, there is.

I have a problem: reiserfs4progs doesn't seem to pay attention to the
--prefix when it comes to locating libaal. I configured libaal with
--prefix=3D/scratch/riesling/reiser4-inst and installed it there, then tried
to configure reiserfs4progs with the same prefix, and it still fails to
locate libaal. When I force it a little by prepending the call to
./configure with suitable CFLAGS and LDFLAGS, it goes past locating libaal,
but chokes on locating <aal/aal.h>.

I'll sure get past that, but it's a little annoying, and might get in the
way of distributors (depending on the way they package libaal, ie separately
or merged with the main reiserfs4progs package).

	-- Cyrille

--=20
