From: Valdis.Kletnieks@vt.edu
Subject: Re: secure delete?
Date: Wed, 24 Mar 2004 13:20:47 -0500
Message-ID: <200403241820.i2OIKlDG008088@turing-police.cc.vt.edu>
References: <1079691239.5767.7.camel@pear.st-and.ac.uk> <405AD31A.7070304@mweb.co.za> <20040319110748.GA30491@chihiro.cern.ch> <405AD9B5.80102@namesys.com> <405F94DD.80004@botz.org>
            <405FD7C2.5030605@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1054293536P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17436-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 23 Mar 2004 09:22:58 +0300."
             <405FD7C2.5030605@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiser@namesys.com
Cc: Jurgen Botz <jurgen@botz.org>, KELEMEN Peter <Peter.Kelemen@cern.ch>, reiserfs-list@namesys.com

--==_Exmh_-1054293536P
Content-Type: text/plain; charset=us-ascii

On Tue, 23 Mar 2004 09:22:58 +0300, Hans Reiser said:
> 
> Secure delete doesn't work against people who have the necessary 
> equipment to scan the media and find remnants due to track misalignment.

Notice that the people who have the necessary equipment and assume that the
adversaries are equally well-stocked don't seem to agree:

Canadian RCMP TSSIT OPS-II says: "Must first be checked for correct functioning
and then have all storage areas overwritten once with the binary digit ONE,
once with the binary digit ZERO and once with a single numeric, alphabetic or
special character, " (http://jya.com/rcmp2.htm)

American DoD 5220-22.M says: Overwriting all addressable locations with a
character, its complement, then a random character and verify.

That's our official government recommendation for what's sufficient when
we're throwing away stuff that the Other Guys might actually do this to.
I have to assume that if the DoD or RCMP thought this wasn't sufficient
to protect *our* secrets, they'd have a stricter standard.

--==_Exmh_-1054293536P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAYdF+cC3lWbTT17ARAp0FAKCbpiY7hcmShhSzVP3Bis3ofzA1swCg0qGI
1qtwrp0NmQJF2rIsBTl9dbo=
=fVEj
-----END PGP SIGNATURE-----

--==_Exmh_-1054293536P--
