From: Mike Fleetwood <mike.fleetwood@googlemail.com>
Subject: [PATCH] reiser4progs: Limit printing of label to the maximum of 16
 chars
Date: Sat, 29 Dec 2012 14:17:53 +0000
Message-ID: <20121229141749.GA8581@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=72Y0upfeffbayFudsAoXefp8hN9kbkKJerNWQMSSNt8=;
        b=t8kMEIE+ZvS1/2pj73TKnOu/3imdzJKtZN4QQlGVo6r8Tzyqh+qSs7oi7Pr+np8ARQ
         +zg05TngHgypRkIOjJDErT5CMFdD+FnDu9Ap4b5ZR3Xj63O7njpR9iy/P8Y3QFY+oJGd
         97LcRq0pIgbTwoKQuSqnan3QJG8etXwEwkunSlyiqB9WuIb36KYphX+Bv1SUfagFDH9q
         zEqmVOIeaS8yQqTxQTVKZXYYN49YpIxQPnNRMSnYkhitKZaeOVD4YEtdX0VVAz2nP69Q
         zNPgjsW8JeFInPtxIRV71cdPfNBl4ia51plzKLNCdMFip3b5IL0gXGeUgEAoixTpCpV3
         LGDg==
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

For a reiser4 file system with exactly the maximum size 16 character
label, debugfs.reiser4 prints junk from memory at the end of the label.
This is because the label is read into a 16 character array and is
printed as a string, but there isn't a nul terminating character.

    # mkfs.reiser4 --yes --label abcdefghij123456 /dev/sda13
    # debugfs.reiser4 /dev/sda13 2> /dev/null | grep label:
    label:          abcdefghij123456!

Print at most 16 characters of the label.

Signed-off-by: Mike Fleetwood <mike.fleetwood@googlemail.com>
---

diff -urN reiser4progs-1.0.7.orig/librepair/master.c reiser4progs-1.0.7/librepair/master.c
--- reiser4progs-1.0.7.orig/librepair/master.c	2009-01-08 21:34:27.000000000 +0000
+++ reiser4progs-1.0.7/librepair/master.c	2012-12-29 13:34:51.000000000 +0000
@@ -356,7 +356,7 @@
 #endif
 	
 	if (*master->ent.ms_label != '\0') {
-		aal_stream_format(stream, "label:\t\t%s\n",
+		aal_stream_format(stream, "label:\t\t%.16s\n",
 				  reiser4_master_get_label(master));
 	} else {
 		aal_stream_format(stream, "label:\t\t<none>\n");
