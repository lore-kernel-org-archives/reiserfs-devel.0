From: Stephan Seitz <nur-ab-sal@gmx.de>
Subject: Re: Status data loggin patches?
Date: Thu, 4 Dec 2003 17:54:26 +0100
Message-ID: <20031204T1751.GA.40cb0.stse@fsing.fs.uni-sb.de>
References: <20031203T1502.GA.5b882.stse@fsing.fs.uni-sb.de> <1070555939.27612.190.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <reiserfs-list-return-16230-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1070555939.27612.190.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Thu, Dec 04, 2003 at 11:38:59AM -0500, Chris Mason wrote:
>I was trying to finalize journal-header patch, which improves
>performance and data=3Dordered features in general.  But a few other
>things ended up sucking down too much time and it didn't happen in time
>for 2.4.23.  I think it is best right now for me to concentrate on 2.6
>instead.

Ah, thanks for the explanation and for your great work.

>> Are there versions for 2.6 to test? I would like to test the new=20
>> kernel, but not without data logging patch.
>2.6 data logging is coming along.  Data logging is actually a few
>different pieces, and I'm pulling them apart for the 2.6 port.  First is
>better performance for small transactions, second is the actual
>data=3Dordered/data=3Djournal code.

Can you give a timeline when someone can try the first patches?

Shade and sweet water!

	Stephan

--=20
| Stephan Seitz                   E-Mail: Nur-Ab-Sal@gmx.de |
|          WWW: http://fsing.fs.uni-sb.de/~stse/            |
| PGP Public Keys: http://fsing.fs.uni-sb.de/~stse/pgp.html |

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/z2bCXse+NwPOAZ4RAlDbAJ9pq+3fPNeAfMTIrtfGVKYCH06McgCgg9VB
iPUlqdGqGvsInnLzjUXY85s=
=hFVb
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
