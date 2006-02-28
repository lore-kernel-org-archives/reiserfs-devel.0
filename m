From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Plugin Patch (was Re: creating live virtual files by concatenation)
Date: Mon, 27 Feb 2006 22:24:16 -0800
Message-ID: <200602272224.19908.pvh@uvic.ca>
References: <1271316508.20060225153749@dns.toxicfilms.tv>
 <Pine.LNX.4.63.0602251736340.13659@cuia.boston.redhat.com>
 <44036470.8050305@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=nextPart2762861.Vmls878RHi;
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28149-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <44036470.8050305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart2762861.Vmls878RHi
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hans,

you've said that these kinds of plugins should be something a weekend warri=
or=20
could tackle. Our group had a real stab and dumped hundreds of man hours in=
to=20
the project with little effect. Admittedly, we were not experienced kernel=
=20
hackers, but we were all comfortable in low-level C and quite happy to read=
=20
source.

I request that a simple plugin be maintained as a standalone patch to Reise=
r4.=20

Ideally, there would be a small set of these plugins demonstrating how to=20
create a new plugin which operates within the existing disk structure, and=
=20
one that extends the on-disk format in a safe way.

This would allow interested parties to see in isolation what a Reiser4 plug=
in=20
looks like and would further provide a conceptual grappling point for the=20
development of a new plugin.

I have been getting requests for just such a plugin to be added to my reise=
r4=20
developer's wiki (http://pvh.ca/trac/wiki/reiser4) at a rate of about one=20
every two months. A few successful third-party plugins would hopefully=20
increase interest in this.

I realise you and your team are up to your necks in serious work on hardcor=
e=20
lowlevel material, but I believe a brief diversion of some of your resource=
s=20
would provide a significant reward.=20

Right now, the cost-of-entry appears to be set too high for developers outs=
ide=20
your team to approach the project.

If this information is already out there somewhere, great. I will integrate=
 it=20
in the R4DevWiki and answer questions as best I can. If anyone out there=20
disagrees with me about the current difficulty of producing even a simple=20
plugin, let them prove me wrong with a patch.

=2Dpvh

=2D-=20
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada

--nextPart2762861.Vmls878RHi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.1 (GNU/Linux)

iD8DBQBEA+yTdnKLARTlqzgRAsZ2AJ0a719u1p9DXZGIGP3q7f2r5GD8vQCdH6s4
T8npV/PIjsBcI85vkhKIvT4=
=3Xat
-----END PGP SIGNATURE-----

--nextPart2762861.Vmls878RHi--
