From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: porting to 3.16: any reason ->aio_read() of struct file_operations has been left out?
Date: Thu, 21 Aug 2014 19:05:32 +0400
Message-ID: <2194734.MaT6DR3706@intelfx-laptop>
References: <10671542.MCAVDCHSND@intelfx-laptop> <5431496.Ue9YL3Eeu2@intelfx-laptop> <53F52195.1020900@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4617564.PAj4WHLpyv"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=OoZHziv2MM2PuP14iL0MVaxQT64hs6Oh7THZOD4jX2k=;
        b=QlWx/G/6xm07Q4MrHgC8Thuk84tqCvKghmqvPheasxaN78Ot+QebcQaecz3/rHvrVd
         h0yhB2VWjt3HodSLF4ONneDM1lRsQQooFBy7Gkp4dKNfGt0qO56IoOS7JjQoDEUueu3l
         qgFNj93dyJSWWy8Cpa3DNn3UzwFX4gUsh7VkfdMDXL5132DrWuMeUSqn9goGCOWQAkV+
         MAWieaS3iMwXRO+drwj72uBKjZkdrwj3JeGwkUT/jJZAx43vIoqYrmc4Hc5Xxy5SG5Eg
         JLCyhTOPAQkLSq37XpCSrO5sx/rVH0bfhjdSN7b+JvNwgEFm2Nbc8WcFurPBsaVxV6RG
         DIoQ==
In-Reply-To: <53F52195.1020900@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart4617564.PAj4WHLpyv
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thursday 21 August 2014 at 00:30:45, Edward Shishkin wrote:=09
>=20
> On 08/20/2014 10:34 PM, Ivan Shapovalov wrote:
> > On Wednesday 20 August 2014 at 01:39:42, Edward Shishkin wrote:=09
> >> On 08/20/2014 12:32 AM, Ivan Shapovalov wrote:
> >>>   From `git log` I've seen that VFS people intend to replace ->ai=
o_read() and
> >>> ->aio_write() of struct file_operations with new methods ->read_i=
ter() and
> >>> ->write_iter().
> >>>
> >>> (Along with a couple of related new helpers, differing from previ=
ous just in
> >>> calling _iter methods instead of aio_ ones.)
> >>>
> >>>   From other filesystems it seems that these are simple drop-in r=
eplacements
> >>> (however, well, I have zero familiarity with VFS). So here is a q=
uestion:
> >>> is there any intentional reason that generic_file_aio_write() is =
not used
> >>> in reiser4?
> >>
> >> Currently reiser4 is a set of two filesystems which differ in meth=
ods
> >> of handling regular files. For VFS we provide "dispatchers", which=
 pass
> >> management to appropriate plugin (UNIX_FILE or CRYPTCOMPRESS).
> >>
> >> UNIX_FILE plugin doesn't use generic write for performance reasons=

> >> (I'll try to find the respective mailing thread). CRYPTCOMPRESS do=
esn't
> >> use it for compatibility reasons: I don't know how how to rewrite =
it
> >> gracefully using the generic write method.
> >>
> >> Edward.
> >
> > Thanks for explanation! So, does this patch make any sense?
>=20
>=20
> I haven't looked at this carefully yet, but likely it is correct.
>=20
> Thanks,
> Edward.

Turned out it isn't.. The iter_file_splice_write() requires ->write_ite=
r
to be set, or a NULL dereference happens.

At first I've thought that we're out of luck and will need to use the f=
allback
splice implementation (default_file_splice_write), but just setting
=2D>write_iter to generic_file_write_iter strangely worked.

(By "it works" I mean "splice finishes successfully and does not cause =
data
corruptions").

Could you please comment on this? :)

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart4617564.PAj4WHLpyv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlP2CsAACgkQxUKljSIMAnBLIQEApQj84A7Rao9qg7Nh02A/Y8nq
iZtdU9vztuYYNvHwFrIA/18CTMr5J8GPSEpz7gKBd3yygvGSOvVRhuIQJu/sZf6g
=4fvJ
-----END PGP SIGNATURE-----

--nextPart4617564.PAj4WHLpyv--

