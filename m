From: prj@po.cwru.edu (Paul Jarc)
Subject: Re: reiserfsprogs 3.6.14 release
Date: Thu, 18 Mar 2004 16:02:06 -0500
Message-ID: <m3hdwloom3.fsf@multivac.cwru.edu>
References: <200403182350.44277.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17298-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403182350.44277.vitaly@namesys.com> (Vitaly Fertman's
 message of "Thu, 18 Mar 2004 23:51:42 +0300")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

My /bin/sh is pdksh, which handles here-documents slightly differently
from bash: for some sequences like \", the backslash is preserved by
bash, but removed by pdksh.  To ensure that a backslash appears in the
here-document, you can escape the backslash with another backslash.
This patch (against 3.6.13, but the problem and fix are the same for
3.6.14) makes the configure script work with pdksh as well as bash.

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


paul
