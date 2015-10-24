From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty
 before marking them writeback.
Date: Sat, 24 Oct 2015 10:17:48 +0300
Message-ID: <1445671068.15896.3.camel@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
	 <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
	 <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com>
	 <5617D55D.2040908@gmail.com> <1444410842.2213.5.camel@gmail.com>
	 <56182257.7060304@gmail.com> <1444473863.4257.10.camel@gmail.com>
	 <561B7857.1030000@gmail.com> <1444817147.5346.10.camel@gmail.com>
	 <1444820148.4077.1.camel@gmail.com> <1444849590.13210.3.camel@gmail.com>
	 <561FE051.3000104@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-I8olGZbPWnFMpL6r18ER"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version;
        bh=K1H5VO3eJnBprjQksoc8jORT5aiz0FE0drEf6bRNQVw=;
        b=BVgRbhCxTMUw0H1ztGyyWsm8/CC24uaV/ap1lJwVsy9W6oc8I3yNtNX4260iQA6OPV
         MrAjz0MT/DWEoL/8Q5/Sd/WRS7IwMbls7qS6i5iyqDyhedAmcB/JxJEtG+I6PIpOva2w
         8SYGTxIVuBRvkLSRgW1SgrCQHko/xtRvsl/9nSNMHFRI6Nv+dB/FI9GkHVd44TPntFgT
         mlJT6C3oI024drWz6cLJ9W27mpV0/g7TRcWwDYodwpanLe9z+19JRtKcLAeMdjMcal7Z
         eiRNWej+qXLYA9CKFgyT0Qle+eo7jm5Cl0nylMYYmlZdDx9QyfYqRm05q0eg5MnfetXH
         3Dtg==
In-Reply-To: <561FE051.3000104@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Oleg Drokin <green@linuxhacker.ru>, reiserfs-devel@vger.kernel.org


--=-I8olGZbPWnFMpL6r18ER
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-10-15 at 19:20 +0200, Edward Shishkin wrote:
> Hello,
>=20
> So the tail conversion is the culprit?
> It's quite realistic...
> I am currently on vacations,
> I'll take a look at this at the end of October
> more carefully.
>=20
> Thanks!
> Edward.

I've done a bit more testing, and the encountered panic at unmount does
not depend on my proposed fix. Hence I'll resend the initial patchset.

--=20
Ivan Shapovalov / intelfx /

>=20
>=20
>=20
> On 10/14/2015 09:06 PM, Ivan Shapovalov wrote:
> > On 2015-10-14 at 13:55 +0300, Ivan Shapovalov wrote:
> > > On 2015-10-14 at 13:05 +0300, Ivan Shapovalov wrote:
> > > > On 2015-10-12 at 11:07 +0200, Edward Shishkin wrote:
> > > > > [...]
> > > > So, I've added three non-fatal checks right before
> > > > set_page_writeback():
> > > > - PageDirty(pg)
> > > > - JF_ISSET(cur, JNODE_DIRTY)
> > > > - pg->mapping->host->i_wb !=3D NULL
> > > >=20
> > > > In almost all times when either of the checks is triggered,
> > > > the first two checks are triggered at once (i. e. neither page
> > > > nor
> > > > jnode is dirty, but i_wb is not NULL). This happens with both
> > > > formatted
> > > > nodes (jnode_is_znode), unformatted nodes
> > > > (jnode_is_unformatted)
> > > > and
> > > > other nodes.
> > > >=20
> > > > And, finally, there are very few warnings where jnode _is_
> > > > dirty,
> > > > but
> > > > the page _isn't_. On the first such warning i_wb is also NULL.
> > > > And,
> > > > just as you've suspected, this happens with an unformatted
> > > > node.
> > > >=20
> > > > I'll try to add a backtrace buffer into struct jnode and
> > > > generate a
> > > > backtrace there on each jnode dirtying attempt... and then
> > > > print it
> > > > for
> > > > the problematic jnode.
> > > >=20
> > > So, here it is. On all occurrences the backtrace is the same.
> > >=20
> > > [...]
> >=20
> > Hmm. This obvious fix "works",=C2=A0=C2=A0but causes an assertion on ro=
otfs
> > unmount:
> >=20
> > "list_empty(&get_super_private(super)->all_jnodes)" in
> > init_super.c:55 (no maintainer-id).
> >=20
> > Why?
> >=20
> > ---
> > =C2=A0 fs/reiser4/plugin/file/tail_conversion.c | 1 +
> > =C2=A0 1 file changed, 1 insertion(+)
> >=20
> > diff --git a/fs/reiser4/plugin/file/tail_conversion.c
> > b/fs/reiser4/plugin/file/tail_conversion.c
> > index 6ffa900..3b4e77d 100644
> > --- a/fs/reiser4/plugin/file/tail_conversion.c
> > +++ b/fs/reiser4/plugin/file/tail_conversion.c
> > @@ -175,6 +175,7 @@ static int replace(struct inode *inode, struct
> > page **pages, unsigned nr_pages,
> > =C2=A0=C2=A0								i
> > _mapping));
> > =C2=A0=C2=A0		if (result)
> > =C2=A0=C2=A0			break;
> > +		set_page_dirty_notag(pages[i]);
> > =C2=A0=C2=A0		unlock_page(pages[i]);
> > =C2=A0=C2=A0		result =3D find_or_create_extent(pages[i]);
> > =C2=A0=C2=A0		if (result) {
>=20



--=-I8olGZbPWnFMpL6r18ER
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlYrMJwACgkQxUKljSIMAnAz8gEArBs0KEFT5gjDAIzVzKXVFfH1
snVKlg0A3B99DrczM0MA/1jnr1AdDzyJc9XGOp0Zru1eZjAU/V9WYr5QxqXjAe+/
=nAD2
-----END PGP SIGNATURE-----

--=-I8olGZbPWnFMpL6r18ER--

