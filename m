From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sun, 10 Aug 2014 22:52:29 +0400
Message-ID: <1526377.TUs3NQt8ap@intelfx-laptop>
References: <3405506.BC0S4TX54B@intelfx-laptop> <9580367.jIyNAsIfmQ@intelfx-laptop> <53DACEE9.8000802@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4725060.eK0bTVr4DF"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=H62f9pc6FM0InbqKQDdIFcgaBiGel2knESah+1Gfqrs=;
        b=GNYpfFGkQGQSeBo2VhlfGZMkXi4amPR0iO5Cllm5U4cRUAaGNY1K3crG+x8DedxRA2
         YjmNmtmp0p1L21JGzoIudp5/c0d5XZr0EXgj3y7ooPtxdLmiutNrnolYyuJwLSHeqmIn
         /tJ4wFv2efcsg6iLkoA5Kx6RnZ6ST5ohlYFSf5lpSKabIloqddU2sNLuqTKXKw3qreBg
         mU8VNqA4TkNblajLRsjfsqOYFelQHIlOjvowRJpy9G+F+3zbw2zPEIMTYNafQD0BYJzq
         AAM7CeazKFiYahAdJ71X/Cmw3zkSKl+t7TD8FbtL+q+UZIlyNDEykFL1iOpC31li8126
         98rg==
In-Reply-To: <53DACEE9.8000802@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart4725060.eK0bTVr4DF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Friday 01 August 2014 at 01:19:05, Edward Shishkin wrote:=09
>=20
> On 08/01/2014 12:16 AM, Ivan Shapovalov wrote:
> > [...]
> > OK. But it still needs to allocate space (even if just to deallocat=
e it
> > shortly), which means that someone could get ENOSPC while the disca=
rd is in
> > progress, and this ENOSPC will come from the allocator itself.
>=20
>=20
> Ah, yes of course, we'll illegally occupy someone's reservation with
> the following oops...
>=20
>=20
> > Do you have any ideas on how to do it gracefully?
>=20
>=20
> Define maximal number of allocated blocks in one iteration
> and reserve this amount of blocks at the beginning of each
> iteration. Once the limit is exhausted, stop the scan and
> force to commit the atom.

This sounds pretty hackish... Isn't there a way to grab all possible sp=
ace
at the same time?
By all possible space I mean (sbinfo->block_count - sbinfo->blocks_used=
),
so that `fstrim <mountpoint>` will be efficient even if system is under=
 load
and atoms are being created continuously.

Or am I trying to over-engineer too much?

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart4725060.eK0bTVr4DF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPnv3EACgkQxUKljSIMAnCd3wEA2y1A+SGpMjaG710Vtrsm9+Uz
jDudf+7KYIdYeWqJrdABALMgjsJuGRGJoVMW1Cp/NiWqcX3quGmdvdUGvDuUuHHQ
=VdQI
-----END PGP SIGNATURE-----

--nextPart4725060.eK0bTVr4DF--

