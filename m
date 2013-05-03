From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 5/6] reiser4progs: Update version to 1.0.8
Date: Fri, 03 May 2013 22:39:43 +0200
Message-ID: <5184208F.6090200@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030809070303000605040202"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=esoXsdatFcP41eW58SaE1uFnegEyPZrdvwUibm7GEtk=;
        b=ykXG3olw4VQxJQBUh8Kw0T0n4tV4SYL9fWykALFwgFkxOhGhpPY9dGSx5QwaOQLXOS
         0L9vTM3xxGyKJ8GdaEXwPzMjh+ALpsmVSL5rQzoet0OZwZbCmyi/im51KbBB/J1dOpkh
         oocybiBp2dRq95Wz3/YZ4WiMaF9B0+OHIq2ozDaiZE63Ln/Dhds81zDt/ENqHLVqouN7
         huMPQyq3qv/krfkfKiytP/jUQg9xJhMplfzzK84JsfkNi2omsui9CkcU3K6itI8imgEP
         cH2HOXZX3c78hU0LEEhTtz3BvL+/SiuF+ySriUxEM1xgCFI5jdFzHLFKhyDQgmPvQWxm
         CMFg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030809070303000605040202
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------030809070303000605040202
Content-Type: text/x-patch;
 name="reiser4progs-update-version-to-1.0.8.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4progs-update-version-to-1.0.8.patch"

Update version to 1.0.8

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 configure.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- reiser4progs-1.0.7.orig/configure.in
+++ reiser4progs-1.0.7/configure.in
@@ -15,7 +15,7 @@ AH_TEMPLATE([LIBREISER4_MIN_INTERFACE_VE
 
 LIBREISER4_MAJOR_VERSION=1
 LIBREISER4_MINOR_VERSION=0
-LIBREISER4_MICRO_VERSION=7
+LIBREISER4_MICRO_VERSION=8
 
 LIBREISER4_INTERFACE_AGE=0
 LIBREISER4_BINARY_AGE=0

--------------030809070303000605040202--
