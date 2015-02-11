From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH] reiser4: precise discard - general case
Date: Wed, 11 Feb 2015 13:09:14 +0300
Message-ID: <1423649354.10127.16.camel@gmail.com>
References: <5495DB0D.1080005@gmail.com>
	 <1423600944.24885.9.camel@gmail.com> <54DB1186.60505@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-3p9Ty43tZLaALjLHPj+f"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=jMWP8ISgoytgPUuttRPwEiggUoGlkRoTU3PGzhzld2I=;
        b=rRrNqoBTB5IQ3kbmfleCCJybYlZn1gL5wdzAuMnSDooTXwXwdxrgQtw0de4Vo56s4l
         QejGX+EUilL7Ptq1Zt2fDEZuUzDOzW/HD9tQg4HkYn2dBiiavVN7s9BQhGNfoG8JjULP
         XyGN7lIRlWv/5k3XYA/W5MV09SFt7lFgZBumWJNfybijflunQgVlc960Q8PJTgPsXaeb
         O8LpLD+AtGFnuZkuMsiOwGtASw5mCawnkVubCrLAcY+42Svg7WZUNZ7eukOWjvAeasNH
         +IR0OsaUPjLl6UDtXr59zwMAntfMrgbl8AaEu0wgJlWB4BeOE6pyCn7CDEnox7xosUS2
         aJCw==
In-Reply-To: <54DB1186.60505@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-3p9Ty43tZLaALjLHPj+f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-02-11 at 09:23 +0100, Edward Shishkin wrote:
> On 02/10/2015 09:42 PM, Ivan Shapovalov wrote:
> > On 2014-12-20 at 21:24 +0100, Edward Shishkin wrote:
> >> This is the promised generalization, which is supposed to work for all
> >> discard
> >> offsets and all discard unit sizes without any restrictions.
> >>
> >> Complications in comparison with the previous implementation:
> >>
> >> In this general case we need "precise" coordinates, where every
> >> individual byte
> >> can be addressed. All local variables, which represent precise
> >> coordinates are
> >> denoted with "prefixes" (a_len, d_off, p_tailp, etc). Local variables,
> >> which represent
> >> "non-precise" coordinates (they are usually of type reiser4_block_nr)
> >> are denoted
> >> without prefixes (start, len, end, tailp, etc).
> >>
> >> Blocks, which contain head and tail paddings are now calculated using =
the
> >> function size_in_blocks(), which actually is an expression for the
> >> minimal number
> >> of blocks containing the precise extent.
> >>
> >> The next trouble is "peculiarity in 0", encountered when calculating t=
he
> >> blocks of
> >> head padding. if discard offset is different from 0, then the first
> >> discard unit of the
> >> partition is partial (its other part doesn't belong to our partition, =
so
> >> we can not
> >> discard it). We handle this peculiarity by an additional check.
> >>
> >> In other bits everything is the same.
> >>
> >> Possible optimization: If discard unit sizes are always powers of 2,
> >> then it makes
> >> sense to replace "do_div(offset, unit_size)" with "offset & (unit_size=
 -
> >> 1)".
> >>
> >> Mount options discard.offset=3Dxxx,discard.unit=3Dyyy are to emulate v=
arious
> >> discard unit sizes and offsets on devices _without_ trim support (e.g.
> >> HDDs).
> >> This is only for debugging purposes, don't use it for real SSD devices=
:
> >> the kernel
> >> retrieves the discard parameters on its own.
> >>
> >> This patch is against the patch series of Ivan Shapovalov:
> >> http://marc.info/?l=3Dreiserfs-devel&m=3D141841865432082&w=3D2
> >>
> >> Current status: not well-tested.
> >>
> >> Edward.
> > Hi,
> >
> > I've found a bug in our implementation (don't know when it appeared,
> > maybe it was quite some time ago). I've intended to fix it and send
> > a patch along with description, but I still can't think of a viable fix=
.
> >
> > So: the problem is that check_free_blocks() isn't idempotent, because i=
t
> > allocates blocks if the whole extent is clean. Therefore, it must not b=
e
> > called for overlapping ranges. However, in some conditions tail padding
> > of some extent and head padding of next extent may overlap in terms of
> > disk blocks (gluing code only catches overlapping erase units).
> >
> > This will yield a false negative when checking the head padding, so it
> > does not lead to any data losses (just to inefficiency).
>=20
>=20
> You mean that sometimes we perform unneeded checks?
> I see nothing criminal, as we don't exceed announced (2N_e)
> number of checks, where N_e is number of extents in the
> discard set.

No, I didn't talk about that.

>=20
> As to fixup: I think that we need to set up the local variable
> head_is_known_dirty properly..

Hmm, head_is_known_dirty is an optimization: either known dirty
(in which case we skip checking and cut the head), or unknown
(in which case we do the check).

I'm talking about a different scenario:
- tail padding of an extent is clean
- head padding of the next extent is clean
- these two paddings overlap in terms of disk blocks

In this case, the head padding check will yield false ("dirty") because
part of it has been already allocated for the tail padding, but in fact
it is clean. Thus a false negative: the head will be cut while it can be
padded.

More generally, our check_free_blocks() is not idempotent. After a
positive result has been returned for a given range [A;B),
check_free_blocks() must not be called for any range [A';B') such that
[A;B) =E2=88=A9 [A';B') =E2=89=A0 =E2=88=85. Otherwise a false negative can=
 be returned.

Actually, during the last night I've *apparently* came up with a
solution for this :) I'll send a patch once I figure out how to explain
it properly in the comments...

Thanks,
--=20
Ivan Shapovalov / intelfx /

--=-3p9Ty43tZLaALjLHPj+f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlTbKkoACgkQxUKljSIMAnB7gwEA4g8Q9P+2OLNG4V4A+47yNIe5
gBtLNudk18bYiuWc6G4A/0HX7OyyOHnG+YYNEK1Pq2zv+mkopFuNSulJEXAgAiKa
=GffI
-----END PGP SIGNATURE-----

--=-3p9Ty43tZLaALjLHPj+f--

