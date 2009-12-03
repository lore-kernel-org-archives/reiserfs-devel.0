From: Johannes Buchner <buchner.johannes@gmx.at>
Subject: Re: reiser4: newbie help needed?
Date: Fri, 4 Dec 2009 09:25:27 +1300
Message-ID: <20091204092527.a5117191.buchner.johannes@gmx.at>
References: <20091202192143.48ece851.buchner.johannes@gmx.at>
	<4B16318E.7010504@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__4_Dec_2009_09_25_27_+1300_f/GESgSJ0DfkC+dE"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4B16318E.7010504@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Fri__4_Dec_2009_09_25_27_+1300_f/GESgSJ0DfkC+dE
Content-Type: text/plain; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 02 Dec 2009 10:21:18 +0100
Edward Shishkin <edward.shishkin@gmail.com> wrote:

> Johannes Buchner wrote:
> >  I took a look at the TODO lists, are there any simple tasks to
> > do for newbies?
>=20
> If you mean the "todo for inclusion", then no.
>=20
> Reiser4 has only one technical issue. It can
> be resolved only by very experienced people.

Thanks for replying. I did not have to the inclusion of
reiser4 in mind specifically.

> > I also believe that on 'sync', reiser4 currently does absolutely
> > nothing.
>=20
> this is not good: a file system should respond on sync (1).
>=20
> >  The comment in reiser4_sync_inodes says reiser4 does its own
> > flush elsewhere. Should this be different?
> >  =20
>=20
> you might want to ask such question _before_ sending patches to akpm.=20

I was under the believe that I did not change the behaviour. I see my
mistake now, I was looking at the wrong if-branch.=20

I tried now to come up with a correct version for some hours, but I keep
having NULL problems. Maybe a writeback_control object has to be
created, possibly even in fs/fs-writeback.c:sync_inodes_sb, as
write_inode_now does below. I tried that too, but it gave me a
recursion. I'm not sure what the rationale was for introducing a call
with NULL here. Sorry I can't correct this.

Looking forward to your review.

Best wishes,
Johannes

--=20
Emails k=F6nnen ge=E4ndert, gef=E4lscht und eingesehen werden. Signiere oder
versch=FCssele deine Mails mit GPG.

--Signature=_Fri__4_Dec_2009_09_25_27_+1300_f/GESgSJ0DfkC+dE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEARECAAYFAksYHrwACgkQ7X1+MfqVcr2GPACfaPtCuwdO992d7XsZYtWOfW10
8WcAn2/1A8SLb1SDMhTtfwz/SUtsOKxU
=WkJH
-----END PGP SIGNATURE-----

--Signature=_Fri__4_Dec_2009_09_25_27_+1300_f/GESgSJ0DfkC+dE--
