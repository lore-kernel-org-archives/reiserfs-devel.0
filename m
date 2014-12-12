From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv2 0/3] reiser4: space grabbing fixes.
Date: Sat, 13 Dec 2014 01:19:01 +0300
Message-ID: <2158963.qP6uLQDbWK@intelfx-laptop>
References: <1414048685-4224-1-git-send-email-intelfx100@gmail.com> <2450127.6MNmFpgyTD@intelfx-laptop> <5488C06D.4070401@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart10930507.lVPV3XH5FE"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=rFKSLLnL3jFrKIER2xr75A6djhDiFOxQJhp4Zsm2QgQ=;
        b=soo5j1vu+yeps5423cdn9glgst3At8sOIEyH7S84KRnGxDKsH+NZNpWpJDFdGn0yK+
         dNbarsLjkLfgQvaBGoNu4CoIaBnEBCschUZatmewNcju8EHnqHzDYY22f5z/AYcHh2eA
         pz78oCD+iSmx/pTo/YHEWOvxX+1n/D71bl9x72lEj7MIebp/WwtF4BBzHeL2UzXB2JLQ
         tVJXGPCJ2yrw30I0WtDw1UhNyyhLft6tTQx3alb2wxtEks0AsivupW7/6VToyyFTkxlM
         BU7qxNeJU3aY4CqINIEDK1gdgaETAughtmxi2k29KeSUjHOEgDth/wW42UOdL0uGTMve
         kAww==
In-Reply-To: <5488C06D.4070401@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart10930507.lVPV3XH5FE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Wednesday 10 December 2014 at 22:51:41, Edward Shishkin wrote:=09
>=20
> On 12/10/2014 02:30 PM, Ivan Shapovalov wrote:
> > On Wednesday 10 December 2014 at 13:52:08, Edward Shishkin wrote:=09=

> >> On 12/10/2014 01:27 PM, Ivan Shapovalov wrote:
> >>> [...]
> >>> ping, what's the status?
> >>
> >> This is in "upstream" already.
> > Hm.. I didn't see it..
> >
> > Well, then a follow-up fix should be applied, as described in one o=
f previous
> > messages, or this should be reverted.
>=20
>=20
> With that patch things looked better and you promised
> "equivalent transform". OK, I'll roll it back then.

Yes, that was a mistake. It's actually not an equivalent transformation=
.
And I need to think what to do with this, because current code looks me=
ssy,
but things are apparently so fragile...

Are there any documentation on the "space grabbing" subsystem? For exam=
ple,
there's some flush code which grabs reserved space _without_ taking the=
 mutex..

Thanks,
=2D-
Ivan Shapovalov / intelfx /
--nextPart10930507.lVPV3XH5FE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlSLadUACgkQxUKljSIMAnDROgEA6/gVoA+Z9TKqjiu1kUOu5M4Q
66GAfETxLFr9URKqzIcA/RrNONv0KTL23R9EXh+PTZGPLSIbJ6y7/flAvofiGBUl
=vWWr
-----END PGP SIGNATURE-----

--nextPart10930507.lVPV3XH5FE--

