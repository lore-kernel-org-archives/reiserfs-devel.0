From: Giuseppe Bilotta <bilotta78@hotpop.com>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document the idea of what reiser4 wants to do with metafiles and why
Date: Wed, 1 Sep 2004 15:18:11 +0200
Sender: news <news@sea.gmane.org>
Message-ID: <MPG.1b9fea81a3b9001c9896dd@news.gmane.org>
References: <41323AD8.7040103@namesys.com> <20040831190814.GA15493@thundrix.ch> <111617109.20040831213808@tnonline.net> <200409010511.31597.robin.rosenberg.lists@dewire.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21209-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org

Robin Rosenberg wrote:
> On Tuesday 31 August 2004 21.38, Spam wrote:
> > > Salut,
> > >
> > > On Tue, Aug 31, 2004 at 08:17:36PM +0200, Spam wrote:
> > >> =A0 How =A0are =A0things =A0done on Windows platforms when there are=
 files and
> > >> =A0 directories =A0with the same name? In Unix that is imposible. Ho=
w does
> > >> =A0 it =A0work =A0for =A0environments =A0like =A0Cygwin =A0etc? What=
 happen to tools
> > >> =A0 that run in them?
> > >
> > > In =A0NTFS it's =A0illegal =A0IIRC. =A0At least =A0the =A0fs correcti=
on =A0utilities
> > > complain about a block being assigned to two files.
> >
> > =A0 I =A0meant =A0a =A0file =A0and a directory with the same name, not =
two files
> > =A0 with the same name :) subtle but important difference.
> >
> > =A0 ie, =A0you can have a file named "foo" and a directory named "foo" =
and
> > =A0 they won't collide.
>=20
> You can't have a file and a directory with the same name in W*.
>=20
> Alternative data streams don't appear in a normal directory. You
> need special API:s and tools to see them. If you know the name of and ADS
> you can however access them with standard tools, including cygwin.
>=20
> echo foo >a.txt
> echo bar >a.txt:b.txt
>=20
> You can also have ADS's on directories. Not sure how Reiserfs4 does that.
>=20
> mkdir foo
> echo bar >foo:a.txt

The problem with this approach is that some tools will not=20
recognize the file:ADS syntax, and complain. This is what=20
happens under Windows, at least. Would the same happen under=20
Linux, I wonder?

Say that we choose a reserved character (say, #; is # a=20
reserved character?) to mark the frontier between the file and=20
the ADS/attributes/whatever. Would old programs still be able=20
to parse the (commandline or anywhere else) "URL" specification=20
and get to the ADS/attribute/whatever?

Say, would cat somefile#an_ads work, or would cat (as it is=20
now) complain in some way?

--=20
Giuseppe "Oblomov" Bilotta

Can't you see
It all makes perfect sense
Expressed in dollar and cents
Pounds shillings and pence
                  (Roger Waters)

