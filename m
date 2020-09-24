From: David Niklas <Hgntkwis@vfemail.net>
Subject: PATCH reiser4 support for Linux 5.8.10
Date: Thu, 24 Sep 2020 13:21:58 -0400
Message-ID: <20200924132158.38fa279f@Phenom-II-x6.niklas.com>
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
        <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
        <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
        <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
        <20200817105604.454981dd@Phenom-II-x6.niklas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=rsbrzNBJkacP
        pVJwOelaXLkQSRipjzlA+7XC0ZOCUpQ=; b=aV25gztyX36Z/DMduFCmAiowPMkC
        zq7tbpDSijeIcOoMITFdcRnSU3EdmbN5tjIq53VdMqGwhbTPGi7i2nLj+4Xm0pYb
        st8GQ3bTsE4cHJ+kt/cKxPbxzNfVMXlUSUBUNJAo3uSx+orV3JjaE69gICTyM6YX
        ZxavqimR5U2TinU=
In-Reply-To: <20200817105604.454981dd@Phenom-II-x6.niklas.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

I'm a kernel dev newbie. Please double check my work if in doubt.

The patch for reiser4 support for Linux 5.8.1 didn't apply to 5.8.10. It
needed only a one line change, but because of all the fuzzy matching and
offset matching I thought I'd make a new one.
The file that failed to patch is fs/fs-writeback.c. A struct got one of
it's members removed. As the entire struct was removed by the patch I
thought it good to ignore the missing member instead of trying to dig up
what it was used for and why it was removed.

Thanks,
David
