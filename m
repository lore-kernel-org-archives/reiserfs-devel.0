From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: REISERFS_MAX_NAME and ENAMETOOLONG
Date: Tue, 30 Aug 2005 03:01:59 -0400
Message-ID: <43140467.8030704@suse.com>
References: <43099E14.7060902@baldauf.org> <43099FFC.9000606@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25722-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43099FFC.9000606@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: =?ISO-8859-1?Q?Xu=E2n_Baldauf?= <xuan--2005.08.22--reiserfs-list--namesys.com@baldauf.org>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Vladimir V. Saveliev wrote:
> Hello
>=20
> Xu=E2n Baldauf wrote:
>>Hello,
>>
>>when downloading something from java.sun.com (e.g.
>>http://javashoplm.sun.com/ECom/docs/Welcome.jsp?StoreId=3D22&PartDetailId=
=3Djdk-1.5.0-doc-oth-JPR&SiteId=3DJSC&TransactionId=3Dnoreg
>>), very long URLs are encountered. When trying to download using "wget",
>>wget tries to open a file with those long filenames, and fails with
>>ENAMETOOLONG (File name too long).
>>
>>I think that the limit is due to the REISERFS_MAX_NAME macro
>>(http://lxr.linux.no/source/include/linux/reiserfs_fs.h?v=3D2.6.10#L1107),
>>which currently resolves to "255" (which supposedly means 255 bytes).
>>
>>Is it safe to change REISERFS_MAX_NAME to something larger, or does this
>>change the disk layout in an unexpected or incompatible way?
>>
>=20
> Yes. Max long name in reiserfs used to be much longer and then it was cha=
nged for compilability with something.
> I believe you can easlily change it to 3500.

Just as a data point:

http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D97908551206263&w=3D2

The current state:

The kernel doesn't care about the length of a file name, so long as the
maximum path used to access it is below PATH_MAX (currently 4k). dirents
are dynamically sized, so there is no more 255 byte limit inside the kernel.

Glibc still defines dirent->d_name as char[256] for backward
compatibility. If the kernel supports d_reclen (which it has for a very
long time), dirents are treated as dynamically sized. Since glibc
allocates an 8k (_IO_BUFSIZE) buffer and passes it to sys_getdents,
proper bounds checking is done, and the max length is supported.

I did a quick test using your suggestion on my development machine, and
got proper results back.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFDFARnLPWxlyuTD7IRAo1wAJ4lD9WoukhZDVNMu0vvLdAbWZgYkACfR9Zb
y3uYCK410VR/ykpWijRt5xw=3D
=3D5Tlx
-----END PGP SIGNATURE-----
