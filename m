From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: More Slowdown
Date: Wed, 16 Nov 2005 19:18:26 +0100
Message-ID: <437B77F2.5050401@ursynow.2a.pl>
References: <1132093347.6347.7.camel@bauerbob.hirsch.lan> <437A674E.2060407@ursynow.2a.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26966-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437A674E.2060407@ursynow.2a.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Thorsten Hirsch <t.hirsch@web.de>

Artur Mak=F3wka wrote:
> My slowdown problems are on my web server, so its concerning different=20
> things than Evolution. but this slowdown was very easy to notice when=20
> writing something with vim.
>=20
> Anyways, i remembered that i was using stable kernel without this=20
> happening some time ago. So i tested 2.6.14.x , 2.6.13.x mm and 2.6.13.x =

> , and i still had system crashes. so i downgraded to 2.6.12.6 and the=20
> system is stable for more than 24 hours (first time in this month or=20
> even longer!)
>=20
> probably some processes were doing fsync often (or something similar)=20
> and the effect was raising LA and lock-up at the end.
>=20
> anyways, 2.6.12.6 (but other than .6 probably too) is, i think, bug=20
> free. maybe this will help.

ok, now im 100% sure that 2.6.12.6 kernel + 2.6.12-3 reiser4 patch=20
doesnt have this fsync bug, or at least its not causing any big=20
slowdowns. The difference is really noticable.

I don't know if i can do anything more to help you fix this bug. But do=20
you know is it going to be fixed soon ?

Thanks in advance


