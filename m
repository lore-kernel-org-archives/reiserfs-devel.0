From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: Re: reiser4 vs. apache2 bad interaction?
Date: Thu, 24 Jun 2004 06:55:35 +0200
Message-ID: <20040624045535.GA30076@chepelov.org>
References: <20040607115743.GA27255@chepelov.org> <20040608165733.GW8091@backtop.namesys.com> <20040608184629.GA6507@chepelov.org> <20040623153253.GC5080@backtop.namesys.com> <20040623192733.GA30720@chepelov.org> <20040623194820.GF5080@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19330-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040623194820.GF5080@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Le Wed, Jun 23, 2004, =C3=A0 11:48:21PM +0400, Alex Zarochentsev a =E9crit:
> > Unfortunately, this kernel FTBFS:
> >=20
> >   CC      init/version.o
> >   LD      init/built-in.o
> >   LD      .tmp_vmlinux1
> > arch/i386/kernel/built-in.o(.text+0xc7fc): dans la fonction << acpi_reg=
ister_gsi >>:
> > : undefined reference to `mp_register_gsi'
> > make[1]: *** [.tmp_vmlinux1] Erreur 1
> > make[1]: quittant le r?pertoire ? /usr/src/linux/build/traminer/linux-k=
etchup ?
> > make: *** [stamp-build] Erreur 2
>=20
> we enable PM and ACPI for curing that.

indeed, enabling ACPI let that kernel build. I'll boot it about 16 hours
from now (around 21:00 CEST today), though I'm not too sure how a
1994-vintage machine will like being probed for ACPI... I hope it's
going to be fine, and will report as soon as I see something.

	-- Cyrille
=09
--=20
