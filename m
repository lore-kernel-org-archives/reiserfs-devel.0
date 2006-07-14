From: rvalles <rvalles@es.gnu.org>
Subject: Re: short term task list for Reiser4
Date: Fri, 14 Jul 2006 07:26:01 +0200
Message-ID: <46954.6123910279$1152854788@news.gmane.org>
References: <44B42064.4070802@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <reiserfs-list-return-28997-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <44B42064.4070802@namesys.com>
Sender: <rvalles@eww.ath.cx.>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2006 at 03:04:20PM -0700, Hans Reiser wrote:
> Please feel free to comment on this list and the order of its tasks:
> 4) review complaints of pauses while using reiser4 --- size of task
> unknown, and it is also unknown how much we may have fixed it while
> writing recent patches.
>
> 6) optimize fsync --- substantive task which requires using fixed area
> for write twice logging, and using write twice logging for fsync'd
> data.  It might require creating mount options to choose whether to
> optimize for serialized sequential fsyncs vs. lazy fsyncs.
>=20
I believe those two are related. I'm having the "pauses" (of many
minutes at times!) when writing to reiser4. It seems it is triggered
mostly by the use of fsync(); NFS in sync mode manages to trigger it
way often: I mount my old desktop's home from my new computer via synced
NFS.
The pauses consist in the application being frozen and the other
applications being slowed down on their IO operations, while the disks
writes data continously during an interval that usually last a minute or
so, but may last many times that. It often happens with small files
(like, when sending a mail, as it passes through the MTA), so I believe
it probably (re)writes to disk lots of stuff that doesn't need to be
written to disk at all.
It only happens on reiser4 patches against 2.6.13 or newer, 2.6.12.x is
fine.
--=20
- Do you study theories? - Oh yes! Theories are fun. - How do you use them?=
 - When I must act, theories are too slow. To act, I must know.

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFEtyrpfwaXC2yIZd8RAkxGAJ0UEit3hWhyYzBNM/+Wvk8ZNgWwlwCcC4yf
Yxs0IsqYhnNziIau3DRcDAY=
=YvlG
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
