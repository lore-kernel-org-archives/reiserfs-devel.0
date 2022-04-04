From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Is it time to remove reiserfs?
Date: Mon, 4 Apr 2022 12:58:28 +0200
Message-ID: <20220404105828.GA7162@duo.ucw.cz>
References: <YhIwUEpymVzmytdp@casper.infradead.org>
 <20220222100408.cyrdjsv5eun5pzij@quack3.lan>
 <20220402105454.GA16346@amd>
 <20220404085535.g2qr4s7itfunlrqb@quack3.lan>
 <20220404100732.GB1476@duo.ucw.cz>
 <20220404101802.GB8279@1wt.eu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220404101802.GB8279@1wt.eu>
List-ID: <reiserfs-devel.vger.kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Jan Kara <jack@suse.cz>, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > But I believe userbase is bigger than you think and it will not be
> > possible to remove reiserfs anytime soon.
>=20
> I was about to say the opposite until I noticed that one of my main
> dev machine has its kernel git dir on it because it's an old FS from
> a previous instance of this machine before an upgrade and it turns out
> that this FS still had lots of available space to store git trees
> :-/

:-).

> So maybe you're right and there are still a bit more than expected out
> there. However I really think that most users who still have one are in
> the same situation as I am, they're not aware of it. So aside big fat
> warnings at mount time (possibly with an extra delay), there's nothing
> that will make that situation change.
>=20
> At the very least disabling it by default in Kconfig and in distros
> should be effective. I really don't think that there are still users
> who regularly update their system and who have it on their rootfs, but
> still having data on it, yes, possibly. The earlier they're warned,
> the better.

I guess we should start by making sure that distributions don't use it
by default. Big fat warning + delay is a bit harsh for that, talking
to them should be enough at this point :-).

Someone start with Arch Linux ARM.
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYkrPVAAKCRAw5/Bqldv6
8g5wAKCDB3UaDOu3F7C3rsVOlJEEkyYU7wCgtmRSLlZxl4muNPrcFe98v6ML2GU=
=akzK
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
