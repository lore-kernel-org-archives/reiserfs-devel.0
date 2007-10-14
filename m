From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: 2.6.23-mm1: BUG in reiserfs_delete_xattrs
Date: Mon, 15 Oct 2007 00:34:58 +0200
Message-ID: <47129992.4040903@free.fr>
References: <20071011213126.cf92efb7.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20071011213126.cf92efb7.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <haveblue@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

Le 12.10.2007 06:31, Andrew Morton a =E9crit :
> ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.23/=
2.6.23-mm1/

/home is mounted with the following options:
   /dev/mapper/vglinux1-lvhome on /home type reiserfs (rw,noatime,nodir=
atime,user_xattr)

I guess that beagled (the Beagle desktop search daemon) has populated u=
ser
xattrs on almost all files. Now, when I delete a file, two BUGs occur
and the system hangs. Here is the stack for the first BUG (the second
one is very similar):

[partially hand copied stack]
_fput
fput
reiserfs_delete_xattrs
reiserfs_delete_inode
generic_delete_inode
generic_drop_inode
iput
do_unlinkat
sys_unlink
sys_enter_past_esp

I reported a similar BUG in 2.6.22-rc8-mm2 (see
http://lkml.org/lkml/2007/9/27/235). Dave Hansen sent a patch for it, I
tested it and it was OK for 2.6.22-rc8-mm2.

I tried this patch on 2.6.23-mm1, and it fixed the BUGs here too.

----
=46rom: Dave Hansen <haveblue@us.ibm.com>

The bug is caused by reiserfs creating a special 'struct file' with a
NULL vfsmount. =20

/* Opens a file pointer to the attribute associated with inode */
static struct file *open_xa_file(const struct inode *inode, const char
*name,
                                 int flags)
{
=2E..
        fp =3D dentry_open(xafile, NULL, O_RDWR);
        /* dentry_open dputs the dentry if it fails */


As Christoph just said, this is somewhat of a bandaid.  But, it
shouldn't hurt anything.

---

 lxc-dave/fs/file_table.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN fs/open.c~fix-reiserfs-oops fs/open.c
diff -puN fs/file_table.c~fix-reiserfs-oops fs/file_table.c
--- lxc/fs/file_table.c~fix-reiserfs-oops	2007-09-27 13:32:20.000000000=
 -0700
+++ lxc-dave/fs/file_table.c	2007-09-27 13:33:11.000000000 -0700
@@ -236,7 +236,7 @@ void fastcall __fput(struct file *file)
 	fops_put(file->f_op);
 	if (file->f_mode & FMODE_WRITE) {
 		put_write_access(inode);
-		if (!special_file(inode->i_mode))
+		if (!special_file(inode->i_mode) && mnt)
 			mnt_drop_write(mnt);
 	}
 	put_pid(file->f_owner.pid);
diff -puN include/linux/mount.h~fix-reiserfs-oops include/linux/mount.h
_


-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
