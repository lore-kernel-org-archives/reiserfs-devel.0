From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Subject: Re: reiser4 plugins
Date: Wed, 22 Jun 2005 20:20:37 +0400
Message-ID: <42B98FD5.6050201@yandex.ru>
References: <20050620235458.5b437274.akpm@osdl.org> <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com> <20050621202448.GB30182@infradead.org> <42B8B9EE.7020002@namesys.com> <20050621181802.11a792cc.akpm@osdl.org> <1119452212.15527.33.camel@server.cs.pocnet.net> <42B97F82.6040404@yandex.ru> <20050622155505.GZ11013@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24467-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050622155505.GZ11013@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?KOI8-R?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, hch@infradead.org, jgarzik@pobox.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Markus T=F6rnqvist wrote:
> So merge it as it is and move the stuff to the VFS as needed or
> deemed necessary. And enable the pseudo interface, or at least
> set it in menuconfig and enable by default, it needs testing too.
Reiser4 has a number of great (IMO) things like file as directory,=20
atomic operations, different kinds of stat data, fibretions, etc, etc.=20
Some thing is not yet ready - doesn't matter. Some of this is of general =

interest, some is Reiser4-dedicated.

New interfaces are needed to allow users to utilize that all. My point=20
is that the things that are of general interest must not be=20
Reiser4-only. For example, I should have a possibility to implement=20
files-like-dir in _another_ FS using the same interfaces that Reiser4=20
uses. That's all I wanted to say.

The other question that it may be difficult to foresee everything and it =

may make sense to move some things upper in future.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

