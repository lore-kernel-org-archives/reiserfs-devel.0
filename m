From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: 2.6.23-mm1: BUG in reiserfs_delete_xattrs
Date: Mon, 15 Oct 2007 22:06:04 +0200
Message-ID: <4713C82C.7020609@free.fr>
References: <20071011213126.cf92efb7.akpm@linux-foundation.org> <47129992.4040903@free.fr> <20071015084052.GA21870@infradead.org> <4713B1E7.2010504@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4713B1E7.2010504@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <haveblue@us.ibm.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

Le 15.10.2007 20:31, Jeff Mahoney a =E9crit :
> Christoph Hellwig wrote:
>> On Mon, Oct 15, 2007 at 12:34:58AM +0200, Laurent Riffard wrote:
>>> reiserfs_delete_xattrs
>>> reiserfs_delete_inode
>>> generic_delete_inode
>>> generic_drop_inode
>>> iput
>>> do_unlinkat
>>> sys_unlink
>>> sys_enter_past_esp
>>>
>>> I reported a similar BUG in 2.6.22-rc8-mm2 (see
>>> http://lkml.org/lkml/2007/9/27/235). Dave Hansen sent a patch for i=
t, I
>>> tested it and it was OK for 2.6.22-rc8-mm2.
>>>
>>> I tried this patch on 2.6.23-mm1, and it fixed the BUGs here too.
>> The delete path is a similar case as the one Dave fixed, also cause =
by
>> a NULL vfsmount passed to dentry_open, but through a different code-=
path.
>>
>> Untested fix for this problem below:
>=20
> Here's a patch I worked up the other night that kills off struct file
> completely from the xattr code. I've tested it locally.

Sorry Jeff, your patch does not apply on 2.6.23-mm1. The 'struct file'
removal from reiserfs_xattr_ function is already in -mm
(make-reiserfs-stop-using-struct-file-for-internal.patch).

The Dave's patch I was refering to is this one:=20

=3D=3D=3D=3D BEGIN =3D=3D=3D=3D=3D
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
=3D=3D=3D=3D END =3D=3D=3D=3D

Dave sent it privately to me... I guess this "bandaid" is no longer
needed now, is it?

~~
laurent

-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
