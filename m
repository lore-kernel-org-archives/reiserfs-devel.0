From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: "Metas"
Date: Tue, 27 Apr 2004 22:06:45 -0700 (PDT)
Message-ID: <200404280506.i3S56jXb022934@sirius.cs.pdx.edu>
References: <no.id>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18263-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <no.id> from "Hans Reiser" at Apr 21, 2004 09:17:49 AM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

> From: Hans Reiser <reiser@namesys.com>
> so if rename works on metas, are you guys happy?  that is, if mv=20
> filename/metas filename/... works, are you less worried about the one in =

> 10 million users who will actually hit the reserved keyword?

I think we've provided evidence that it might well be one in one
thousand. Pretty much any filename that `ls` without the "-a" option
will display will be unacceptable. Adding a leading '.' or using a
separator character ('\' or "/.metas/" perhaps) fits this qualification.

> From: mjt@nysv.org (Markus T=F6rnqvist)
> Lookups would be next to impossible, for one. And what if someone actually
> loses a meta directory, like, renames it accidentally and forgets about i=
t?
> Yeah, far-fetched but stuff does happen...

I don't think this is at all far fetched, Hans, please listen!

> What's so terribly bad about having the name for it in /proc or /sys
> or wherever and having it global from the kernel config?

open()/read()/write()/stat()/readdir() are system calls, but fairly cheap
operations. getcwd() is a library call, almost certainly making
*hundreds* of system calls, and quite possibly *thousands*. In order to
use a /proc or /sys interface you'd need to use getcwd(), if you're
accessing many files this would be extremely expensive.


--=20
(\___(\___(\______          --=3D> 8-) EHM <=3D--          ______/)___/)___=
/)
 \   (    |         EHeM@cs.pdx.edu      PGP 8881EF59         |    )   /
  \_  \   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
    \___\_|_/82 04 A1 3C C7 B1 37 2A*E3 6E 84 DA 97 4C 40 E6\_|_/___/


