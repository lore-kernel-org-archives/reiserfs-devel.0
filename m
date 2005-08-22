From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: REISERFS_MAX_NAME and ENAMETOOLONG
Date: Mon, 22 Aug 2005 13:50:52 +0400
Message-ID: <43099FFC.9000606@namesys.com>
References: <43099E14.7060902@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25603-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43099E14.7060902@baldauf.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Xu=E2n_Baldauf?= <xuan--2005.08.22--reiserfs-list--namesys.com@baldauf.org>
Cc: reiserfs-list@namesys.com

Hello

Xu=E2n Baldauf wrote:
> Hello,
>=20
> when downloading something from java.sun.com (e.g.
> http://javashoplm.sun.com/ECom/docs/Welcome.jsp?StoreId=3D22&PartDetailId=
=3Djdk-1.5.0-doc-oth-JPR&SiteId=3DJSC&TransactionId=3Dnoreg
> ), very long URLs are encountered. When trying to download using "wget",
> wget tries to open a file with those long filenames, and fails with
> ENAMETOOLONG (File name too long).
>=20
> I think that the limit is due to the REISERFS_MAX_NAME macro
> (http://lxr.linux.no/source/include/linux/reiserfs_fs.h?v=3D2.6.10#L1107),
> which currently resolves to "255" (which supposedly means 255 bytes).
>=20
> Is it safe to change REISERFS_MAX_NAME to something larger, or does this
> change the disk layout in an unexpected or incompatible way?
>=20

Yes. Max long name in reiserfs used to be much longer and then it was chang=
ed for compilability with something.
I believe you can easlily change it to 3500.

> Thanks,
>=20
> Xu=E2n Baldauf.
>=20
>=20
>=20

