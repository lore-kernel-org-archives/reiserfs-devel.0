From: Kacper Wysocki <kacperw@online.no>
Subject: Re: reiser4 problems in 2.6.10-rc1-mm
Date: Sun, 21 Nov 2004 19:40:36 +0000
Message-ID: <1101066053l.5651l.0l@comotion>
References: <1100667360l.1027l.0l@comotion> <1100850087l.4414l.0l@comotion>
 <20041119192825.6d53af61.hihone@bigpond.net.au>
 <877joioyiy.fsf@barad-dur.crans.org>
 <20041120074401.4aec50ac.hihone@bigpond.net.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-OD69rIU0fACdr/6lpRiw";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-list-return-22471-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <20041120074401.4aec50ac.hihone@bigpond.net.au>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-OD69rIU0fACdr/6lpRiw
Content-Type: text/plain; charset=ISO-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11/19/04 15:44:01, Cal wrote:
> and then at Fri, 19 Nov 2004 12:42:45 +0100, it was written ...
>> Could you try 2.6.10-rc2-mm2, reiser4 is pretty stable in this  =20
>> tree,  and >contains more fix bits.

Didn't have the time yet, but seems Cal has..

> Lost in the alchemy, I didn't notice the update, so thanks for the
> update pointer. The problem still happens in 2.6.10-rc2-mm2:-

[snip kernel oops]

>  Last night, with a blend of about 60/40 alchemy/engineering, I =20
> merged  base 2.6.10-rc2 with 2.6.10-rc2-bk3, reiser4-for-2.6.10-rc1, =20
> selected  fixes from 2.6.10-mm1 and the reiserfs mailing list, plus =20
> ck patches.   So far that build performs just fine.  Now I guess I =20
> need to figure  out the difference between that and 2.6.10-mm2.  That =20
> said, I  cheerfully acknowledge that the mm series is the best place =20
> to be if  using reiser4.

Wow... while you're figuring out which part fixes it, do you mind =20
diffing your tree against 2.6.10-rc2-mm2 and posting the patch? I'll =20
gladly try it out... might even take a look at the difference in the =20
reiser code to see what's been changed (on the assumption that it's =20
reiser4 that's causing the problem, and not some sideeffect).

Cheers,
Kacper
--=20
Please do not cc: me. I'm on the list. I read the list, really I do.
I do not need HTML email, virus warnings or unsolicited forwards.
Get my GnuPG public key from pgp.mit.edu.
Signed mail preferred. Please encrypt where appropriate.


--=-OD69rIU0fACdr/6lpRiw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBoO9F+LsaKQiaxYYRAvFhAJ0esPSkMtqyr8LwUrVmbaR/qwxcMACeLT2M
EJ4vEGD9N/MjpeFOMxHyJbk=
=bX2K
-----END PGP SIGNATURE-----

--=-OD69rIU0fACdr/6lpRiw--

