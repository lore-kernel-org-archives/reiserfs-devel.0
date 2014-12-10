From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv2 0/3] reiser4: space grabbing fixes.
Date: Wed, 10 Dec 2014 15:27:05 +0300
Message-ID: <5497656.EllimmOa76@intelfx-laptop>
References: <1414048685-4224-1-git-send-email-intelfx100@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4908017.e4grhyFuNX"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=SA3KSFxMCQE1ACRluG7Lu1AU7rlXpw9V1BSIboYFSlQ=;
        b=e9jQ8D/cuxFJSS5w6O3jeHaj0H2YUCZ6/1pjVlcazG1NJ5gwmL/vEiY1zcV/GW0cGL
         vuPk/aMrQI3DmVdjKYlwFs3ebFUNhBkCwWIrh9h1Ai2IZzrtpHOyG4ke80Av0Tijo9B0
         8HbiwE1rb5R+TeYkgExHv1ek/cZyKdds37sDrnLtrP/mFL57+AMQ0/yWGXNUQNTKGS3y
         aM5CP33pfFW+GhtB16wg+zu3N7f9UdP6wY+ar4eT24TrpBIyVzL90yqOtW63bknlzng4
         OKBhajazxrSR1ziVll3vipRupdpFbT+csg4Yhhpm/pqJD89vEyRtHmNF4rFA2PgKx7yN
         RDGA==
In-Reply-To: <1414048685-4224-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart4908017.e4grhyFuNX
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 October 2014 at 11:18:02, Ivan Shapovalov wrote:=09
> These are mostly equivalent transformations (aside from the first pat=
ch)
> I've done when I was experimenting with rwsems at zero-th iteration o=
f
> batch discard support.
>=20
> v2: - disable grab in current context unconditionally, not only if !B=
A_FORCE
>=20
> Ivan Shapovalov (3):
>   reiser4: block_alloc: improve error handling in reiser4_grab_reserv=
ed().
>   reiser4: block_alloc: sanitize grab_enabled modifications.
>   reiser4: do not mess with grab_enabled; instead, use BA_FORCE.
>=20
>  fs/reiser4/block_alloc.c                 | 57 +++++++++++++++++-----=
=2D---------
>  fs/reiser4/plugin/file/file.c            | 12 +++----
>  fs/reiser4/plugin/file/file_conversion.c |  3 +-
>  fs/reiser4/plugin/file/tail_conversion.c | 11 +++---
>  fs/reiser4/plugin/item/extent_file_ops.c |  3 +-
>  fs/reiser4/plugin/item/tail.c            |  3 +-
>  fs/reiser4/safe_link.c                   |  4 +--
>  7 files changed, 44 insertions(+), 49 deletions(-)

ping, what's the status?

/*
I'll send another round of discard patches shortly... That is, once I f=
igure
out how to explain in comments the sheer amount of happily coinciding s=
ubtle
details, whose coincidence makes everything actually work. :/

BTW, could you please check that I've rebased your "precise discard" pa=
tch
correctly?
https://github.com/intelfx/linux/commit/47f27446d5ae7b796a842735811c48c=
c07615dd6
*/

=2D-=20
Ivan Shapovalov / intelfx /
--nextPart4908017.e4grhyFuNX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlSIPBkACgkQxUKljSIMAnDvfQEA0PLE3GQiYglh3g2dawTc2uXU
IDB/r/4uuTSK5tg/5dYBAO9LCbQXFjR6GZ7UvzCbmyh9a28m5NkCNhLh+LLisI4g
=vnIH
-----END PGP SIGNATURE-----

--nextPart4908017.e4grhyFuNX--

