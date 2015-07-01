From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Thu, 02 Jul 2015 02:35:08 +0300
Message-ID: <1435793708.3758.14.camel@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com>
	 <1435648387.15634.3.camel@gmail.com> <559245B3.1020804@gmail.com>
	 <1435651611.15634.12.camel@gmail.com> <55925A3C.6000604@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-cBTL0ZQSO1n59pigul+i"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:date:in-reply-to:references:content-type
         :mime-version;
        bh=jAZLuX5abZ2bYFanKcQ6TmrHHdwOuRBlfIbGlxBuISQ=;
        b=ROb3ECmdY8GoTz8P28K+a124nOQ45D2kga1k1VqY+mceU4ZZvPZqhx1dF0FWPTTb+T
         5skISHMlo6Y6lyhnxEKYx6y4UayBOPehOiR/c2c75yUDXKyVkJCIirShxjJwY+iXmE2m
         hI7URRU3OjNy0kgIhen/04a9JauPXNQcv0CpJdfHgzLuXXcTaJ32R7KNeDHELPE1f0p9
         kBghPRlnkRvWNc7zxGvfoYdWvgJN0aeIEZOuApLzcMYWg0Rib2042W7VfaZEQ4ezZThJ
         Sc1JEjZZe8wrtga/JIB1KQsb0MNup3j9YhedX8rqtTyZS7CiXTSCR+Oak5sOkE0AR4IV
         78pQ==
In-Reply-To: <55925A3C.6000604@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-cBTL0ZQSO1n59pigul+i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2015-06-30 at 10:58 +0200, Edward Shishkin wrote:
> On 06/30/2015 10:06 AM, Ivan Shapovalov wrote:
> > On 2015-06-30 at 09:30 +0200, Edward Shishkin wrote:
> > > On 06/30/2015 09:13 AM, Ivan Shapovalov wrote:
> > > > On 2015-06-30 at 01:54 +0800, Edward Shishkin wrote:
> > > > > Oh, bad
> > > > > generic_write_checks() doesn't change offset now,
> > > > > please, ignore this patch..
> > > > Hi,
> > > Hello.
> > >=20
> > > > it does change it, but in struct kiocb instance, but we keep=20
> > > > using
> > > > initial "off".
> > > >=20
> > > > i'm trying to port file_operations' ->write() to ->write_iter()
> > > > right
> > >=20
> > > Hmm. You'll need to modify ->write() of both file plugins -
> > > it's not simple, esp. for cryptcompress, which performs writes by
> > > chunks (4, 8, ... 64K)
> > Yeah, I understand. However, it doesn't seem too complex. It's=20
> > simply
> > iov_iter* instead of a char*+size_t. I just need to grok how does=20
> > the
> > page cache work (wrt. "faulting in" pages, flushing caches, error
> > handling, etc).
> >=20
> > I'm now trying to read the generic code together with btrfs'
> > implementation, compare bit-by-bit and implement the same in=20
> > reiser4.
> >=20
> > > > now, FTR. The obvious fix (assign back ki_pos to off) is too=20
> > > > ugly
> > > > :)
> > > may be just create a static inline function
> > > reiser4_write_check() ?
> > > {
> > >       ...
> > >       generic_write_check();
> > > *off =3D iocb.ki_pos;
> > > }
> > Sure, it will work, but right now, as everything in vfs moves=20
> > towards
> > *_iter methods, I guess there could be some sense in moving to=20
> > those as
> > well...
> >=20
> > Yes, I understand that vfs is a fast-moving target, but why not?
>=20
> I afraid it'll get stuck in the queue "for review"..

Then let's say that we have an "experimental"/"unreviewed" branch :)

>=20
> BTW, we need to do something with the "precise discard extension":
> http://sourceforge.net/projects/reiser4/files/patches/
> It reports erase unit 512 bytes for my samsung SSD 840 EVO.
> You said that this is incorrect. If so, then how to retrieve correct
> discard parameters?

I was wrong about usage of `hdparm -I`. The "limit" it says about
is in fact "how many 512-byte blocks worth of LBA ranges can be given
to the drive in a single ATA trim command"[1].

In fact, the standard (referenced below) doesn't seem to contain
any references to the trim granularity, let alone to define any means
to query it.

So, I guess, the kernel will never tell us correct values for ATA SSDs,
and the only option is direct testing at mount time.

[1]: ATA8-ACS3 (nevar.pl/pliki/ATA8-ACS-3.pdf), 7.16.7.55
     "IDENTIFY DEVICE" - "Input From the Device to the Host Data=20
     Structure" - "7.16.7.55 Word 105: Maximum number of 512-byte=20
     blocks of LBA Range Entries per DATA SET MANAGEMENT command".

Thanks,
--=20
Ivan Shapovalov / intelfx /

--=-cBTL0ZQSO1n59pigul+i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlWUeSwACgkQxUKljSIMAnDi3gD+PGv6Qq0hLjJzs9x2kC2icuRx
ux9oDYzXtelVskcda0QBAOGNZvcwZ8Dykm8ojkEinZQKQZCY7NunL90kMSexQ2CG
=wzTH
-----END PGP SIGNATURE-----

--=-cBTL0ZQSO1n59pigul+i--

