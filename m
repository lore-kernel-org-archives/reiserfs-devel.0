From: Francisco Javier Cabello <fjcabello@visual-tools.com>
Subject: Re: other system with datacorruption  (2.425 + datalogging patches)
Date: Mon, 24 Jul 2006 14:24:23 +0200
Message-ID: <200607241424.25532.fjcabello@visual-tools.com>
References: <200607201452.09270.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1315259.U1aKZbNQsp";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29174-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607201452.09270.fjcabello@visual-tools.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart1315259.U1aKZbNQsp
Content-Type: multipart/mixed;
  boundary="Boundary-01=_3vLxEabZ4Qyu23V"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_3vLxEabZ4Qyu23V
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Another one :(
This time rebuild-tree failed. I guess the system didn't have enough memory.
Swap is mounted as loopback file inside the reiserfs filesystem, then when =
I=20
umount filesystem to check I lose swap.

Regards,

Paco

On Thursday, 20 de July de 2006 14:52, Francisco Javier Cabello wrote:
> Hello,
> I have other system with data corruption.
> I send you the output of 'reiserfsck --check'
>
> Regards,
>
> Paco

=2D-=20
One of my most productive days was throwing away 1000 lines of code (Ken=20
Thompson)
=2D----------------
PGP fingerprint: AF69 62B4 97EB F5BB 2C60  B802 568A E122 BBBE 5820
PGP Key available at http://pgp.mit.edu
=2D----------------


--Boundary-01=_3vLxEabZ4Qyu23V
Content-Type: text/plain;
  charset="iso-8859-1";
  name="reiserfsck_check"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfsck_check"

bad_internal: vpf-10320: block 263224, items 3 and 4: The wrong order of items: [2 5 0x87bb2001 IND (1)], [2 5 0xee9e001 IND (1)]
 the problem in the internal node occured (263224), whole subtree is skipped
vpf-10640: The on-disk and the correct bitmaps differs.

--Boundary-01=_3vLxEabZ4Qyu23V--

--nextPart1315259.U1aKZbNQsp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBExLv5VorhIru+WCARAlUpAJ4prYTKsdJ9yYJUe5wxZjI3AFoGoACdFVAL
bWh2thG/AAT0sD9/LwtnsqE=
=D3b/
-----END PGP SIGNATURE-----

--nextPart1315259.U1aKZbNQsp--
