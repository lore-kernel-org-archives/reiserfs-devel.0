From: "Enric Ramos" <eramos@atlasit.com>
Subject: RE: Problem with ReiserFS + NFS + Convolo
Date: Tue, 17 Jun 2003 13:08:35 +0200
Message-ID: <9985D86E48B29B40BABD3B4A177F692626811D@atlassrv.int.atlassolutions.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14579-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Oleg Drokin <green@namesys.com>
Cc: =?iso-8859-1?Q?Oscar_Garc=EDa?= <ogarcia@atlasit.com>, reiserfs-list@namesys.com


Oleg -

Thnks :-)
We will tell you something.

Regards.

Enric Ramos Mas
Atlas Internet Solutions
Telf: +34 934 452 461 - Fax: +34 934 452 145
e-mail: eramos@atlasit.com
http://www.atlassolutions.net

*
La informaci=F3n transmitida en este mensaje es CONFIDENCIAL y est=E1 =
dirigida =FAnicamente al destinatario del mensaje arriba indicado. No =
puede ser transmitida ni revelada a persona distinta del destinatario =
sin autorizaci=F3n expresa del remitente.
La recepci=F3n de este mensaje, por cualquier causa, por persona =
distinta al destinatario del mismo no le autoriza para hacer uso alguno =
de la informaci=F3n. En este caso queda prohibida, y puede ser =
il=EDcita, cualquier divulgaci=F3n, copia, distribuci=F3n y/o cualquier =
uso de la informaci=F3n. Le rogamos borre inmediatamente el mensaje de =
su sistema y, en su caso, todas las copias del mismo y lo notifique al =
remitente. Gracias.


-----Mensaje original-----
De: Oleg Drokin [mailto:green@namesys.com]=20
Enviado el: martes, 17 de junio de 2003 13:00
Para: Enric Ramos
CC: Oscar Garc=EDa; reiserfs-list@namesys.com
Asunto: Re: Problem with ReiserFS + NFS + Convolo

Hello!

On Mon, Jun 16, 2003 at 07:36:25PM +0200, Enric Ramos wrote:

> In this way... is it possible to make a patch for the 2.4.18 release =
in order to solve the "iget() race bug" ? Do you know if this patch =
exists for this release ?

Ok, here is the backport.

Bye,
    Oleg
diff -u fs/reiserfs/inode.c.orig fs/reiserfs/inode.c
--- fs/reiserfs/inode.c.orig	2003-06-17 14:47:57.000000000 +0400
+++ fs/reiserfs/inode.c	2003-06-17 14:54:23.000000000 +0400
@@ -19,6 +19,10 @@
=20
 static int reiserfs_get_block (struct inode * inode, long block,
 			       struct buffer_head * bh_result, int create);
+/* This spinlock guards inode pkey in private part of inode
+   against race between find_actor() vs reiserfs_read_inode2 */
+static spinlock_t keycopy_lock =3D SPIN_LOCK_UNLOCKED;
+
 //
 // initially this function was derived from minix or ext2's analog and
 // evolved as the prototype did
@@ -890,8 +894,9 @@
     bh =3D PATH_PLAST_BUFFER (path);
     ih =3D PATH_PITEM_HEAD (path);
=20
-
+    spin_lock(&keycopy_lock);
     copy_key (INODE_PKEY (inode), &(ih->ih_key));
+    spin_unlock(&keycopy_lock);
     inode->i_blksize =3D PAGE_SIZE;
=20
     INIT_LIST_HEAD(&inode->u.reiserfs_i.i_prealloc_list) ;
@@ -1204,10 +1209,27 @@
 				unsigned long inode_no, void *opaque )
 {
     struct reiserfs_iget4_args *args;
+    int retval;
=20
     args =3D opaque;
+    /* We protect against possible parallel init_inode() on another CPU =
here. */
+    spin_lock(&keycopy_lock);
     /* args is already in CPU order */
-    return le32_to_cpu(INODE_PKEY(inode)->k_dir_id) =3D=3D args -> =
objectid;
+    if (le32_to_cpu(INODE_PKEY(inode)->k_dir_id) =3D=3D args -> =
objectid)
+	retval =3D 1;
+    else
+	/* If The key does not match, lets see if we are racing
+	   with another iget4, that already progressed so far
+	   to reiserfs_read_inode2() and was preempted in
+	   call to search_by_key(). The signs of that are:
+	     Inode is locked
+	     dirid and object id are zero (not yet initialized)*/
+	retval =3D (inode->i_state & I_LOCK) &&
+		 !INODE_PKEY(inode)->k_dir_id &&
+		 !INODE_PKEY(inode)->k_objectid;
+
+    spin_unlock(&keycopy_lock);
+    return retval;
 }
=20
 struct inode * reiserfs_iget (struct super_block * s, const struct =
cpu_key * key)
