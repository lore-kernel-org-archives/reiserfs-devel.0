From: Michael Milverton <camel78@iprimus.com.au>
Subject: Re: On a free repacker
Date: Tue, 25 May 2004 09:12:34 +0800
Message-ID: <200405250912.40950.camel78@iprimus.com.au>
References: <20040519192831.GL24604@nysv.org> <20040524203016.GA4990@nysv.org> <40B25DF0.2090400@gmx.net>
Reply-To: camel78@iprimus.com.au
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_I2psAZMWLW/Vvn9";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18836-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40B25DF0.2090400@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Boundary-02=_I2psAZMWLW/Vvn9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, 25 May 2004 04:41 am, Carl-Daniel Hailfinger wrote:
> Markus T=F6rnqvist wrote:
> > On Fri, May 21, 2004 at 03:02:05PM -0400, Valdis.Kletnieks@vt.edu wrote:
> >>Larry McVoy's BitKeeper licensing might be an interesting model to
> >> follow. Not sure if you can make it work for a repacker thought....
> >
> > I must look into this. (Note, you can also enlighten me on this, since
> > I don't think I'll look into it yet).
> >
> > All I know about BitKeeper is that it's not as simple to use as
> > subversion and subversion is free in all senses of the word. So I don't
> > use BK. And I wouldn't if Namesys wouldn't force me.
>
> Oh, that is interesting. I think we agree that CVS is not simple to use.
> But I'm interested in how subversion can be simpler than bitkeeper.
>
> # bk clone bk://some.url/of/the/project
> and you have a directory "project"
> # cd project
> # ./configure; make; make install
> for updates:
> # cd project
> # bk pull
> some projects may have a default of source not checked out, do it now
> # bk -r get
>
> Can it get simpler than this? I'm truly interested in anything that makes
> my life simpler.
I realise that this may have been a rhetorical question but I still can't=20
resist answering. This is really a note to those people who would like an R=
CS=20
similar to BK but want something that is GPL free. I recommend giving DARCS=
 a=20
try.

David's Advanced Revision Control System
http://abridgegame.org/darcs/

It seems as simple to use ( I have not used BK so I am only looking at the=
=20
steps above and they seem similar ) and its GPL. It is a distributed RCS wi=
th=20
some original ideas behind it, eg a theory of patches etc. It is still=20
reaching maturity, nearly at the big 1.0 release,  but I already use it and=
 I=20
love it a lot.

P.S I know this subject is offtopic but I have found useful links to progra=
ms=20
that others have recommended so I hope that someone finds this useful.  =20
>
> Regards,
> Carl-Daniel

Thankyou
Michael Milverton
=2D-=20
GNU/Linux: Secure, Stable, Free
Michael <camel78@iprimus.com.au>

--Boundary-02=_I2psAZMWLW/Vvn9
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iQCVAwUAQLKdiDbWs3O08JjCAQIHswP/f/9gGQ5c9idNupOYGYwWKf+J96Nmx7LI
ebLMF9ur2YTKwOfwCPJeSCeB/YB4eyBDPQxY6E15L6/BcQsABcFy36NqDGfdqLPt
4u6C5Z8Tlq0foPTMKEg0O7JCO01QOTXQ+BCNfdsp6ESfZC+zh+HvTD+0zpti4J+Q
fAc1kfta5oY=
=BB9K
-----END PGP SIGNATURE-----

--Boundary-02=_I2psAZMWLW/Vvn9--
