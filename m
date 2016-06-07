From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiserfsprogs v3.6.25
Date: Tue, 7 Jun 2016 10:28:44 -0400
Message-ID: <4eaa5319-4456-7dd0-259a-21251ad432ee@suse.com>
References: <42434805-7b9f-bde1-e882-998f9f62676e@suse.com>
 <1465308038.1718.2.camel@z-51.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="59huCMHeJg3rk7jg1xgGc06gLD9JWlhJp"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1465308038.1718.2.camel@z-51.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Felix Zielcke <fzielcke@z-51.de>, reiserfs-devel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--59huCMHeJg3rk7jg1xgGc06gLD9JWlhJp
Content-Type: multipart/mixed; boundary="5WmBReaRlNlqNfVNJvPBguhX5wkODercG"
From: Jeff Mahoney <jeffm@suse.com>
To: Felix Zielcke <fzielcke@z-51.de>, reiserfs-devel@vger.kernel.org
Message-ID: <4eaa5319-4456-7dd0-259a-21251ad432ee@suse.com>
Subject: Re: reiserfsprogs v3.6.25
References: <42434805-7b9f-bde1-e882-998f9f62676e@suse.com>
 <1465308038.1718.2.camel@z-51.de>
In-Reply-To: <1465308038.1718.2.camel@z-51.de>

--5WmBReaRlNlqNfVNJvPBguhX5wkODercG
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 6/7/16 10:00 AM, Felix Zielcke wrote:
> Am Montag, den 06.06.2016, 14:23 -0400 schrieb Jeff Mahoney:
>> Hello all -
>>
>> I've just released reiserfsprogs v3.6.25, which contains a rollup of
>> the commits that have accumulated since the last release.  The
>> biggest
>> change is that libreiserfscore can now be used as a shared library
>> for
>> use with other projects (e.g. btrfs-convert).
>>
>> It is available now at:
>> https://www.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v3
>> .6.25/
>=20
> Hi Jeff,
>=20
> I get a compile error. com_err.h is missing:
>=20
> In file included from parse_time.c:8:0:
> ../include/reiserfs_lib.h:14:21: fatal error: com_err.h: Datei oder Ver=
zeichnis nicht gefunden
> compilation terminated.

You're missing the libcom_err-devel package.  The configure script would
have issued a warning but it should probably issue an error instead.
I'll commit a patch for that.

Thanks,

-Jeff

--=20
Jeff Mahoney
SUSE Labs


--5WmBReaRlNlqNfVNJvPBguhX5wkODercG--

--59huCMHeJg3rk7jg1xgGc06gLD9JWlhJp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJXVtoiAAoJEB57S2MheeWyqvsP/jAoLxbco60+PWHUYfCfQ5bs
SZxBcxe0xcf/nflO6tKiQ/+mLmExROKeBKW2KWTf6nW1PAN6kydkTzLWz3IHoMgS
jDXq0jJuFCsdpJavnU9rbA2Y3t7JAG+UAZcnmOQsA1pK9pbWjAxW7Yr/dzV0gt3i
M4utBnnWx2LSxVPhgimqxw2Sw5jREgjjEeMQfyzA5cKc7npTwrp6aiXyZMyNoYzd
HhFaeRctuQ9KAT8f0y1Kp0Sn+OtQsg1g1tnOf7PBIk3UrGfosGnd2E/BXSw1lwx/
kqGr/5DhW8c8Nwxf1QIuLHB3btoUZKzw5pAPfX6Mg8mGXWPd+3xvDi7WYOWtlW8p
SObLTlJw1KnxR7S+r5Y3fiqXygkTFqYXfTHnnwbFJc1/lw/XqMuScpNzEZAAhv9O
YJYbLnlVBcyC+YszmDRYjLsidkxKg68QesrewcuPZQQwa5pARfSCHtdgqsv5F8hv
2pmZr8xn5O8AlSeTZe27Mo18SS5dJU4ea2EPxHw9l0PbpKzRI7b+qPXx/q7sSfR6
ymgC+vu1txw9+K/npmHI1bucgr8aUcOYcdGPMER4mlk/9e0GU5LvAznjclPfbTdd
fdGH7KPk8vAmza4+wJ2Y4rgUH/FaIeKV08UA9x/YlbZQ4szJxfvbNmH45DO85gG4
GyKTFdZjMWWWWg31fJBA
=Zu/Z
-----END PGP SIGNATURE-----

--59huCMHeJg3rk7jg1xgGc06gLD9JWlhJp--
