From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.03-internal.testing/
Date: Wed, 4 Aug 2004 14:34:41 +0400
Message-ID: <200408041434.41816.vitaly@namesys.com>
References: <200406150022.34578.vitaly@namesys.com> <4110A38A.7040807@namesys.com> <20040804095513.GL1284@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19971-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040804095513.GL1284@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?koi8-r?q?T=F6rnqvist?= <mjt@nysv.org>, Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

On Wednesday 04 August 2004 13:55, Markus T=F6rnqvist wrote:
> On Wed, Aug 04, 2004 at 01:51:22AM -0700, Hans Reiser wrote:
> >These blocks refers to blocks that were used by files and are now backup
> >super blocks?  These blocks could be critical database files, etc.?
>
> Seems to me like yes, but Reiser4 hasn't launched yet officially, so
> I somehow doubt people will have anything too critical on Reiser4.
>
> I'm at least preparing myself to take backups of everything.
>
> >If yes, then please pull this off our website until you come up with a
> >scheme that I am sure will not create more user problems than it solves,
> >on average.
>
> Yeah, there is the other hand that said that the online format is
> now set in stone...
>
> Still the important question is, what's the net gain of this new format?

the previous bakup layout had backup block locations depending on the fs=20
size, in other words every resize operation may need to relocate some nodes=
=20
in the tree to other blocks if the current ones are needed for the backup -=
-=20
even on expanding. there are no such problems with the current backup layou=
t.

--=20
Thanks,
Vitaly Fertman

