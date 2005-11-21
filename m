From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: More Slowdown or reiser4 update for 2.6.14-mm2
Date: Mon, 21 Nov 2005 22:51:05 +0000
Message-ID: <1132613465.7324.30.camel@teratron.lan.etheus.net>
References: <200511171447.41362.mail@earthworm.de>
	 <43820CAD.3090605@namesys.com> <200511211944.17942.mail@earthworm.de>
	 <200511212150.46418.mail@earthworm.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-X8k1w3XnWsjFU8LlMr39"
Return-path: <reiserfs-list-return-27059-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511212150.46418.mail@earthworm.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-X8k1w3XnWsjFU8LlMr39
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2005-11-21 at 21:50 +0100, Hesse, Christian wrote:
> On Monday 21 November 2005 19:44, Hesse, Christian wrote:
> > On Monday 21 November 2005 19:06, E.Gryaznova wrote:
> > > Unfortunately we are not able to reproduce this slowdown. Would you
> > > please provide more info?:
> > > Is this 2.6.14-mm2 bad sync/fsync performance reproducible on fresh
> > > created reiser4 too?

I have this problem on a vanilla 2.6.14 kernel patched with
reiser4-for-2.6.14-1. The kernel is also patched with suspend2 and
fbsplash.

The effect of the slowdown does not seem to noticeably affect the boot
up time of the system, though I have never timed it.
When using the system interactively, the hard drive makes a distinctly
different noise. It actually sounds similar to using Windows95 in safe
mode.

The time taken to perform a sync/fsync appears to not only depend on how
much data their is to commit to disk, but also depends on how much data
has been read from the disk since the last call.
Unfortunately I have temporarily stopped using the affected kernel for a
while as I have some important work to get out of the way.

At the time, it seemed like there was some form of cross-contamination
of the fs cache, where the amount of cached data seemed to affect the
overall performance especially during a sync.

One other thing is that I don't think all that head movement does hard
drives any good. A few bad blocks appeared after several days of heavy
thrashing. The data had to be transferred to another drive and
fsck.reiser4 fixed the breakage.

I was wondering if there are are debugging messages that could be of
use? I imagine it would be useful to have a function call trace with the
time spent in each function printed out for when a sync/fsync is called.
Is there an option/patch to enable this?

--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-X8k1w3XnWsjFU8LlMr39
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDgk9Z5OI9vmOoVqERAtDgAJ4u6N2262QCT6eQus/Ijv7jte52kgCg+qhf
yKKFe/E68ra6CSsDB0KtFMk=
=tySi
-----END PGP SIGNATURE-----

--=-X8k1w3XnWsjFU8LlMr39--

