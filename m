From: Pavel Bartusek <pba@sysgo.com>
Subject: Cross compiling reiserfsprogs-3.6.11
Date: Fri, 21 Nov 2003 12:22:25 +0100
Message-ID: <3FBDF571.5070100@sysgo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000808070903080605020600"
Return-path: <reiserfs-list-return-16141-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs-List@namesys.com

--------------000808070903080605020600
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Hi list,

I have downloaded and tried to crosscompile the reiserfsprogs-3.6.11. 
Unfortunatelly, in the config.in is used the macro AC_TRY_RUN which 
prevents it from cross compiling. The attached patch replaces the macro 
and the simple C program for transforming CREDITS file, with a simple 
AWK script.

NOTE: To recreate configure script run autoconf in the reiserfsprogs 
directory.

regards

Pavel Bartusek

pba@sysgo.com

--------------000808070903080605020600
Content-Type: text/plain;
 name="configure.in.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="configure.in.patch"

--- reiserfsprogs-3.6.11/configure.in.ori	2003-08-01 17:49:31.000000000 +0200
+++ reiserfsprogs-3.6.11/configure.in	2003-11-21 11:39:14.000000000 +0100
@@ -18,7 +18,7 @@
 
 dnl Checks for programs.
 AC_PROG_RANLIB
-dnl AC_PROG_AWK
+AC_PROG_AWK
 dnl AC_PROG_INSTALL
 dnl AC_PROG_LN_S
 
@@ -50,78 +50,41 @@
   fi
 ])
 
-AC_DEFUN(AC_PREPARE_CREDITS,
-[
-
-AC_MSG_CHECKING(for CREDITS)
-
-AC_TRY_RUN([
-#define _GNU_SOURSE
-#include <stdio.h>
-#include <errno.h>
-#include <string.h>
-
-int main (void) {
-    FILE *fin, *fout;
-    char *line = NULL;
-    unsigned int len = 0;
-    int start, count;
-    
-    if ((fin = fopen("CREDITS", "r")) == NULL) {
-	fprintf(stderr, "Error occured while openning the file 'CREDITS': "
-	    "%s.\n", strerror(errno));
-
-	return 1;
-    }
-
-    if ((fout = fopen("include/credits.h", "w")) == NULL) {
-	fprintf(stderr, "Error occured while openning the file 'credits.h': "
-	    "%s.\n", strerror(errno));
-	
-	return 1;
-    }
-     
-    /* Replicate the header. */
-    while (getline(&line, &len, fin) != -1) {
-	fprintf(fout, line);
-	
-	if (!strcmp(line, "\n"))
-	    break;
-    }
-    
-    fprintf(fout, "char *credits[] = {\n");
-    
-    start = 2; count = 0;
-    
-    while (getline(&line, &len, fin) != -1) {
-	if (!strcmp(line, "\n") || strlen(line) < 1) {
-	    start = 1;
-	    count++;
+credits="./CREDITS"
+AC_MSG_CHECKING(for $credits)
+if test -r $credits ; then
+ AC_MSG_RESULT(yes)
+else 
+ AC_MSG_ERROR(Missing file $credits)
+fi 
+
+$AWK ['
+BEGIN	{in_header = 1; start = 2; count = 0}
+
+{
+	if (in_header) {
+		print $0
+		if ($0 == "") {
+			in_header = 0;
+			printf "char *credits[] = {\n"
+		}
 	} else {
-	    if (!start)
-		fprintf(fout, "\t\\\" "\n");
-	    else if (start == 1)
-		fprintf(fout, ",\n\n");
-	    
-	    line[strlen(line) - 1] = 0;
-	    fprintf(fout, "\t\"%s\\\n\"", line);
-	    start = 0;
-	}
-    }
-    
-    fprintf(fout, "\n};\n");
-    fprintf(fout, "#define CREDITS_COUNT %d\n", count);
-    
-    free(line);
-    fclose(fin);
-    fclose(fout);
-    
-    return 0;
+		if (($0 == "") || (length($0) < 1)) {
+			start = 1;
+			count++;
+		} else {
+			if (!start)
+				printf "\t\\\n"
+			else if (start == 1)
+				printf ",\n\n"
+			printf "\t\"" $0 "\\n\""
+			start = 0;
+		}
+	}	
 }
-], AC_MSG_RESULT(yes), AC_MSG_RESULT(no) ; exit)
-])
 
-AC_PREPARE_CREDITS()
+END	{ print "\n};\n#define CREDITS_COUNT "  count }
+']  $credits > include/credits.h
 
 AC_OUTPUT(
     include/Makefile 

--------------000808070903080605020600--

