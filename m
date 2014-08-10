From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Mon, 11 Aug 2014 00:37:58 +0400
Message-ID: <1857998.1bln76ELaS@intelfx-laptop>
References: <3405506.BC0S4TX54B@intelfx-laptop> <1526377.TUs3NQt8ap@intelfx-laptop> <53E7CC75.2010500@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3860037.x8jL24jL5r"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=+oZMSLsZ3R3h8yJy0rkbD6tzH4YLRRJ5g516pmyFSGc=;
        b=cLI7DBYsHHedeIBSzT8OTWy3JBEMzjIZ3GF2dEuR8w/OXjl81bCOcb38HF/G4WUxmm
         yEWIHfieqoZwd2ihqD48GwwbrBODGATawCZVvRlOwnLayxXdx/NLavLnllOgoM+ZKSJ6
         9fSoZbufiNKtu5+sBxvok/aPl6wfKxg3gRxM5REiLpRAWY8X2TRfwqR5udiEzZBuU5Ur
         56BsuKXCYZE5RQ152qorRSqwpwa35Aee0n8Nnn2k5U/566UWGfB6NIZvmbJn29ta4vfD
         auV4OEUBs/GmeM5LAR+2+vQLdLWe0Dx54er/TyNZ4P4n27jfwLaiC5OaDpQF/jIQWOOU
         EPPQ==
In-Reply-To: <53E7CC75.2010500@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart3860037.x8jL24jL5r
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Sunday 10 August 2014 at 21:48:05, Edward Shishkin wrote:=09
>=20
> On 08/10/2014 08:52 PM, Ivan Shapovalov wrote:
> > On Friday 01 August 2014 at 01:19:05, Edward Shishkin wrote:=09
> >> [...]
> >> Define maximal number of allocated blocks in one iteration
> >> and reserve this amount of blocks at the beginning of each
> >> iteration. Once the limit is exhausted, stop the scan and
> >> force to commit the atom.
> > This sounds pretty hackish... Isn't there a way to grab all possibl=
e space
> > at the same time?
> > By all possible space I mean (sbinfo->block_count - sbinfo->blocks_=
used),
> > so that `fstrim <mountpoint>` will be efficient even if system is u=
nder load
> > and atoms are being created continuously.
>=20
>=20
> I am afraid that other processes will return ENOSPC, whereas there is=

> a lot of free disk space.
> Assume fstrim grabbed all possible space. A process X , who needs to
> reserve space invokes txnmgr_force_commit_all(). Everyone waits for
> commits completion. After this fstrim grabs all possible space again
> (there is no any queue for free space reclaimers). Process X returns
> ENOSPC.
>=20
> Edward.

I've meant "grabbing all space and then allocating all space" -- so the=
re won't
be multiple grabs or multiple atoms.

Then all processes grabbing space with BA_CAN_COMMIT will wait for the =
discard
atom to commit. (Actually, there is a small race window between grabbin=
g space
and creating an atom...)

The only problem is to wait for (sbinfo->block_count =3D=3D sbinfo->blo=
cks_used +
sbinfo->blocks_free) condition, i. e. until no blocks are reserved in a=
ny form,
and then to grab all space atomically wrt. reaching this condition.

Again, if this is not feasible, I'll go with the multiple atoms approac=
h. I
just want to make sure.

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart3860037.x8jL24jL5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPn2CYACgkQxUKljSIMAnDQjgEAt8KiJhToCx4pvZ8NumyxcoXI
AQ7J80vld3aokXOdbcUBAINcQek+7pD1yxZzkI39iQ6OMKgPxvFYIla1trtZYH11
=0GA3
-----END PGP SIGNATURE-----

--nextPart3860037.x8jL24jL5r--

