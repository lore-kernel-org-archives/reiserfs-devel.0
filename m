From: "Michael W. Bombardieri" <mb@ii.net>
Subject: [PATCH] use __progname in mkreiserfs.c (try again)
Date: Thu, 15 Nov 2012 14:55:01 +0800
Message-ID: <20121115065501.GA22342@bom.nom.co>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

Sorry for the re-post.

I think I mangled the previous diff in vi...

--- mkreiserfs.c	Thu Nov 15 14:34:11 2012
+++ mkreiserfs_new.c	Thu Nov 15 14:40:07 2012
@@ -34,9 +34,8 @@
 #  include <uuid/uuid.h>
 #endif
 
+extern char *__progname;
 
-char *program_name;
-
 static void message( const char * fmt, ... ) 
 	__attribute__ ((format (printf, 1, 2)));
 
@@ -50,7 +49,7 @@
     va_end( args );
 
     if( buf ) {
-	    fprintf( stderr, "%s: %s\n", program_name, buf );
+	    fprintf( stderr, "%s: %s\n", __progname, buf );
 	    free( buf );
     }
 }
@@ -80,7 +79,7 @@
 	"                                   by end users only.\n"
 	"  -d | --debug                     print debugging information during mkreiser\n"
 	"  -V                               print version and exit\n",
-	program_name);
+	__progname);
     exit (1);
 }
 
@@ -432,7 +431,7 @@
     
     if (*tmp) {
 	reiserfs_exit (1, "%s: strtol is unable to make an integer of %s\n",
-		       program_name, str);
+		       __progname, str);
     }
     
     return val;
@@ -447,7 +446,7 @@
 
     if (*tmp) {
 	reiserfs_exit (1, "%s: strtoll is unable to make an integer of %s\n",
-		       program_name, str);
+		       __progname, str);
     }
 
     return val;
@@ -461,7 +460,7 @@
     if (!is_blocksize_correct (*b_size))
         reiserfs_exit (1, "%s: wrong blocksize %s specified, "
 		       "only power of 2 from 512-8192 interval "
-		       "are supported", program_name, str);
+		       "are supported", __progname, str);
 }
 
 
@@ -478,7 +477,7 @@
 /*
     if (Journal_size < JOURNAL_MIN_SIZE)
 		die ("%s: wrong journal size specified: %lu. Should be at least %u",
-			 program_name, 
+			 __progname, 
 			 Journal_size + 1, JOURNAL_MIN_SIZE + 1);
 */
 }
@@ -560,13 +559,6 @@
     int c;
     static int flag;
 
-    program_name = strrchr( argv[ 0 ], '/' );
-    
-    if (program_name)
-	program_name++;
-    else
-	program_name = argv[ 0 ];
-    
     if (argc < 2)
 	print_usage_and_exit ();
     
@@ -673,7 +665,7 @@
 		}
     }
 
-    print_banner (program_name);
+    print_banner (__progname);
 
     if (mode & QUIET_MODE)
 	fclose(stdout);
