From: Dushan Tcholich <dusanc@absolutok.net>
Subject: [PATCH 16/8] dscale.c cleanup
Date: Tue, 23 Oct 2007 16:35:16 +0200
Message-ID: <1193150116.6236.83.camel@krshina3.gekom>
Reply-To: dusanc@absolutok.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-OZZrEcJzMyN8R3ifEUeX"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiser4 <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward@namesys.com>


--=-OZZrEcJzMyN8R3ifEUeX
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



--=-OZZrEcJzMyN8R3ifEUeX
Content-Disposition: attachment; filename=dscale.c.patch
Content-Type: text/x-patch; name=dscale.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- dscale.c.orig	2007-10-23 16:32:28.000000000 +0200
+++ dscale.c	2007-10-23 16:33:28.000000000 +0200
@@ -49,7 +49,7 @@ static int gettag(const unsigned char *a
 }
 
 /* clear tag from value. Clear tag embedded into @value. */
-static void cleartag(__u64 * value, int tag)
+static void cleartag(__u64 *value, int tag)
 {
 	/*
 	 * W-w-what ?!
@@ -94,7 +94,7 @@ static int dscale_range(__u64 value)
 
 /* restore value stored at @adderss by dscale_write() and return number of
  * bytes consumed */
-int dscale_read(unsigned char *address, __u64 * value)
+int dscale_read(unsigned char *address, __u64 *value)
 {
 	int tag;
 

--=-OZZrEcJzMyN8R3ifEUeX--

