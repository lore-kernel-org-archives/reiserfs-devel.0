From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: Two usage examples for attribute directories.
Date: Fri, 02 Dec 2005 16:49:54 -0800
Message-ID: <200512021649.54939.pvh@uvic.ca>
References: <200511201317.12598.pvh@uvic.ca> <200511230057.22520.pvh@uvic.ca>
 <4390E5F6.704@st-andrews.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27175-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <4390E5F6.704@st-andrews.ac.uk>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> PvH,
>
> I am really worried about introducing this new concept of "attribute
> directory" and new syntax. Maybe I am just missing the point (in which
> case please explain), but is there anything you can do with this that
> there is no way you could do without it.
> Hans' favourite topic (quite rightly) is namespace unification, which
> involves keeping the syntax as simple as possible, having only one type
> of expression for one kind of logical structure. If you could possibly
> do this without the "..@", do it without it.
>
> So why not just do (to take your example):
>
> $ echo "Matmos" >> track01.mp3/artist
>
>
>   Peter F

This is not new syntax, it is a new type of File (well, tecnically, it woul=
d=20
be implemented as a new pseudoplugin.)

=46rom a user's point of view, these files are equivalent to an XML attribu=
te,=20
whereas normal files are child elements. The semantic difference is, I=20
contend, significant.

=46rom an implementation point of view, this would allow us to provide guid=
ance=20
to, or eventually even full FS-level support for indexed attributes.=20

These attribute directories, like "...." would also be available for=20
directories, not just files.=20

Also, important to me is that they could provide Reiser4 xattr compatibilit=
y. =20
(The xattr('artist') for a file would be file/@/artist.)

Personally, I think "..@" is a keyboard-full. I would prefer "@" for improv=
ed=20
consistency with xpath, but worrying about the actual string to access with=
=20
is worrying about what colour the shed will be before you put it up.

I think resource directories in the style of OSX have a seperate value to t=
hem=20
and also deserve implementation, but are another (related) project.

Dinner beckons,
=2Dpvh


=2D-=20
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
