From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH] reiser4: fix problem of non-deletable directories
Date: Sun, 28 Sep 2014 03:16:51 +0400
Message-ID: <3496060.ZNKtY66gHr@intelfx-laptop>
References: <5425C5FD.6020907@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2753521.SvqrG9jubf"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=GcDQwYF6Ldi0IzImHHNJqd5CqSxK9imLYPJ1fGhbLHQ=;
        b=DvpsWlaDIpTJwGAxC0EHI1q5EbkPKCgRM7VRK2XGGhkgrURnNoXAS3rn1qB1vPdYJ1
         6Ol6c43n4nNvaekGyS0h7u5otO31jf8L9ZNzFKsLHI6WZ7Xr0wGGD3bSZgah/I9vPxA5
         eEkbsh1KLzDB0lcrr8qxtWlf/xUt49OYu8obdZDRbfAaWn7ZQ76whbNEfnPmlseljZhF
         4NwaG2df0v+xicHuP0xITY5klBDnXxj6oZigbRZtTVj3skuOTgffC/Bx+1K1lJBVC7V8
         HDW6XdN9mQaiSooNBDvRcDBMvHmQKUL2OAM8LiDuAnC62WbbCyvOlxJUSCs8xAuzxd6x
         dmLQ==
In-Reply-To: <5425C5FD.6020907@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart2753521.SvqrG9jubf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Yeah, can also confirm that the problem is fixed for me.

Thank you!
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart2753521.SvqrG9jubf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlQnRWcACgkQxUKljSIMAnCS1gEAm5HXUX9+uk3hjtXSXplU8xnt
vbjk5IH5JHC3AUwgrA0BAOvZ+HjZ1LYQ0xnHSxvXQH7Cr3chGcynrU4ATAA5gwNi
=FE4G
-----END PGP SIGNATURE-----

--nextPart2753521.SvqrG9jubf--

