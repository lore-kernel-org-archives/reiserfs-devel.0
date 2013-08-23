From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiserfsck segfault when journal transactions count == 1
Date: Fri, 23 Aug 2013 16:28:21 +0200
Message-ID: <52177185.9040309@suse.com>
References: <CAGuA69tBJXApdtNHrxBOkOD98X3p2CaMk8yg9BUWYDVah3ZxMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="wlp28XUTSHIJ7iSagpixF1kn5K6P3vOXf"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAGuA69tBJXApdtNHrxBOkOD98X3p2CaMk8yg9BUWYDVah3ZxMw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Victor Leschuk <vleschuk@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wlp28XUTSHIJ7iSagpixF1kn5K6P3vOXf
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 8/23/13 12:57 PM, Victor Leschuk wrote:
> Damn gmx.com, can't manage to make it use TEXT/PLAIN. Jeff, sorry for s=
pamming.
>=20
> Resending original message from gmail...
>=20
> Hello,
>=20
> We have met a situation when reiserfsck segfaulted on one of our
> partitions. I have performed a small research and the cause appeared
> to be wrong detection of transaction count.
>=20
> Our FS had only one journal transaction, however trans_count which was
> passed to progbar_update() as maximum transaction value was detected
> as (last_transaction - first_transaction) which in our case was 0.
> Thus progbar_update() resulted in segmentation fault:
>=20
> (gdb) bt
> #0  0xb7610b7c in vfprintf () from /lib/i386-linux-gnu/i686/cmov/libc.s=
o.6
> #1  0xb7611bb2 in ?? () from /lib/i386-linux-gnu/i686/cmov/libc.so.6
> #2  0xb760cdc3 in vfprintf () from /lib/i386-linux-gnu/i686/cmov/libc.s=
o.6
> #3  0xb7616e4f in fprintf () from /lib/i386-linux-gnu/i686/cmov/libc.so=
=2E6
> #4  0x08088aca in progbar_update (ctx=3D0xbfef0020, label=3D0x8096650
> "Replaying journal", curr=3D1, max=3D0, dpynum=3D1) at progbar.c:80
> #5  0x080843c4 in replay_journal (fs=3D0x9492980) at journal.c:868
> #6  0x0804ae67 in reiserfsck_replay_journal (fs=3D0x9492980) at main.c:=
727
> #7  0x0804b477 in prepare_fs_for_check (fs=3D0x9492980) at main.c:838
> #8  0x0804c0c8 in check_fs (fs=3D0x9492980) at main.c:1100
> #9  0x0804cfb0 in main (argc=3D3, argv=3D0xbfef0254) at main.c:1380
>=20
> Here is part of debugreiserfs -j output
>=20
> Journal header (block #8210 of ./partition.bug):
>     j_last_flush_trans_id 0
>     j_first_unflushed_offset 0
>     j_mount_id 10
>     Device [0x0]
>     Magic [0x4f0a099e]
>     Size 8193 blocks (including 1 for journal header) (first block 18)
>     Max transaction length 1024 blocks
>     Max batch size 900 blocks
>     Max commit age 30
> Mountid 10, transid 10, desc 18, length 2, commit 21
> #0    19->16 20->8211    < =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D this is the only record
>=20
> I successfully reproduced it on versions 3.6.21 (which we were using)
> and 3.6.23 (which I believe is the latest).
>=20
> Attaching patch. Let me know your opinion. If I am wrong, please
> comment, if I am correct, feel free to include patch into sources.

Thanks for the report and patch. I've applied it to my repo (adding your
Signed-off-by, per the line immediately quoted above) and it'll be part
of 3.6.24.

-Jeff

--=20
Jeff Mahoney
SUSE Labs


--wlp28XUTSHIJ7iSagpixF1kn5K6P3vOXf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJSF3GIAAoJEB57S2MheeWyt+gQAJwjipQf5f/t0O3C9pchC5BB
o5v29eU+khumk8+d4Ozr5ZsBa0U0Rsl2oWnPyelVEJIoqLXDzU068QS4appck0ze
OjQZL/iH0oFC02wl1atol9HDNXZa0LwVDJvFcdWytUVCqF58Lte5rEOC1FU5Rpyn
3Jc1iy3BnXcLpYVvUymXlyc5mlW4iXwYG2EVGY8LQLjPginYmawt8eRIT6zHHbTW
Ve+5dBidUxgVu82YfdnfsWdKSFDm+C86oG6ZtxZisXFTYtGziF9IEpNXaqYQAinU
1fvWeN26zY5pbQ+jrgcVLtHoougjrBO4DRsNJCx/cgWleKNT49IXFj3QzogUzY+T
r8H1LhAS5pdkWPEdJHrmh152SxNgmcmjByqzRcrBNzzGAMFbwCaslOkVss4/pZHS
jfFCJ/ch2UTZgj3hlfUFaEBw3uAUuyUEt2y2FUa2ewbQuYL4ZvjCQsEphqycuBs2
IRJO0IQUQfXeB9kTRsM3e/fzAPO7ZvnkKJrCFRBU9AGp0cASwORU1+oXA1VGPaUQ
vLJy0j/ij/ZgJLCMp6SlHxSt8bI2lrfwWCV4dTtd65d/oa6pqUXiIYAuTFqmQZAZ
UK36NzPoxItE+j35w15E2FqbnmpTxD6uHKR81RoCelGDMuNbBaRrW62zP9XIPf1/
YCgLruV/WXjEm4rs5XJL
=yYKt
-----END PGP SIGNATURE-----

--wlp28XUTSHIJ7iSagpixF1kn5K6P3vOXf--
