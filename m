From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 15:01:30 +0100
Message-ID: <1119880888.27005.15.camel@localhost.localdomain>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl>
	 <42BB31E9.50805@slaphack.com>
	 <1119570225.18655.75.camel@localhost.localdomain>
	 <42BB5E1A.70903@namesys.com>
	 <1119609680.17066.81.camel@localhost.localdomain>
	 <20050627091808.GC11013@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24702-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050627091808.GC11013@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus =?ISO-8859-1?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Llu, 2005-06-27 at 10:18, Markus T=C3=B6rnqvist wrote:
> Sure, "other people merge design-breakers and bugs" is NOT a justificatio=
n
> for merging Reiser4, of course, but Reiser4's track record has vastly
> cleaned itself up.

The discussion is about merging from -mm, not into -mm. The merge into
-mm isn't at all under discussion so I don't the relevance of the
comparison.

> 0. Namesys addresses the code beautification reqs mentioned here earlier.
>=20
> 1. Merge Reiser4 sans metas into 2.6.13.
> 2. Namesys can have a separate metas patch for testing.
> 3. Gradually merge Reiser4 architecture into VFS and if this really
>    requires a 2.7, as (iirc) Valdis Kletnieks suggested, make it so.
>    Might do the rest of the kernel some good too.

0 and 1 look like the first right steps to take to me as well. That will
allow people to use reiser4 and give it a good hammering see what comes
out and how it benches in real life.=20

Alan

