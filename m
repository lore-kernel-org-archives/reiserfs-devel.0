From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Mon, 11 Aug 2014 13:39:12 +0400
Message-ID: <2275451.mu6kquuFD5@intelfx-laptop>
References: <3405506.BC0S4TX54B@intelfx-laptop> <1857998.1bln76ELaS@intelfx-laptop> <53E80077.2060300@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1610076.AIAaL630gj"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=seZJdmenN9a3yHbh3b44WVw8dDFDptL7u2Ucfc2RpFw=;
        b=GHUMSE2Ucrrw+o6Zv6OIPG8TIRsqySglsVcTbOmpQC7SQx8BDPO5yN1DM6toUkEpcW
         5MmsSSLO7v10D8B4wkfj6iuqHD+uuuAAGU/SZM7LqkTe1fWiubtoMBtxwbjUcPGLS9Oj
         eCXOcWitA2xILG6jpG9pTPrE4pPmZbdZSyEigSN0VYgFcPhaTpllKY5Cf1f4+wqMW5r9
         PBOPM69aiVafyy2OqDTu4owU5jFbI5xyXW/G/eK8X8p7G8aLE7I24PQR4KVL0PjPSfJZ
         hS8688Xh1Ady1dMCOMwnuwIm2CbnaPZUyxwCDEZ07Yg+shnHHIPeNuwGjDHdn/cm1xxN
         q51w==
In-Reply-To: <53E80077.2060300@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


--nextPart1610076.AIAaL630gj
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Monday 11 August 2014 at 01:29:59, Edward Shishkin wrote:=09
>=20
> On 08/10/2014 10:37 PM, Ivan Shapovalov wrote:
> > On Sunday 10 August 2014 at 21:48:05, Edward Shishkin wrote:=09
> >> On 08/10/2014 08:52 PM, Ivan Shapovalov wrote:
> >>> On Friday 01 August 2014 at 01:19:05, Edward Shishkin wrote:=09
> >>>> [...]
> >>>> Define maximal number of allocated blocks in one iteration
> >>>> and reserve this amount of blocks at the beginning of each
> >>>> iteration. Once the limit is exhausted, stop the scan and
> >>>> force to commit the atom.
> >>> This sounds pretty hackish... Isn't there a way to grab all possi=
ble space
> >>> at the same time?
> >>> By all possible space I mean (sbinfo->block_count - sbinfo->block=
s_used),
> >>> so that `fstrim <mountpoint>` will be efficient even if system is=
 under load
> >>> and atoms are being created continuously.
> >>
> >> I am afraid that other processes will return ENOSPC, whereas there=
 is
> >> a lot of free disk space.
> >> Assume fstrim grabbed all possible space. A process X , who needs =
to
> >> reserve space invokes txnmgr_force_commit_all(). Everyone waits fo=
r
> >> commits completion. After this fstrim grabs all possible space aga=
in
> >> (there is no any queue for free space reclaimers). Process X retur=
ns
> >> ENOSPC.
> >>
> >> Edward.
> > I've meant "grabbing all space and then allocating all space" -- so=
 there won't
> > be multiple grabs or multiple atoms.
> >
> > Then all processes grabbing space with BA_CAN_COMMIT will wait for =
the discard
> > atom to commit.
>=20
>=20
> It seems such waiting will screw up the system. No?

I was afraid of such situations, but how would that happen? The discard=
 atom's
commit will always be able to proceed as it doesn't grab space at all.

> >   (Actually, there is a small race window between grabbing space
> > and creating an atom...)
>=20
>=20
> Which one?

BA_CAN_COMMIT machinery does wait only for atoms, not for contexts. If
process X happens to grab space between us grabbing space and creating =
an atom,
it will get -ENOSPC even with BA_CAN_COMMIT.

=2D-=20
Ivan Shapovalov / intelfx /

> > The only problem is to wait for (sbinfo->block_count =3D=3D sbinfo-=
>blocks_used +
> > sbinfo->blocks_free) condition, i. e. until no blocks are reserved =
in any form,
> > and then to grab all space atomically wrt. reaching this condition.=

> >
> > Again, if this is not feasible, I'll go with the multiple atoms app=
roach. I
> > just want to make sure.
> >
> 
--nextPart1610076.AIAaL630gj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlPoj0QACgkQxUKljSIMAnCsHwD/fY1Ubh4xuzAogyH+GM+bJ0nN
AzAqqnarzATwf9l7xkQBALrfgy3mHL762c3NwkkFgW1owyymNjrAVgzFxP/NCBs3
=hxsN
-----END PGP SIGNATURE-----

--nextPart1610076.AIAaL630gj--

