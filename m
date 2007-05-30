From: David Masover <ninja@slaphack.com>
Subject: Re: Filesystem corruption
Date: Wed, 30 May 2007 08:25:25 -0500
Message-ID: <200705300825.26083.ninja@slaphack.com>
References: <46598532.5060505@lncsa.com> <200705291215.48354.vs@namesys.com> <1138AFDD-ED08-4390-A418-807A84342AE9@smartgames.ca>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3955226.Ff2qMm1UZX";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30667-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1138AFDD-ED08-4390-A418-807A84342AE9@smartgames.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart3955226.Ff2qMm1UZX
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 29 May 2007 07:36:13 Toby Thain wrote:

> >> but you can't
> >> mention using reiserfs in mixed company without someone accusing
> >> you of
> >> throwing your data away.
>
> People who repeat this rarely have any direct experience of Reiser;
> they repeat what they've heard; like all myths and legends they are
> transmitted orally rather than based on scientific observation.

Well, there is one problem I vaguely remember that I don't think has been=20
addressed, I think it was one of those lets-put-it-off-till-v4 things. It w=
as=20
the fact that there are a limited number of inodes (or keys, or whatever yo=
u=20
call a unique file), and no way of knowing how many you have left until you=
r=20
=46S will suddenly, one day refuse to create another file.

(For comparison, ext3 seems to support not only telling you how many inodes=
=20
you have left, but tuning that on the fly.)

But, I haven't run into that, and the only problem I've had lately has been=
=20
Reiser4 losing data, and crashing occasionally. I switched most of my data=
=20
off of Reiser4 and onto XFS for that reason. I've also been using ext3 in=20
some places, and Reiser3 in others (one place in particular where space is=
=20
limited, but I will have tons of small files).

I later learned that XFS does out-of-order writes by default, making me thi=
nk=20
I should give up and invest in UPS hardware. But, switching away from Reise=
r4=20
means I no longer see random files (including stuff in, for example, /sbin,=
=20
that I hadn't touched in months) go up in smoke.

Ordinarily I like to help debug things, but not at the risk of my data. May=
be=20
I'll try again later, and see if I can reproduce it in a VM or somewhere=20
safe...

I do still follow the list, though, in case something interesting happens. =
It=20
was fun while it lasted!

--nextPart3955226.Ff2qMm1UZX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iQIVAwUARl17RXgHNmZLgCUhAQJByw//XuSJzsbzU0TvNLfIl6GQe3IXX5Qp8mnn
mzYFyk9EEV0eNaSQdtUFOEATlvVk+n5+Sv5h0glAHyHvAfLFowj+HJmNCxu4xr9v
FqAYq7hDojlqE1HoRTII24cy1taPuUOMggvSgm0ph4HRJ31LfEUTMVtVNaPAvl6X
QbBdwS+sjt3rzW3q4Z7s2KcXH8Epm6pVS0Fg9m4Ujk3JNvVwyeDam6RvQQxCgu2L
XbBS7fptwoS7rgr+lP6T/kvXg+bS7UzZTknrTeUMspdI43m7TD2P6FzB3bL4yEAr
q8gKcAIXfhv/N9DyoNbEHckVQeJzMI9LmEYwZe4X8IB8C4ZZlJ/1odzflmCCISy6
/7F9FsKfkGW6NnUGk1FPjkV+vTb6i0zoNJE4j5L0lsTUdGvSx9QP5aTecyT46u2x
9/Wy3q02SjZUNxdEB9qiR2D27O0r25Gt/wm+t7JA2pCD9ioWmtk0U05/APZJZh45
6LArniYYgQsqVfzRAzTapGxQ5BwjhbJq1DbVRBE/BII6rSscOxA9cksJUL1XqLPV
boHn0CucsBZ6yJs9OcO9SZvcLRaw4uPk5xVlpG+cl2lYQIZ6c+ftQ8eTa/8wOyX4
ETrYwuhjB92ojUc2OJHLp47KfyCIAjsqAPvamqAkVKIrW1yWN1SuitwHojoi7o9e
DYNUj1+GaJA=
=/oFX
-----END PGP SIGNATURE-----

--nextPart3955226.Ff2qMm1UZX--
