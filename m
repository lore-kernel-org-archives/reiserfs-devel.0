From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 2/3] reiser4: fixup status writes
Date: Sun, 16 Aug 2015 15:22:42 +0200
Message-ID: <55D08EA2.5050902@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080500070602000509060502"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=bLc8IkGK0nW4/6Yi7yDHcMb68yMau4xIMQTT4wAuBjU=;
        b=WH9HkN7JeyJne5XuCoymuIZz8ivdxEw+wV1D8PJog25MW7Lz/9ekHaXZrMys6bYlXB
         uvbntFyJlMUBSZe25Yef1iGPheUZsWLtZzXxR0vIl9X0nA+VdhTnsZ/8Tk6e7AqJf5rF
         2I80C7Rkml4YIeVPa3gKsYfFb/RNvWILC/IpcvXNlZ+le949S9nsVNOjwoNaBoPBljEL
         Anyei3k/oM41BHB/v6vlltZ+rvqjOJuSiKLeiIllSkyVtybGGk2xGyEN+Dw+DUnerqw8
         NvH4dPkFsLvTfzClfAdn7qIheCZLjrSjbbyaBaVgqBhCDjT4gNbg9aXKzSJK4k1YFbrR
         46cA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080500070602000509060502
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------080500070602000509060502
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

--------------080500070602000509060502--
