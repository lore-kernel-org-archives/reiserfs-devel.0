From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv2 0/3] reiser4: space grabbing fixes.
Date: Thu, 23 Oct 2014 11:20:02 +0400
Message-ID: <26188958.9NUTjoysPU@intelfx-laptop>
References: <1414048685-4224-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11315260.GSM5x99xW5"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:user-agent:in-reply-to:references
         :mime-version:content-type;
        bh=Ln6gcPkDWfgKhvgl8vN0+2+rDs8gLB9qAHEUKS0dH90=;
        b=G7JSHznHszTG1NjJ5wZ2zuKbzgv0ytPkfmFj7csFmHwxVEziUkJv84uP8/5qRQscOd
         fpaIOEcLoLhSqqg7Y+EKqSnpf/Qnu/7AMG6bA1ZKGni7SD9EZSaI5ZTxuF3HUy22waQf
         imkHgjiX+mata8b+P2+czZKPjsxd6a0Vrv0HcXHEhyJ3n9MJWzZEFZQx0cjjDezvRWYB
         M63QkZ4KtrUk3gisfh3+wN1T5Ph9i+4OgPbSesogL+ePbSCQYhOjiBisZ4IOYDjo1Et9
         +9oz8Ztq8i7ff7lbQmNB0GSelWm1w1xORPAKW+/LUXKAmYhPbu/lrnJApijLaX8yXva1
         3paA==
In-Reply-To: <1414048685-4224-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--nextPart11315260.GSM5x99xW5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 October 2014 at 11:18:02, Ivan Shapovalov wrote:=09
> [...]
>=20
> Ivan Shapovalov (3):
>   reiser4: block_alloc: improve error handling in reiser4_grab_reserv=
ed().
>   reiser4: block_alloc: sanitize grab_enabled modifications.
>   reiser4: do not mess with grab_enabled; instead, use BA_FORCE.
>=20
> [...]

This is a diff between v1 and v2, for ease of reviewing.

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index a30f7b9..9339de7 100644
=2D-- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -329,7 +329,7 @@ int reiser4_grab_space(__u64 count, reiser4_ba_flag=
s_t flags)
 =09=09}
 =09}
=20
=2D=09if (!(flags & BA_FORCE) && (ret =3D=3D 0)) {
+=09if (ret =3D=3D 0) {
 =09=09/* disable grab space in current context */
 =09=09ctx->grab_enabled =3D 0;
 =09}

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart11315260.GSM5x99xW5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlRIrCYACgkQxUKljSIMAnB5EwEAiQaIampzlYvx+wN//VaDtjVw
cCyrKDQB3xFfFVWpMd4A/2W5nL7I2uBVlMmtgtRn0CmxhvYX4WJZajVlAD0VcaIE
=z/8J
-----END PGP SIGNATURE-----

--nextPart11315260.GSM5x99xW5--

