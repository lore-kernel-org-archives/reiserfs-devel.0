From: Pierre =?UTF-8?B?RXRjaGVtYcOvdMOp?= <petchema@concept-micro.com>
Subject: Re: Authoring a versioning plugin
Date: Sat, 14 Jan 2006 12:56:21 +0100
Message-ID: <20060114125621.0766f137.petchema@concept-micro.com>
References: <200601111759.14638.fred@lab.matcom.uh.cu>
	<200601121014.37940.pvh@uvic.ca>
	<43C80EC3.7050003@namesys.com>
	<43C818D2.4080805@ac24.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27712-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43C818D2.4080805@ac24.ee>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le Fri, 13 Jan 2006 23:17:06 +0200, Toomas Laasik <toomas@ac24.ee> a =C3=A9=
crit :

> Hello,
> Here are some links that I have found while searching such file systems=20
> that can keep versions or log of changes:

While not currently implemented as a filesystem, Subversion repositories
look-and-feel is very much like a filesystem.

I mention it, because instead of maintaining revisions of each file
separately (RCS, then CVS, etc.), it maintains revisions (simple
integer counter) of the repository as a whole.
It nicely solve the problem of deleted (or simply moved around) files.

Tagging versions, creating branches, is handled orthogonally, by copying
whole trees in other directories (of course internally everything is
just "hardlinked").

What I mean is, that different approach could give ideas on how to
implement versionning at filesystem level, or maybe improve a filesystem
as a better backend (or frontend ?) to Subversion...

Hope it helps,
Pierre.
