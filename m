From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: [PATCH] Adjust reiser4 for 3.15: replace
 truncate_inode_pages(..., 0) with truncate_inode_pages_final(...).
Date: Mon, 03 Oct 2016 17:40:46 +0300
Message-ID: <1475505646.3029.13.camel@intelfx.name>
References: <20160930063629.13794-1-intelfx@intelfx.name>
                 <20160930064332.19365-1-intelfx@intelfx.name>
         <1475218025.19471.1.camel@intelfx.name> <57F26B32.7040807@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-FTdDn0dntr1CKgY5Fbmz"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=WlZnqq07FbqRe+6z0z3T0+7UcgD2W82wvaybiek0PK8=;
        b=PxI1T1i1+7dIfyT4qMtNOxM8ck24k/YQottvi6OU3HIVqOj+UXS89Y0lib+cMl6P/L
         zrPGhgWFQd2tolNadDbCEr7swmwXrHWmzaYdBAS1LtNpA7jjArSGjh6/e0N6wvCiNC4o
         y4Mzik1g+VOwj0hGtsKJgbRIwpnAQBOzj5C9E=
In-Reply-To: <57F26B32.7040807@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org


--=-FTdDn0dntr1CKgY5Fbmz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2016-10-03 at 16:29 +0200, Edward Shishkin wrote:
> On 09/30/2016 08:47 AM, Ivan Shapovalov wrote:
> > On 2016-09-30 at 09:43 +0300, Ivan Shapovalov wrote:
> > > Upstream commit 91b0abe36a7b2b3b02d7500925a5f8455334f0e5
> > > "mm + fs: store shadow entries in page cache".
> > >=20
> > > Moreover, the truncate_inode_pages(..., 0) in
> > > delete_object_cryptcompress()
> > > is not needed at all.
> > >=20
> > > Signed-off-by: Ivan Shapovalov <intelfx@intelfx.name>
> > > ---
> > > =C2=A0 plugin/file/cryptcompress.c | 2 --
> > > =C2=A0 super_ops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2 +-
> > > =C2=A0 2 files changed, 1 insertion(+), 3 deletions(-)
> > >=20
> > > diff --git a/plugin/file/cryptcompress.c
> > > b/plugin/file/cryptcompress.c
> > > index 59d8df8..5433de9 100644
> > > --- a/plugin/file/cryptcompress.c
> > > +++ b/plugin/file/cryptcompress.c
> > > @@ -3595,8 +3595,6 @@ int delete_object_cryptcompress(struct
> > > inode
> > > *inode)
> > > =C2=A0=C2=A0			(unsigned long
> > > long)get_inode_oid(inode),
> > > =C2=A0=C2=A0			result);
> > > =C2=A0=C2=A0	}
> > > -	truncate_inode_pages(inode->i_mapping, 0);
> > > -	assert("edward-1487", pages_truncate_ok(inode, 0));
> > > =C2=A0=C2=A0	/* and remove stat data */
> > > =C2=A0=C2=A0	return reiser4_delete_object_common(inode);
> > > =C2=A0 }
> > > diff --git a/super_ops.c b/super_ops.c
> > > index 73c18f2..697580c 100644
> > > --- a/super_ops.c
> > > +++ b/super_ops.c
> > > @@ -215,7 +215,7 @@ static void reiser4_evict_inode(struct inode
> > > *inode)
> > > =C2=A0=C2=A0			fplug->delete_object(inode);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0
> > > -	truncate_inode_pages(&inode->i_data, 0);
> > > +	truncate_inode_pages_final(&inode->i_data);
> > > =C2=A0=C2=A0	inode->i_blocks =3D 0;
> > > =C2=A0=C2=A0	clear_inode(inode);
> > > =C2=A0=C2=A0	reiser4_exit_context(ctx);
> >=20
> > BTW, this raises a question: in the ->evict_inode path, are we ever
> > allowed to call plain truncate_inode_pages() (i. e. not *_final())?
>=20
> Actually, I would like to see a kind of assertion 1487 instead:
> everything should be already truncated at that point.

Do you mean that the assertion should go instead of
truncate_inode_pages_final()? Doesn't that function contain extra
logic, beyond removing pages?

Moreover, that function seems to contain extra logic _before_ actually
going off and truncating pages. This makes me wonder: doesn't this mean
that we _must not ever_ call regular truncate_inode_pages() from
inside=C2=A0->evict_inode()?

I do not know VFS enough to answer these kinds of stupid questions...

>=20
> >=20
> > The ->delete_object plugin methods do this as part of their logic,
> > actually. At least the cryptcompress plugin calls
> > truncate_inode_pages(..., new_size) at the end of
> > prune_cryptcompress(), however I suspect that the regular file
> > plugin
> > also does this deep inside reiser4's guts.
>=20
> File body is truncated item-by-item from right to left. For each item
> its ->kill_hook() method is called. It is responsible for truncating
> attached pages. Bodies of cryptcompress files are not connected:
> there can be pages without "parent" items (in the case of holes), so
> in addition we call truncate_inode_pages() in prune_cryptcompress()
> to kill those pages.
>=20
Understood. Thanks for explanation!
(the above question is still in effect...)

--=C2=A0
Ivan Shapovalov / intelfx /

--=-FTdDn0dntr1CKgY5Fbmz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJX8m3uAAoJEHveF8jk4w6dZ38P/jaVIeTYl0Wg7fvSeLM22VxI
DW1JFxJocPibHz6OahMJeMB+83KocmJlWwQqvMI6o+9PkmSiuRsxNo/i+0o271EB
l+ufaFyOZwqKt5oL5el/jPIAljdCxoZdosQKMhKoilUqzvcp4tdGKhuIGrDTwwTa
uC0IMrcIKRxw3h2D3ikgtzZS2/+rkVu32XmE8CFJFgG2idC5OkpBVN74/261yH+C
DXgnN8Afo7Jos6a2iIIjd18uw2z0FnJVOuQRO1sRPY9msTHVujmN3DimBMSQSGNm
neFwhDPAYaj2mmOqYDFqjrzzYN0wAlHwGCNXU5Tz+87oVZq5yKCqyMM0vKagPC7R
njJY/FFt5e0Z9ueGPbKddFxf2NzCfxmWCV9BJ0j13XqUW+OzTdEyCCnYrI2L4k8m
l0SNqq6L9oLUW+1w0l3hVNLNcYiqSohFpwwh2vB9h/3lg6s4MPgwCtSZO6h3xJNA
OO0irJDEEj88bRSGJDwBK6+lCKcZbIb5/IFLzzIKunAHnN2nnaVi2DAsn2uungwA
AaOLCtPBky0oenaAp7NklpRUzBnTeHZy3H4B64WwJ7dj1z6Bo08V6B/Y+z0AyUwD
WDWKxu5XMm79XrvKwNBBibo7W9FnlP3oy0MNVcLdMBwWY/Fn0fPjheVUeQCsHKHm
dxAFrTWbU31Mg2LLz9pg
=v1DU
-----END PGP SIGNATURE-----

--=-FTdDn0dntr1CKgY5Fbmz--

