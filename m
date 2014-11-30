From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 3/3] reiser4: fix up compile errors when debug is on
Date: Sun, 30 Nov 2014 22:42:35 +0100
Message-ID: <547B8F4B.1070400@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-type:content-transfer-encoding;
        bh=KQ0Hu9KozJk3ABH2iQaY7NaAfCeGprJNn4X8xl5noD4=;
        b=rmOsPG+yBu3ES9kKjHBKnonQY81KCnG5RIMzNj1gOXXvDvxVzOU+jFSqbaBS+ATP2m
         82Fn5YcKvR/dvUlCDm1hNxrFBr9Fex2smPRu6WaBsJfR8Px5T0rEwXYZ3YTODsDCbkNA
         mZ52igRs5V8NfjIY9U+QPuvXVIQ7PBf/582TlFMgKyhi2v6hRX05ZjKw9z71dCa0pYN2
         m1Du+ApLsfXpkZtsN0+yAoT8O2BCkhOJY9Aj8ImuGTN+8yZ5Ir6itRS7B89fs0622QjI
         WPfsfpFAivUhY9SDb7ub8ZwnBJY8YKxQX94DK3cW6aDQRXypPTOzLFs33qIN3lpN3mGi
         Layg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
