From: Nick Piggin <nickpiggin@yahoo.com.au>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 19:46:15 +1000
Message-ID: <42BFCAE7.6070708@yahoo.com.au>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl> <42BB31E9.50805@slaphack.com> <1119570225.18655.75.camel@localhost.localdomain> <42BB5E1A.70903@namesys.com> <1119609680.17066.81.camel@localhost.localdomain> <20050627091808.GC11013@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050627091808.GC11013@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Markus T=F6rnqvist wrote:

 > I can't find the original post I'm thinking about but
 > http://lkml.org/lkml/2005/5/16/68 says essentially the same thing.

The scheduler is being improved for better behaviour on complex
topologies like multi core + NUMA and multi level NUMA systems.
If Con's work had gone in first, then conversely these improvements
would have had to wait.

> There's also my all-time favorite, http://lkml.org/lkml/2005/3/14/4
>=20

What's wrong with that? The slowdown is due to the workload
becoming disk bound. The reasons are still not entirely clear,
but I don't think it is a recent (ie. 2.6) regression (or even
a regression at all IIRC).

> The lack of QA seems appalling here, and I'm sure Reiser has had
> to do more of that for DARPA than most linux kernel hackers around.
>=20

And what QA would you have preferred?

I think if you are resorting to bringing up all time favourite
blunders when trying to justify Reiser4 being included, then
that is a sign right there that something is fundamentally wrong
(if not with the code, then with your line of thought0

And note my email has nothing to do with any *real* argument for
or against R4.

Thanks,
Nick

Send instant messages to your online friends http://au.messenger.yahoo.com =


