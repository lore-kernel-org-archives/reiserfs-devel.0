From: Piotr Siminski <piotr.siminski@globallogic.com>
Subject: [PATCH] MAINTAINERS: change reiserfs status to obsolete
Date: Thu, 20 Jul 2023 13:54:45 +0200
Message-ID: <20230720115445.15583-1-piotr.siminski@globallogic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=globallogic.com;
        s=mimecast20210517; t=1689854169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=c7080CelcZWJ+mm58M6YqWdRAhB/qpuLOxcf6z5iFjE=;
        b=UwcbQ7T1R1xXId+LC363tSUyCdrSakFNYuEPLbEHMXEW2HWzugidihH1Xc5vBZ7DXiyQQw
        YWRlvX8YnrJmediFrhZ5Ka7y5Ec86wSql7v9FeiKJvkSUcgt5NZ+RVRdt0RuJjcEa6Hpes
        ZxFN8KZYkdjeoAT8LMxNeS6uCAs2jR/F2FjewabHjXA2f3/DqN0LE9JBPJsb36WBG1tknK
        zD/6uFtFEI8aBquawNwqA9g1Oz5h0qPqieUhDZ9NYiEeA9vJmv90muPtI8Ss5/u/qjNxLS
        Zr2hHVLlyoXQLNFSr4pwsalO/j/4CGyDdi6gPduXWGmm+iWcOCjr+EFtyHzmcA==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; x-default="true"
To: Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Piotr Siminski <piotr.siminski@globallogic.com>

Reiserfs file system is no longer supported and is going to be removed
in 2025 as stated in commit eb103a51640e ("reiserfs: Deprecate reiserfs").

Signed-off-by: Piotr Siminski <piotr.siminski@globallogic.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a5c16bb92fe2..c340c6fc7923 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18064,7 +18064,7 @@ F:=09include/linux/regmap.h
=20
 REISERFS FILE SYSTEM
 L:=09reiserfs-devel@vger.kernel.org
-S:=09Supported
+S:=09Obsolete
 F:=09fs/reiserfs/
=20
 REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM
--=20
2.34.1

