From: "Burnes, James" <james.burnes@gwl.com>
Subject: RE: Setting the disk label
Date: Wed, 14 Jan 2004 13:32:15 -0700
Message-ID: <3DF9165145FACB4C96977FF650C1E90409633617@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16506-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: redeeman@metanurb.dk, Reiserfs Mailinglist <reiserfs-list@namesys.com>

Thanks, again.  I was reading the man pages and it says that filesystems
modified by reiserfstune need a special kernel patch or a normal 2.4
kernel will refuse to mount them.  I'm not sure if that only applies if
you change the journaling device/parameter or if it applies to all
options of reiserfstune.

I'm guessing it's only if you change journal device parameters, as the
other possible interpretation wouldn't make much sense and Hans and crew
tend to do things that make a lot of sense (as far as I know ;-)

jim burnes
security engineer
great-west, denver
=20

> -----Original Message-----
> From: Redeeman [mailto:redeeman@metanurb.dk]
> Sent: Wednesday, January 14, 2004 2:13 PM
> To: Reiserfs Mailinglist
> Subject: Re: Setting the disk label
>=20
> sure!
>=20
> reiserfstune can do it, you've got it from reiserfsprogs
>=20
> On Wed, 2004-01-14 at 20:42, Burnes, James wrote:
> > Is it possible to set the disk label on a reiserfs filesystem that
has
> > already been built without one?
> >
> >
> > Thx,
> >
> > jim burnes
> > security engineer
> > great-west, denver
> >
> --
> Regards, Redeeman
> ()  ascii ribbon campaign - against html e-mail
> /\                        - against microsoft attachments

