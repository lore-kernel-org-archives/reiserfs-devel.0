From: Michael Brunnbauer <brunni@netestate.de>
Subject: Re: reiserfs broke between 4.9.205 and 4.9.208
Date: Thu, 9 Jan 2020 13:30:41 +0100
Message-ID: <20200109123041.GA14075@netestate.de>
References: <20200108193634.GA17390@netestate.de>
 <481c595b-46c9-0b4d-c618-a998ab6247c6@infradead.org>
 <20200109121216.GC22232@quack2.suse.cz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200109121216.GC22232@quack2.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, jeffm@suse.com


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hello Jan,

On Thu, Jan 09, 2020 at 01:12:16PM +0100, Jan Kara wrote:
> Also Michael, I'd like to clarify: Does 'cp -a' return any error or is it
> just that the kernel is spewing these annoying warnings?  Because from the
> code reading I'd think that it is only the kernel spewing errors but
> userspace should be fine...

Yes, 'cp -a' returns errors and files are owned by root instead of the corr=
ect
user after copying as root.

Regards,

Michael Brunnbauer

--=20
++  Michael Brunnbauer
++  netEstate GmbH
++  Geisenhausener Stra=DFe 11a
++  81379 M=FCnchen
++  Tel +49 89 32 19 77 80
++  Fax +49 89 32 19 77 89=20
++  E-Mail brunni@netestate.de
++  https://www.netestate.de/
++
++  Sitz: M=FCnchen, HRB Nr.142452 (Handelsregister B M=FCnchen)
++  USt-IdNr. DE221033342
++  Gesch=E4ftsf=FChrer: Michael Brunnbauer, Franz Brunnbauer
++  Prokurist: Dipl. Kfm. (Univ.) Markus Hendel

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTAkMfrYFFSaeacJ6u+j6gOLbYeuQUCXhcc7wAKCRC+j6gOLbYe
uScQAKDKIkDkiJojYLvQEuxKD96bfqSvnwCdG6Vm4TAAmar0PSatXQSEMk7nNIA=
=2KAK
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
