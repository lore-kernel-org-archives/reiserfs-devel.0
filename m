From: Gerrit Hannaert <degerrit@web.de>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Thu, 15 Aug 2002 20:36:35 +0200
Message-ID: <200208152036.35333.degerrit@web.de>
References: <200208152007.42370.degerrit@web.de> <200208152227.21766.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11196-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200208152227.21766.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

>
> why did you decided to run fix-fixable? You run --check just before it
> and it said to run --fix-fixable or what?

Er... I confess it was just a hunch, I did run --check but as I recall it d=
id=20
not tell me to, it did say there were corruptions in any case. The filesyst=
em=20
needed fixing and fix-fixable seemed less drastic than rebuild... (The=20
undeletable files were basically a thorn in my eye and I just wanted to be=
=20
sure there were no corruptions other than these clearly visible ones).

>
> Did reiserfsck finish its work or (was)stopped/failed?

Yes, reiserfsck finished properly.

> > What went wrong here?
> > Will reiserfsck --rebuild-tree fix this? Or is the error some compilati=
on
> > thing? What are my chances to recover the filesystem?
>
> Chances are good. No data ware lost and I am checking how reiserfsck hand=
le
> direcory nlinks now.

It would be nice to recover most of the fs. I'd probably be better using so=
me=20
standard, tested reiserfsck-binaries over my own this time I suppose?

Thanks a lot, Vitaly.

=2D Gerrit
