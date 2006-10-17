From: Edward Shishkin <edward@namesys.com>
Subject: =?UTF-8?B?UmU6IFsyLjYuMTktcmMyLW1tMV0gZXJyb3I6IHRvbyBmZXcgYXJndW0=?=
 =?UTF-8?B?ZW50cyB0byBmdW5jdGlvbiDigJhjcnlwdG9fYWxsb2NfaGFzaOKAmQ==?=
Date: Wed, 18 Oct 2006 01:19:25 +0400
Message-ID: <453548DD.3000701@namesys.com>
References: <20061016230645.fed53c5b.akpm@osdl.org> <200610171603.38253.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080209030100060709020601"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750957AbWJQVTk@vger.kernel.org>
In-Reply-To: <200610171603.38253.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: andrew.j.wade@gmail.com
Cc: Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

This is a multi-part message in MIME format.
--------------080209030100060709020601
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Andrew James Wade wrote:

>Hello,
>
>The latest -mm introduced a new error:
>
>  CC      fs/reiser4/plugin/crypto/digest.o
>fs/reiser4/plugin/crypto/digest.c: In function ‘alloc_sha256’:
>fs/reiser4/plugin/crypto/digest.c:17: error: too few arguments to function ‘crypto_alloc_hash’
>make[2]: *** [fs/reiser4/plugin/crypto/digest.o] Error 1
>make[1]: *** [fs/reiser4] Error 2
>make: *** [fs] Error 2
>
>Andrew Wade
>  
>
The fix is attached.
Andrew, please apply.
Thanks.

--------------080209030100060709020601
Content-Type: text/x-patch;
 name="reiser4-fix-alloc_sha256.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-alloc_sha256.patch"

Fixed alloc_sha256 (missed argument)

Signed-off-by: Edward Shishkin <edward@namesys.com>
---
 linux-2.6.19-rc2-mm1/fs/reiser4/plugin/crypto/digest.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

--- linux-2.6.19-rc2-mm1/fs/reiser4/plugin/crypto/digest.c.orig
+++ linux-2.6.19-rc2-mm1/fs/reiser4/plugin/crypto/digest.c
@@ -14,7 +14,7 @@
 static struct crypto_hash * alloc_sha256 (void)
 {
 #if REISER4_SHA256
-	return crypto_alloc_hash ("sha256", 0);
+	return crypto_alloc_hash ("sha256", 0, CRYPTO_ALG_ASYNC);
 #else
 	warning("edward-1418", "sha256 unsupported");
 	return ERR_PTR(-EINVAL);

--------------080209030100060709020601--
