From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Thu, 06 Jul 2006 10:01:47 -0600
Message-ID: <1152201707.9445.1.camel@localhost>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>
	 <1151608355.6335.79.camel@tribesman.namesys.com>
	 <1151612146.11510.4.camel@ipso.snappymail.ca>
	 <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>
	 <1152059846.30139.11.camel@ipso.snappymail.ca>
	 <44AB25EE.8030702@namesys.com>
	 <20060706125856.fdac1d16.pegasus@nerv.eu.org>
	 <1152200638.30139.45.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-JDDfQmEjvGdwUZ56jTCi"
Return-path: <reiserfs-list-return-28917-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1152200638.30139.45.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Mike Benoit <ipso@snappymail.ca>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

--=-JDDfQmEjvGdwUZ56jTCi
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2006-07-06 at 08:43 -0700, Mike Benoit wrote:
[snip]
> My desktop machine (v2.6.16, same as my MythTV box) is running with 9%
> free space right now and it is not experiencing any slow down. I think
> the problem is caused by the usage pattern of MythTV and how it
> simultaneously streams one or more large files to the HD in relatively
> small chunks over a long period of time.

Hasn't someone patched MythTV to pre-allocate (zero-write) the video
files to the expected sizes?

I was sure I'd read about that somewhere...
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-JDDfQmEjvGdwUZ56jTCi
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iD8DBQBErTPqG8fHaOLTWwgRAsu1AJ0Xf53ALBp9Ni25G1gDgPRwJYUXPgCggKxr
X84k9Cmz80k8qNF+uy7T14Y=
=5qCS
-----END PGP SIGNATURE-----

--=-JDDfQmEjvGdwUZ56jTCi--

