From: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>
Subject: Re: Conversion from v3.6 to v4 of Reiserfs...
Date: Tue, 24 Feb 2004 18:50:26 +0100
Message-ID: <403B8EE2.1030501@futuretg.com>
References: <20040224172153.M90659@pk25.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16909-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040224172153.M90659@pk25.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "Diaz Rodriguez, Eduardo" <ediaz@pk25.com>
Cc: reiserfs-list@namesys.com

Diaz Rodriguez, Eduardo wrote:

>Sorry for the question from a newbie but I can'f find the answer and I fin=
d in
>google maillist and may sites...
>
>I recently upgrade from 2.4.20 kernel to 2.6.3 kernel my debian testing.
>
>I see in logs that my lvm system are using version 3.6 of resiser fs.
>
>Feb 23 21:57:12 servidor1 kernel: found reiserfs format "3.6" with standard
>journal
>Feb 23 21:57:12 servidor1 kernel: Reiserfs journal params: device dm-0, si=
ze
>8192, journal first block 18, max trans len 1024, max batch 900, max commit
>age 30, max trans age 30
>Feb 23 21:57:12 servidor1 kernel: reiserfs: checking transaction log (dm-0)
>for (dm-0)
>Feb 23 21:57:12 servidor1 kernel: reiserfs: replayed 23 transactions in 1 =
seconds
>Feb 23 21:57:12 servidor1 kernel: Using r5 hash to sort names
>
>
>I want use new version v4 but I don't want to lost my data. are there any =
form
>to convert my fs to a new version v4??? This files are not critical for the
>system, only data..
>
> =20
>
Hi,

    Actually, there are no a way. You need to backup and re-write it=20
your data.

    However, I speak with Hans and probably we will release a=20
tool/utility for that purpose.

    We have no date for this release.

Thanks,
Giovanni

>Thanks for the time and for reiserfs...
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>Una part=EDcula que vuela ... buscar=E1 el ojo mas pr=F3ximo ...
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> =20
>

