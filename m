From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [RFC] [PATCHv3 1/9] reiser4: block_alloc: add BA_SOME_SPACE flag for grabbing a fixed amount of space.
Date: Mon, 20 Oct 2014 14:36:42 +0400
Message-ID: <3239928.cvXopdq3l9@intelfx-laptop>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <1408312379-1990-2-git-send-email-intelfx100@gmail.com> <54443577.3050700@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5408259.T2Ip05MqF4"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=LX0T8QseYBEFjYuegZtkwp7VuIGkvwvtlIVhGugRBnw=;
        b=RtpAtkivMFkOaQfOMG/33CJ4EaE1bGumw/Bzy2+Q7+DbanzBHOMSR9TEI3xM8zKw5N
         2uS+Zg5rzZS9qJBRruTZE0TuQVsiSKHXLYzEhzgbtX+SZOHkcnR6FDZiWiDBuI+5SMVg
         NAGBalU//HaQYvk1HFObu7zXQWIktnfC+yS9bs4BaokHfBdSKgsdYyZIufC67oWFylXb
         0wWC0HQzAvS5bs+RUPV5tCfsoi8krBG5eJE9HVaN6qdf/8qugLBhCPwM6MIJrodbp6fN
         e+QLLGgPARhv7O1eR5Y0mJlXYAIM0DjZMFzODua7aqxYcOjsyLuu/BF9wZ1XyZ60EEq1
         eoPw==
In-Reply-To: <54443577.3050700@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart5408259.T2Ip05MqF4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 20 October 2014 at 00:04:39, Edward Shishkin wrote:=09
>=20
> On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
> > This is used for FITRIM ioctl which will iteratively grab, allocate=
 and trim disk space
> > bit by bit to avoid starving the rest of system.
> >
> > Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> > ---
> >   fs/reiser4/block_alloc.c | 5 +++++
> >   fs/reiser4/block_alloc.h | 5 ++++-
> >   2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
> > index d3d730c..9eed7fc 100644
> > --- a/fs/reiser4/block_alloc.c
> > +++ b/fs/reiser4/block_alloc.c
> > @@ -276,6 +276,11 @@ reiser4_grab(reiser4_context * ctx, __u64 coun=
t, reiser4_ba_flags_t flags)
> >  =20
> >   =09free_blocks =3D sbinfo->blocks_free;
> >  =20
> > +=09if (flags & BA_SOME_SPACE) {
> > +=09=09/* Reserve 25% of all free space. */
>=20
> if (free_blocks =3D=3D 0) {
>          /* nothing to trim */
>          ret=3D RETERR(-ENOSPC);
>          goto unlock_and_ret;
> }

Makes sense, but IMO without returning error. TRIM'ing a completely ful=
l
filesystem is a no-op (=3D=3D all blocks busy, nothing to trim), not a =
failure.

>=20
> > +=09=09count =3D free_blocks >> 2;
>=20
> if (count =3D=3D 0)
>          /* there are 1, 2, or 3 free blocks  */
>          count =3D free_blocks;

Done.

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart5408259.T2Ip05MqF4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRE5b4ACgkQxUKljSIMAnA0FwD/X1W60J0lJBOEnSOPpxXePHIU
qBlxoVW6yi5TZOHo0PgA/1svGNC6l4Npi29n3TxnAknkDKCcIuMwwlSUkvhLWqxh
=nK/d
-----END PGP SIGNATURE-----

--nextPart5408259.T2Ip05MqF4--

