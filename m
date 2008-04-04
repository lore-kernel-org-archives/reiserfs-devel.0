From: Zan Lynx <zlynx@acm.org>
Subject: Re: bad block management
Date: Thu, 03 Apr 2008 18:14:32 -0600
Message-ID: <1207268072.379391.7.camel@localhost>
References: <16413477.post@talk.nabble.com>
	 <alpine.DEB.1.10.0804012050350.7128@sheep.housecafe.de>
	 <47F28DE5.1060402@emc.com>  <47F29257.3000502@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-/ICCFyICN1Dkm5rFrSAk"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47F29257.3000502@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>
Cc: ric@emc.com, Christian Kujau <lists@nerdbynature.de>, kgp <jyotiv@tataelxsi.co.in>, reiserfs-devel@vger.kernel.org


--=-/ICCFyICN1Dkm5rFrSAk
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-04-01 at 15:51 -0400, Jeff Mahoney wrote:

> Ric's right about disk drives, though. They'll remap the bad sectors
> automatically at the hardware level. When you start to see bad sectors
> at the file system level, it means that the sectors reserved for
> remapping have been exhausted and you should replace the disk.

There are a couple of cases where you can see bad block errors on a good
drive.

If a block is written with a bad CRC for some reason...the write head
got a freak blip or it lost power as it was writing, or the data went
corrupt while sitting on disk, then it will read as a bad block, but
rewriting would fix it.

A RAID media verify or a badblocks -n run can usually fix these.
--=20
Zan Lynx <zlynx@acm.org>

--=-/ICCFyICN1Dkm5rFrSAk
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEABECAAYFAkf1cugACgkQolqWs/Y4NLxnoACglFAzi8P9AOgCPgttRh9qFKTf
JAwAnAuKckSKoyE+7KzvSN+oiRw7psLw
=783I
-----END PGP SIGNATURE-----

--=-/ICCFyICN1Dkm5rFrSAk--

