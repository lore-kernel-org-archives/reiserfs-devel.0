From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: reiser4 plugins
Date: Tue, 28 Jun 2005 09:44:59 -0400
Message-ID: <200506281344.j5SDixiH003441@laptop11.inf.utfsm.cl>
References: <20050627092138.GD11013@nysv.org>
Return-path: <reiserfs-list-return-24759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from mjt@nysv.org (Markus =?ISO-8859-1?Q?=20T=F6rnqvist?=) 
   of "Mon, 27 Jun 2005 12:21:38 +0300." <20050627092138.GD11013@nysv.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Markus =?ISO-8859-1?Q?=20T=F6rnqvist?= <mjt@nysv.org>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, David Masover <ninja@slaphack.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Markus   T=C3=B6rnqvist <mjt@nysv.org> wrote:
> On Thu, Jun 23, 2005 at 11:34:50PM -0400, Horst von Brand wrote:
> >David Masover <ninja@slaphack.com> wrote:
> >> I think Hans (or someone) decided that when hardware stops working, it=
's
> >> not the job of the FS to compensate, it's the job of lower layers, or
> >> better, the job of the admin to replace the disk and restore from
> >> backups.

> >Handling other people's data this way is just reckless irresponsibility.
> >Sure, you can get high performance if you just forego some of your basic
> >responsibilities.

> Your honest-to-bog opinion is that the FS vendor is responsible for
> the admin not taking backups or the hardware vendor shipping crap?

No. But just relying on perfect hardware and concientious sysadmins is
reckless. Hardware /is/ flaky, sysadmins /are/ (sometimes) lazy (and
besides, today they are increasingly just plain Joe Sixpack users). Also,
backing up a few hundred GiB is /not/ fun, and then keeping track of all
the backups is messy.

Also, I'm not claiming that they are /solely/ responsible, but not having
the filesystem fall apart utterly every time some bug breaths on it /is/ a
requirement.

> *still trying to understand how that can be*

You haven't been around too much yet, do you?
--=20
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
