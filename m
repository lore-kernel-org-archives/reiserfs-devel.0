From: Robin Rosenberg <robin.rosenberg.lists@dewire.com>
Subject: Re: silent semantic changes in reiser4 (brief attempt to document the idea of what reiser4 wants to do with metafiles and why
Date: Wed, 1 Sep 2004 05:11:31 +0200
Message-ID: <200409010511.31597.robin.rosenberg.lists@dewire.com>
References: <41323AD8.7040103@namesys.com> <20040831190814.GA15493@thundrix.ch> <111617109.20040831213808@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21195-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <111617109.20040831213808@tnonline.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Spam <spam@tnonline.net>
Cc: Tonnerre <tonnerre@thundrix.ch>, V13 <v13@priest.com>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@digeo.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@osdl.org>, reiserfs-list@namesys.com

On Tuesday 31 August 2004 21.38, Spam wrote:
> > Salut,
> >
> > On Tue, Aug 31, 2004 at 08:17:36PM +0200, Spam wrote:
> >> =A0 How =A0are =A0things =A0done on Windows platforms when there are f=
iles and
> >> =A0 directories =A0with the same name? In Unix that is imposible. How =
does
> >> =A0 it =A0work =A0for =A0environments =A0like =A0Cygwin =A0etc? What h=
appen to tools
> >> =A0 that run in them?
> >
> > In =A0NTFS it's =A0illegal =A0IIRC. =A0At least =A0the =A0fs correction=
 =A0utilities
> > complain about a block being assigned to two files.
>
> =A0 I =A0meant =A0a =A0file =A0and a directory with the same name, not tw=
o files
> =A0 with the same name :) subtle but important difference.
>
> =A0 ie, =A0you can have a file named "foo" and a directory named "foo" and
> =A0 they won't collide.

You can't have a file and a directory with the same name in W*.

Alternative data streams don't appear in a normal directory. You
need special API:s and tools to see them. If you know the name of and ADS
you can however access them with standard tools, including cygwin.

echo foo >a.txt
echo bar >a.txt:b.txt

You can also have ADS's on directories. Not sure how Reiserfs4 does that.

mkdir foo
echo bar >foo:a.txt

-- robin
