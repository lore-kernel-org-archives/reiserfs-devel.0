From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: rebuild-tree hangs
Date: Fri, 11 Apr 2003 16:20:27 +0400
Message-ID: <200304111620.27377.vitaly@namesys.com>
References: <20030411015312.GA20912@coloppl> <200304111356.18574.vitaly@namesys.com> <20030411121321.2a3686b2.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13644-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030411121321.2a3686b2.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?iso-8859-1?q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

On Friday 11 April 2003 14:13, Philippe Gramoull=E9 wrote:
> Hi,
>
> Just my 0.02 euro but why not build reiserfsck statically out of the bo=
x ?
>
> This would avoid such problems and also when someone uses a floppy to
> repair a root filesystem ( stripped 3.6.5 reiserfsck static binary is a=
bout
> 643 Ko )

This is probably pretty big for a floppy, stripped not-static binary is 3=
 times smaller.
Actually, there was only this problem with different libc versions and I =
hope that I will=20
be able to reproduce it and to resolve it soon.=20

--=20
Thanks,
Vitaly Fertman
