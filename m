From: "Burnes, James" <james.burnes@gwl.com>
Subject: RE: "Metas"
Date: Wed, 21 Apr 2004 10:19:33 -0600
Message-ID: <3DF9165145FACB4C96977FF650C1E9040C469E5E@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18127-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hans,

What could be the worst case if someone hits a file collision with the
reserved word?  Could reiser automagically detect the reserved word
conflict and correct it?

jb

jim burnes
security engineer
great-west, denver
=20

> -----Original Message-----
> From: Hans Reiser [mailto:reiser@namesys.com]
> Sent: Wednesday, April 21, 2004 10:18 AM
> To: reiserfs-list@namesys.com
> Subject: Re: "Metas"
>=20
> so if rename works on metas, are you guys happy?  that is, if mv
> filename/metas filename/... works, are you less worried about the one
in
> 10 million users who will actually hit the reserved keyword?
