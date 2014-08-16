From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sat, 16 Aug 2014 04:44:34 +0400
Message-ID: <2026408.Yl74NqGZKK@intelfx-laptop>
References: <3405506.BC0S4TX54B@intelfx-laptop> <53E80077.2060300@gmail.com> <2275451.mu6kquuFD5@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1924282.MLvWpWLlNc"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=Xzj3iqRoEFNjBjaKSAvGbYNTLZDZ/Gfpg9sNRyMiHWo=;
        b=fmHC+x5i7bzzuNnDYlR/27duZKf1vCSgOmDEACNBFQDX/Pl142Io280TuP6gppgc0A
         qxhLZMNKhj+C9nt2s0L5+fY3LuU25jOiTRJcYR0iZDqfKrEw6TA2jqiX7ibhotvHsFLs
         IrcWBy/8/GWbrSof628d5hoPGML+V8yar4rguhK02bBDUMwuD5bF9KJP1bwl8V8E1ath
         G592zCK8OF2BGQLGKNM4w6U0Qz0Xrw7cgvwlNjPdz3R8QgPwzJjmbQlhZy0NmVw/ut/I
         9m6LaJTY+hPM4aq1fYrj7LDSz839Ae0QgCd2+RKKC2D3ig3w3eCMAh3+f69fc9lDHpqf
         G6yQ==
In-Reply-To: <2275451.mu6kquuFD5@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart1924282.MLvWpWLlNc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 11 August 2014 at 13:39:12, Ivan Shapovalov wrote:=09
> [...]
> > > I've meant "grabbing all space and then allocating all space" -- =
so there won't
> > > be multiple grabs or multiple atoms.
> > >
> > > Then all processes grabbing space with BA_CAN_COMMIT will wait fo=
r the discard
> > > atom to commit.
> >=20
> >=20
> > It seems such waiting will screw up the system. No?
>=20
> I was afraid of such situations, but how would that happen? The disca=
rd atom's
> commit will always be able to proceed as it doesn't grab space at all=
.
>=20
> > >   (Actually, there is a small race window between grabbing space
> > > and creating an atom...)
> >=20
> >=20
> > Which one?
>=20
> BA_CAN_COMMIT machinery does wait only for atoms, not for contexts. I=
f
> process X happens to grab space between us grabbing space and creatin=
g an atom,
> it will get -ENOSPC even with BA_CAN_COMMIT.
>=20
> > > The only problem is to wait for (sbinfo->block_count =3D=3D sbinf=
o->blocks_used +
> > > sbinfo->blocks_free) condition, i. e. until no blocks are reserve=
d in any form,
> > > and then to grab all space atomically wrt. reaching this conditio=
n.
> > >
> > > Again, if this is not feasible, I'll go with the multiple atoms a=
pproach. I
> > > just want to make sure.
> > >
> >=20

...so, I've almost given up implementing this :)

In kernel there is a read-write semaphore implementation called rwsem.
I've added a per-superblock instance of rwsem with following semantics:=


=2D when count of grabbed+special (not free or used) blocks is increased =
by any
  means, the semaphore is taken for reading before taking spinlock and
  modifying counters

=2D if the counters already were non-zero, the semaphore has been already=
 taken
  for reading (reader count > 1) and it is released once while under sp=
inlock
  (so that reader count always stays at 1)

=2D when count of grabbed+special blocks is decreased and drops to zero, =
the
  semaphore is released once (so reader count drops to 0 unless there i=
s a race
  with increasing the count)

=2D on second try of BA_CAN_COMMIT grabbing (if there was not enough spac=
e),
  the semaphore is taken for writing instead of for reading, ensuring
  that every block is either permanently used or free. The write lock i=
s
  converted to read lock after grabbing required space.

This "almost" works. The main problem is that Linux rwsem implementatio=
n
is write-biased: that is, if there are writers waiting, readers count c=
an't
increase. That is, a process must not take a semaphore for reading in s=
econd
time if it is responsible for releasing the "first time" reader.

The comment in original rwsem implementation by Andrew Morton states fo=
llowing:
"It is NOT legal for one task to down_read() an rwsem multiple times."

  reader1     writer1
=2D-----------------------
down_read()
            down_write()
            up_write()
down_read()
up_read()
up_read()

This is a deadlock: reader1's down_read() blocks on writer1's up_write(=
),
while writer1's down_write() blocks on reader1's second up_read().

A force grab (or a grab preceded by grab_space_enable(), or a used2some=
thing)
deadlocks 100% in presence of waiting writers, and so does the correspo=
nding
transaction commit.

So I need to find a way to take rwsem in a read-biased mode... Any advi=
ce is
accepted, including "give up with adding of yet another lock and go wit=
h
multiple transactions" :)

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart1924282.MLvWpWLlNc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPuqXIACgkQxUKljSIMAnBazwEAyDhY+25mAqWDsgj6kiuwlkFw
GNPwgV04xyxKyeWjnAEBANKWzJpC6t/MmoG6VW6HB3oteNM9h1/VoCt1ec17tQJh
=0u3W
-----END PGP SIGNATURE-----

--nextPart1924282.MLvWpWLlNc--

