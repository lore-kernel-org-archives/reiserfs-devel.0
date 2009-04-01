From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [patch 00/35] Jeff's ReiserFS Patch Queue
Date: Wed, 1 Apr 2009 18:34:07 +0200
Message-ID: <20090401163407.GE22517@elte.hu>
References: <20090330180215.951354436@suse.com> <alpine.LFD.2.00.0903301236280.4093@localhost.localdomain> <20090401161657.GA13802@elte.hu> <49D39642.9070606@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49D39642.9070606@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, =?iso-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>


* Jeff Mahoney <jeffm@suse.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Ingo Molnar wrote:
> > * Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >=20
> >>> Once this is applied, I expect reiserfs to be in deep=20
> >>> maintenance-only mode.
> >> Heh, I hadn't expected even this.
> >=20
> > Note, there are BKL-removal patches in the works by Fr=E9d=E9ric=20
> > Weisbecker, for the tip:kill-the-BKL topic branch.
> >=20
> > Reiser3 is the heaviest (and most non-trivial) BKL user amongst all=
=20
> > the filesystems, its BKL use is recursive and it frequently relies=20
> > on the implicit dropping of the BKL at various blocking points both=
=20
> > for correctness and for performance reasons.
> >=20
> > There might be something worth posting+reviewing soon.
>=20
> Oh interesting. I'm glad someone is working on this. I've started=20
> to several times and decided to focus my efforts on things outside=20
> of reiserfs instead. The reiserfs usage of the BKL has always been=20
> a black mark.

I'll let Frederic describe it but AFAIK the patch is working fine=20
with the BKL as a mutex and no lockdep complaints or lockups. The=20
main focus is now on finding the performance affecting spots,=20
because Frederic's main desktop is on reiserfs and he does not=20
accept a slowdown :)

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
