From: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>
Subject: Re: git tree for reiser4 development
Date: Sun, 7 Nov 2010 21:56:36 +0100
Message-ID: <201011072156.36359.a.miskiewicz@gmail.com>
References: <201011071538.44063.a.miskiewicz@gmail.com> <201011071639.23764.a.miskiewicz@gmail.com> <4CD6CBDD.9020802@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=vC0dnIcTvSoLBWdpSq8nyF9p8sqGCsFeEq9tl3easK0=;
        b=k6q56pPEKNXbQkqGOF60bM4U8G0bw0uIN9VTIb7T49Javg++w9bCF/yNRaMEA672FR
         tOZw4TLGUsVz6obh22EPUUT739ubPM49UK54ymRO3Sp63zv63Km8ZxOnBc0IbJdwwpkZ
         O+wW0DQDrHAuhBTC1PPRKWZnUT0nOLg8iGJcE=
In-Reply-To: <4CD6CBDD.9020802@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="macroman"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Sunday 07 of November 2010, Edward Shishkin wrote:

> > Was looking for something newer - close to 2.6.36
>=20
> reiser4-for-2.6.36 stuff is not yet ready.

Dirty, untested change for .35 patch ... I assume "real" update needs m=
ore than this?

Index: kernel-reiser4.patch
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /cvsroot/packages/kernel/kernel-reiser4.patch,v
retrieving revision 1.13
retrieving revision 1.14
diff -u -u -r1.13 -r1.14
--- kernel-reiser4.patch	5 Aug 2010 19:52:26 -0000	1.13
+++ kernel-reiser4.patch	7 Nov 2010 18:25:45 -0000	1.14
@@ -40016,7 +40016,7 @@
 diff -urN linux-2.6.35.orig/fs/reiser4/plugin/inode_ops.c linux-2.6.35=
/fs/reiser4/plugin/inode_ops.c
 --- linux-2.6.35.orig/fs/reiser4/plugin/inode_ops.c	1970-01-01 01:00:0=
0.000000000 +0100
 +++ linux-2.6.35/fs/reiser4/plugin/inode_ops.c	2010-08-04 15:44:57.000=
000000 +0200
-@@ -0,0 +1,906 @@
+@@ -0,0 +1,916 @@
 +/*
 + * Copyright 2005 by Hans Reiser, licensing governed by reiser4/READM=
E
 + */
@@ -40479,9 +40479,19 @@
 +				return result;
 +			}
 +		}
-+		result =3D inode_setattr(inode, attr);
-+		if (!result)
++
++		if ((attr->ia_valid & ATTR_SIZE) &&
++		    attr->ia_size !=3D i_size_read(inode))
++			result =3D vmtruncate(inode, attr->ia_size);
++			if (result)
++				goto result_error;
++		setattr_copy(inode, attr);
++		mark_inode_dirty(inode);
++		result =3D 0;
++result_error:
++		if (!result) {
 +			reiser4_update_sd(inode);
++		}
 +	}
 +
 +	context_set_commit_async(ctx);
@@ -56458,7 +56468,7 @@
 +	.read =3D reiser4_read_careful,
 +	.write =3D reiser4_write_careful,
 +	.aio_read =3D generic_file_aio_read,
-+	.ioctl =3D reiser4_ioctl_careful,
++	.unlocked_ioctl =3D reiser4_ioctl_careful,
 +	.mmap =3D reiser4_mmap_careful,
 +	.open =3D reiser4_open_careful,
 +	.release =3D reiser4_release_careful,
@@ -65466,7 +65476,7 @@
 +
 +	truncate_inode_pages(&inode->i_data, 0);
 +	inode->i_blocks =3D 0;
-+	clear_inode(inode);
++	end_writeback(inode);
 +	reiser4_exit_context(ctx);
 +}
 +
@@ -65726,11 +65736,11 @@
 +	.alloc_inode =3D reiser4_alloc_inode,
 +	.destroy_inode =3D reiser4_destroy_inode,
 +	.dirty_inode =3D reiser4_dirty_inode,
-+	.delete_inode =3D reiser4_delete_inode,
++	.evict_inode =3D reiser4_delete_inode,
 +	.put_super =3D reiser4_put_super,
 +	.write_super =3D reiser4_write_super,
 +	.statfs =3D reiser4_statfs,
-+	.clear_inode =3D reiser4_clear_inode,
++//	.clear_inode =3D reiser4_clear_inode,
 +	.writeback_inodes =3D reiser4_writeback_inodes,
 +	.show_options =3D reiser4_show_options
 +};


>=20
> Thanks,
> Edward.


--=20
Arkadiusz Mi=C5=9Bkiewicz        PLD/Linux Team
arekm / maven.pl            http://ftp.pld-linux.org/
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
