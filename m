From: Felix Zielcke <fzielcke@z-51.de>
Subject: [PATCH] little patch to let reiser4progs compile with gcc-4.4
Date: Mon, 09 Feb 2009 15:45:20 +0100
Message-ID: <1234190720.24013.1.camel@fz.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-RTpibmqHBlXC+N1Qe3aQ"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org


--=-RTpibmqHBlXC+N1Qe3aQ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

here's a small patch so reiser4progs compile with gcc-4.4.

-- 
Felix Zielcke

--=-RTpibmqHBlXC+N1Qe3aQ
Content-Disposition: attachment; filename=gcc-4.4.diff
Content-Type: text/x-patch; name=gcc-4.4.diff; charset=UTF-8
Content-Transfer-Encoding: 7bit

--- reiser4progs-1.0.7/plugin/node/node40/node40.c	2009-02-09 15:42:02.000000000 +0100
+++ reiser4progs-1.0.7.orig/plugin/node/node40/node40.c	2009-01-08 22:34:27.000000000 +0100
@@ -996,7 +996,7 @@ static lookup_t node40_lookup(reiser4_no
 	func = cb_comp_key3;
 #elif defined(ENABLE_LARGE_KEYS)
 	func = cb_comp_key4;
-#else
+#elif
 	func = NULL;
 #endif
 	

--=-RTpibmqHBlXC+N1Qe3aQ--

