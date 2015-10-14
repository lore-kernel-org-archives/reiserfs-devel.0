From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Wed, 14 Oct 2015 22:06:30 +0300
Message-ID: <1444849590.13210.3.camel@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
	 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
	 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
	 <5617D55D.2040908@gmail.com> <1444410842.2213.5.camel@gmail.com>
	 <56182257.7060304@gmail.com> <1444473863.4257.10.camel@gmail.com>
	 <561B7857.1030000@gmail.com> <1444817147.5346.10.camel@gmail.com>
	 <1444820148.4077.1.camel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-6nL4MjQgAw6qsPQjA408"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=z1RofdzNDG/hniD0KUtRT2rMim1xxSkpMRTedcDZ+zg=;
        b=RrAdak/+HTp7ILHzhUsKKjkcnk7JFMdX0QfdReZ8pCVLtU1VYZsq5KfLWn8oRDU9Z2
         q1vmtwb79t0oNziIaJ5B66GJw+P/0zqiesVJ6OX4COiywwpsg13SqJBRHq+IYnRLSmm2
         KXw62QftuNB0gJ/EghcM2cQ8DrnH11HiGSEbe6aMQfXfvfKuXTAhK3D8+pzCuBYigakQ
         2DyVu2wWTUmge8K0NvaFzLyJAI4068vEgYGp/KZkGGJtmfQOG1LClujFnE6GV/TcJZRz
         K3oo6y7c8k0AnG6XZpsZwhlGgpxUmOnHENFXTsmNYK9Q5jBoFpQM7YlPt0dS/b3AiY1t
         Y6uQ==
In-Reply-To: <1444820148.4077.1.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Oleg Drokin <green@linuxhacker.ru>, reiserfs-devel@vger.kernel.org


--=-6nL4MjQgAw6qsPQjA408
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-10-14 at 13:55 +0300, Ivan Shapovalov wrote:
> On 2015-10-14 at 13:05 +0300, Ivan Shapovalov wrote:
> > On 2015-10-12 at 11:07 +0200, Edward Shishkin wrote:
> > > [...]
> >=20
> > So, I've added three non-fatal checks right before
> > set_page_writeback():
> > - PageDirty(pg)
> > - JF_ISSET(cur, JNODE_DIRTY)
> > - pg->mapping->host->i_wb !=3D NULL
> >=20
> > In almost all times when either of the checks is triggered,
> > the first two checks are triggered at once (i. e. neither page nor
> > jnode is dirty, but i_wb is not NULL). This happens with both
> > formatted
> > nodes (jnode_is_znode), unformatted nodes (jnode_is_unformatted)
> > and
> > other nodes.
> >=20
> > And, finally, there are very few warnings where jnode _is_ dirty,
> > but
> > the page _isn't_. On the first such warning i_wb is also NULL. And,
> > just as you've suspected, this happens with an unformatted node.
> >=20
> > I'll try to add a backtrace buffer into struct jnode and generate a
> > backtrace there on each jnode dirtying attempt... and then print it
> > for
> > the problematic jnode.
> >=20
>=20
> So, here it is. On all occurrences the backtrace is the same.
>
> [...]


Hmm. This obvious fix "works",  but causes an assertion on rootfs unmount:

"list_empty(&get_super_private(super)->all_jnodes)" in init_super.c:55 (no =
maintainer-id).

Why?

---
=C2=A0fs/reiser4/plugin/file/tail_conversion.c | 1 +
=C2=A01 file changed, 1 insertion(+)

diff --git a/fs/reiser4/plugin/file/tail_conversion.c b/fs/reiser4/plugin/f=
ile/tail_conversion.c
index 6ffa900..3b4e77d 100644
--- a/fs/reiser4/plugin/file/tail_conversion.c
+++ b/fs/reiser4/plugin/file/tail_conversion.c
@@ -175,6 +175,7 @@ static int replace(struct inode *inode, struct page **p=
ages, unsigned nr_pages,
=C2=A0								i_mapping));
=C2=A0		if (result)
=C2=A0			break;
+		set_page_dirty_notag(pages[i]);
=C2=A0		unlock_page(pages[i]);
=C2=A0		result =3D find_or_create_extent(pages[i]);
=C2=A0		if (result) {
--=20
2.6.1

--=20
Ivan Shapovalov / intelfx /


--=-6nL4MjQgAw6qsPQjA408
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlYep7YACgkQxUKljSIMAnCBhAEAqIHMEbySKg0BSjBqp+gucQIQ
xsOO0uq6DFPkoGmmUTMBAIDvldSD8CnVBkn/kvlWWsi3yN1iYDEs4UmxHGGLUa0r
=nxwU
-----END PGP SIGNATURE-----

--=-6nL4MjQgAw6qsPQjA408--

