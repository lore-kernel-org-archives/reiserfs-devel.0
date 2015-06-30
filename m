From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Tue, 30 Jun 2015 11:06:51 +0300
Message-ID: <1435651611.15634.12.camel@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>
	 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-SJH4XE/bTQkCyuNUAChk"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:in-reply-to:references:content-type
         :mime-version;
        bh=VDmx/w9DIK8dYSnGvMhhX8ctbZqq48hCeIQRAKhh39Y=;
        b=LfOopkm+nS94ToH7H6b1RexqfYL+cI013PdHpr5kAOixYgS7FRkVJiO3EQoj4/AyE/
         5cjE0PBQ0Hl//v9sJV4DkS0hOsxXMA6VXWdN6PW4KhlxcaiWWUkph7MGhBjbMjRRDAzO
         LJrrcd6KR9X7txinYzZcv2fkhnvl44wQSRksjEQ9z6t61XL8lEtLS81Ttk9oDITO1/hg
         jt7WpB7X5VnZryP6kokgpoC2hBOt68WpiaLVQp8KgyS/cw0kVIMWMQ9jBeVp1JD6fFXo
         un1vH8kCbv6dCv+8vY42+DZdPgArrvKuBGmBn+k1IDHayx+AvmErPSvSLSDOIcLwB66L
         14yQ==
In-Reply-To: <559245B3.1020804@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-SJH4XE/bTQkCyuNUAChk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-06-30 at 09:30 +0200, Edward Shishkin wrote:
>=20
> On 06/30/2015 09:13 AM, Ivan Shapovalov wrote:
> > On 2015-06-30 at 01:54 +0800, Edward Shishkin wrote:
> > > Oh, bad
> > > generic_write_checks() doesn't change offset now,
> > > please, ignore this patch..
> > Hi,
>=20
> Hello.
>=20
> >=20
> > it does change it, but in struct kiocb instance, but we keep using
> > initial "off".
> >=20
> > i'm trying to port file_operations' ->write() to ->write_iter()=20
> > right
>=20
>=20
> Hmm. You'll need to modify ->write() of both file plugins -
> it's not simple, esp. for cryptcompress, which performs writes by
> chunks (4, 8, ... 64K)

Yeah, I understand. However, it doesn't seem too complex. It's simply
iov_iter* instead of a char*+size_t. I just need to grok how does the
page cache work (wrt. "faulting in" pages, flushing caches, error
handling, etc).

I'm now trying to read the generic code together with btrfs'
implementation, compare bit-by-bit and implement the same in reiser4.

>=20
> > now, FTR. The obvious fix (assign back ki_pos to off) is too ugly=20
> > :)
>=20
> may be just create a static inline function
> reiser4_write_check() ?
> {
>      ...
>      generic_write_check();
> *off =3D iocb.ki_pos;
> }

Sure, it will work, but right now, as everything in vfs moves towards
*_iter methods, I guess there could be some sense in moving to those as
well...

Yes, I understand that vfs is a fast-moving target, but why not?

Thanks,
--=20
Ivan Shapovalov / intelfx /

--=-SJH4XE/bTQkCyuNUAChk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlWSThsACgkQxUKljSIMAnCoPQEAxYmY1Ctelu/vB5QRrc/SbKD+
3ywiRY8iwuekDAecf6YA/3syuj+ze4uXo5CN9bPWO3dP/YfnfvewKfCqJSW8omI/
=lLeH
-----END PGP SIGNATURE-----

--=-SJH4XE/bTQkCyuNUAChk--

