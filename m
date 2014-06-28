From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch] libaal: version-1.0.6
Date: Sun, 29 Jun 2014 01:09:58 +0200
Message-ID: <53AF4B46.6010200@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020008070602030704020808"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=nhgbgjbP6T/cP2e/HZVec0XJyclhUffKmQeDsiVpTRc=;
        b=Zgk0+fdcnqGahixQnNu8KPn2TUyzpwBu/FSKeZBzu6vBbPk6x/hJPl5JfDu8kfnvsK
         SPP4VSDimNaR2kIWjJ9ojZEqDKcSdfEtxk86XJZnkOJV0KKtQi8vFziQbJgy7+ZEryXm
         FawkdOMZaHNNv8CuyeeJLghSlkkacY9NwE53MZuGae0bnbx0DGfHObQt1v+Y8EVzg9xX
         EgFYioBkHUWZTPumeVtnZPh7j8mVskwv9m7jDjOG5WwjY+qLVDEiPpkS9c20HdTf7oG7
         5F0eyx6+VVXmc6+RgQ8Fp+j6dNrgWkFNz1WFiiE0UmP05TA6DICjk4wAQ1QlXOJLpxJW
         CSgA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------020008070602030704020808
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------020008070602030704020808
Content-Type: text/x-patch;
 name="libaal-version-1.0.6.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="libaal-version-1.0.6.patch"

Index: libaal-1.0.5/configure.in
===================================================================
--- libaal-1.0.5.orig/configure.in
+++ libaal-1.0.5/configure.in
@@ -14,7 +14,7 @@ AH_TEMPLATE([ENABLE_MEMORY_MANAGER], [De
 
 LIBAAL_MAJOR_VERSION=1
 LIBAAL_MINOR_VERSION=0
-LIBAAL_MICRO_VERSION=5
+LIBAAL_MICRO_VERSION=6
 
 LIBAAL_INTERFACE_AGE=0
 LIBAAL_BINARY_AGE=0
Index: libaal-1.0.5/ChangeLog
===================================================================
--- libaal-1.0.5.orig/ChangeLog
+++ libaal-1.0.5/ChangeLog
@@ -6,6 +6,10 @@ reiser4progs/COPYING.
 This file may be modified and/or distributed without restriction. This is
 not an invitation to misrepresent the history of reiser4progs.
 
+2014-06-28
+	1.0.6 version
+	Implement device discard functionality in libaal to be used
+	by mkfs and friends.
 2005-08-05
 	1.0.5 version.
 2005-03-21

--------------020008070602030704020808--
