From: prj@po.cwru.edu (Paul Jarc)
Subject: reiserfsprogs 3.6.13 installation bug, with fix
Date: Thu, 11 Mar 2004 12:28:53 -0500
Message-ID: <m37jxri978.fsf@multivac.cwru.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <reiserfs-list-return-17184-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com


My /bin/sh is pdksh, which handles here-documents slightly
differently from bash: for some sequences like \", the backslash is
removed, while bash preserves it.  To ensure that a backslash appears
in the here-document, you can escape the backslash with another
backslash.  This patch makes the configure script work with pdksh.


paul

--=-=-=
Content-Type: text/x-patch
Content-Disposition: inline;
  filename=reiserfsprogs-3.6.13-backslash.patch

--- reiserfsprogs-3.6.13/configure.in~	2004-03-10 17:21:56.000000000 -0500
+++ reiserfsprogs-3.6.13/configure.in	2004-03-10 17:22:42.000000000 -0500
@@ -110,7 +110,7 @@
 		fprintf(fout, ",\n\n");
 	    
 	    line[strlen(line) - 1] = 0;
-	    fprintf(fout, "\t\"%s\\\n\"", line);
+	    fprintf(fout, "\\t\\"%s\\\\n\\"", line);
 	    start = 0;
 	}
     }

--=-=-=--
