From: Christoph Hellwig <hch@infradead.org>
Subject: Re: reiser4 plugins
Date: Sun, 26 Jun 2005 18:28:16 +0100
Message-ID: <20050626172816.GB19630@infradead.org>
References: <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com> <20050621202448.GB30182@infradead.org> <42B8B9EE.7020002@namesys.com> <42B8BB5E.8090008@pobox.com> <42B8E834.5030809@slaphack.com> <20050622053656.GB28228@infradead.org> <42B91764.1080208@slaphack.com> <20050626165246.GB18942@infradead.org> <42BEE430.7010505@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24629-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42BEE430.7010505@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Masover <ninja@slaphack.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jeff Garzik <jgarzik@pobox.com>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Sun, Jun 26, 2005 at 12:21:52PM -0500, David Masover wrote:
> I seem to remember the comment was more about hardcoded ID tables.
>=20
> And this was the generic ID code database, which is now maintained out
> of the kernel:
>=20
> /usr/share/misc/pci.ids
> 	A list of all known PCI ID's (vendors, devices, classes and sub-classes).
>=20
> That is what I was referring to, that used to be in the kernel.

And you once again showed that you don't understand what you're talking
about.  Said database is a pci id to name mapping, which is completely
irrelevant for any driver.  For things like your example there's very
little thing you can do but hardcoding a set of pci ids in one way or
another.

> What this has to do with is whether you believe that it's better to keep
> code out until it's perfectly clean, or to let in code that has some

I doesn't need to be perfect, we just need it in a reasonable state and
have a buying that it's going to continue to evolve in the rig=FEt directio=
n.

And we're are very far from both of them in this ccase.

