From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: BUG on reiser4_delete_inode
Date: Sat, 06 May 2006 07:51:50 +0200
Message-ID: <445C3976.6090007@free.fr>
References: <445A623F.6090409@free.fr>            <1146836304.6254.26.camel@tribesman.namesys.com>            <445B836F.2000702@free.fr> <20060505183245.5243.qmail@pv105234.reshsg.uci.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigB350611676AA99A73354ED93"
Return-path: <reiserfs-list-return-28572-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060505183245.5243.qmail@pv105234.reshsg.uci.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Joe Feise <jfeise@feise.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

--------------enigB350611676AA99A73354ED93
Content-Type: multipart/mixed;
 boundary="------------030109000007010003050603"

This is a multi-part message in MIME format.
--------------030109000007010003050603
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le 05.05.2006 20:32, Joe Feise a =C3=A9crit :
> The patch doesn't seem to have made it to the list. I have run into the=

> same problem...
> -Joe

Vladimir's mail never reached the list despite the fact it was CC'ed to.

Here is the patch that Vladimir sent.=20
~~
laurent



--------------030109000007010003050603
Content-Type: text/x-patch;
 name="reiser4-radix-tree-direct-data-fix.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="reiser4-radix-tree-direct-data-fix.patch"

Date: Fri, 05 May 2006 17:38:21 +0400
Subject: No Subject
Message-Id: <1146836301.6254.25.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
From:=20

From: Vladimir Saveliev <vs@namesys.com>

Reiser4 used to check radix tree emptiness by comparing tree height again=
st 0.
With radix-tree-direct-data.patch not empty tree can have zero height.
This patch makes reiser4 to check tree emptiness using tree root.

Signed-off-by: Vladimir V. Saveliev <vs@namesys.com>


 fs/reiser4/jnode.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -puN fs/reiser4/jnode.c~reiser4-radix-tree-direct-data-fix fs/reiser=
4/jnode.c
--- linux-2.6.17-rc2-mm1/fs/reiser4/jnode.c~reiser4-radix-tree-direct-dat=
a-fix	2006-05-05 13:53:47.000000000 +0400
+++ linux-2.6.17-rc2-mm1-vs/fs/reiser4/jnode.c	2006-05-05 13:54:49.000000=
000 +0400
@@ -432,7 +432,7 @@ static void inode_attach_jnode(jnode * n
 	inode =3D node->key.j.mapping->host;
 	info =3D reiser4_inode_data(inode);
 	rtree =3D jnode_tree_by_reiser4_inode(info);
-	if (rtree->height =3D=3D 0) {
+	if (rtree->height =3D=3D 0 && rtree->rnode =3D=3D NULL) {
 		/* prevent inode from being pruned when it has jnodes attached
 		   to it */
 		write_lock_irq(&inode->i_data.tree_lock);

_

--------------030109000007010003050603--

--------------enigB350611676AA99A73354ED93
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEXDmHUqUFrirTu6IRAlXRAJ4t1EJ7kSxs+zsryafEBIELgRf8TwCbBS5z
WU43ZDTJ3og2gn84rovjIAo=
=2kDZ
-----END PGP SIGNATURE-----

--------------enigB350611676AA99A73354ED93--
