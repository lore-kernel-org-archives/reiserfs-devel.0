From: Gerrit Hannaert <degerrit@web.de>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Thu, 15 Aug 2002 21:06:28 +0200
Message-ID: <200208152106.28085.degerrit@web.de>
References: <200208152007.42370.degerrit@web.de> <200208152036.35333.degerrit@web.de> <200208152253.40413.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11198-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200208152253.40413.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

stderr reports near the end:

Comparing bitmaps..ok
=46atal corruptions were found, Semantic pass skipped
There were found 4 corruptions which can be fixed only during --rebuild-tree

So I guess I don't need to answer which output reiserfsck gave the first ti=
me=20
;-)

(btw, It didn't say fix-fixable, and it didn't say no corruptions... hence.=
=2E.)

Many thanks for your help with my bungling...

=2D Gerrit


> > > why did you decided to run fix-fixable? You run --check just before it
> > > and it said to run --fix-fixable or what?
> >

> No problem in reiserfsck 3.6.3 found for now. I have just run --fix-fixab=
le
> on a test partition, evth is fine.
>
> Ah, I guess I know what happened. I think you have some fatal corruptions
> and rebuild-tree is required. In this case check and fix-fixable do not
> perform semantic check.
>
> To be able to solve the problem with nlinks without rebuild-tree,
> fix-fixable zeros them on the first check and increment nlinks during the
> semantic pass.
>
> To check this guess - when you run check do you have the phrase:
> Fatal corruptions were found, Semantic pass skipped?

