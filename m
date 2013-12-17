From: Wang Sheng-Hui <shhuiw@gmail.com>
Subject: [PATCH] reiserfsprogs: update the min block size description
Date: Tue, 17 Dec 2013 15:42:50 +0800
Message-ID: <52B0007A.7070102@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=FrlPoPQDO+yp5amIpDxk5E8xrpR0CRnca8/t1aa83WE=;
        b=W7fEUlRBnSjEyf2E4bsoMfz4BXyoZe1TtZjJBu/qOc7ujQyP6buBdLeIAXVxATxC7k
         5n03ImHsq2PCuOjWmDsP2Eq0dbREDxdV6gBAAfpN6jnOdtIudlT4QCtkqHQ+fTjOoPSm
         Pjx562ted99eEQ5TAgXeyWoWxJjYlvCpELs1XpBmD2R80vditkee8kFTA7zs/A5VIZaO
         QgvD5MgGGmKrE9OAi6PsbqmvmAhALpzLgLEuE1AvQknt7pU1kggEOv5IYzfpncoar+W5
         8O70Rp8LNr+9Is2qp7S4wSIhXYMiSM24nbE3BOrm2tapBGSTzJ2uTHKn2KiDHO+mcy88
         gzww==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


Current minimal block size is 4096, not 512.

Signed-off-by: Wang Sheng-Hui <shhuiw@gmail.com>
---
 mkreiserfs/mkreiserfs.8.in  | 2 +-
 mkreiserfs/mkreiserfs.c     | 2 +-
 reiserfscore/node_formats.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/mkreiserfs/mkreiserfs.8.in b/mkreiserfs/mkreiserfs.8.in
index 850854f..90036b9 100644
--- a/mkreiserfs/mkreiserfs.8.in
+++ b/mkreiserfs/mkreiserfs.8.in
@@ -33,7 +33,7 @@ automatically set it.
 .TP
 \fB-b\fR | \fB--block-size \fIN\fR
 \fIN\fR is block size in bytes. It may only be set to a power of 2 within the
-512-8192 interval.
+4096-8192 interval.
 .TP
 \fB-h\fR | \fB--hash \fIHASH\fR
 \fIHASH\fR specifies which hash function will sort the names in the directories.
diff --git a/mkreiserfs/mkreiserfs.c b/mkreiserfs/mkreiserfs.c
index 6739850..d16d99e 100644
--- a/mkreiserfs/mkreiserfs.c
+++ b/mkreiserfs/mkreiserfs.c
@@ -460,7 +460,7 @@ static void set_block_size(char *str, int *b_size)

        if (!is_blocksize_correct(*b_size))
                reiserfs_exit(1, "%s: wrong blocksize %s specified, "
-                             "only power of 2 from 512-8192 interval "
+                             "only power of 2 from 4096-8192 interval "
                              "are supported", program_name, str);
 }

diff --git a/reiserfscore/node_formats.c b/reiserfscore/node_formats.c
index fccb8ea..6b8c440 100644
--- a/reiserfscore/node_formats.c
+++ b/reiserfscore/node_formats.c
@@ -1266,5 +1266,5 @@ void mark_objectid_used(reiserfs_filsys_t fs, __u32 objectid)
 int is_blocksize_correct(unsigned int blocksize)
 {
        return ((((blocksize & -blocksize) == blocksize)
-                && (blocksize >= 512) && (blocksize <= 8192)));
+                && (blocksize >= 4096) && (blocksize <= 8192)));
 }
-- 
1.8.3.2

