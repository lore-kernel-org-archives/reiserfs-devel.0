From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [Fwd: [PATCH] reiser4: fix a use after free bug in reiser4_parse_options]
Date: Mon, 22 Nov 2004 21:55:27 +0100
Message-ID: <41A2523F.2050201@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig9A2670EA19ADC06D65E3A39F"
Return-path: <reiserfs-list-return-22515-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>

--------------enig9A2670EA19ADC06D65E3A39F
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I posted this patch last week and nobody replied.

So, if there is no objections, Andrew please apply.

Thank you.

-------- Message original --------
Sujet: [PATCH] reiser4: fix a use after free bug in
reiser4_parse_options
Date: Thu, 18 Nov 2004 00:09:36 +0100
De: Laurent Riffard <laurent.riffard@free.fr>
Pour: reiserfs-list@namesys.com

This patch fix a "use after kfree" bug in reiser4_parse_options.

Signed-off-by: Laurent Riffard <laurent.riffard@free.fr>
---

diff -u linux-2.6-orig/fs/reiser4/vfs_ops.c
linux-2.6/fs/reiser4/vfs_ops.c
--- linux-2.6-orig/fs/reiser4/vfs_ops.c	2004-11-17
23:43:22.186242952 +0100
+++ linux-2.6/fs/reiser4/vfs_ops.c	2004-11-17 23:39:15.935678728 +0100
@@ -1060,8 +1060,6 @@
  	});
  #endif

-	kfree(opts);
-
  	sbinfo->tmgr.atom_max_size = txnmgr_get_max_atom_size(s);
  	sbinfo->tmgr.atom_max_age = REISER4_ATOM_MAX_AGE / HZ;
  	sbinfo->tmgr.atom_max_flushers = ATOM_MAX_FLUSHERS;
@@ -1089,6 +1087,9 @@
  	sbinfo->ra_params.flags = 0;

  	result = parse_options(opt_string, opts, p - opts);
+
+	kfree(opts);
+
  	if (result != 0)
  		return result;


-- 
laurent


--------------enig9A2670EA19ADC06D65E3A39F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFBolJMUqUFrirTu6IRAiGRAKC/6WpRwYLztijGFQ6e1nNGLKKkFgCgmw8A
I3cyEI5JMyWKb+hHnXDeNzA=
=JJZT
-----END PGP SIGNATURE-----

--------------enig9A2670EA19ADC06D65E3A39F--
