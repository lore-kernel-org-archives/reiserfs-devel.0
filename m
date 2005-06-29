From: Pekka Enberg <penberg@gmail.com>
Subject: Re: reiser4 merging action list
Date: Wed, 29 Jun 2005 09:18:07 +0300
Message-ID: <84144f02050628231814e9e6db@mail.gmail.com>
References: <42BB7B32.4010100@slaphack.com>
	 <200506240334.j5O3YowB008100@laptop11.inf.utfsm.cl>
	 <20050627092138.GD11013@nysv.org> <20050627124255.GB6280@thunk.org>
	 <42C0578F.7030608@namesys.com> <20050627212628.GB27805@thunk.org>
	 <42C084F1.70607@namesys.com> <20050627162303.156551b4.akpm@osdl.org>
	 <42C2348F.3000908@namesys.com>
Reply-To: Pekka Enberg <penberg@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24789-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C2348F.3000908@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, tytso@mit.edu, mjt@nysv.org, vonbrand@inf.utfsm.cl, ninja@slaphack.com, alan@lxorguk.ukuu.org.uk, jgarzik@pobox.com, hch@infradead.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, lord@xfs.org, vs <vs@thebsh.namesys.com>, Pekka Enberg <penberg@cs.helsinki.fi>

Andrew Morton wrote:
> > There's also the custom list, hash and debug code.  We should either
> >
> > a) remove them or
> >
> > b) generify them and submit as standalone works or
> >
> > c) justify them as custom-to-reiser4 and leave them as-is.

On 6/29/05, Hans Reiser <reiser@namesys.com> wrote:
> either b) or c) is ok with me for the list code.  The debug code should
> be c) I think.
>=20
> Probably vs can offer a more detailed and accurate opinion,

I completely agree that the current state of the generic hashing
facilities is somewhat poor but I fail to see why you can't use
<linux/list.h>.

As for the debugging code, I would love to see that turned into
something generic (every subsystem has their own now) but it is
definitely not something that should stop you from merging.

                                Pekka
