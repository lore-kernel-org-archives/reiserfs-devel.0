From: =?UTF-8?B?TGFzc2UgS8Okcmtrw6RpbmVuIC8gVHJvbmlj?= <tronic2@sci.fi>
Subject: capture_anonymous_page
Date: Fri, 29 Oct 2004 22:14:01 +0300
Message-ID: <41829679.2010808@sci.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig938D82BEDC791D2567BBD8B0"
Return-path: <reiserfs-list-return-22216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------enig938D82BEDC791D2567BBD8B0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Posting here, as requested by nikita:

reiser4[pdflush(27198)]: capture_anonymous_page 
(fs/reiser4/plugin/file/file.c:999)[nikita-3329]:
WARNING: Cannot capture anon page: -28
reiser4[pdflush(27198)]: capture_anonymous_pages 
(fs/reiser4/plugin/file/file.c:1058)[vs-1454]:
WARNING: failed for moved page: result=-28 (captured=0)

I'm getting lots of those in my kernel log. The filesystem (which is 
root) was fsck'ed a few days ago and there have been no dirty reboots 
since then. I've been using it in normal desktop/Gentoo setup, not 
benchmarking nor doing anything special.

Running 2.6.9-cko2.

- Tronic -


--------------enig938D82BEDC791D2567BBD8B0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBgpZ5OBbAI1NE8/ERAqm8AJ9UAliuBIaTycwT9eAQE2zGZGN78gCgmpJM
kLniuzcL3D0DKpS87rSJY/U=
=Smd5
-----END PGP SIGNATURE-----

--------------enig938D82BEDC791D2567BBD8B0--
