From: Siegfried.Loeschmann@t-online.de (Siegfried =?iso-8859-1?q?L=F6schmann?=)
Subject: Re: On disk and correct bitmaps differ
Date: Sat, 11 Oct 2003 02:01:11 +0200
Message-ID: <200310110201.11510.Siegfried.Loeschmann@loe-online.de>
References: <200310022128.51416.Siegfried.Loeschmann@loe-online.de> <200310090449.05105.Siegfried.Loeschmann@loe-online.de> <200310101839.00683.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15834-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310101839.00683.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Am Freitag, 10. Oktober 2003 16:39 schrieben Sie:
> On Thursday 09 October 2003 06:49, you wrote:
> > Vitaly,
> >
> > thank you for your quick answer.
> >
> > in the meantime I did some more research on the problem, had some
> > hardware problems so it took so long.
> >
> > I splitet up the logical volume and testet on plain partitions and I
> > found that the problem only ocurrs on the big 250G disk. After that I
> > deleted the files again until simply one single empty directory was lef=
t.
> > Still the same effect.
>
> ok, so you mean that all hardware problems are fixed and you use
> reiserfsprogs 3.6.11 and reiserfsck --check says "on disk and correct
> bitmaps differ" and reiserfsck --fix-fixable says "no corruptions found",
> right?

Perfectly right. But I have some new Info in the meantime. I took the big d=
isk=20
and created a smaller partition on it. First 154G, error reproducable, then=
=20
77G error disapeared.

I will send the soon in a separated mail.

>
> > On this filesystem I did the debugreiserfs ... The resulting file is on=
ly
> > 83K big. Since I don't have way to to provide it for download now is it
> > possible I mail it?
>
> ok.

--=20
Siegfried L=F6schmann
Schillerstr. 22
21423 Winsen
fon: +49 4171 72415
mobile: +49 162 10 455 43
email: Siegfried.Loeschmann@loe-online.de
