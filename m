From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [patch 00/35] Jeff's ReiserFS Patch Queue
Date: Wed, 1 Apr 2009 18:51:36 +0200
Message-ID: <20090401165134.GA5924@nowhere>
References: <20090330180215.951354436@suse.com> <alpine.LFD.2.00.0903301236280.4093@localhost.localdomain> <20090401161657.GA13802@elte.hu> <49D39642.9070606@suse.com> <20090401163407.GE22517@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=0EzAC1NVAzsm5QHBUJJepdc/k+9MqerLgGEYpxGqHGE=;
        b=CIT6IwrmEmh9AICq24QXDNF+dgYs8JyUK9C+Fa/X73DGjDDpi7+cp/B8nt0hfvn/AU
         lw8aamBPJOA4GzxY4Zfz2OLXaqzmZf4VwXSHz6maWPmT3ymBjm2vgxz+H46Sca8GolBj
         R3OTjJT11q6Za+nzN4cXcrVVnRE2z3k+pi858=
Content-Disposition: inline
In-Reply-To: <20090401163407.GE22517@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ingo Molnar <mingo@elte.hu>
Cc: Jeff Mahoney <jeffm@suse.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Wed, Apr 01, 2009 at 06:34:07PM +0200, Ingo Molnar wrote:
>=20
> * Jeff Mahoney <jeffm@suse.com> wrote:
>=20
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >=20
> > Ingo Molnar wrote:
> > > * Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > >=20
> > >>> Once this is applied, I expect reiserfs to be in deep=20
> > >>> maintenance-only mode.
> > >> Heh, I hadn't expected even this.
> > >=20
> > > Note, there are BKL-removal patches in the works by Fr=E9d=E9ric=20
> > > Weisbecker, for the tip:kill-the-BKL topic branch.
> > >=20
> > > Reiser3 is the heaviest (and most non-trivial) BKL user amongst a=
ll=20
> > > the filesystems, its BKL use is recursive and it frequently relie=
s=20
> > > on the implicit dropping of the BKL at various blocking points bo=
th=20
> > > for correctness and for performance reasons.
> > >=20
> > > There might be something worth posting+reviewing soon.
> >=20
> > Oh interesting. I'm glad someone is working on this. I've started=20
> > to several times and decided to focus my efforts on things outside=20
> > of reiserfs instead. The reiserfs usage of the BKL has always been=20
> > a black mark.
>=20
> I'll let Frederic describe it but AFAIK the patch is working fine=20
> with the BKL as a mutex and no lockdep complaints or lockups. The=20
> main focus is now on finding the performance affecting spots,=20
> because Frederic's main desktop is on reiserfs and he does not=20
> accept a slowdown :)



Hehe :-)
No actually I would accept a tiny slowdown but I fear that the common
reiserfs users wouldn't.

I'm still working on this and once it's ready enough for an RFC patch,
I'll explain how is done the conversion to a mutex.

Stay tuned.

=20
> 	Ingo

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
