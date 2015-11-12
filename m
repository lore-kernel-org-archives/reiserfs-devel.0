From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCHv2 3/3] reiser4: mark pages created during tail2extent
 conversion as dirty.
Date: Thu, 12 Nov 2015 14:31:30 +0300
Message-ID: <1447327890.926.5.camel@gmail.com>
References: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
	 <1445727740-12361-4-git-send-email-intelfx100@gmail.com>
	 <56408F30.3060404@gmail.com> <564318AD.4080503@gmail.com>
	 <56446331.2090106@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-s2eYIT3VrbxAidlM6krX"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:in-reply-to:references:content-type
         :mime-version;
        bh=6GPtc1pEZbIeYuaIhSqHAYSt7znJhNygS8YjSMZ3tTo=;
        b=B6xbPzpsTsgwuR4pl7SMERafnC6Pxp2od4rw7m3svFS1mSWLzRQm+g0/l8IeiO9hTD
         qkGv/lDdvivnQbCicX3AB5HGoB7LraZeOmKq1wRdKSXRF6sTVeH41UfSmOZXnlecWDsZ
         5Y6uz6KoL+dE+YYJ/DraMtpzPBY4qS5Sm0RirxyeiXbNqYHvt8FINO//2VeJYBJ68hta
         ncP4Z7kacc/lBWuF7DmAsxlJmmYgmgaRSePs9qENO03z584lMVuO/z8RVpUnhgsNCkkf
         sxgoAQYXquHHPXxS1jk7m8WCycP0gKhJOCszpqjwlWGIadiQJdKtHkoR+1ebFSoLTWd3
         VmUw==
In-Reply-To: <56446331.2090106@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org


--=-s2eYIT3VrbxAidlM6krX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-11-12 at 11:00 +0100, Edward Shishkin wrote:
> On 11/11/2015 11:30 AM, Edward Shishkin wrote:
> >=20
> >=20
> > On 11/09/2015 01:18 PM, Edward Shishkin wrote:
> > > On 10/25/2015 01:02 AM, Ivan Shapovalov wrote:
> > > > This is responsible for an oops in v4.2 in
> > > > write_jnodes_to_disk_extent() -> set_page_writeback().
> >=20
> >=20
> > As to me, this patch doesn't prevent the oops,
> > so someone else forgets to set pages dirty...
>=20
>=20
> False alarm: I applied to the old stuff..
> Everything woks without the hack in
> write_jnodes_to_disk_extent().
> Good work! Merged to reiser4-for-4.2.3.

Hi Edward,

Glad to hear that. I was already halfway recovering my debug patches
for collecting stacktraces and related information and was going to ask
you to reproduce :)

> > > > The pages needs to be marked dirty before marked writeback.
> > > >=20
> > > > =C2=A0From a similar problem in f2fs:
> > > > "The cgroup attaches inode->i_wb via mark_inode_dirty and when
> > > > set_page_writeback is called, __inc_wb_stat() updates i_wb's
> > > > stat.
> > > >=20
> > > > So, we need to explicitly call set_page_dirty-
> > > > >__mark_inode_dirty in
> > > > prior to any writebacking pages."
> > > >=20
> > > > Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> > > > ---
> > > > =C2=A0 fs/reiser4/plugin/file/tail_conversion.c | 1 +
> > > > =C2=A0 1 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/fs/reiser4/plugin/file/tail_conversion.c=20
> > > > b/fs/reiser4/plugin/file/tail_conversion.c
> > > > index 7542c03..c856b73 100644
> > > > --- a/fs/reiser4/plugin/file/tail_conversion.c
> > > > +++ b/fs/reiser4/plugin/file/tail_conversion.c
> > > > @@ -175,6 +175,7 @@ static int replace(struct inode *inode,
> > > > struct=20
> > > > page **pages, unsigned nr_pages,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i_mapping));
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (res=
ult)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0break;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0set_page_dirty_not=
ag(pages[i]);
> > >=20
> > >=20
> > > So, at this point the page is dirty but not uptodate.
> > > I am confused with this. Why not to set the page
> > > uptodate right before setting it dirty? At this point
> > > everything has been copied already, so the page is
> > > in fact uptodate. Could you please try this?

Have you made this correction in the merged patch?
Anyway, could you
please explain why it should be done one way and not another? What will
happen if the ordering is left as is?

Is it about marking page uptodate _before unlocking_, so that no one will s=
ee it dirty && !uptodate?

Thanks,
--=20
Ivan Shapovalov / intelfx /

> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unlock_=
page(pages[i]);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0result =
=3D find_or_create_extent(pages[i]);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (res=
ult) {
--=-s2eYIT3VrbxAidlM6krX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlZEeJIACgkQxUKljSIMAnAtVwD5ARIVyu6SP2aHbmb1k57Uj+8d
mtwEWWd4fwSsGOFzGOgBAKhTlrNALO4rK6WDW4yM4xhlfNQ/hGOoJcTyhaiH2wXB
=4Apb
-----END PGP SIGNATURE-----

--=-s2eYIT3VrbxAidlM6krX--

