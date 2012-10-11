From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 10/10] mkreiserfs: stop printing credits
Date: Thu, 11 Oct 2012 14:33:36 -0400
Message-ID: <20121011200115.EF658200AB@oldboy.suse.de>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

The CREDITS file contains the credits for the reiserfsprogs. Users
have been complaining for years that they don't need to see them
at every invokation.

This patch removes it.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 configure.in            |   35 -----------------------------------
 include/misc.h          |    2 --
 lib/misc.c              |   22 ----------------------
 mkreiserfs/mkreiserfs.c |    5 -----
 4 files changed, 64 deletions(-)

diff --git a/configure.in b/configure.in
index 5f172c2..0473be1 100644
--- a/configure.in
+++ b/configure.in
@@ -122,41 +122,6 @@ AC_ARG_ENABLE(io-failure-emulation,
   fi
 ])
 
-credits="./CREDITS"
-AC_MSG_CHECKING(for $credits)
-if test -r $credits ; then
-    AC_MSG_RESULT(yes)
-else
-    AC_MSG_ERROR(Missing file $credits)
-fi
-
-$AWK ['
-BEGIN  {in_header = 1; start = 2; count = 0}
-
-{
-    if (in_header) {
-	print $0
-	if ($0 == "") {
-	    in_header = 0;
-	    printf "char *credits[] = {\n"
-	}
-    } else {
-	if (($0 == "") || (length($0) < 1)) {
-	    start = 1;
-	    count++;
-	} else {
-	    if (!start)
-		printf "\t\\\n"
-	    else if (start == 1)
-		printf ",\n\n"
-	    printf "\t\"" $0 "\\n\""
-	    start = 0;
-	}
-    }
-}
-END    { print "\n};\n#define CREDITS_COUNT "  count }
-']  $credits > include/credits.h
-
 if test x$enable_debug = xyes; then
 	if test "x" = "x$PRESET_CFLAGS"; then
 		CFLAGS="-g -Wall"
diff --git a/include/misc.h b/include/misc.h
index 6891b59..5400e82 100644
--- a/include/misc.h
+++ b/include/misc.h
@@ -60,8 +60,6 @@ typedef struct mount_hint {
 struct mntent *misc_mntent(char *device);
 int misc_device_mounted(char *device);
 	
-void misc_print_credit(FILE *out);
-
 typedef struct dma_info {
     int fd;
     struct stat st;
diff --git a/lib/misc.c b/lib/misc.c
index 04a4d88..e3aef28 100644
--- a/lib/misc.c
+++ b/lib/misc.c
@@ -952,28 +952,6 @@ inline unsigned long long misc_find_next_set_bit(const void *vaddr,
     return res + (p - addr) * 8;
 }
 
-#include "credits.h"
-
-/* Reads the "CREDITS" file and prints one paragraph from it. */
-void misc_print_credit(FILE *out) {
-    char *line;
-    __u32 num1, num2;
-    
-    fprintf(out, "A pair of credits:\n");
-    
-    srandom (time (0));
-    
-    num1 = random() % CREDITS_COUNT;
-    line = credits[num1];
-    fprintf(out, "%s\n", line);
-    
-    while ((num1 == (num2 = random() % CREDITS_COUNT))) {}
-    
-    line = credits[num2];
-    
-    fprintf(out, "%s\n", line);
-}
-
 int user_confirmed (FILE * fp, char * q, char * yes) {
     char * answer = 0;
     size_t n = 0;
diff --git a/mkreiserfs/mkreiserfs.c b/mkreiserfs/mkreiserfs.c
index b0cd9b6..f0fe473 100644
--- a/mkreiserfs/mkreiserfs.c
+++ b/mkreiserfs/mkreiserfs.c
@@ -675,11 +675,6 @@ int main (int argc, char **argv)
 
     print_banner (program_name);
 
-    if (!(mode & QUIET_MODE)) {
-	misc_print_credit(stdout);
-	printf("\n");
-    }
-    
     if (mode & QUIET_MODE)
 	fclose(stdout);
     
-- 
1.7.10.4

