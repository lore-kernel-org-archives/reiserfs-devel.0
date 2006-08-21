From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Is as_ops.c releasepage patch still needed?
Date: Mon, 21 Aug 2006 12:49:58 -0600
Message-ID: <1156186198.10806.5.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-O5eUQl+F5hOd8Xi19bcR"
Return-path: <reiserfs-list-return-29638-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-O5eUQl+F5hOd8Xi19bcR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The following patch was posted to the Reiser4 list August 3 by zam.  Is
it still needed?  It solved many problems for me, making my systems able
to actually complete full Beagle indexing.

But I have not seen this patch show up in the last two mm kernel
releases.  Did something else fix it or is this patch still needed?


Index: linux-2.6-git/fs/reiser4/as_ops.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6-git.orig/fs/reiser4/as_ops.c
+++ linux-2.6-git/fs/reiser4/as_ops.c
@@ -350,6 +350,11 @@ int reiser4_releasepage(struct page *pag
        if (PageDirty(page))
                return 0;

+       /* extra page reference is used by reiser4 to protect
+        * jnode<->page link from this ->releasepage(). */
+       if (page_count(page) > 3)
+               return 0;
+
        /* releasable() needs jnode lock, because it looks at the jnode fie=
lds
         * and we need jload_lock here to avoid races with jload(). */
        spin_lock_jnode(node);

--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-O5eUQl+F5hOd8Xi19bcR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBE6gBWG8fHaOLTWwgRAtYsAJ9izlStDdoM/JqJTDDYq6Q1ITF7SgCgkp4P
melU4PW9GYfYPdh3aqeQnQc=
=N15C
-----END PGP SIGNATURE-----

--=-O5eUQl+F5hOd8Xi19bcR--

