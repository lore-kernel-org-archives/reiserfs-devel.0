From: Valdis.Kletnieks@vt.edu
Subject: Re: Will I need to re-format my partition for using the compression plugin?
Date: Thu, 22 Sep 2005 17:05:40 -0400
Message-ID: <200509222105.j8ML5eSP012939@turing-police.cc.vt.edu>
References: <194f625505092006316ad200b5@mail.gmail.com> <2f4958ff05092208244a0496fc@mail.gmail.com> <4332DE9F.8010808@namesys.com> <200509221951.38302.namesys.Sch@ttgen.net> <43330E14.9050209@namesys.com> <4333100F.6080307@slaphack.com> <200509222049.j8MKn1CH012169@turing-police.cc.vt.edu>
            <b14e81f00509221354348a431b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1127423140_2709P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26246-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 22 Sep 2005 16:54:12 EDT."
             <b14e81f00509221354348a431b@mail.gmail.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: michael chang <thenewme91@gmail.com>
Cc: David Masover <ninja@slaphack.com>, Edward Shishkin <edward@namesys.com>, Fred Schaettgen <namesys.Sch@ttgen.net>, reiserfs-list@namesys.com

--==_Exmh_1127423140_2709P
Content-Type: text/plain; charset=us-ascii

On Thu, 22 Sep 2005 16:54:12 EDT, michael chang said:
> On 9/22/05, Valdis.Kletnieks@vt.edu <Valdis.Kletnieks@vt.edu> wrote:
> > 2) Even though most modern block ciphers are designed to be fast, it's still
> > faster to apply a reasonably quick compression scheme to whomp 16K of data
> > down to 5-6K and encrypt/decrypt 5-6k than it is to encrypt/decrypt 16K.
> 
> Two questions.  One, does this mean that compression will usually be
> performed before encryption (which to me, sounds like it appears to be
> what would be the best method here)?

Yes, the general rule is "compress, then encrypt" and "Decrypt then decompress".

The corner cases where it should be the other way around are so few and far
between that it's not worth worrying about - they basically center around those
few times when compression causes a *larger* payload, and can be dealt with
a simple "Don't compress if output is bigger than input" rule.

--==_Exmh_1127423140_2709P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFDMxykcC3lWbTT17ARAmFIAKDpbKsdd7hysG1Rl5AGKeZfup6+2wCgrXKp
2KrUj9xTP2FbnwTunJOqyNY=
=HbeZ
-----END PGP SIGNATURE-----

--==_Exmh_1127423140_2709P--
