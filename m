From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: [PATCH] Adjust reiser4 for 3.15: replace
 truncate_inode_pages(..., 0) with truncate_inode_pages_final(...).
Date: Mon, 03 Oct 2016 22:45:31 +0300
Message-ID: <1475523931.3029.17.camel@intelfx.name>
References: <20160930063629.13794-1-intelfx@intelfx.name>
         <20160930064332.19365-1-intelfx@intelfx.name>
         <1475218025.19471.1.camel@intelfx.name> <57F26B32.7040807@gmail.com>
         <1475505646.3029.13.camel@intelfx.name>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-EVWbjeHjifqKPkDkwa77"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=rdruU5MpS1jj1rogT/nO+tcuV5qifCgtZ7ZUnCV28VM=;
        b=A3hCRgiPWbpXIa/rWu28dGxv+Y29iGYaTnoKrFGLR4KsSgiyL571yCVhk8opAMWAk2
         6XpkUsouTwhUXZGXIXdMZEO87gd6ZFKvoyTcy0B50a8lQlylcPRNZZVnYXDSwiTcnFNd
         Vy6KLQQX/+Z9Ps2U9go5vdM5nW13i3WQ2Cods=
In-Reply-To: <1475505646.3029.13.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org


--=-EVWbjeHjifqKPkDkwa77
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-10-03 at 17:40 +0300, Ivan Shapovalov wrote:
> On 2016-10-03 at 16:29 +0200, Edward Shishkin wrote:
> > On 09/30/2016 08:47 AM, Ivan Shapovalov wrote:
> > > On 2016-09-30 at 09:43 +0300, Ivan Shapovalov wrote:
> > > > [...]
> > >=20
> > > BTW, this raises a question: in the ->evict_inode path, are we
> > > ever
> > > allowed to call plain truncate_inode_pages() (i. e. not
> > > *_final())?
> >=20
> > Actually, I would like to see a kind of assertion 1487 instead:
> > everything should be already truncated at that point.
>=20
> Do you mean that the assertion should go instead of
> truncate_inode_pages_final()? Doesn't that function contain extra
> logic, beyond removing pages?
>=20
> Moreover, that function seems to contain extra logic _before_
> actually
> going off and truncating pages. This makes me wonder: doesn't this
> mean
> that we _must not ever_ call regular truncate_inode_pages() from
> inside=C2=A0->evict_inode()?
>=20
> I do not know VFS enough to answer these kinds of stupid questions...

Looks like the answer is "no, everything is OK". If ->evict_inode()
races with remove_mapping() and shadow entries are installed into the
radix tree, the *_final() call will still catch them. By association
this means that this call is still needed.

(However, now I wonder how does this work with regular truncate and
whether the radix tree can hold shadow entries for already truncated
pages during an inode's lifetime, but this is a purely VFS/mm
question.)

--=20
Ivan Shapovalov / intelfx /
--=-EVWbjeHjifqKPkDkwa77
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX8rVbAAoJEHveF8jk4w6dQ5wQALuGTjtlpuVwxBMmVhtbaThf
oGGWzULN4tbOFm/HfQeL7NumVTNBBpcffCZaS74mr2tRuoabCWsxvOsApS0aVap4
+GwxWCYpBk+/eqBBdaM+wsPM1X16tjrEqrmNFe2mpwX+B+k395HaubWLwE1CKo8Q
dn8RbUFl8TneazElqwlGMS5e7zDZZv4d8m8vhwZ8hWJsaSKb1dIjcVO4vY6kTDoz
B0oAy/Mb8sCnqYJEQ2miAtey7qFIxEQs+b11ljboVautkZ6xFQa/xzhiiG8sSPif
7Ov93/5CPNRSmEVu/j0SsILaYq5AG4g9GYfDTMDCEaxN7+Yur/9V0gLeh49YXMOh
nR62oTGLdpUBDx9ejWIcdPv/OZCYh+34g983YVO7zxBHufQpmPFvBHnV/qko/cEu
Y+SYWG0yAvTs1dcjUm9ShUof/E/ywXfgDpQR3wMvvV+BDb2gmI3XIrG+5cdUwhbn
t1uMxCVf8xA3fBUbApVA+Gi/X8vEz7sxXHZOfBsfyg4XVbcpGfo288z5ZbxXHr1z
fVNSSHy9UauQb3GQKFYD9p+MQvO70hN4lbv4ar3bhrtI7KvmFBeA+4q6jU0y6zQw
kDXbCr+SLwcYb1caiGDRUsyxaKduJk0geQzFtq51geukk9jaYO2tVgle1cYGeId9
wLuKEokNcCOvxjA6kCWj
=LSRg
-----END PGP SIGNATURE-----

--=-EVWbjeHjifqKPkDkwa77--

