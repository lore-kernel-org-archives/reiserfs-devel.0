From: Mariusz Mazur <mmazur@kernel.pl>
Subject: Re: Invalid use of asm/unaligned.h
Date: Thu, 12 Aug 2004 00:27:12 +0200
Message-ID: <200408120027.12385.mmazur@kernel.pl>
References: <200408112148.42125.mmazur@kernel.pl> <411A87A5.7020608@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20221-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <411A87A5.7020608@suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-list@namesys.com

On =B6roda 11 sierpie=F1 2004 22:55, Jeff Mahoney wrote:
> Can you provide examples of what you consider depending on "kernel
> internal stuff" ? When I look through include/asm*/unaligned.h, I see no
> references to functions not provided in a standard C library. I also
> don't see any assembly code, so I'm not sure why you'd need to code
> assembly for each architecture.

Haven't checked good enough (just saw ifdef __KERNEL__ in {linux,asm}/strin=
g.h=20
and didn't bother to check what's exactly inside - but that was just memcpy=
).

> There are other instances of libc headers defining macros that expand to
> standard libc functions. Why should the presence of memcpy/memmove calls
> be an exception to this? If you truly feel the need to create
> "userspace" headers for unaligned access, you can lift the kernel
> headers wholesale. If that's not desirable, take a look in
> asm-generic/unaligned.h and include that instead.

I don't like adding dependencies (even if it's libc), but what the heck. I'=
ll=20
add asm*/unaligned.h in llh 2.6.8.0 (whenever linus will release 2.6.8).

> That said, I don't believe the problem is the inclusion of
> asm/unaligned.h at all, but rather the fact that the PPC developers
> decided to surround the code with ifdef KERNEL. They're the only arch to
> do so, which is odd considering it's a no-op anyway.

I've got used to checking against ppc if I'm not sure whether a header is o=
r=20
isn't kernel only (contrary to other archs the ppc guys do separate kernel =

and userland stuff). The asm/unaligned.h header was always included as kern=
el=20
stuff (+ ppc defined it as kernel only) which got me fooled.


--=20
In the year eighty five ten
God is gonna shake his mighty head
He'll either say,
"I'm pleased where man has been"
Or tear it down, and start again
