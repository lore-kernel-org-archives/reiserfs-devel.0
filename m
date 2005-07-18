From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 0/5] reiserfs: moving towards better error handling
Date: Mon, 18 Jul 2005 13:41:00 -0400
Message-ID: <20050718174100.GA23337@locomotive.unixthugs.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <reiserfs-list-return-25180-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hey all -

There was a thread recently addressing the lack of better error handling
in reiserfs. The following series of patches attempts to address it.

I'll post the following 5 patches. The first three are kind of cleanups, ju=
st
making things more consistent. The final two start to implement the actual
error handling and haven't received much testing yet.

* 01-reiserfs-consistent-msgs.diff
  - Makes the reiserfs output messages more consistent with respect to
    each other and other Linux filesystems. This really just consists
    of changing the prefix that gets printed before a warning, info, panic,
    etc.
* 02-reiserfs-info.diff
  - A few messages that are currently printed as warnings aren't. This patch
    changes them to be informational notices.
* 03-reiserfs-warning.diff
  - This patch makes the warning messages more consistent. Hans as specified
    every warning should have a unique ID associated with it, so the
    patch adds a parameter for it. The function name will also be included
    in every warning. In instances where the device name was printed, it
    has been removed since the reiserfs warning message prefix includes it.
* 04-reiserfs-error-1.diff
  - This patch adds a reiserfs_error() function to handle non-journal error=
s.
  - FOR TESTING ONLY
* 05-reiserfs-error-2.diff
  - This patch changes a number of warnings to errors, such as where metada=
ta
    i/o errors occur.
  - FOR TESTING ONLY

  Comments welcome.

  -Jeff

--=20
Jeff Mahoney
SuSE Labs

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFC2+mrLPWxlyuTD7IRAhkyAKCJrMbzsHUwW3eTphBRMFKdYGa7HwCcC2Ag
9Ma7wZMMgP71yjQOe/eKsLA=
=FHRS
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
