From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: Reiser4 stress test.
Date: Mon, 21 Aug 2006 17:58:55 -0400
Message-ID: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Reply-To: ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29639-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

     I've been having problems with Reiser 4 panicking for a few
months, and I've recently had time to investigate the matter. I've
created a program that can crash my system in a few minutes. It's
based on kmail's disk activity and consists of small, separated writes
to a file that is also mmapped.

=== scatteredwrites ===
#!/usr/bin/python

import os
import mmap
import optparse

parser = optparse.OptionParser(description=
"Creates a file in $CWD and performs a pattern of reads and writes to it in an "
"attempt to trigger fs bugs. The file is broken up into regions: for each "
"region the entire region is read, then some portion of it is written to."
"\nDistilled from kmail workload.")

parser.add_option("--region-size", dest="regionsize", default=65536,
    type="int", help="Set region size to BYTES", metavar="BYTES")
parser.add_option("--region-count", dest="regioncount", default=2048,
    type="int", help="Set number of regions to COUNT", metavar="COUNT")
parser.add_option("--write-offset", dest="writeoffset", default=0,
    type="int", help="Offset write by BYTES in each region", metavar="BYTES")
parser.add_option("--write-size", dest="writesize", default=256,
    type="int", help="Size of write in each region.", metavar="BYTES")

options, args = parser.parse_args()


f = open("scatteredwrites.%d.tmp" % (os.getpid()), "w+b")

try:
    writestr = "A" * options.regionsize
    for i in xrange(options.regioncount):
        f.write(writestr)
    f.close()

    f = open("scatteredwrites.%d.tmp" % (os.getpid()), "r+b")

    writestr = "B" * options.writesize

    dummy = mmap.mmap(f.fileno(), options.regionsize * options.regioncount,
                      mmap.MAP_SHARED)

    while True:
        for i in xrange(options.regioncount):
            f.seek(i * options.regionsize, 0)
            f.read(options.regionsize)
            f.seek(- options.regionsize + options.writeoffset,1)
            f.write(writestr)

except KeyboardInterrupt:
    os.unlink("scatteredwrites.%d.tmp" % (os.getpid()))

======
Without fs load this stress test rarely causes problems. But with five
instances running in parallel with five instances of a large grep (or
patch, or tar), my computer crashes on a timescale of 10 minutes.


I've also added a few patches to my kernel to help me debug the
problems I've been having:

diff -rupN a/fs/reiser4/page_cache.c b/fs/reiser4/page_cache.c
--- a/fs/reiser4/page_cache.c	2006-08-19 19:45:57.000000000 -0400
+++ b/fs/reiser4/page_cache.c	2006-08-19 20:23:43.000000000 -0400
@@ -489,12 +489,9 @@ static int can_hit_entd(reiser4_context 
 		return 1;
 	if (ctx->super != s)
 		return 1;
-	if (get_super_private(s)->entd.tsk == current)
-		return 0;
-	if (!lock_stack_isclean(&ctx->stack))
-		return 0;
-	if (ctx->trans->atom != NULL)
-		return 0;
+	assert("ajw-1", get_super_private(s)->entd.tsk != current);
+	assert("ajw-2", lock_stack_isclean(&ctx->stack));
+	assert("ajw-3", ctx->trans->atom == NULL);
 	return 1;
 }
 
diff -rupN 2.6.18-rc4-mm1/fs/reiser4/debug.c linux/fs/reiser4/debug.c
--- 2.6.18-rc4-mm1/fs/reiser4/debug.c	2006-08-18 19:21:13.000000000 -0400
+++ linux/fs/reiser4/debug.c	2006-08-18 19:24:35.000000000 -0400
@@ -56,6 +56,9 @@ static char panic_buf[REISER4_PANIC_MSG_
  */
 static DEFINE_SPINLOCK(panic_guard);
 
+static void print_lock_counters(const char *prefix,
+                                const reiser4_lock_counters_info * info);
+
 /* Your best friend. Call it on each occasion.  This is called by
     fs/reiser4/debug.h:reiser4_panic(). */
 void reiser4_do_panic(const char *format /* format string */ , ... /* rest */ )
@@ -74,6 +77,8 @@ void reiser4_do_panic(const char *format
 		vsnprintf(panic_buf, sizeof(panic_buf), format, args);
 		va_end(args);
 		printk(KERN_EMERG "reiser4 panicked cowardly: %s", panic_buf);
+		dump_stack();
+		print_lock_counters("",reiser4_lock_counters());
 		spin_unlock(&panic_guard);
 
 		/*

I've also added this bugfix by Alexander Zarochentsev <zam@namesys.com>:

Index: linux-2.6-git/fs/reiser4/as_ops.c
===================================================================
--- linux-2.6-git.orig/fs/reiser4/as_ops.c
+++ linux-2.6-git/fs/reiser4/as_ops.c
@@ -350,6 +350,11 @@ int reiser4_releasepage(struct page *pag
 	if (PageDirty(page))
 		return 0;
 
+	/* extra page reference is used by reiser4 to protect
+	 * jnode<->page link from this ->releasepage(). */
+	if (page_count(page) > 3)
+		return 0;
+
 	/* releasable() needs jnode lock, because it looks at the jnode fields
 	 * and we need jload_lock here to avoid races with jload(). */
 	spin_lock_jnode(node);


Andrew Wade
