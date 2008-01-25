From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for 2.6.24
Date: Fri, 25 Jan 2008 15:13:13 +0300
Message-ID: <4799D259.3020104@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050009060408050100000907"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------050009060408050100000907
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

http://chichkin_i.zelnet.ru/namesys/reiser4-for-2.6.24.patch.gz

The same as reiser4-for-2.6.23-3 plus the following -mm stuff:
reiser4-fix-null-pointer-dereference-in-sys_truncate64.patch
reiser4-new-export-ops.patch
reiser4-drop-size-argument-from-bio_endio-and-bi_end_io.patch (from 
Laurent Riffard)

Thanks,
Edward.

--------------050009060408050100000907
Content-Type: text/plain;
 name="reiser4-for-2.6.24.patch.gz.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-for-2.6.24.patch.gz.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBHmc1G7tCFoSvInRoRAiGlAKCCD/uzTKWN6pdPr9PgHZbEIA4j8wCgiwnB
YSG0tgkb6RA8HKBZL3CJbAY=
=qtdO
-----END PGP SIGNATURE-----

--------------050009060408050100000907--
