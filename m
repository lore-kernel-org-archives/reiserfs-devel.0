From: rvalles <rvalles@es.gnu.org>
Subject: Trouble with 2.6.13.4-reiser4-4
Date: Tue, 1 Nov 2005 02:55:51 +0100
Message-ID: <41056.7274936058$1130810261@news.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <reiserfs-list-return-26748-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
Sender: <tux@148.Red-217-126-33.pooles.rima-tde.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I've been using reiser4 for a while (since last december). Recently,
I've upgraded from 2.6.12 to 2.6.13.4 patched with the reiser4 -4 patch
available on the namesys ftp.
For some reason, since using this kernel, every now and then the
filesystem hits the disk really hard for 15 seconds or so blocking IO
for a program or two (I guess those that triggered the problem) and
slowing down IO seriously for others. It may be triggered by something
as easy as pasting some text from firefox to a xterm running vim, and
the text won't get pasted until the HD hitting ends.
Just in case, I've booted a recent knoppix and ran the most recent fsck
(thank you unionfs and apt-get) on the partition. It fixed some little
stuff extents-related that didn't look serious at all. It didn't fix
this, tho.
Maybe it's worth noting that there are no reiser4 related errors or
warnings, nor IO related, on syslog.
I can provide more debug-related information on request. I'm looking
forward for a patch against plain 2.6.14 (not -mm, that breaks stuff I
need and is by itself far too unstable for my taste) to see if it fixes
anything, too.
Cheers.

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDZssnrD81VR3MDtoRAhGjAJ0aPF/i+1Tz559/LOGSXUXfkavrHwCbBo57
o88k+aSn1yMfTbSGwsEG54U=
=r7Aj
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
