From: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Subject: reiserfs tails and disk space
Date: Tue, 17 Jan 2006 12:15:49 -0600
Message-ID: <20060117181548.GB11010@untroubled.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <reiserfs-list-return-27769-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi.

I've been running a few tests with reiserfs and tails, and have been
unable to create a setup where the use (or lack) of tails results in a
significant difference in the amount of disk space used.

Here's what I've done:

1. Create a fresh 1GB filesystem (in a file on loopback), using reiserfs
with no options.

2. Mount the filesystem with either no options, "notail", "tails=3Doff",
"tails=3Don", or "tails=3Dsmall".

3. Unpack a sources tarball onto the filesystem, consisting of two fully
compiled versions of the linux kernel.  The tarball contains 47996 files
and 3321 directories totalling about 660MB of space.

4. Measure the free disk space using df.

5. Use dd to fill up the free disk space and count how many 1kB blocks
it could write.

In all of the tests, the result was within 12kB of each other.  In fact,
the tests with "notail" or "tails=3Doff" options had more usable disk
space than when using tails.

Results:

Options    1K-blocks    Used Available
default      1023964  645988  377976
notail       1023964  645988  377976
tails=3Doff    1023964  645996  377968
tails=3Don     1023964  646000  377964
tails=3Dsmall  1023964  645996  377968

default      377600+0 records out
notail       377600+0 records out
tails=3Doff    377592+0 records out
tails=3Don     377588+0 records out
tails=3Dsmall  377592+0 records out

I've put the log files and scripts up for review at
	http://untroubled.org/reiserfsdf/
I'm using Gentoo Linux, kernel 2.6.14-gentoo-r5

Am I missing something, is this an expected result, or is something
broken?

Thanks.
--=20
Bruce Guenter <bruce@untroubled.org> http://untroubled.org/
OpenPGP key: 699980E8 / D0B7 C8DD 365D A395 29DA  2E2A E96F B2DC 6999 80E8

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDzTRU6W+y3GmZgOgRAiT2AJ9eb3ylq8HsG8JRQUWG009tHtUOkQCghIUB
3/leQLil7rJdY2gmZwElmQ0=
=myd5
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
