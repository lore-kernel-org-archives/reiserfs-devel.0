From: "Burnes, James" <james.burnes@gwl.com>
Subject: RE: Creditsd [Re: Speaking of credits...]
Date: Mon, 10 May 2004 18:19:05 -0600
Message-ID: <3DF9165145FACB4C96977FF650C1E9040C469F7F@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18591-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Miguel <turtle.power@wanadoo.es>, =?iso-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

An interesting issue.  I'll encapsulate that layer so that we can =
experiment with several different implementations.

After I mentioned the other possible viewers of creditsd, I thought of =
the same idea.  If not a direct use of the fortune db format, then an =
augmented fortune that could pull a random credit.

Larger issues will come to the fore soon.  Issues such as how much =
exposure certain groups get via creditsd, how much control the user =
should have over it, possible security issues etc.

I think we should give as much control to the end user as possible.  =
That way no one can complain (nor start lawsuits) about how they are not =
being given enough credit in the daemon. =20

Maybe I could get some help with different ideas for usage scnearios -- =
on the application registration end as well as with the credits viewer =
developer and the user themself. =20

Some use-cases for the apps themselves...

1.  An application that is usually used as a quick command-line utility. =
 It could ask for a one-shot credit per day.

2.  Apps that attempt to be scene whores and keep registering credits.

3.  Apps that are installed, but never used.

4.  Apps that are running continuously (drivers, kernel, ...filesystems =
;-)

5.  Apps/subsystems that are installed in the format of the local =
package manager.

Use-cases for the viewer....

1.  Give me a random credit for an app that is currently running
2.  Give me the next credit for an app that is running
3.  (same as above but for installed apps/subsystems)
4.  (same as above, but select the apps, the feed me individuals within =
the team)
5.  (Same as above, but only select developers)
6.  (Same as above, but only select financial contributors)

(The structure is starting to feel very XML/heirarchical)

So let me know of any imaginative use cases.  I'd be glad to take them =
into account if I can.

BTW: I'm trying to set this up so that it doesn't require the developer =
to embed much information into the binary -- possibly none at all.   =
This is one of the reasons why I'd like to use structured credits in XML =
or something similar.  I think that it would be good to be able to write =
the credits data to disk out-of-band.  That way creditsd won't have to =
be running to initialize it. =20

If you were a developer, would you rather register a URL in creditsd, or =
would you want to embed the credits for the system right in the program =
-- perhaps eating up more space that is necessary.  If you registered a =
URL, that would give you interesting feedback on the usage of your =
program, but it might also be a privacy/security issue.

Just brainstorming while I fool around with some code.


Jb





jim burnes
security engineer
great-west, denver
=20

> -----Original Message-----
> From: Miguel [mailto:turtle.power@wanadoo.es]
> Sent: Monday, May 10, 2004 5:02 PM
> To: Markus T=F6rnqvist
> Cc: Burnes, James; Hans Reiser; reiserfs-list@namesys.com
> Subject: Re: Creditsd [Re: Speaking of credits...]
>=20
> On Mon, 10 May 2004 21:37:41 +0300
> mjt@nysv.org (Markus T=F6rnqvist) wrote:
>=20
> > On Mon, May 10, 2004 at 12:21:44PM -0600, Burnes, James wrote:
> >
> > >I would have to write most of the internal mechanisms in creditsd =
for
> > >the screensaver anyway.  Might as well make the interface
> > >universal....
> >
> > Correct me if I'm wrong, but shouldn't it be like a little database
> > somewhere under /var/ or somewhere with an interface socket in =
/tmp/?
> >
> > Then one would, of course, have to write a renderer for the
> > screensaver that takes a random entry from the database and displays
> > it on the screen.
> >
> > I have no experience in screensavers on that level (if I want to =
lock
> > my computer I type xlock) so I may be drifting.
> >
> > Naturally a good API that allows even the kernel to interface (for
> > proc, or is it ok for userland daemons to publish stuff there?) with
> > it is the way to go.
> >
> > I wonder if some already-existing database would be good for this.
> >
> > One will also need a good way of updating this database...
>=20
>=20
> fortune(6) works that way and several screensavers display strings =
from
> fortune's "databases".
> You want to build another "fortune-credits" db?
>=20
> seems pretty simple if is integrated with pkg management tools.
>=20
> >
> > --
> > mjt
> >
>=20
>=20
> --
> La resistencia es f=FAtil todos ser=E9is asimilados
