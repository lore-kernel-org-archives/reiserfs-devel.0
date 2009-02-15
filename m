From: Frederik Himpe <fhimpe@telenet.be>
Subject: Patch for reiser4progs 1.0.7 to build with -Werror=format-security
Date: Sun, 15 Feb 2009 19:24:11 +0100
Message-ID: <1234722251.14332.9.camel@Anastacia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-MsNZ1tNs2yUDtZIQ5sDB"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--=-MsNZ1tNs2yUDtZIQ5sDB
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The attached patch fixes building reiser4progs 1.0.7 with the
-Werror=format-security CFLAG, which is used by default now in Mandriva.
Could you review it and include it if it's correct?

Thanks,
-- 
Frederik Himpe <fhimpe@telenet.be>

--=-MsNZ1tNs2yUDtZIQ5sDB
Content-Disposition: attachment; filename="reiser4progs-1.0.7-fix-string-format.patch"
Content-Type: text/x-patch; name="reiser4progs-1.0.7-fix-string-format.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff -ur reiser4progs-1.0.7.orig/libmisc/ui.c reiser4progs-1.0.7/libmisc/ui.c
--- reiser4progs-1.0.7.orig/libmisc/ui.c	2009-01-08 22:34:27.000000000 +0100
+++ reiser4progs-1.0.7/libmisc/ui.c	2009-02-15 17:31:09.000000000 +0100
@@ -116,7 +116,7 @@
 				line_width = 0;
 			}
 
-			fprintf(stream, word);
+			fprintf(stream, "%s", word);
 
 			line_width += aal_strlen(word);
 
diff -ur reiser4progs-1.0.7.orig/librepair/add_missing.c reiser4progs-1.0.7/librepair/add_missing.c
--- reiser4progs-1.0.7.orig/librepair/add_missing.c	2009-01-08 22:34:27.000000000 +0100
+++ reiser4progs-1.0.7/librepair/add_missing.c	2009-02-15 18:20:14.000000000 +0100
@@ -65,7 +65,7 @@
 	time_str = ctime(&am->stat.time);
 	time_str[aal_strlen(time_str) - 1] = '\0';
 	aal_stream_format(&stream, time_str);
-	aal_mess(stream.entity);
+	aal_mess("%s", (char *) stream.entity);
 	aal_stream_fini(&stream);
 }
 
diff -ur reiser4progs-1.0.7.orig/librepair/cleanup.c reiser4progs-1.0.7/librepair/cleanup.c
--- reiser4progs-1.0.7.orig/librepair/cleanup.c	2009-01-08 22:34:27.000000000 +0100
+++ reiser4progs-1.0.7/librepair/cleanup.c	2009-02-15 18:53:37.000000000 +0100
@@ -26,7 +26,7 @@
 	time_str = ctime(&cleanup->stat.time);
 	time_str[aal_strlen(time_str) - 1] = '\0';
 	aal_stream_format(&stream, time_str);
-	aal_mess(stream.entity);
+	aal_mess("%s", (char *) stream.entity);
 	aal_stream_fini(&stream);
 }
 
diff -ur reiser4progs-1.0.7.orig/librepair/disk_scan.c reiser4progs-1.0.7/librepair/disk_scan.c
--- reiser4progs-1.0.7.orig/librepair/disk_scan.c	2009-01-08 22:34:27.000000000 +0100
+++ reiser4progs-1.0.7/librepair/disk_scan.c	2009-02-15 18:14:53.000000000 +0100
@@ -45,7 +45,7 @@
 	time_str = ctime(&ds->stat.time);
 	time_str[aal_strlen(time_str) - 1] = '\0';
 	aal_stream_format(&stream, time_str);
-	aal_mess(stream.entity);
+	aal_mess("%s", (char *) stream.entity);
 	aal_stream_fini(&stream);
 }
 
diff -ur reiser4progs-1.0.7.orig/librepair/filter.c reiser4progs-1.0.7/librepair/filter.c
--- reiser4progs-1.0.7.orig/librepair/filter.c	2009-01-08 22:34:27.000000000 +0100
+++ reiser4progs-1.0.7/librepair/filter.c	2009-02-15 17:32:41.000000000 +0100
@@ -591,7 +591,7 @@
 	time_str = ctime(&fd->stat.time);
 	time_str[aal_strlen(time_str) - 1] = '\0';
 	aal_stream_format(&stream, time_str);
-	aal_mess(stream.entity);
+	aal_mess("%s", (char *) stream.entity);
 	aal_stream_fini(&stream);
 }
 
diff -ur reiser4progs-1.0.7.orig/librepair/semantic.c reiser4progs-1.0.7/librepair/semantic.c
--- reiser4progs-1.0.7.orig/librepair/semantic.c	2009-01-08 22:34:27.000000000 +0100
+++ reiser4progs-1.0.7/librepair/semantic.c	2009-02-15 18:26:50.000000000 +0100
@@ -791,7 +791,7 @@
 	time_str = ctime(&sem->stat.time);
 	time_str[aal_strlen(time_str) - 1] = '\0';
 	aal_stream_format(&stream, time_str);
-	aal_mess(stream.entity);
+	aal_mess("%s", (char *) stream.entity);
 	aal_stream_fini(&stream);
 }
 
diff -ur reiser4progs-1.0.7.orig/librepair/twig_scan.c reiser4progs-1.0.7/librepair/twig_scan.c
--- reiser4progs-1.0.7.orig/librepair/twig_scan.c	2009-01-08 22:34:27.000000000 +0100
+++ reiser4progs-1.0.7/librepair/twig_scan.c	2009-02-15 18:21:39.000000000 +0100
@@ -119,7 +119,7 @@
 	time_str[aal_strlen(time_str) - 1] = '\0';
 	
 	aal_stream_format(&stream, time_str);
-	aal_mess(stream.entity);
+	aal_mess("%s", (char *) stream.entity);
 	aal_stream_fini(&stream);
 }
 
diff -ur reiser4progs-1.0.7.orig/progs/debugfs/browse.c reiser4progs-1.0.7/progs/debugfs/browse.c
--- reiser4progs-1.0.7.orig/progs/debugfs/browse.c	2009-01-08 22:34:27.000000000 +0100
+++ reiser4progs-1.0.7/progs/debugfs/browse.c	2009-02-15 19:02:02.000000000 +0100
@@ -27,7 +27,7 @@
 		if (read <= 0)
 			break;
 
-		printf(buff);
+		printf("%s", buff);
 	}
 
 	return 0;
diff -ur reiser4progs-1.0.7.orig/progs/debugfs/print.c reiser4progs-1.0.7/progs/debugfs/print.c
--- reiser4progs-1.0.7.orig/progs/debugfs/print.c	2009-01-08 22:34:27.000000000 +0100
+++ reiser4progs-1.0.7/progs/debugfs/print.c	2009-02-15 18:57:18.000000000 +0100
@@ -24,7 +24,7 @@
 		if ((size = aal_stream_read(stream, buff, size)) <= 0)
 			return size;
 		
-		printf(buff);
+		printf("%s", buff);
 	}
 
 	return 0;

--=-MsNZ1tNs2yUDtZIQ5sDB--

