From: Miguel <turtle.power@wanadoo.es>
Subject: Re: Creditsd [Re: Speaking of credits...]
Date: Tue, 11 May 2004 00:01:40 +0200
Message-ID: <20040511000140.1f1a337a.turtle.power@wanadoo.es>
References: <3DF9165145FACB4C96977FF650C1E9040C469F7D@its-mail1.its.corp.gwl.com>
	<20040510183741.GZ29226@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18589-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040510183741.GZ29226@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?ISO-8859-15?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: "Burnes, James" <james.burnes@gwl.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Mon, 10 May 2004 21:37:41 +0300
mjt@nysv.org (Markus T=F6rnqvist) wrote:

> On Mon, May 10, 2004 at 12:21:44PM -0600, Burnes, James wrote:
>=20
> >I would have to write most of the internal mechanisms in creditsd for
> >the screensaver anyway.  Might as well make the interface
> >universal....
>=20
> Correct me if I'm wrong, but shouldn't it be like a little database
> somewhere under /var/ or somewhere with an interface socket in /tmp/?
>=20
> Then one would, of course, have to write a renderer for the
> screensaver that takes a random entry from the database and displays
> it on the screen.
>=20
> I have no experience in screensavers on that level (if I want to lock
> my computer I type xlock) so I may be drifting.
>=20
> Naturally a good API that allows even the kernel to interface (for
> proc, or is it ok for userland daemons to publish stuff there?) with
> it is the way to go.
>=20
> I wonder if some already-existing database would be good for this.
>=20
> One will also need a good way of updating this database...


fortune(6) works that way and several screensavers display strings from
fortune's "databases".
You want to build another "fortune-credits" db?

seems pretty simple if is integrated with pkg management tools.

>=20
> --=20
> mjt
>=20


--=20
La resistencia es f=FAtil todos ser=E9is asimilados
