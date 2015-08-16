From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 0/3] reiser4: metadata checksums - take 2
Date: Sun, 16 Aug 2015 20:15:07 +0200
Message-ID: <55D0D32B.7070307@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=W2v0I+m0p+eVos4gbJed/PhvGZ94Bq8YqDWjsfcTG9s=;
        b=m1qYcXZnuu+Yy8GKFFm3sWKRM9EXUr8cSUmiOBfmpGYKGyPmRplN8qWpy+PsrN+f2f
         09reuQmzU9k3SbHwWMz3L13mV/Gg3bdNY9iKtxAEC8Yce7UZJN+3RHUm+MY4QIDZA1RJ
         QNVxUaazVJUHif2ysvxrIyUiNzVogztMfZAt8czDF5irp+dP9JQFUL3EDp0UiR0lNIgN
         T2GYJNv1tuXAPJcJlbwF1pxfIUd5se+uBNxuBf6/oE7RTheJrnAswFI2ObXh+jErV+Pi
         4kyW1p5ox/6L2PAFmBEyTQ5F3hLSE85Ai6rYh/YsaypASIgI0vhHyFiIDATgHU6PWmEe
         L+jA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

The same as previous series plus handling case of failed
checksum verification (instead of just issuing warnings).
