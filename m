From: "Lamont R. Peterson" <lamont@gurulabs.com>
Subject: RE: How to set a reiserfs partition to get an occasional fsck?
Date: Sat, 31 Jan 2004 00:29:16 -0700
Message-ID: <1075534156.2317.62.camel@wraith.advansoft.us>
References: <3DF9165145FACB4C96977FF650C1E904096336DD@its-mail1.its.corp.gwl.com>
Reply-To: lamont@gurulabs.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ufymd7ZT5TLEolqFevQq"
Return-path: <reiserfs-list-return-16667-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF9165145FACB4C96977FF650C1E904096336DD@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-ufymd7ZT5TLEolqFevQq
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-01-30 at 09:31, Burnes, James wrote:
[SNIP]
> After days of spare time work on this machine I finally opened it up and
> looked around.  Nothing obvious, so I threw up my hands and just
> re-seated the SIMM modules.

SIMMs??  Really?  I have a couple of old machines at home that only have
SIMM slots, but otherwise, I have not seen SIMMs in a long long time.=20
You meant DIMMs, right?

> One more time re-installing Slackware and I did a kernel compile.  No
> problems.  Completely stable.  I wrote a script that did nothing but run
> kernel compiles for 5 hours straight.  Still stable.  Everything fine.
> So strange.  The SIMM modules seemed to be tightly seated.  Maybe
> corrosion?

Memory problems could rightfully be blamed for many problems that are
encountered.

[SNIP]
> Hans and crew: I'm still not sure what kind of memory operations crash
> out the marginal SIMMs.  Have you isolated them?  Could you reproduce
> it?  It would be interesting if you could write a small utility that
> stresses RAM in the same way that Reiser stresses it.  That way there
> would be no suprises and it could be run as a pre-install package before
> Reiser is installed.  Something like:

Reading your story above, I would not jump to the conclusion that the
load using ReiserFS places on the CPU would manifest consistent
crashes.  I think you hit on the real problem, your RAM.  Remember,
kernel compilation causes the CPU to work hard and requires lots of
RAM.  I do not believe that ReiserFS being involved contributed
*ANYTHING* to cause the crashes that you experienced.

Frankly, I am frustrated when people imply that ReiserFS is faulty
because they were using that filesystem when they experienced a
problem.  This happens far too much out there.  ReiserFS is not perfect,
nor is it the destabilizing component that many people try to make it
out to be.

Please, do not take this personally.  I do not believe it was your
intention to spread such innuendo.

> YOU ARE ABOUT TO INSTALL REISERFS!  THIS IS A RELIABLE AND HIGH
> PERFORMANCE ACCELERATED FILE SYSTEM.  IT DEPENDS ON HIGH QUALITY RAM
> CORRECTLY SEATED ON YOUR MOTHERBOARD.  WOULD YOU LIKE TO TEST YOUR RAM
> MODULES BEFORE YOU INSTALL IT? (Y/N) Y<cr>
>=20
> TESTING: PATTERN TEST 1....PATTERN TEST 2.....DMA TEST.....etc
>=20
> Your RAM passed the stress testing -- proceed.
>=20
> Or=20
>=20
> ERROR: Detected periodic faults in CPU mediated block transfers.
>        Detected periodic faults in microcoded block transfers.
>        Detected periodic faults in memory to I/O DMA transfers.
>=20
> ** Your system memory is faulty.  Suggest you re-seat the modules, clean
> module connectors or replace your memory with higher quality modules. **

This would definitely be a mistake.  Even if there was any truth to it
as far as ReiserFS is concerned (which I think there is not), there is
no good reason to add something into the process that would scare off
those who are not "in-the-know" about memory problems.

> This way there would be no suprises.  Reiser (and especially Reiser4)
> uses deep magick.  That comes at a price. I remember a test of various
> journaling file systems a while back.  They measured a lot of things,
> but seemed to really focus on speed vs CPU consumed.
>=20
> Reiser3 and 4 consumed more CPU than the average file system so it was
> rated low in the standings.  But what was really interesting was what
> they didn't mention.  Over in the corner of the chart Reiser had
> completed nearly all the tests before any other file system. ;-)

Very good point.  There seems to be a tendency to impugn ReiserFS
unduly.  For me, I would be perfectly happy to trade such a small
percentage of compute cycles (which no one uses all the time, anyway)
for such a large improvement in overall system performance.=20

> Reiser, the accelerated file system.  It comes at a price.  I wouldn't
> use it on a PDA ;-)

It is not that much CPU time, but on a PDA the filesystem performance
will be affected more by RAM speed (there is no hard drive) than CPU
overhead (once again, no one uses all those cycles all the time).=20
However, I would probably not use ReiserFS on a PDA because of the
amount of the already limited storage space that would be used up by
it's fixed overhead.  Just like I would not create a 20MB /boot
partition using ReiserFS.
--=20
Lamont Peterson <lamont@gurulabs.com>
Senior Instructor
Guru Labs <http://www.gurulabs.com/>

--=-ufymd7ZT5TLEolqFevQq
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAG1lMRK8Q4zt1QRURAqH+AJ4qNZIAGC0kfwudbQihkLTl81FNfwCfSO0P
jWjQxg8LXRpR08zX6FFfZz8=
=Lji0
-----END PGP SIGNATURE-----

--=-ufymd7ZT5TLEolqFevQq--

