From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [patch 00/35] Jeff's ReiserFS Patch Queue
Date: Wed, 1 Apr 2009 18:16:57 +0200
Message-ID: <20090401161657.GA13802@elte.hu>
References: <20090330180215.951354436@suse.com> <alpine.LFD.2.00.0903301236280.4093@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0903301236280.4093@localhost.localdomain>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linus Torvalds <torvalds@linux-foundation.org>, =?iso-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: Jeff Mahoney <jeffm@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > Once this is applied, I expect reiserfs to be in deep=20
> > maintenance-only mode.
>=20
> Heh, I hadn't expected even this.

Note, there are BKL-removal patches in the works by Fr=E9d=E9ric=20
Weisbecker, for the tip:kill-the-BKL topic branch.

Reiser3 is the heaviest (and most non-trivial) BKL user amongst all=20
the filesystems, its BKL use is recursive and it frequently relies=20
on the implicit dropping of the BKL at various blocking points both=20
for correctness and for performance reasons.

There might be something worth posting+reviewing soon.

	Ingo
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
