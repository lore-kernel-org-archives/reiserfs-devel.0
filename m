From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: Re: reiser4 vs. apache2 bad interaction?
Date: Mon, 28 Jun 2004 09:21:47 +0200
Message-ID: <20040628072147.GA29726@chepelov.org>
References: <20040607115743.GA27255@chepelov.org> <20040608165733.GW8091@backtop.namesys.com> <20040608184629.GA6507@chepelov.org> <20040623153253.GC5080@backtop.namesys.com> <20040623192733.GA30720@chepelov.org> <20040623194820.GF5080@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19427-reiserfs=m.gmane.org@namesys.com>
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

> > > can you try
> > > http://namesys.com/auto-snapshots/reiser4-2004.06.23-14.56-linux-2.6.=
7-rc3-mm1.diff.gz ?


> > make[1]: *** [.tmp_vmlinux1] Erreur 1
> > make[1]: quittant le r?pertoire ? /usr/src/linux/build/traminer/linux-k=
etchup ?
> > make: *** [stamp-build] Erreur 2
>=20
> we enable PM and ACPI for curing that.

OK, I was able to build a kernel for that machine by enabling PM and
ACPI. I never got around to booting that kernel, though, and did not
test that kernel on the originall affected machine.

However, I ran that patch on a new machine that happened to be delivered
last Thursday, and encountered similar "busy loop" effects while doing
nothing special on the machine (apt-get install foo, apt-get install
bar, vi /etc/bar/bar.conf, apt-get install baz, rinse, repeat), so I
just threw the towel and will wait for a proper patch (-not-
an auto-snapshot) to come out against the Linus tree.

	-- Cyrille
=09
--
