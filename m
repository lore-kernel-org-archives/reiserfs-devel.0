From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 4/6] reiser4progs: mkfs: Enable intelligent compression by
 default
Date: Fri, 03 May 2013 22:39:34 +0200
Message-ID: <51842086.4060104@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020301060606040304090709"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=Fs9lRLbHYULxdqqqsd7XGbl5i8wjpjYTZdc2yAJgCqk=;
        b=bWNvyWgW29ybz1bYaSk/K24WnciFLBD3257LlZvWdWnRcKTQuC6JQWAt49lNoV/AaF
         IVyp4vcbOi3LH31cF541zOocMNK8CVnm4p5aWfGEqpf0CutS/CD7hbRnWl96TSD01DVn
         8Cgj+nBCL67jnT7oWJ3Y/n6Tym8JAt0sV68yZAoVxYn7Vsl2XB3DS6nZPLg7BloWquaM
         khAoSfjsvfJc1klLPjck4he0maV7O8nZthBm0VXghWDj7TmG0ZpwVbjJmTh3c+nmYlbd
         77vJfrbBJrEX0IVoQqxmWAXcyQ9bejdw/32H4DpK9/DfzeYBdz4o/4QIMDS4WGooP1qW
         U2JQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020301060606040304090709
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------020301060606040304090709
Content-Type: text/x-patch;
 name="reiser4progs-mkfs-enable-intelligent-compression-by-default.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="reiser4progs-mkfs-enable-intelligent-compression-by-default.";
 filename*1="patch"

Enable intelligent compression with lzo1 algorithm by default
(create=ccreg40,compress=lzo1,compressMode=conv).

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 libreiser4/profile.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- reiser4progs-1.0.7.orig/libreiser4/profile.c
+++ reiser4progs-1.0.7/libreiser4/profile.c
@@ -73,7 +73,7 @@ reiser4_profile_t defprof = {
 			.hidden = 0,
                         .max = OBJECT_LAST_ID,
 #endif
-                        .id = {OBJECT_REG40_ID, REG_OBJECT, OBJECT_PLUG_TYPE},
+                        .id = {OBJECT_CCREG40_ID, REG_OBJECT, OBJECT_PLUG_TYPE},
                 },
 		[PROF_FORMAT] = {
 #ifndef ENABLE_MINIMAL

--------------020301060606040304090709--
