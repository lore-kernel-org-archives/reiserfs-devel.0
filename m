From: "Burnes, James" <james.burnes@gwl.com>
Subject: RE: Speaking of credits...
Date: Fri, 7 May 2004 15:26:41 -0600
Message-ID: <3DF9165145FACB4C96977FF650C1E9040C469F76@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18546-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clifford Beshers <clifford.beshers@lindows.com>, reiserfs-list@namesys.com

I'm working on a 'creditsd' daemon that runs in the background and acts
as a "broker" between applications that want to publish credits and
applications that want to sample them.

Basically creditsd exports and API that makes it possible for teams and
individuals that contributed to a subsystem to make themselves known to
people and other applications that want to know.  It does it "out of
band" so that it doesn't affect performance and gets around the problem
of the credit's being invisible at some application layer that calls a
lower layer.  What if a kde app calls the reiserfs mkfs tool?  Credits
will be invisible even though they are not intended to be.

The credits deamon will accept credit registration at either package
install time or run time.

Credits displays and access methods which can include screensavers,
install attractors, perhaps a kde ioslave called credits:, maybe
something in /proc), will have the option of looking at the credits of
either all installed apps, all running apps, or some selection of those,
perhaps sorted by various process criteria, package install date or
whatever.

It will be up to the credits display program and the user to decide how
much credits they want to watch, how fast, how quietly etc...

The credits access methods could be installed as a /proc or a ioslave
etc which should take the distro re-branding craziness out of the game.

Well the idea is a little loose right now, but perhaps a little more
innovation and a little less "legislation" is what we need right now.

Should be fun.  I'm going begin the prototype this weekend.

jim burnes
security engineer
great-west, denver
=20

> -----Original Message-----
> From: Clifford Beshers [mailto:clifford.beshers@lindows.com]
> Sent: Friday, May 07, 2004 4:08 PM
> To: Jonathan Briggs
> Cc: Reiserfs mail-list
> Subject: Re: Speaking of credits...
>=20
> No, the name of the company is still Lindows (although it has changed
> from Lindows.com, Inc. to just Lindows, Inc.)  It is just the product
> and website names that have changed.
>=20
> However, I have been reading the various threads about credit with
> interest and thinking about the plagiarism/rebranding issues.  I don't
> have time at the moment to write at length, but I would like to say
that
> changing the name of something is not necessarily done for the
purposes
> of stealing.
>=20
> We who are steeped in Unix/Linux lore do not usually have a problem
with
> the names developers come up with for their software, but many novice
> users do.  Hell, given a raw list of KDE applications I still would
have
> trouble telling you what half of them did.
>=20
> On the other hand, it really is a lot of tedious work to rebrand
things
> and it usually ends up confusing things.  Changing the title of
> something with an obscure name still leaves you with a package name
that
> is obscure, etc.
>=20
> Fortunately, KDE added a generic name feature, so that apps can have a
> ``kool'' name like ``kooka'', but also a secondary name like
``Scanning
> Tool'' that will optionally show up in menus and titlebars.  This is
> saving us a lot of effort because this is usually sufficient for
people
> to figure out what is going on.
>=20
> So, when we at Lindows change the name of something, we do it
explicitly
> to try and reduce confusion for the user who may never even have heard
> the name Linux.
>=20
> Case in point:  I'm removing lilo and putting in grub right now.  Grub
> puts up its name and version number on the top of the boot screen.  I
> can just imagine Michael trying to explain to Walmart, ``Umm... yes,
> GRUB stands for Grand Universal Boot Loader...''  Uh hunh.
>=20
> At one point I proposed to our marketing department that we start the
> equivalent of the IMDB for Open Source Software, seed it with
> high-quality biographies of some of the best known people and open it
up
> for developers to submit more content.  Then we could put links in
every
> app to that website so that people could find out the history of the
> appications and developers.  Everyone liked the idea, but
unfortunately
> the key would be to have some level of professional editing going on
and
> that is hard to maintain.
>=20
> I suppose in the end we'll all just end up on some credits page that
> scrolls by at OS shutdown at three times the pace that anyone can
> actually read, just like in the movies...
>=20
> Cliff
>=20
> Jonathan Briggs wrote:
>=20
> >I was poking around on www.namesys.com and looked at your Reiser4
page,
> >where Lindows is listed as a supporter.
> >
> >Y'all need to update that to Linspire, these days.
> >
> >

