From: Yury Umanets <umka@namesys.com>
Subject: Re: Gnu Parted error, Kernel Panic, Reiserfs
Date: Mon, 19 Apr 2004 14:38:44 +0300
Message-ID: <1082374724.7491.7.camel@firefly>
References: <Pine.LNX.4.21.0404161554420.16938-100000@mlf.linux.rulez.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-U4FePulr5ftvaKqpz9er"
Return-path: <reiserfs-list-return-18043-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.21.0404161554420.16938-100000@mlf.linux.rulez.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Alan Chu <alanchu@MIT.EDU>, Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, bug-parted@gnu.org

--=-U4FePulr5ftvaKqpz9er
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2004-04-16 at 17:06, Szakacsits Szabolcs wrote:
> On Fri, 16 Apr 2004, Yury Umanets wrote:
> 
> > One more thing. Is it common case, that resizier errors happen on Gento?
> 
> Hmmm, seems to be a good point. Alan had Gentoo. On the QTParted forums
> people mention Gentoo. SystemRescueCD (http://www.sysresccd.org), the most
> popular LiveCD for partition handling is Gentoo based ... 
> 
> Look what I've found right now:
>     
> 	http://www.sysresccd.org/forums/viewtopic.php?t=294
> 
>   "Why is it that with and only with System Rescue CD, if I format a
>    partition as reiserfs, then copy some data from another resierfs
>    partition to that newly formatted partition and then unmount the
>    partition and run fsck on it, errors are found that need fixing?"
> 
> 	Szaka
Hello all,

I have new progsreiserfs at:

http://o3test.iit.nau.edu.ua/pr/progsreiserfs-0.3.0.5.tar.gz
ftp://ftp.namesys.com/pub/libreiserfs/progsreiserfs-0.3.0.5.tar.gz

It has a function which can be used for simple tree check. Check is
sufficient to say, that if it pass, resizing will pass too if there is
no bad blocks on device.

Also see parted patch in attachment.

PS. Unfortunately I was not able to find gentoo source package of
progsreiserfs (is it exists? I'm not familiar with Gentoo) to check if
it is modified or not. So, if one can say me where I can take it, please
do. Thanks in advance.

Thanks.

-- 
umka

--=-U4FePulr5ftvaKqpz9er
Content-Disposition: attachment; filename=parted-1.6.10-reiserfs-check.patch
Content-Type: text/x-patch; name=parted-1.6.10-reiserfs-check.patch; charset=KOI8-R
Content-Transfer-Encoding: 7bit

diff -rupN ./parted-1.6.10.orig/configure.in ./parted-1.6.10.check/configure.in
--- ./parted-1.6.10.orig/configure.in	2004-04-16 03:22:07.000000000 +0300
+++ ./parted-1.6.10.check/configure.in	2004-04-19 13:47:09.000000000 +0300
@@ -239,6 +239,9 @@ if test "$enable_dynamic_loading" = no -
 			REISER_LIBS="-ldal -lreiserfs"
 			AC_DEFINE(HAVE_LIBREISERFS, 1, [Have libreiserfs])
 		)
+		AC_CHECK_LIB(reiserfs, reiserfs_fs_check,
+			AC_DEFINE(HAVE_REISERFS_FS_CHECK, 1, [Have reiserfs_fs_check()])
+		)
 	)
 	LIBS="$OLD_LIBS"
 fi
diff -rupN ./parted-1.6.10.orig/libparted/fs_reiserfs/reiserfs.c ./parted-1.6.10.check/libparted/fs_reiserfs/reiserfs.c
--- ./parted-1.6.10.orig/libparted/fs_reiserfs/reiserfs.c	2002-08-10 03:47:33.000000000 +0300
+++ ./parted-1.6.10.check/libparted/fs_reiserfs/reiserfs.c	2004-04-19 13:55:34.000000000 +0300
@@ -100,8 +100,11 @@ FCLASS reiserfs_fs_t* (FPTR reiserfs_fs_
 				          reiserfs_gauge_t *);
 
 FCLASS int (FPTR reiserfs_fs_resize) (reiserfs_fs_t *, blk_t, reiserfs_gauge_t *);
+FCLASS int (FPTR reiserfs_fs_check) (reiserfs_fs_t *, reiserfs_gauge_t *);
+
 FCLASS reiserfs_fs_t *(FPTR reiserfs_fs_copy) (reiserfs_fs_t *, dal_t *,
 					reiserfs_gauge_t *);
+
 FCLASS int (FPTR reiserfs_fs_clobber) (dal_t *);
 FCLASS void (FPTR reiserfs_fs_close) (reiserfs_fs_t *);
 
@@ -383,6 +386,7 @@ static PedConstraint *reiserfs_get_creat
 static int reiserfs_check(PedFileSystem *fs, PedTimer *timer)
 {
 	reiserfs_fs_t *fs_info;
+	reiserfs_gauge_t *gauge = NULL;
 
 	PED_ASSERT(fs != NULL, return 0);
 
@@ -410,6 +414,34 @@ static int reiserfs_check(PedFileSystem 
 		return 0;
 	}
 
+#ifdef HAVE_REISERFS_FS_CHECK
+	ped_timer_reset(timer);
+	
+	if (libreiserfs_gauge_create && libreiserfs_gauge_free) {
+		if (!
+		    (gauge =
+		     libreiserfs_gauge_create(NULL, gauge_handler, timer)))
+			return 0;
+	}
+		
+	ped_timer_set_state_name(timer, _("checking"));
+	ped_timer_update(timer, 0.0);
+
+	if (!reiserfs_fs_check(fs_info, gauge)) {
+		ped_exception_throw(PED_EXCEPTION_ERROR,
+				    PED_EXCEPTION_CANCEL,
+				    _
+				    ("Reiserfs tree seems to be corrupted. "
+				     "Run reiserfsck --check first."));
+		return 0;
+	}
+	
+	ped_timer_update(timer, 1.0);
+
+	if (gauge)
+		libreiserfs_gauge_free(gauge);
+#endif
+	
 	ped_exception_throw(PED_EXCEPTION_INFORMATION, PED_EXCEPTION_OK,
 			    _
 			    ("The reiserfs filesystem passed a basic check.  For a more "

--=-U4FePulr5ftvaKqpz9er--

