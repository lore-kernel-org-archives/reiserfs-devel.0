From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sat, 16 Aug 2014 21:02:38 +0400
Message-ID: <3328274.dmtPODE4QV@intelfx-laptop>
References: <3405506.BC0S4TX54B@intelfx-laptop> <1651199.WS1bpHXlZS@intelfx-laptop> <53EF4B61.4080906@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3144195.jlFLmZVZIL"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=zvySKn6t9QFqb5vh4Dr/YcW3oN57jfQ2MCFHlrOUyHY=;
        b=jR/CVu4BIFz64NhrS29OIaef3FzOi2xta1X9UeeLfgxWTihXRtaoQ36Ttk0IO+xnjj
         pjkGZfxCXwoo7W1l8zM1ohTiAM2/ks8+pqXsBfgCuj5wqzKjFwEjxV/vOTIFuqA8bods
         3ulSRcxIe8r6tV/RfhUkyu4z/R6xpMSVBwCEQF+IKIM5/wn0YKgjlspOo79RHyisM7b7
         jpZwsGq7m/69Xo/zmu4Ll6U3e+47Y6l/zafHHjnoiaRbdySvjG7WOO1I9ldIN16Ez3kh
         iRbXnGBxwrRwK79jlkSL6NWsXq+/02plBvydrPy8EIGQo+tYPmeS/hGptihD9nPQxigs
         IbOA==
In-Reply-To: <53EF4B61.4080906@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart3144195.jlFLmZVZIL
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Saturday 16 August 2014 at 14:15:29, Edward Shishkin wrote:=09
>=20
> On 08/16/2014 01:17 PM, Ivan Shapovalov wrote:
> > On Saturday 16 August 2014 at 10:09:44, Edward Shishkin wrote:=09
> >> On 08/16/2014 02:44 AM, Ivan Shapovalov wrote:
> >>> On Monday 11 August 2014 at 13:39:12, Ivan Shapovalov wrote:=09
> >>>> [...]
> >>>>>> I've meant "grabbing all space and then allocating all space" =
=2D- so there won't
> >>>>>> be multiple grabs or multiple atoms.
> >>>>>>
> >>>>>> Then all processes grabbing space with BA_CAN_COMMIT will wait=
 for the discard
> >>>>>> atom to commit.
> >>>>> It seems such waiting will screw up the system. No?
> >>>> I was afraid of such situations, but how would that happen? The =
discard atom's
> >>>> commit will always be able to proceed as it doesn't grab space a=
t all.
> >>>>
> >>>>>>     (Actually, there is a small race window between grabbing s=
pace
> >>>>>> and creating an atom...)
> >>>>> Which one?
> >>>> BA_CAN_COMMIT machinery does wait only for atoms, not for contex=
ts. If
> >>>> process X happens to grab space between us grabbing space and cr=
eating an atom,
> >>>> it will get -ENOSPC even with BA_CAN_COMMIT.
> >>
> >> I still don't see any "races" here. How atom creation is related t=
o grabbing
> >> space? Are we talking about races in the existing code? f so, plea=
se show
> >> the racing paths..
> > Well, this is not a race per se - it does not involve locking. But =
it is
> > a race-like behavior.
> >
> > taskA                                 taskB
> > -------------------------------------------------------------------=
=2D------
> > grab very much space
>=20
> Ok, assume A wants X blocks.
>=20
> >                                          grab some space with BA_CA=
N_COMMIT
>=20
> Assume B wants Y blocks.
>=20
> > create an atom using the grabbed space
>=20
>=20
> Please, specify which code is executing at this point.
>=20
> Anyway, we don't need any reservation to _create_ an atom.
> Reservation is expended when allocating blocks on the low level
> (bitmaps). Reservation (grabbing space) is needed to avoid hard
> ENOSPC (=3Dno free bits in bitmaps) in situation, when we can not
> fail (e.g. flush, commit, etc..,)

Let's take reiser4_sync_file_common().

The grabbing is
=09reserve =3D estimate_update_common(dentry->d_inode);
=09if (reiser4_grab_space(reserve, BA_CAN_COMMIT)) {

The creation of atom is (somewhere deep in the call stack) at
=09write_sd_by_inode_common(dentry->d_inode);

Clearly, syncing file won't increase the real space occupied by data on=
 disk.
However, because there is WA + journaling, such transaction still needs=
 some
space to complete. This is "X blocks".

Suppose there is a second sync scheduled between grabbing and creation =
of atom
of the first sync. In the same vein it needs Y blocks, and Y is such th=
at
Y < free-space < X+Y.

In this case, the second sync will fail despite BA_CAN_COMMIT flag give=
n to
reiser4_grab_space(): at time of its execution, the first sync did not =
yet
create its atom, so there is nothing to commit to reclaim those X block=
s.

However, if the second sync gets ordered after write_sd_by_inode_common=
() of
the first sync, BA_CAN_COMMIT machinery will eventually execute
txnmgr_force_commit_all() which will wait for the first sync to complet=
e and
reclaim those X blocks.

So, the second transaction's result depends on scheduling. It is a race=
=2Dlike
behavior.

=2D-=20
Ivan Shapovalov / intelfx /

>=20
>=20
> >
> > In this case, the taskB's grab will fail though it could wait for t=
askA's
> > not yet created atom.
>=20
>=20
> I still don't see why somebody should fail if X+Y < free-space-on-dis=
k.
> If X+Y > free-space, then yes, someone will fail, and it is correct.
--nextPart3144195.jlFLmZVZIL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPvjq4ACgkQxUKljSIMAnCWsAD/Y0JNjtyo0MrUCGUrcrvmyzzD
xO3kYXV2l5SBQcyNk08BALX5lpc1LA8deK9jOWpDI/aRbviDeRwmruvQizZrDCAM
=Z6p6
-----END PGP SIGNATURE-----

--nextPart3144195.jlFLmZVZIL--

