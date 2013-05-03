From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 6/6] reiser4progs: Remove excess object.h in the list of header
 files in Makefile.am
Date: Fri, 03 May 2013 22:39:54 +0200
Message-ID: <5184209A.5090601@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000208090400060502060906"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=gLuXzeAzt4E42EvofCIWIt/gaxiw1cQFATZKDImGgyU=;
        b=hiKBjxJ0ywOpOWFZnJ8FfZoqtOJgOWfj8mzdP5qVWXfFk2GG2ciGJifqyVWxNu2xbb
         dFUSxODsuJTbkGDYLLqfgxeDENfhksVjsKPzE8KAzBm+egrBiKXz3xA/KA1+mdgACHhy
         MMuwfRXBaFymeztiqW8H30hSznXrwq7uYnyc8WVhfUuYgF4Zl074PgQwhvQ0QOam+T0D
         2Wq4YzJCSVWXkm/Nbzj2QLDrxKvQr5Nu313TJ0lKGG77ymAje+dQWUZ4fZV0jXuDsvKz
         oA8bmKv98GYtnVAsjADJRqbD1XQoKrxGwjyiLhVPfveHzbDgoWhd2Ugjift+WXj6zRDY
         MlGg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000208090400060502060906
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------000208090400060502060906
Content-Type: text/x-patch;
 name="reiser4progs-remove-excess-object_h-in-the-list.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="reiser4progs-remove-excess-object_h-in-the-list.patch"

Remove excess object.h in the list of headers

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 include/repair/Makefile.am |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- reiser4progs-1.0.7.orig/include/repair/Makefile.am
+++ reiser4progs-1.0.7/include/repair/Makefile.am
@@ -3,4 +3,4 @@ repairinclude_HEADERS   = librepair.h re
 			  master.h format.h journal.h node.h place.h item.h \
 			  filter.h disk_scan.h twig_scan.h add_missing.h \
 			  semantic.h lost_found.h cleanup.h tree.h alloc.h \
-			  object.h status.h backup.h oid.h pset.h
+			  status.h backup.h oid.h pset.h

--------------000208090400060502060906--
