From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: [Build Faliure] 2.6.25-rc5-mm1 build fails
Date: Tue, 11 Mar 2008 15:46:30 +0530
Message-ID: <20080311101630.GA23757@linux.vnet.ibm.com>
References: <20080311011434.ad8c8d7d.akpm@linux-foundation.org>
Reply-To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080311011434.ad8c8d7d.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, apw@shadowen.org, balbir@linux.vnet.ibm.com

Hi Andrew,

The 2.6.25-rc5-mm1 kernel build fails with allyesconfig

  LD      .tmp_vmlinux1
fs/built-in.o: In function `reiser4_debugtrap':
/root/kernels/linux-2.6.25-rc5/fs/reiser4/debug.c:295: undefined reference to `breakpoint'
make: *** [.tmp_vmlinux1] Error 1

This build failure has been introduced by reiser4.patch, i think the
breakpoint() have been used instead of kgdb_breakpoint().


--- linux-2.6.25-rc5/fs/reiser4/debug.c	2008-03-11 22:12:45.000000000 +0530
+++ linux-2.6.25-rc5/fs/reiser4/~debug.c	2008-03-11 23:14:54.000000000 +0530
@@ -291,8 +291,8 @@ void reiser4_debugtrap(void)
 {
 	/* do nothing. Put break point here. */
 #if defined(CONFIG_KGDB) && !defined(CONFIG_REISER4_FS_MODULE)
-	extern void breakpoint(void);
-	breakpoint();
+	extern void kgdb_breakpoint(void);
+	kgdb_breakpoint();
 #endif
 }
 #endif
-- 
Thanks & Regards,
Kamalesh Babulal,
Linux Technology Center,
IBM, ISTL.
