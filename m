From: David Masover <ninja@slaphack.com>
Subject: Re: Filesystem corruption
Date: Wed, 30 May 2007 14:42:25 -0500
Message-ID: <200705301442.25908.ninja@slaphack.com>
References: <46598532.5060505@lncsa.com> <200705300825.26083.ninja@slaphack.com> <0D658DE9-E05E-471E-A881-20F8D9B215CB@smartgames.ca>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1260298.8oTe0h977F";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30673-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <0D658DE9-E05E-471E-A881-20F8D9B215CB@smartgames.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart1260298.8oTe0h977F
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 30 May 2007 11:42:01 Toby Thain wrote:

> But does it cause data loss? One usually sees claims that "reiserfs
> ate my data", or "I heard reiserfs ate somebody's data", but without
> supplying a root cause - bad memory? powerfail? bad disk? etc.

Power failure shouldn't kill a filesystem, and generally shouldn't eat data=
=20
that was written to disk before the failure. (Although I could complain all=
=20
day here about why corruption happens anyway when you do any kind of=20
out-of-order operations...  I am looking forward to that Reiser4 transactio=
n=20
API, so we can finally get rid of the tmpfile+rename hack.)

But in any case, there were some kernels -- 2.4.16, I think? -- in which=20
reiserfs was unstable and did corrupt easily. I believe that was tracked do=
wn=20
to kernel bugs outside of reiserfs.

--nextPart1260298.8oTe0h977F
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iQIVAwUARl3ToXgHNmZLgCUhAQI+gQ//WcD5ViN6IK6NGzAqg9wvIPn9IRJCdfxG
FdRkflS9g2HUArmOtwOEer49IRttKzURjR9Frz1MzwuOWCR69OYsGhvtn5sbBcih
+XhXMog0yQoD1f/itTTYop2Bl9L+qRcwx35obcA9vPVvw8OzHhD57pZ5DbByQQAI
Mz/PLHNSs6XF4wdGi/VKwtPgMIlmrWUun1MMqpbPitbIofu8yQTsSoPfJFgUMkjj
wag8PkRKLeE1YgI+OaSymO+0zhHWYw0AIFxjqexS9kOVc+h8zWRdcdTPG72pJRzX
0DYxFG/C1yejp1jvh8JlL3Pkxf4QBxChBCsIwJVmyWEVUZMwLoyjxeZ9A6qUv0qo
72jAhZwquoI9czN73apo+OooaDk3ebt8r/AeV6aO0M26esdkAE8HpcgQgfIIwrJz
HL5XqfrD2zsEnnk6vSc1nYpz8i3eGN8PNY8uOzfR+Yk2p/jhcVGDNTkzHrY1kp2R
1wrnqtFF4jRdf8iz1dLGAlukv6gAG5UFSCroRzgX8GM3w0Sw3TSn0p020Zul6eMV
ePdUWdzKSsGziuh7PxL/wCf6B1CvJ+f5PfYcqGVedDVJzM7Fz2y4Xnir+cTmkXIQ
R/KqP2uZ9XI10LtoPJm1WiwEsFG4TEhvF3CJoue5oD41Fxm5xCj+p2ImZ1ouRp4S
j7nrxezQtc4=
=stHe
-----END PGP SIGNATURE-----

--nextPart1260298.8oTe0h977F--
