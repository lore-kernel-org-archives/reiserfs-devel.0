From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: [PATCH] Re: http://www.namesys.com/snapshots/2004.07.13-internal.testing/
Date: Tue, 13 Jul 2004 16:06:09 +0400
Message-ID: <200407131606.09283.vitaly@namesys.com>
References: <200406150022.34578.vitaly@namesys.com> <200407131427.58912.vitaly@namesys.com> <20040713125401.1ac99b7f@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19597-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040713125401.1ac99b7f@philou.gramoulle.local>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?utf-8?q?Gramoull=C3=A9?= <philippe.gramoulle@mmania.com>
Cc: reiserfs-list@namesys.com

On Tuesday 13 July 2004 14:54, Philippe Gramoull=C3=A9 wrote:
> Hello Vitally,
>
> I needed the following patch in order to compile reiser4progs-0.5.6
> correctly.
>
> Thanks,
>
> Philippe

ah, the patch for libaux/gauge.c, right. It found very old=20
ocasionally not uninstalled aal.h in my tests.
--=20
Thanks,
Vitaly Fertman

