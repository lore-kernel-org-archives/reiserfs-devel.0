From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 3/6] reiser4progs: mkfs: Don't ask for confirmation to work
 under linux-3.X
Date: Fri, 03 May 2013 22:39:23 +0200
Message-ID: <5184207B.6060005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050208040504050007090702"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=2Snz3i2n7/oqddti5AJgPHkoBhc/enfCso4iC9d2o9c=;
        b=NmZmGbGf4lg/9gF+9vgMwWt13lMhW2UDwaHTAvqaoPyX7QOHXEksRtFq5IOHggZ/1+
         uW1CzY8mMwESR0VyECXsO3zwIfLP0yDT+iiBYCekHw9I4JkE9YZUykvgqzOLnQhDdfU9
         F0BwaCMm4qHa953B210LUAxTHdKQ8krdMpaNnN01s2RKKTluKX9JgJhXsMVy2iyZZwp6
         SqGxIBq8t/re9pzpmCNC2zwKqeRdNbFfUfCiYoN+WN1plwn30xGDtfXRP1gjT+ztXinW
         YRuD33YKpXX3yQJP/BxjJRwLt2utlMdBezHBN1pwlKmvVofYF/amvrZ8gSqgB5caIvv2
         0nhw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------050208040504050007090702
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------050208040504050007090702
Content-Type: text/x-patch;
 name="reiser4progs-mkfs-support-linux-3.x.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4progs-mkfs-support-linux-3.x.patch"

Support Linux 3.x by mkfs.reiser4

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 progs/mkfs/mkfs.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- reiser4progs-1.0.7.orig/progs/mkfs/mkfs.c
+++ reiser4progs-1.0.7/progs/mkfs/mkfs.c
@@ -300,15 +300,15 @@ int main(int argc, char *argv[]) {
 
 	if (!(flags & BF_FORCE)) {
 		if (aal_strncmp(sysinfo.release, "2.5", 3) &&
-		    aal_strncmp(sysinfo.release, "2.6", 3))
-		{
+		    aal_strncmp(sysinfo.release, "2.6", 3) &&
+		    (aal_strncmp(sysinfo.release, "3.", 2) ||
+		     (sysinfo.release[2] < '0' && (sysinfo.release[2] > '9')))){
 			aal_warn("%s %s is detected. Reiser4 does not "
 				 "support such a platform. Use -f to "
 				 "force over.", sysinfo.sysname,
 				 sysinfo.release);
 			goto error_free_libreiser4;
 		}
-
 	}
 
 	if (!(flags & BF_YES)) {

--------------050208040504050007090702--
