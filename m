From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 vs. apache2 bad interaction?
Date: Wed, 23 Jun 2004 19:32:53 +0400
Message-ID: <20040623153253.GC5080@backtop.namesys.com>
References: <20040607115743.GA27255@chepelov.org> <20040608165733.GW8091@backtop.namesys.com> <20040608184629.GA6507@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19306-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040608184629.GA6507@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: reiserfs-list@namesys.com

On Tue, Jun 08, 2004 at 08:46:29PM +0200, Cyrille Chepelov wrote:
> Le Tue, Jun 08, 2004, ?=9A 08:57:33PM +0400, Alex Zarochentsev a ?crit:
>=20
> > Thanks for the report.
> >=20
> > We will try to reproduce it (I think it will take some time
> > to a web server test suite up).
> =20
> > > apache2 is 2.0.49-1 as Debian sid ships it.
> >=20
> > what kind of load apache has? serving static pages?
>=20
> Yes. The machine is http://www.chepelov.org/cyrille/traminer, so you can
> see it's not exactly a 2U quad-opteron (and you can also get a sense for
> the kind (and lack) of content on the box).

can you try
http://namesys.com/auto-snapshots/reiser4-2004.06.23-14.56-linux-2.6.7-rc3-=
mm1.diff.gz ?

there was a bug in readpages_unix_file() which affected reiser4_sendfile().

>=20
> The hardware is a P75 with 96MB of EDO RAM, apparently an Olivetti-made
> motherboard with an Intel Triton V chipset on it (I got it for 1? a
> couple of weeks ago on a flea market, when the previous, similar, board
> fried). This may mean you'll need to run the tests on a very slow
> machine to reliably reproduce the problem.
>=20
> FWIW, the only non-static pages on that apache2 come from awstats; I
> subsequently installed php4+mysql+spip (well, I try), but the problem=20
> happened before.=20
> Finally, the machine also runs exim4 with the current anti-crap
> paraphernalia (spfd, clamav, amavis, spamassassin), albeit at a very low
> priority.
>=20
> If you supply me with a binary kernel+syms out of a .config I provide,
> I can run that and send back the DMESG output, if you'd like (I'll
> need about 3 hours to move back to reiser4).
>=20
> 	-- Cyrille
> =09
> --

--=20
Alex.
