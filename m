From: Vasily Averin <vvs@sw.ru>
Subject: [PATCH 2.6.19-rc4] Documentation: remount_fs() needs lock_kernel
Date: Mon, 06 Nov 2006 14:08:28 +0300
Message-ID: <454F17AC.8010003@sw.ru>
References: <20061101235407.a92f94a5.akpm@osdl.org>	<454B5B56.4090307@shadowen.org> <20061103110210.08169843.akpm@osdl.org> <454F16ED.7060204@sw.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30106-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <454F16ED.7060204@sw.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>, Matthew Wilcox <willy@debian.org>
Cc: Andy Whitcroft <apw@shadowen.org>, reiserfs-dev@namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

From:	Vasily Averin <vvs@sw.ru>

fixed long-lived typo: remount_fs() needs BKL

Signed-off-by:	Vasily Averin <vvs@sw.ru>

--- linux-2.6.19-rc4/Documentation/filesystems/Locking.umntlk	2006-11-02
13:25:04.000000000 +0300
+++ linux-2.6.19-rc4/Documentation/filesystems/Locking	2006-11-06
13:22:35.000000000 +0300
@@ -124,7 +124,7 @@ sync_fs:		no	no	read
 write_super_lockfs:	?
 unlockfs:		?
 statfs:			no	no	no
-remount_fs:		no	yes	maybe		(see below)
+remount_fs:		yes	yes	maybe		(see below)
 clear_inode:		no
 umount_begin:		yes	no	no
 show_options:		no				(vfsmount->sem)


