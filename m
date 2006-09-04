From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Need help retrieving data
Date: Mon, 4 Sep 2006 17:56:28 +0400
Message-ID: <200609041756.28694.vs@namesys.com>
References: <44EDE55E.7030106@comcast.net> <6110980.post@talk.nabble.com> <200609021526.05313.zam@namesys.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_MCD/Egxi8y24Spy"
Return-path: <reiserfs-list-return-29798-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609021526.05313.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Alexander Zarochentsev <zam@namesys.com>, Alex Efros <powerman-asdf@yandex.ru>

--Boundary-00=_MCD/Egxi8y24Spy
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello

On Saturday 02 September 2006 15:26, Alexander Zarochentsev wrote:
> On 2 September 2006 13:32, Alex Efros wrote:
> > Hi!
> >
> > So, I did everything correctly to fix it? --rebuild-tree doesn't
> > broke anything?
>
> usually not.
>
> but reiserfsck --rebuild-tree is a complex operation. It has a possibility
> to insert wrong blocks into the tree if your fs was used to store another
> reiserfs image. and you have a chance to hit new reiserfsck bug.
>
> > > unfortunately no fix for fsck is available yet.

I think it is not fsck bug. When hash code is unknown - it can be defined o=
n=20
mount. The attached patch is supposed to fix broken hash detection.

> >
> > If you provide fixed reiserfsck version, I can run it on my image to
> > test it and confirm image become mountabe after --rebuild-sb. But I
> > can't leave this 3GB image on my drive for months, so if you wish
>
> to make the partition mountable again it is enough to change
> one byte in the super block from 0 (hash is not set) to 3 (r5 hash).
> It can be done by a hex editor.
>
> hexdump -C of block #16 (reiserfs uses 4k-size blocks, numbers start with
> 0):
>
> ...
> 00000030  06 00 01 00 52 65 49 73  45 72 32 46 73 00 00 00=20
> |....ReIsEr2Fs...| 00000040  03 00 00 00 05 00 c6 04  02 00 00 00 89 28 00
> 00  |......=C6.....=89(..| ^^
>           this byte.
> ...
>
> according with:
>
> struct reiserfs_super_block_v1 {
> ...
>         char s_magic[10];       /* reiserfs magic string indicates that
>                                  * file system is reiserfs:
>                                  * "ReIsErFs" or "ReIsEr2Fs" or "ReIsEr3F=
s"
> */ __le16 s_fs_state;      /* it is set to used by fsck to mark which *
> phase of rebuilding is done */
>         __le32 s_hash_function_code;    /* indicate, what hash function is
> being use ...
>
> > this testing from me - please provide fixed version in about 7-10
> >
> > days or at least notify me when it will be ready - if your need more
> > time I probably move it to DVD-RW.
>
> I already have a broken fs to experiment with.

--Boundary-00=_MCD/Egxi8y24Spy
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiserfs-fix-fill_super.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfs-fix-fill_super.patch"


diff -puN fs/reiserfs/super.c~reiserfs-fix-fill_super fs/reiserfs/super.c
--- linux-2.6.18-rc4-mm1/fs/reiserfs/super.c~reiserfs-fix-fill_super	2006-09-01 21:13:02.000000000 +0400
+++ linux-2.6.18-rc4-mm1-vs/fs/reiserfs/super.c	2006-09-03 11:33:12.000000000 +0400
@@ -1384,7 +1384,7 @@ static __u32 find_hash_out(struct super_
 	do {			// Some serious "goto"-hater was there ;)
 		u32 teahash, r5hash, yurahash;
 
-		make_cpu_key(&key, inode, ~0, TYPE_DIRENTRY, 3);
+		make_cpu_key(&key, inode, LLONG_MAX, TYPE_DIRENTRY, 3);
 		retval = search_by_entry_key(s, &key, &path, &de);
 		if (retval == IO_ERROR) {
 			pathrelse(&path);
@@ -1549,7 +1549,7 @@ static int reiserfs_fill_super(struct su
 	struct reiserfs_super_block *rs;
 	char *jdev_name;
 	struct reiserfs_sb_info *sbi;
-	int errval = -EINVAL;
+	int errval;
 
 	sbi = kmalloc(sizeof(struct reiserfs_sb_info), GFP_KERNEL);
 	if (!sbi) {
@@ -1576,12 +1576,14 @@ static int reiserfs_fill_super(struct su
 	if (reiserfs_parse_options
 	    (s, (char *)data, &(sbi->s_mount_opt), &blocks, &jdev_name,
 	     &commit_max_age) == 0) {
+		errval = -EINVAL;
 		goto error;
 	}
 
 	if (blocks) {
 		SWARN(silent, s, "jmacd-7: reiserfs_fill_super: resize option "
 		      "for remount only");
+		errval = -EINVAL;
 		goto error;
 	}
 
@@ -1593,6 +1595,7 @@ static int reiserfs_fill_super(struct su
 		SWARN(silent, s,
 		      "sh-2021: reiserfs_fill_super: can not find reiserfs on %s",
 		      reiserfs_bdevname(s));
+		errval = -EINVAL;
 		goto error;
 	}
 
@@ -1610,6 +1613,7 @@ static int reiserfs_fill_super(struct su
 		      "You may need to run fsck or increase size of your LVM partition");
 		SWARN(silent, s,
 		      "Or may be you forgot to reboot after fdisk when it told you to");
+		errval = -EINVAL;
 		goto error;
 	}
 
@@ -1649,6 +1653,7 @@ static int reiserfs_fill_super(struct su
 	if (journal_init(s, jdev_name, old_format, commit_max_age)) {
 		SWARN(silent, s,
 		      "sh-2022: reiserfs_fill_super: unable to initialize journal space");
+		errval = -ENODEV;
 		goto error;
 	} else {
 		jinit_done = 1;	/* once this is set, journal_release must be called
@@ -1658,11 +1663,14 @@ static int reiserfs_fill_super(struct su
 	if (reread_meta_blocks(s)) {
 		SWARN(silent, s,
 		      "jmacd-9: reiserfs_fill_super: unable to reread meta blocks after journal init");
+		errval = -ENODEV;
 		goto error;
 	}
 
-	if (replay_only(s))
+	if (replay_only(s)) {
+		errval = -EINVAL;
 		goto error;
+	}
 
 	if (bdev_read_only(s->s_bdev) && !(s->s_flags & MS_RDONLY)) {
 		SWARN(silent, s,
@@ -1677,6 +1685,7 @@ static int reiserfs_fill_super(struct su
 	if (!root_inode) {
 		SWARN(silent, s,
 		      "jmacd-10: reiserfs_fill_super: get root inode failed");
+		errval = -ENODEV;
 		goto error;
 	}
 
@@ -1688,6 +1697,7 @@ static int reiserfs_fill_super(struct su
 	s->s_root = d_alloc_root(root_inode);
 	if (!s->s_root) {
 		iput(root_inode);
+		errval = -ENOMEM;
 		goto error;
 	}
 	// define and initialize hash function
@@ -1695,6 +1705,7 @@ static int reiserfs_fill_super(struct su
 	if (sbi->s_hash_function == NULL) {
 		dput(s->s_root);
 		s->s_root = NULL;
+		errval = -ENODEV;
 		goto error;
 	}
 

_

--Boundary-00=_MCD/Egxi8y24Spy--
