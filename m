From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: 2.6.0-test6 crash while reading files in /proc/fs/reiserfs/sda1
Date: Wed, 1 Oct 2003 21:54:44 +0400
Message-ID: <16251.5348.570797.101912@laputa.namesys.com>
References: <1064936688.4222.14.camel@localhost.localdomain>
	<200309302006.32584.vitaly@namesys.com>
	<1065019441.4226.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1065019441.4226.1.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zan Lynx <zlynx@acm.org>
Cc: viro@parcelfarce.linux.theplanet.co.uk, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Zan Lynx writes:
 > On Tue, 2003-09-30 at 10:06, Vitaly Fertman wrote:
 > > Hi
 > > 
 > > On Tuesday 30 September 2003 19:44, Zan Lynx wrote:
 > > > I was interested in the contents of the files in /proc/fs/reiserfs/sda1,
 > > > so I did these commands:
 > > >
 > > > cd /proc/fs/reiserfs/sda1
 > > > grep . *
 > > >
 > > > (I like using the grep . * because it labels the contents of each file
 > > > with the filename.)
 > > >
 > > > I did this as a regular user and also as root.  Both times the system
 > > > crashed and immediately rebooted.  I tried it again as root and the
 > > > system froze instead.
 > > 
 > > which kernel do you use? some patches? could you look into syslog and
 > > send us all relevant information.
 > > 
 > > would you also run cat on all files there separately to detect the fault one.
 > > 
 > 
 > The kernel is 2.6.0-test6 from kernel.org.  No other patches.
 > 
 > Okay, I did cat file > /dev/null on each one.  It looks like the problem
 > is with oidmap.  The other files do not crash.

Below is a patch, please test.

Seems that while seq_file-ing fs/reiserfs/procfs.c, Alexander got lost
in a maze of little pointers and iterators all alike.

Cannot help but describe a little detail: r_stop() erroneously thought
that de->data contains a pointer to the super block, while in reality
address of some fs/reiserfs/procfs.c:show_* function was stored
there. As a result, deactivate_super() danced fine fandango on core, in
particular, in the case of show_oidmap() it modified first assignment
within loop to reset loop counter back to zero.

Nikita.
----------------------------------------------------------------------
--- bk-linux-2.5/fs/reiserfs/procfs.c	Wed Sep 24 03:00:43 2003
+++ procfs.c	Wed Oct  1 21:37:43 2003
@@ -453,24 +453,25 @@ static int set_sb(struct super_block *sb
 	return -ENOENT;
 }
 
+extern struct file_system_type reiserfs_fs_type;
+
 static void *r_start(struct seq_file *m, loff_t *pos)
 {
 	struct proc_dir_entry *de = m->private;
 	struct super_block *s = de->parent->data;
-	loff_t l = *pos;
+	void *ret;
 
-	if (l)
-		return NULL;
-
-	if (IS_ERR(sget(&reiserfs_fs_type, test_sb, set_sb, s)))
-		return NULL;
+	ret = sget(&reiserfs_fs_type, test_sb, set_sb, s);
+	if (IS_ERR(ret))
+		return ret;
 
 	up_write(&s->s_umount);
 
-	if (de->deleted) {
-		deactivate_super(s);
+	if (*pos)
+		return NULL;
+
+	if (de->deleted)
 		return NULL;
-	}
 
 	return s;
 }
@@ -484,15 +485,16 @@ static void *r_next(struct seq_file *m, 
 static void r_stop(struct seq_file *m, void *v)
 {
 	struct proc_dir_entry *de = m->private;
-	struct super_block *s = de->data;
-	deactivate_super(s);
+	struct super_block *s = de->parent->data;
+	if (v == NULL || !IS_ERR(v))
+		deactivate_super(s);
 }
 
 static int r_show(struct seq_file *m, void *v)
 {
 	struct proc_dir_entry *de = m->private;
 	int (*show)(struct seq_file *, struct super_block *) = de->data;
-	return show(m, v);
+	return show(m, de->parent->data);
 }
 
 static struct seq_operations r_ops = {
----------------------------------------------------------------------
 > -- 
 > Zan Lynx <zlynx@acm.org>
