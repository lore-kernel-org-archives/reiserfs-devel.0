From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: Re: reiser4 vs. apache2 bad interaction?
Date: Tue, 8 Jun 2004 20:46:29 +0200
Message-ID: <20040608184629.GA6507@chepelov.org>
References: <20040607115743.GA27255@chepelov.org> <20040608165733.GW8091@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19098-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040608165733.GW8091@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Le Tue, Jun 08, 2004, =C3=A0 08:57:33PM +0400, Alex Zarochentsev a =E9crit:

> Thanks for the report.
>=20
> We will try to reproduce it (I think it will take some time
> to a web server test suite up).
=20
> > apache2 is 2.0.49-1 as Debian sid ships it.
>=20
> what kind of load apache has? serving static pages?

Yes. The machine is http://www.chepelov.org/cyrille/traminer, so you can
see it's not exactly a 2U quad-opteron (and you can also get a sense for
the kind (and lack) of content on the box).

The hardware is a P75 with 96MB of EDO RAM, apparently an Olivetti-made
motherboard with an Intel Triton V chipset on it (I got it for 1=A4 a
couple of weeks ago on a flea market, when the previous, similar, board
fried). This may mean you'll need to run the tests on a very slow
machine to reliably reproduce the problem.

FWIW, the only non-static pages on that apache2 come from awstats; I
subsequently installed php4+mysql+spip (well, I try), but the problem=20
happened before.=20
Finally, the machine also runs exim4 with the current anti-crap
paraphernalia (spfd, clamav, amavis, spamassassin), albeit at a very low
priority.

If you supply me with a binary kernel+syms out of a .config I provide,
I can run that and send back the DMESG output, if you'd like (I'll
need about 3 hours to move back to reiser4).

	-- Cyrille
=09
--
