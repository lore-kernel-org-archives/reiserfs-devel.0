From: "Burnes, James" <james.burnes@gwl.com>
Subject: RE: Creditsd [Re: Speaking of credits...]
Date: Mon, 10 May 2004 12:21:44 -0600
Message-ID: <3DF9165145FACB4C96977FF650C1E9040C469F7D@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18587-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Hans Reiser <reiser@namesys.com>, =?iso-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

I thought of that, and it makes sense to have an xlockmore module that =
talks to creditsd.  But that form of credits is extremely mode-specific =
to X and perhaps xlockmore specifically.

Some people turn screensavers off for various reasons.

Some people never use X, preferring instead of run in text mode, =
emacslands or whatever.

Imagine a web server that was running 24x7x365 and making tremendous use =
of reiserfs v4, but the admin almost never logged onto the main console =
either in textmode or X.  But he was a huge fan of reiserfs and used a =
combination of webmin and also wanted his users to be able to click on =
an icon on his webpage and see all the great developers that were =
responsible for the screamin web server they were using.

In this case the following credits viewer would make more sense....

1. An apache module, plugin, that allowed you to browse information =
about the developers of the OS/apps software.
2. A webmin module that allowed the remote admins to view this =
information.

So it's probably very specific to the usage.  You could make the =
argument that Linux webservers serve more traffic everyday to people who =
aren't even Linux users.  Imagine that!  Getting credits out to people =
who don't use Linux as a desktop, but are served content by it daily.

That would be much more powerful than a screensaver for raw exposure.

In any case I would do creditsd, then people could write modules to =
interface to it.  Obvious candidates would be....

1. Screensaver
2. Apache module
3. /proc
4. KDE ioslave
5. Webmin module

The sky is the limit....

I would have to write most of the internal mechanisms in creditsd for =
the screensaver anyway.  Might as well make the interface universal....

jim burnes
security engineer
great-west, denver
=20

> -----Original Message-----
> From: Hans Reiser [mailto:reiser@namesys.com]
> Sent: Monday, May 10, 2004 12:23 PM
> To: Markus T=F6rnqvist
> Cc: Burnes, James; reiserfs-list@namesys.com
> Subject: Re: Creditsd [Re: Speaking of credits...]
>=20
> I suggest just making it a screensaver.  This will annoy very few
> persons, and be very effective, if the distros can be talked into =
making
> it the default screensaver....
>=20
> Hans
