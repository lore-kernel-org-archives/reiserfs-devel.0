From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: 2 minutes for a reiser4 filesystem to mount.
Date: Sat, 24 Oct 2015 00:37:44 +0300
Message-ID: <1445636264.2412.0.camel@gmail.com>
References: <n0b6ql$6t4$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/vbZzav74plb+vBI0bw5"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:in-reply-to:references:content-type
         :mime-version;
        bh=wK3yNbSjnrOeGyZCnVDts0cH757XGVH1ZfRfVpBIPNI=;
        b=B1+pEArm0KhdXDKLXcdC7BHV9kEwHQPvdsYpOXaoL7S5Y2ueuLLA5UUaqf3nU6hHIr
         NhEKXn9k7vK2x6QVv41OYd5qoOS/5gFtBlrZrIcbP3ZSo8GcxbJFOG6wfUam+YjU9bId
         olwDVGCd5AEc60a/yq0qIhne5r2MXhKdVs+1XJXeLlGfUkq3+33lsgZmOlqGZvdLg5dM
         pi3vr7Naqnelm+NeU9LAxsKAv3O8omEvBsR/tSZWP5dOxRoti6d79abOZwPzKYb1aDfl
         0EMtEa6LSM4FUQTBvP9gSkbAqhwkhMdYW2vwBlea2inNoW/hhGwUNJ8w3INzCWfJjXT6
         vXdA==
In-Reply-To: <n0b6ql$6t4$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Georgios Tsalikis <georgios@tsalikis.net>, reiserfs-devel@vger.kernel.org


--=-/vbZzav74plb+vBI0bw5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-10-22 at 20:38 +0300, Georgios Tsalikis wrote:
> The filesystem is 1.7GB large, lies in a GPT patition and is formated
> with -o node=3Dnode41 without any other override. The kernel is 4.2.3
> with=20
> the 4.2.2 patch.
> I tried the same on a 250MB partition and it mounts instantly. dmesg=20
> shows nothing special
> Any ideas? Thanks in advance. :)

Hello,

try "dont_load_bitmap" in mount options. However, this is anyway very
strange for a ~2GB partition...

>=20
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-
> devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at=C2=A0=C2=A0http://vger.kernel.org/majordomo-info.h=
tml
--=20
Ivan Shapovalov / intelfx /


--=-/vbZzav74plb+vBI0bw5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlYqqKgACgkQxUKljSIMAnDQgQEA1luGdx2bPGL0stBLh6XKQ6fL
AsEBK5ivKPAStWOGZB0A/jun/DZzBxXjeIirlXd8peZ+Gw6V3vwcElW41MAstecd
=/xQL
-----END PGP SIGNATURE-----

--=-/vbZzav74plb+vBI0bw5--

