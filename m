From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfsprogs: remove old support message in
 reiserfstune.8
Date: Tue, 25 Jul 2017 12:07:37 -0400
Message-ID: <ca34d4d3-62f2-159a-2ce5-315432c9513c@suse.com>
References: <20170725155704.6430-1-xose.vazquez@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TR1X5Tx9ATGtJTfCexCaVxDCvIqw6bfX6"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20170725155704.6430-1-xose.vazquez@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: ReiserFS ml <reiserfs-devel@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TR1X5Tx9ATGtJTfCexCaVxDCvIqw6bfX6
Content-Type: multipart/mixed; boundary="LgSMpInHdw9l3wEwkI2U11nC5MLi7U8s8";
 protected-headers="v1"
From: Jeff Mahoney <jeffm@suse.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: ReiserFS ml <reiserfs-devel@vger.kernel.org>
Message-ID: <ca34d4d3-62f2-159a-2ce5-315432c9513c@suse.com>
Subject: Re: [PATCH] reiserfsprogs: remove old support message in
 reiserfstune.8
References: <20170725155704.6430-1-xose.vazquez@gmail.com>
In-Reply-To: <20170725155704.6430-1-xose.vazquez@gmail.com>

--LgSMpInHdw9l3wEwkI2U11nC5MLi7U8s8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/25/17 11:57 AM, Xose Vazquez Perez wrote:
> CC: Jeff Mahoney <jeffm@suse.com>
> CC: ReiserFS ml <reiserfs-devel@vger.kernel.org>
> Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
> ---
>  tune/reiserfstune.8.in | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/tune/reiserfstune.8.in b/tune/reiserfstune.8.in
> index ecffc9e..df7636e 100644
> --- a/tune/reiserfstune.8.in
> +++ b/tune/reiserfstune.8.in
> @@ -34,8 +34,7 @@ Note: At the time of writing the relocated journal wa=
s implemented for a special
>  release of ReiserFS, and was not expected to be put into the mainstrea=
m kernel
>  until approximately Linux 2.5.  This means that if you have the stock =
kernel you=20
>  must apply a special patch. Without this patch the kernel will refuse =
to mount=20
> -the newly modified file system.  We will charge $25 to explain this to=
 you if=20
> -you ask us why it doesn't work.
> +the newly modified file system.
>  .PP
>  Perhaps the most interesting application of this code is to put the
>  journal on a solid state disk.
>=20

Applied.

Thanks,

-Jeff

--=20
Jeff Mahoney
SUSE Labs


--LgSMpInHdw9l3wEwkI2U11nC5MLi7U8s8--

--TR1X5Tx9ATGtJTfCexCaVxDCvIqw6bfX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2

iQIVAwUBWXds0B57S2MheeWyAQgrmQ/9E2ttZ2nQWtp/sF/1K/8EPf+DSsNdjDzq
aI8y6pCNDSDeVqnetzXWEPEvzEYDr7nBvhPx1etwkmDJShc7CwiDi5yljtfk/yd7
jn9ou+4uxbg+ZrmzYRjKgNKxb8khrJVWXI0Z6qIgiBUrrhf+PARLEQLukbIXovC5
Ju5IZ9sC8iis9BNW9fR6NAvrjcJ74GPgZAejMvyqHAzYUSs1gDgGmMPE/oCyVm4i
WOy8T2oOP/M/7yHnnE+bopQLjwW+Fny+GKND7TcCa/1E1IHz/8Xz/9Vj+DoraC4p
bPiOw18rHW1E2TFWqCUAjuf96TdPg4haTXJOm/VbdHgMtU6+bae6ZUBX6NYdjloa
DU7FVSA3VThvAnhaGn/iTfI/OLGUnYs41F6snOt4VsdbDdrG2n4OAFHsr6Ninv0x
shImm3X8diDWFEGUmnOZ3mjPUFFVjsad8yLWOlN/QI/i1ggK7iwociLreTF3A116
IKB8fStMa5wkfvfvaHgq8uMeiTsf042554jxiii0dg++hZvVnd0RsU6Jue07Tmac
k7ZH0wSDvUdToPOR3HMqkdlGj7LYA4ELE79Zs/wlTWdoqpXcER4l7ZOsFlaDqjvs
PL04KLxlk0hceUlgohxec07BWAh9rzHpP3dICgnGQGltbmi8LQnCe1w362Y76O0c
PwJOvTD82q8=
=vAga
-----END PGP SIGNATURE-----

--TR1X5Tx9ATGtJTfCexCaVxDCvIqw6bfX6--
