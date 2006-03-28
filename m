From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Reiser4 crash 2.6.16-mm1
Date: Tue, 28 Mar 2006 13:45:03 -0700
Message-ID: <1143578704.2380.9.camel@localhost>
References: <20060327214132.4074.qmail@pv105234.reshsg.uci.edu>
	 <C68877DC-ED4F-4827-B6ED-2F5CFEFC8037@smartgames.ca>
	 <20060327223214.5291.qmail@pv105234.reshsg.uci.edu>
	 <200603280439.k2S4dAql011014@turing-police.cc.vt.edu>
	 <F01E6B3F-3EBE-4982-9978-C79554F01FDA@smartgames.ca>
	 <4429577C.7020105@ics.uci.edu> <1143573487.2380.1.camel@localhost>
	 <442997D9.7000505@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-RKpR+6bDYfsEHyIvjbs9"
Return-path: <reiserfs-list-return-28392-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <442997D9.7000505@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: jfeise@ics.uci.edu, Toby Thain <toby@smartgames.ca>, reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>

--=-RKpR+6bDYfsEHyIvjbs9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2006-03-28 at 12:08 -0800, Hans Reiser wrote:
> Jonathan Briggs wrote:
[...]
> >And if it's a production machine, it is using ECC RAM, I would hope.  If
> >it is, memory problems (unreported ones, anyway) are very, very
> >unlikely.
> > =20
> >
> Jonathan, be merciful, ECC ram last I checked is twice the cost of
> regular and the mobs cost more too.  (I am sure the cost to produce is <
> 15% more, which makes it a great pity Intel does not standardize on
> requiring it and force it to be cheap)  Some folks need to save money.=20
> Yeah, I know, this time it may have cost him more in cost of his time
> but we are all just assuming it is memory.  Unfortunately, unless he
> checks it or we see an identical error message from another user with
> checked memory, or vs tells me he sees a flaw in the code, we need to
> assume it is memory.
[...]

Yes, I know. :)

But for a production machine that is "producing" something of value, the
extra cost should not be an issue.  RAM errors are so subtle and so hard
to find that ECC is of far more value than RAID.  It is obvious when
your disk fails.

An extra high bit in a credit transaction could cost you $16,384 and you
might not ever realize what happened. :)

Anyway, off topic, but ECC is highly recommended.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-RKpR+6bDYfsEHyIvjbs9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEKaBOG8fHaOLTWwgRAt/2AKCAIKYhizKbeWMjAbYJxDg1roYEDACfZo8Q
gmeoLkw3wdGJpBOCnKlqoVM=
=nQvL
-----END PGP SIGNATURE-----

--=-RKpR+6bDYfsEHyIvjbs9--

