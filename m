From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [PATCH] reiserfsprogs: remove old support message in reiserfstune.8
Date: Tue, 25 Jul 2017 17:57:04 +0200
Message-ID: <20170725155704.6430-1-xose.vazquez@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=oPC6KC8iUALSXqNxIVLE/ApPyMX94HJKk304Ukxm+Fw=;
        b=hyQdi8vaf3m8nvLSH2jTJLkfg9yI5Lq0nFrlBQQj7Ublida8flKzlWIe5mhuHGvitf
         S5vNXr5V2qVTPJnEVnFIT2gE3KFg75If48uJQ9v55WhFukhTUNTZ8Sor4E4yxvNQQHcZ
         ySHbH8IR2dwC5L1gHUjpZ/OZNPgdjhHN6GLyAycRHML/x7bayhMgyLxK9BMaK4Jq/Cbe
         Z5fLfr/xrOl4eswqzQS46PGEJY5NgKb+N46cb77fBhVWOVXUf+KPgqPVSZPd5oD7p4mo
         6TFVZ6aQB6XSzCWAfSvK6B6ID0vneY0bik29rffKYCtuYU7UNIq8qZT8SpVAzkl8WEuY
         VZkw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>, Jeff Mahoney <jeffm@suse.com>, ReiserFS ml <reiserfs-devel@vger.kernel.org>

CC: Jeff Mahoney <jeffm@suse.com>
CC: ReiserFS ml <reiserfs-devel@vger.kernel.org>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 tune/reiserfstune.8.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tune/reiserfstune.8.in b/tune/reiserfstune.8.in
index ecffc9e..df7636e 100644
--- a/tune/reiserfstune.8.in
+++ b/tune/reiserfstune.8.in
@@ -34,8 +34,7 @@ Note: At the time of writing the relocated journal was implemented for a special
 release of ReiserFS, and was not expected to be put into the mainstream kernel
 until approximately Linux 2.5.  This means that if you have the stock kernel you 
 must apply a special patch. Without this patch the kernel will refuse to mount 
-the newly modified file system.  We will charge $25 to explain this to you if 
-you ask us why it doesn't work.
+the newly modified file system.
 .PP
 Perhaps the most interesting application of this code is to put the
 journal on a solid state disk.
-- 
2.13.3

