From: Domenico Andreoli <cavok@tiscali.it>
Subject: typo in resizefs.reiser4 0.5.3 help message
Date: Sat, 3 Apr 2004 16:21:42 +0200
Sender: Domenico Andreoli <cavok@libero.it>
Message-ID: <20040403142142.GA10183@raptus.homelinux.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="HlL+5n6rz5pIUxbD"
Return-path: <reiserfs-list-return-17678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hi,

i found a typo in resizefs.reiser4 help message, the diff is attached.

cheers
domenico

-----[ Domenico Andreoli, aka cavok
 --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50

--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="resizefs.reiser4.c.diff"

--- resizefs.c.orig	2004-04-03 15:57:08.000000000 +0200
+++ resizefs.c	2004-04-03 15:57:16.000000000 +0200
@@ -44,7 +44,7 @@ static void resizefs_print_usage(char *n
 		"                                any questions.\n"
 		"  -f, --force                   makes resizer to use whole disk, not\n"
 		"                                block device or mounted partition.\n"
-		"  -c, --cache N                 number of nodes in tree byffer cache\n");
+		"  -c, --cache N                 number of nodes in tree buffer cache\n");
 }
 
 /* Initializes exception streams used by resizefs */

--HlL+5n6rz5pIUxbD--
