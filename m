From: gimpel <gimpel@sonnenkinder.org>
Subject: reiser4 on 2.6.13-rc6-realtime-preempt
Date: Thu, 11 Aug 2005 22:45:03 +0200
Message-ID: <20050811224503.7dbd67dd@SiRiUS.home>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary="Signature_Thu__11_Aug_2005_22_45_03_+0200_3gIY31qm/482AAD8";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Return-path: <reiserfs-list-return-25415-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Signature_Thu__11_Aug_2005_22_45_03_+0200_3gIY31qm/482AAD8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello!

I'm trying to compile a recent 2.6.13-rc6 with realtime-preempt-2.6.13-
rc4-RT-V0.7.53-02 and want to add reiser4. 2.6.12-rt hardlocked very
often here.
I managed to fix up the DEFINE_SPINLOCK and compat_semaphore wait;
changes by taking a look on the changes between reiser4 for 2.6.12
and 2.6.12-rt and it first seems to compile fine but ends up with:

----8<------

  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
fs/built-in.o(.text+0x92999): In function `reiser4_put_super':
: undefined reference to `rcu_barrier'
fs/built-in.o(.text+0x929a9): In function `reiser4_put_super':
: undefined reference to `rcu_barrier'
fs/built-in.o(.text+0x97989): In function `_done_sinfo':
: undefined reference to `rcu_barrier'
fs/built-in.o(.text+0x97d76): In function `_done_formatted_fake':
: undefined reference to `rcu_barrier'
fs/built-in.o(.text+0x97d86): In function `_done_formatted_fake':
: undefined reference to `rcu_barrier'
make: *** [.tmp_vmlinux1] Fehler 1

----->8-----

Maybe some has managed to fix that or knows how to do so and is willing
to help me. My C knowledge is still too limited...

regards and thanks in advance
tom


--Signature_Thu__11_Aug_2005_22_45_03_+0200_3gIY31qm/482AAD8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFC+7jV21TUzfKRUn4RAm79AJ4ukNtgKlVEGxfjMvK0Hgj5VJOB2ACgoYL4
8HnJxNKc6lSs6QOk3n0+JUU=
=qHfn
-----END PGP SIGNATURE-----

--Signature_Thu__11_Aug_2005_22_45_03_+0200_3gIY31qm/482AAD8--
