From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Fri, 09 Oct 2015 16:50:42 +0300
Message-ID: <1444398642.6030.3.camel@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
	 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
	 <5617C0C1.6060806@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-17X1a3HPBEVIyQ2P520z"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=pFkyv1zI1M4MLk3yO6uZumsFYJ1g1mN4W7FpNS50yhw=;
        b=wJ8oniJbbcC2eMedpBeoJYmFJIowtcAkDThF3jArBBg07A4yJGTD2lSgmyw8HRs3LC
         2J0Bl/Q/C/j6DdGNcrl+C2OJ7VlwRnZcsxGmYUrLWhfudQVVvMGDCp4mNnI0B1+FbXUa
         dVILW4kxd+ngnXlqYpTHywneKA9/XyZwhXp4XyXn2ZtnkWsyRtbao/ZpMoT1Rwxgle/Y
         hq6T1+fzsUYqrwsGBMx/+5M2XF/ZE/8YZIoolO4ZLlOaw71/zsVfeq+3EeqEj5L+BBHT
         mblJl4A4jCba6Qwerv/4UPTR4RR5S98YTf3623NzRrj6Onqp9C7zJgHyZGJWaLYn4lvZ
         CVgw==
In-Reply-To: <5617C0C1.6060806@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org
Cc: Oleg Drokin <green@linuxhacker.ru>


--=-17X1a3HPBEVIyQ2P520z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-10-09 at 15:27 +0200, Edward Shishkin wrote:
> Hi Ivan,
>=20
> On 10/09/2015 01:16 PM, Ivan Shapovalov wrote:
> > Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists.sourcef
> > orge.net/msg02745.html
>=20
> Do you have a stack trace for reiser4?
> How to reproduce it?

I'll rebuild the kernel without the fix and provide you with the oops'
stacktrace asap.

I guess that it's tied to the config. In my case, it is reproducible on
each boot, just as the DE starts up and something issues the first
fsync().

>=20
> >=20
> > Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
> > ---
> >=20
> > Lustre seemed to encounter the same oops and fixed it in a
> > different way, removing
> > set_page_writeback() altogether:
> > https://lkml.org/lkml/2015/7/30/806
> >=20
> > We cannot just remove the call to set_page_writeback() at least
> > because later
> > we wait on PG_Writeback flag of that page (in jwait_io())... What
> > is meant by
> > "synchronous write" in that Lustre patch? Is our write
> > "synchronous" in the
> > same sense?
>=20
>=20
> Nop.
> This is a generic function, it doesn't differentiate the writes.

Well, that lustre vvp_page_prep_write() is generic as well, and that
patch adds a conditional to differentiate sync/async writes. What is
meant by "sync" in that context? sync =3D=3D page is locked until I/O ends?
Or something else?

--=20
Ivan Shapovalov / intelfx /

> > =C2=A0 I don't know VFS well. Cc'ing Oleg.
> >=20
> > =C2=A0 fs/reiser4/wander.c | 2 ++
> > =C2=A0 1 file changed, 2 insertions(+)
> >=20
> > diff --git a/fs/reiser4/wander.c b/fs/reiser4/wander.c
> > index ce20d50..0e2c105 100644
> > --- a/fs/reiser4/wander.c
> > +++ b/fs/reiser4/wander.c
> > @@ -782,7 +782,9 @@ static int write_jnodes_to_disk_extent(
> > =C2=A0=C2=A0					node_plugin_by_node(JZNOD
> > E(cur))->csum(JZNODE(cur), 0);
> > =C2=A0=C2=A0				zrelse(JZNODE(cur));
> > =C2=A0=C2=A0			}
> > +
> > =C2=A0=C2=A0			ClearPageError(pg);
> > +			set_page_dirty_notag(pg);
> > =C2=A0=C2=A0			set_page_writeback(pg);
> > =C2=A0=20
> > =C2=A0=C2=A0			if (get_current_context()->entd) {
>=20



--=-17X1a3HPBEVIyQ2P520z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlYXxjIACgkQxUKljSIMAnADsQD9Gg3mLRrnpqnXzk76F8qKslDu
Cvjvkxvx+rSMJk3uKzsBAMVYbt7VNmhCvQeFV6T6c92VuQNd4f6VFPmvxOD0c2Lt
=+1bP
-----END PGP SIGNATURE-----

--=-17X1a3HPBEVIyQ2P520z--

