From: Christian Trefzer <ctrefzer@gmx.de>
Subject: reiser4 can now bear with filled fs, looks stable to me...
Date: Mon, 31 Jul 2006 00:38:44 +0200
Message-ID: <20060730223755.GA14386@hermes.uziel.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Return-path: <reiserfs-list-return-29284-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Bn2rw/3z4jIqBvZU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Hi,

I booted 2.6.18-rc2-mm1 today and later filled up my /opt partition by
accident, and guess what, reiser4 did not screw up : D

I already planned on forcibly filling up something less depended upon,
like the portage tree, but studies kept me from playing and the
scheduled java vm update took care of it...

Congratulations and thanks to the namesys developers! Hans, I can
somewhat understand how you feel about your situation. Don't let
frustration get in your way, your work is simply too great. You're an
emotional kind of guy - don't get me wrong, so am I and at least once a
day I want to run off and knock out some lying politician scum for
screwing over society ; ) Sometimes you just  have to swallow your pride
instead of wasting your time by yelling at the rest of the world, and if
"humble work" does not lead to success, there won't be any other way, I
fear.

IMHO it would be best to deliver "quality patches" against all kinds of
sources (distro kernels, vanilla -rcs maybe, etc.) and the entire
patched source tarball as well, for people to download and build. Next
step would be to provide binary packages, and repos for people to add to
their package manager's source list. Until distros pick up their
respective patch, this is as far as support can go, I guess.

This is not about forking, it's more about providing the service we'd
want kernel.org to provide for us and which will possibly happen some
time, in some way. If they won't push you, you have to push by yourself,
sad but true.

This is also _not_ meant as the start of yet another flame war, and
$deity be my witness, I won't reply on any non-technical polarizing
bullshit, damnit. And this is exactly the reason why I won't cross-post
this to LKML, where OT-flames span topics from ext4 over suspend2 to the
2.4-2.5 transition. Some people really do have too much time on their
hands.

This is about what can be done to bring reiser4 to the users, at least
to those who know about differences in file systems. To anybody else, it
simply won't matter anyway.

So, to get to an end now, as I really need to get some sleep: where do
we start?

- a git tree might be very helpful in the beginning, separating, in
  branches, the self-contained source code from the kbuild part that may
  intersect with diverging modifications in different patchsets/vendor
  sources.

- next we could adapt, in branches forking off of the vanilla kbuild
  branch, the kbuild-related parts to different distro kernels, maybe
  even old versions. Troublesome are things like changing APIs, but that
  can be taken care of and has been in the past.

- once we get a source repo that takes into account several
  distro-patched kernels, we can generate patches with git against those
  kernel sources, build binary packages, and maybe even binary modules
  as separate packages for minimal installation effort.

Maybe I am a bit too optimistic estimating the amount of work required
for this, but seeing a pretty stable (and self-contained!) code base
being torn appart to satisfy some obscure need for generalization, which
might even yield _no approach towards inclusion_ nonetheless, just makes
me feel sick. I personally don't care about new semantics as long as
they are absolutely backwards-compatible, like test ! -d on a file that
has file/.../metadata stuff still returns true for instance. But the
core fs, disk layout etc. are stable AFAICS, so screw politics and get
the job done ; ) New features will come with mount options only, anyway.

So, what do you all say?

Nighty-night,
Chris

--
committee: too many arguments to function

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iQIVAwUBRM0086nY3eLOiwZcAQrcfA/+PwpGbtSIW8CG8tSn9KvyXoe2mxIlH3bC
RGeF4wT43QFZicskjah93EWRs7eZtt2b/XLn0RM34YSFz3pFJpe1bLa4LVV/f1VB
D2HkI0j+Gd8Le7SoJ1BafacllG4NnM+iD+OKvePcJ9IIrz85Lnh5U5rEpmQqMU0c
nibBtqd6tfkF3/jBML1KEN+45aQMex8VwtjdwKpu3o0cpnR5AmyXk8h4rPtNNlzS
uI3ITLgFzcjor8n62pvcUf/19GRMHIIA1ASEweIQlTveLtugy4NIqiuVpTEr5aza
qTISfllO3//dVfjv/EL6gGGg2oLpowOCbdKR41msQbuQhUBhZqL52WCqRtQS/WGq
LKukRxiiUxCaKweta52dNeHx4y3TBny4uEXoKde7SycbpXDtf0kLAMKadpziE2qT
PHV4JBmyAVhROu7zH88d+yitQjMdf7gjvVnySxyGO9tCue6cn0WOyFjtYwMlZ5go
ER316Ko7QPR3ymCyA6ivN5Z1NKJ+rFDiGa/naDeIGhe3mXX2O6FWQBiaLth5BcKE
oThfzgOF+e0XholJxtwjDZw+AnZYOQG+xpTJGapgBPvcWJ4f90siwsIX0PqU0Xz/
0PLLRDqaV+fjvpVvv/MsdH9gRZrkvsU5DmF4au3+cDHMtOXWfp5kOcSKvwdwClc7
mbjdGVWyNic=
=7zT5
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--

