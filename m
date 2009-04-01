From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [patch 00/35] Jeff's ReiserFS Patch Queue
Date: Wed, 01 Apr 2009 12:28:50 -0400
Message-ID: <49D39642.9070606@suse.com>
References: <20090330180215.951354436@suse.com> <alpine.LFD.2.00.0903301236280.4093@localhost.localdomain> <20090401161657.GA13802@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090401161657.GA13802@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ingo Molnar <mingo@elte.hu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, =?ISO-8859-1?Q?Fr=E9d?= =?ISO-8859-1?Q?=E9ric_Weisbecker?= <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ingo Molnar wrote:
> * Linus Torvalds <torvalds@linux-foundation.org> wrote:
>=20
>>> Once this is applied, I expect reiserfs to be in deep=20
>>> maintenance-only mode.
>> Heh, I hadn't expected even this.
>=20
> Note, there are BKL-removal patches in the works by Fr=E9d=E9ric=20
> Weisbecker, for the tip:kill-the-BKL topic branch.
>=20
> Reiser3 is the heaviest (and most non-trivial) BKL user amongst all=20
> the filesystems, its BKL use is recursive and it frequently relies=20
> on the implicit dropping of the BKL at various blocking points both=20
> for correctness and for performance reasons.
>=20
> There might be something worth posting+reviewing soon.

Oh interesting. I'm glad someone is working on this. I've started to
several times and decided to focus my efforts on things outside of
reiserfs instead. The reiserfs usage of the BKL has always been a black
mark.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAknTlkIACgkQLPWxlyuTD7IAsQCfSNKuHk7oL8KhZK1InW7b189z
K4kAn3lINkZFMg89wJbwSiLZEfeQLLJA
=3DgrqX
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
