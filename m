From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Fri, 30 Sep 2016 06:28:57 +0300
Message-ID: <1475206137.26604.1.camel@intelfx.name>
References: <57E6DF37.1050702@gmail.com>
         <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>
         <1474944195.1773.15.camel@intelfx.name>
         <1921c810-5d7f-1de0-ec3d-48d123dba41f@gmail.com>
         <1475001384.1609.2.camel@intelfx.name> <57EAE900.8060301@gmail.com>
         <1475013062.1621.5.camel@intelfx.name>
         <b2b6b412-6a80-37d3-0055-3fe84a195afd@gmail.com>
         <1475058981.10051.1.camel@intelfx.name>
         <5aba3b45-ccd5-35bb-96a9-335c78022f92@gmail.com>
         <3d1f6d29-b3a8-1e14-d622-a3e158ec79d1@gmail.com>
         <1475074980.10051.3.camel@intelfx.name> <57EC20E7.8030906@gmail.com>
         <1475099403.10051.5.camel@intelfx.name>
         <314913f7-5bf0-3edc-ad0d-6a88567c0ae0@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-5x9sUZrTBLpIDCObj/XQ"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=uPw+qRvAvtDg06TsHn7HcGZjNkXEKzJe2fTtsdubdfA=;
        b=TKrPtRUUlQA1Zat7xC/saaLZkRD/TBZ5bekMWM+Oeji4oIP2uQIwHcGN7Gp4bwndib
         YWSTLcdvQWdV9ju847wALGU7GaYt4HfDGF7oV7pqA1IWiVaxe2+psq0U4zTv7j6Des7F
         u3eeGsMMRXFNNkxpCinZMCX6EnkeKieC2HbWo=
In-Reply-To: <314913f7-5bf0-3edc-ad0d-6a88567c0ae0@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>


--=-5x9sUZrTBLpIDCObj/XQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-09-29 at 17:07 +0200, Edward Shishkin wrote:
>=20
> On 09/28/2016 11:50 PM, Ivan Shapovalov wrote:
> > On 2016-09-28 at 21:58 +0200, Edward Shishkin wrote:
> > > On 09/28/2016 05:03 PM, Ivan Shapovalov wrote:
> > > > On 2016-09-28 at 16:44 +0200, Edward Shishkin wrote:
> > > > > [...]
> > > > >=20
> > > > > BTW, your fstrim-scanner is the first candidate to scrub ;)
> > > > > Actually, I think about a common multi-functional scanner,
> > > > > with 3
> > > > > modes:
> > > > > 1) discard only (handle only free blocks);
> > > > > 2) scrub only (handle only busy blocks);
> > > > > 3) combined (scan the whole partition; for free blocks call
> > > > > discard,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for busy ones call scru=
b).
> > > > > Any ideas?
> > > > >=20
> > > > > Thanks,
> > > > > Edward.
> > > > > PS: We have an own ioctl number: 0xCD inherited from
> > > > > ReiserFS(v3).
> > > >=20
> > > > I still have to finish the erase unit detection (which has
> > > > completely
> > > > stalled) to merge all this work. Moreover:
> > > >=20
> > > > For the fstrim, we have dropped all locking and serialization
> > > > issues
> > > > and declared that fstrim is best-effort: if it misses some
> > > > blocks
> > > > due
> > > > to concurrent transactions allocating and freeing blocks, it
> > > > doesn't
> > > > matter.
> > > >=20
> > > > For the scrub, this won't fly...
> > >=20
> > > Indeed, the requirements to fstrim and scrub are different,
> > > but, as I remember, the last decision was to not miss:
> > > http://marc.info/?l=3Dreiserfs-devel&m=3D141391883022745&w=3D2
> > > so everything will fly just perfectly..
> > >=20
> > > Edward.
> >=20
> > This is different thing, it's about grabbing space in bigger
> > chunks...
> > If a concurrent transaction allocates some space and frees some
> > space,
> > we don't care, because it will then be discarded "online".
> >=20
> > But in case of the scrub, how do we protect from the storage tree
> > changing right beneath us?
>=20
> Yup, it seems that the idea of common scanner is dead.
> It should be an independent tool. I think, we need to simply scan the
> storage tree, do whatever is needed for each node, and make it dirty.
>=20
> Edward.

How does it work in btrfs? They have their "allocation group"
equivalents ("chunks", IIRC), so I suppose they just walk them
sequentially and lock each one completely for processing?

--=20
Ivan Shapovalov / intelfx /
--=-5x9sUZrTBLpIDCObj/XQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX7dv6AAoJEHveF8jk4w6dHLcP/1Y1cDuWC7kUt/9JsJnRPjmp
SR10LsOcxAA2kcywsvmGwH8l9j7OI9xmOZLPVM5mMm35sOD2O/Q9wM6iaq/28AUX
DJHsYeG6u8vuIN40ShVJ9bkhiZpy2JPQuaJY6Vqs7ueRmfxblEyJFsmmhdsNuetD
T1O0W5+fFw4do9ecP0QXwKdxZkVfxniGXEnjPapsDL5OIvt1EhhsA8omFpzqLag1
+f4X9JCLydaWn0MNujOORKnfn3KVjFOPorAYhEqm7sHLc874nUs+2CsthjVIgJAg
ZZaNIFw8Say2S6VQFR/qu/VREhZ0NniBkb84sbP2wh5+Kh43smgKg8sAKAPszY/6
mqW5sCLiXiB5KGU9zITeBKjZzGGMqLFVZN48dwaYQL9wC0S83h7kk5GO5fW5r9Ry
iSA1AEdIX6DoNZRaMmMZQbYKDMWfzbbCg6Gvb9dyrTuTw3FYheX3VF3pjQ+gL97k
1Ki8Sqo3J1cM6fk4DcGTwu5+vKEM07H+caeHRxVloQkEyL7r1zVFSd9EizdVXM2f
ar8TgdzUnsh4x3PGdA+jt/txeVoYMnsWElGia7rc7G+KDInNMK0VqBT3vYq3L1IW
WtOXUXyjqvKI1SG+q9hv/6RiVUEPlChgDbYrtv0QR1eMAqC3/RXi7WprVefV6p15
4Zx8OAe3/ecLhyLeVCtf
=4l3E
-----END PGP SIGNATURE-----

--=-5x9sUZrTBLpIDCObj/XQ--

