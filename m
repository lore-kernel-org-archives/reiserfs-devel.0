From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Wed, 18 Sep 2013 06:14:42 +0000
Message-ID: <523944D2.40409@gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so> <5238B2FF.5060900@gmail.com> <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com> <5238BD79.6030005@gmail.com> <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com> <20130917211510.Horde.Zc6miMwWvs-M3goxK91zdw1@mail.thieu.so> <5238D17D.1080806@gmail.com> <20130918034441.Horde.FO9Ni879mCm-vV7kvTW6yg1@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=z2R4ti/WQSs7OjyX154s3Ro0Lw7WvPWinGv0OKtqJAE=;
        b=PaKoNLqUFwlwX2RGErP+gh9Lave3j5nvIp9r5bYCGZGF8D2slonbjxMxNTJKgy4sp5
         mJjCUaEjFJvCXJ5BEDPMqDwxj7sQBBEYfj7fzK9JMRqRklrZsRM086UA8HcDQh/H1iCR
         PQesHq8+va6lXZo/GLFyvoIp3q7J3K1/fjB9aKo89pnLI27B/KQ/SZ9jLz/d8txHJscf
         sd0qV3zjDBzALBq5rH1fUHOZ6aC1rnheHWGqdXaF6OB0j5XPEutVdn40/RP5Rn9P6rP0
         S4vlmK1+aiM3WrxVq0d9i8fVFdPDjCoXW3qu6HtkuLWIarf8B6ujoguR3C1aPjdKGyF8
         PtQg==
In-Reply-To: <20130918034441.Horde.FO9Ni879mCm-vV7kvTW6yg1@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mathieu Belanger <m@thieu.so>
Cc: Evgeniy <iron.udjin@gmail.com>, Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

I get the following error during compile on the 3.12-rc1 and down the
line it kills the build.

fs/fs-writeback.c: In function 'generic_writeback_sb_inodes':
fs/fs-writeback.c:641:3: warning: passing argument 2 of
'__writeback_single_inode' from incompatible pointer type [enabled by
default]
   __writeback_single_inode(inode, &wbc);
   ^
fs/fs-writeback.c:414:1: note: expected 'struct writeback_control *' but
argument is of type 'struct writeback_control **'
 __writeback_single_inode(struct inode *inode, struct writeback_control
*wbc)



On 09/18/13 03:44, Mathieu Belanger wrote:
> https://github.com/DestroyFX/reiser4/tree/reiser4-for-3.11-r4
>
> Sorry for the delay.
>

