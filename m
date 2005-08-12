From: gimpel <gimpel@sonnenkinder.org>
Subject: Re: reiser4 on 2.6.13-rc6-realtime-preempt
Date: Fri, 12 Aug 2005 12:09:03 +0200
Message-ID: <20050812120903.1ff16b24@SiRiUS.home>
References: <20050811224503.7dbd67dd@SiRiUS.home>
	<42FC665D.4030802@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary="Signature_Fri__12_Aug_2005_12_09_04_+0200_LOwjlClYlj54=rdg";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Return-path: <reiserfs-list-return-25424-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FC665D.4030802@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--Signature_Fri__12_Aug_2005_12_09_04_+0200_LOwjlClYlj54=rdg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Aug 2005 13:05:33 +0400
"Vladimir V. Saveliev" <vs@namesys.com> wrote:

> Hello
>=20
> gimpel wrote:
> > Hello!
> >=20
> > I'm trying to compile a recent 2.6.13-rc6 with realtime-
> > preempt-2.6.13- rc4-RT-V0.7.53-02 and want to add reiser4. 2.6.12-
> > rt hardlocked very often here.
>=20
> Which patches did you use?
>=20
I used the patches from 2.6.13-rc5-mm1 and added the changes that have
been done to reiser4-for-2.6.12-realtime-preempt-2.6.12-final-
V0.7.51-29.patch.gz which look like that:=20
http://gimpel.ath.cx/~tom/r4_to_rtp.patch=20
The complete patches and changes are in this diff:
http://gimpel.ath.cx/~tom/r4_for_realtime-preempt-2.6.13-rc4-RT-V0.7.53-02_=
notworking.patch
Seems like there where some new changes to realtime-preempt that break
reiser4 again. Maybe the is to wait for stable 2.6.13 before doing
tests with realtime-preempt as it gets updated twice a day.=20
And i so much hope the kernel guys decide to merge reiser4.=20

> > I managed to fix up the DEFINE_SPINLOCK and compat_semaphore wait;
> > changes by taking a look on the changes between reiser4 for 2.6.12
> > and 2.6.12-rt and it first seems to compile fine but ends up with:
> >=20
> > ----8<------
> >=20
> >   CC      init/version.o
> >   LD      init/built-in.o
> >   LD      .tmp_vmlinux1
> > fs/built-in.o(.text+0x92999): In function `reiser4_put_super':
> > : undefined reference to `rcu_barrier'
>=20
> reiser4 depends on several core kernel patches. I think you did not
> apply them. You might want to try to apply this patch
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.12/reiser4-for-2.6.12-realt=
ime-preempt-2.6.12-final-V0.7.51-29.patch.gz
> It contains all necessary patches already.

That compiled fine with 2.6.12-RT-xx, but 2.6.12-RT didn't work very
well here. it hardlocked and performance whise there was not much
difference to vanilla. 2.6.11-RT + reiser4 works fine, but to be able to
get some sound out of my second soundcard i need a recent alsa-cvs,
which doesn't compile with kernel < 2.6.13-rcX.=20
The above reiser4 patch is broken with 2.6.13-rc4-RT again.

>=20
> > fs/built-in.o(.text+0x929a9): In function `reiser4_put_super':
> > : undefined reference to `rcu_barrier'
> > fs/built-in.o(.text+0x97989): In function `_done_sinfo':
> > : undefined reference to `rcu_barrier'
> > fs/built-in.o(.text+0x97d76): In function `_done_formatted_fake':
> > : undefined reference to `rcu_barrier'
> > fs/built-in.o(.text+0x97d86): In function `_done_formatted_fake':
> > : undefined reference to `rcu_barrier'
> > make: *** [.tmp_vmlinux1] Fehler 1
> >=20
> > ----->8-----
> >=20
> > Maybe some has managed to fix that or knows how to do so and is
> > willing to help me. My C knowledge is still too limited...
> >=20
> > regards and thanks in advance
> > tom
> >=20
>=20

--Signature_Fri__12_Aug_2005_12_09_04_+0200_LOwjlClYlj54=rdg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFC/HVH21TUzfKRUn4RApdVAJ9jvAFzY/DNWfKiFOfESFaGqmhiEgCeIbuM
34eME9M3Mvj6LVmr+P18QWw=
=xtd+
-----END PGP SIGNATURE-----

--Signature_Fri__12_Aug_2005_12_09_04_+0200_LOwjlClYlj54=rdg--
