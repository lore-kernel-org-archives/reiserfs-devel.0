From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Reiser4 oops on cat ./..plugin/..readdir
Date: Fri, 27 Feb 2004 14:29:34 +0300
Message-ID: <16447.10782.595624.815422@laputa.namesys.com>
References: <1077845680.6801.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16960-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1077845680.6801.4.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Jonathan Briggs writes:
 > Filesystem is on a RAID 0 MD device.
 > Config is attached.
 > Kernel compiled with:
 > 
 > # gcc34 --version
 > gcc34 (GCC) 3.4.0 20040129 (Red Hat Linux 3.4.0-0.3)
 > Copyright (C) 2004 Free Software Foundation, Inc.
 > This is free software; see the source for copying conditions.  There is NO
 > warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 > 
 > Problem Description:
 > A clean, fresh boot into single user mode, no tainted modules:
 > # cd /home
 > # cat ./..plugin/..readdir

Please try the following patch:
----------------------------------------------------------------------
===== plugin/pseudo/pseudo.c 1.41 vs edited =====
--- 1.41/plugin/pseudo/pseudo.c	Tue Jan 27 18:40:13 2004
+++ edited/plugin/pseudo/pseudo.c	Fri Feb 27 14:27:54 2004
@@ -533,7 +533,7 @@
 	dotname.len  = 1;
 
 	down(&host->i_sem);
-	if (dplug == NULL) {
+	if (dplug == NULL || dplug->build_entry_key == NULL) {
 		finish(NULL);
 		return NULL;
 	}
----------------------------------------------------------------------

 > 
 > -- 
 > Jonathan Briggs
 > jbriggs@esoft.com

Nikita.
