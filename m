From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: reiser4: porting to 3.16: any reason ->aio_read() of struct file_operations has been left out?
Date: Thu, 09 Oct 2014 22:55:55 +0400
Message-ID: <2652463.xKkjd4Oans@intelfx-laptop>
References: <10671542.MCAVDCHSND@intelfx-laptop> <53F52195.1020900@gmail.com> <2194734.MaT6DR3706@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4015521.S5c43RX6qd"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-type;
        bh=THJBdMYvtUPhncgzXedkKFLBCAEsqBgp2T5BMO3AcrQ=;
        b=SJZ9JnDAESBSVeAhERZAel6MWI2CcUEN52f5gFO3OQ3zl6IedYaYVRfN/G+r3OmPzn
         GQDPT/oVEXrCngDqKRw9ScKIKS2I7Snlttm7zQ07b3PsJBTS/6YDFw3jm5MaUHhtX1SQ
         /df3WQn0VmtPoXkyExOSxw1xRva6kxZILbdTdtWEXcZYANoyPbd52S18wIjGcJuJtb8j
         WUuOQG0F9PWSeMCrH9qKpwSBlvsxysKA0zg9FJ611lPMMYWYBEynP3ryhyh/1SW2HHdt
         p8ftRrkrR1gFEPWnx1eJHQuygQku0Rw845wnjbMOPM9A0Q9SSMn93e0cimL8ItRQA2X+
         2Tog==
In-Reply-To: <2194734.MaT6DR3706@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart4015521.S5c43RX6qd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Thursday 21 August 2014 at 19:05:32, Ivan Shapovalov wrote:=09
> On Thursday 21 August 2014 at 00:30:45, Edward Shishkin wrote:=09
> >=20
> > On 08/20/2014 10:34 PM, Ivan Shapovalov wrote:
> > > On Wednesday 20 August 2014 at 01:39:42, Edward Shishkin wrote:=09=

> > >> On 08/20/2014 12:32 AM, Ivan Shapovalov wrote:
> > >>>   From `git log` I've seen that VFS people intend to replace ->=
aio_read() and
> > >>> ->aio_write() of struct file_operations with new methods ->read=
_iter() and
> > >>> ->write_iter().
> > >>>
> > >>> (Along with a couple of related new helpers, differing from pre=
vious just in
> > >>> calling _iter methods instead of aio_ ones.)
> > >>>
> > >>>   From other filesystems it seems that these are simple drop-in=
 replacements
> > >>> (however, well, I have zero familiarity with VFS). So here is a=
 question:
> > >>> is there any intentional reason that generic_file_aio_write() i=
s not used
> > >>> in reiser4?
> > >>
> > >> Currently reiser4 is a set of two filesystems which differ in me=
thods
> > >> of handling regular files. For VFS we provide "dispatchers", whi=
ch pass
> > >> management to appropriate plugin (UNIX_FILE or CRYPTCOMPRESS).
> > >>
> > >> UNIX_FILE plugin doesn't use generic write for performance reaso=
ns
> > >> (I'll try to find the respective mailing thread). CRYPTCOMPRESS =
doesn't
> > >> use it for compatibility reasons: I don't know how how to rewrit=
e it
> > >> gracefully using the generic write method.
> > >>
> > >> Edward.
> > >
> > > Thanks for explanation! So, does this patch make any sense?
> >=20
> >=20
> > I haven't looked at this carefully yet, but likely it is correct.
> >=20
> > Thanks,
> > Edward.
>=20
> Turned out it isn't.. The iter_file_splice_write() requires ->write_i=
ter
> to be set, or a NULL dereference happens.
>=20
> At first I've thought that we're out of luck and will need to use the=
 fallback
> splice implementation (default_file_splice_write), but just setting
> ->write_iter to generic_file_write_iter strangely worked.
>=20
> (By "it works" I mean "splice finishes successfully and does not caus=
e data
> corruptions").

...aand... it doesn't. At least on reg40 (sic, NOT ccreg40):
1) `kde-cp` and FF 32.0.3's downloader produce empty files;
2) some applications (at least two games: luftrausers and x-plane 10, b=
oth
proprietary) deadlock somewhere inside of generic_file_write_iter().

Removing ".splice_write =3D iter_file_splice_write" and
".write_iter =3D generic_file_write_iter" fixes the described cases.

Unfortunately, no time to dig deeper (MIPT is evil). Hopefully you will=

look into it someday... :)

Thanks,
=2D-=20
Ivan Shapovalov / intelfx /
--nextPart4015521.S5c43RX6qd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlQ22j8ACgkQxUKljSIMAnBTTQD6A6ZWX6nWJYDnfpJWWi8q8u41
nffSYn9XwAC0JT9/gcwBAM9Q75nNAk+W+7NBysWqpSrXbvEuk5LVEhkBDNSAT3fQ
=TRmP
-----END PGP SIGNATURE-----

--nextPart4015521.S5c43RX6qd--

