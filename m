From: Matias Seco <matias.jose.seco@gmail.com>
Subject: R4: setting a swap file
Date: Sat, 26 Nov 2011 17:31:16 +0100
Message-ID: <CAMjNLwobU+ENtHCn5+84+mOCrL=qcdcgBRTp8LOh41XgSNfbLQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=8muD6euKTRFevDJ7rAjw6zlre24IMYy+dkds2XL2Y30=;
        b=syh98z69nJej3EGMf/EKMc++C4enfnitMJp/T4N8/b31XN1092vvRBNsufwOyXfYC1
         1aHKP4VQOF3uBi8FXnYA523VIJVkADriMVAWexA5FpyC0OkKH999QaEpw+md3+RnZZIw
         r8unUBsoQESMd7O0G28UyUF+3dzrRXO4F9w1o=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

if we would like to set a swap file through:

dd if=/dev/zero of=/swapfile1 bs=<int number (kb)> count=<bs*int number>


we should consider bs (block size) equal to cluster size's plugin
value? (4k, 8k, 16k, 32k or 64k)


PS: sorry, if this thread could be off topic from mailinglist scope,
if it is, please notify me :)

Regards,
Matias
