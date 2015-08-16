From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 2/3] reiser4: fixup status writes
Date: Sun, 16 Aug 2015 20:15:42 +0200
Message-ID: <55D0D34E.4020701@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010504050401070006000107"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=ZnRNsUXRtwlN1W+Dvl8DzC3r0sSAsiuW11WRsJGKn3s=;
        b=DrmOBjqQnT/MmRlme/VmQUyhB1k5nkhR6LealggZuc6SnKZ5bIFBEXG7JQInsy23ty
         Dy3I2OW4Rk8qerALSrjBGTCyFG6X0g8JUeVo7xM6KW0banD4pg+OO1HSoLUL7HrSKOEq
         rDcyoiWnegT3vtzSxLz7fDWX6zABc3s2r7xmY8LWmXG34JicHxz7renByZRKymnkXqNL
         +pyB9+fRw++4axXXt/JFwLf0++g5QXxuH34Yl2PRxXv++1PTmDJIKXY1obXzwZMbkxLl
         rvU2m6jvUjiqbUutkfU8Y0eneRNtke7yHBsCy9BRDZWFpcGJLmJS4PGa9IPrafjKCGKn
         jgmg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------010504050401070006000107
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------010504050401070006000107
Content-Type: text/x-patch;
 name="reiser4-fixup-status_write.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fixup-status_write.patch"

Reset bio in reiser4_status_write() to prevent oops in error paths.

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/status_flags.c |    1 +
 1 file changed, 1 insertion(+)

--- a/fs/reiser4/status_flags.c
+++ b/fs/reiser4/status_flags.c
@@ -145,6 +145,7 @@ int reiser4_status_write(__u64 status, _
 	strncpy(statuspage->texterror, message, REISER4_TEXTERROR_LEN);
 
 	kunmap_atomic((char *)statuspage);
+	bio_reset(bio);
 	bio->bi_bdev = sb->s_bdev;
 	bio->bi_io_vec[0].bv_page = get_super_private(sb)->status_page;
 	bio->bi_io_vec[0].bv_len = sb->s_blocksize;

--------------010504050401070006000107--
