From: Felix Zielcke <fzielcke@z-51.de>
Subject: Re: Reiser4 for Linux-4.14, Reiser4progs-1.2.0, Libaal-1.0.7,
 Format 4.0.2
Date: Mon, 27 Nov 2017 16:27:01 +0100
Message-ID: <1511796421.5344.6.camel@z-51.de>
References: <2cf6aac6-650d-4940-359d-316dc70a183d@gmail.com>
         <1511788205.5344.2.camel@z-51.de>
         <8db85297-34f8-980c-dab9-c98b95fb592c@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=z-51.de;
        s=exim; h=Subject:Content-Transfer-Encoding:Mime-Version:Date:Content-Type:
        References:In-Reply-To:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=19yoaXHuvTr1oe+gbETUF2c95KWmKTd0zKj9ZbBN0Jw=; b=GX47FX29Q80VuAW2+NrWdxIn/Q
        zApM9dxPwo0XYIcDDExTLXtVYUbhPGvU9fT5Q6306OA9r/F8Y3IHcU1KKfxfVTXi2t8QVmgNxwgsi
        5y8rimCpqwsmEkx9ZqI6Dn9Su0X32Zw0SRGver1o11zqURXxxydW49Bh5+PYuezuv5Zo=;
In-Reply-To: <8db85297-34f8-980c-dab9-c98b95fb592c@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Am Montag, den 27.11.2017, 14:46 +0100 schrieb Edward Shishkin:
> Hi Felix,
> 
> Thank you for the report, I'll try to find out, what is wrong.
> 
> Edward.
> 

Hi Edward,

I got now a hint on the Debian bugtracker
The problem seems to be the variable used in the configure.ac check for
falign-loops
This patch seems to fix it:

--- a/configure.ac
+++ b/configure.ac
@@ -408,7 +408,7 @@
 fi
  
 # Force no alignment to save space.
-if test "x$falign_loop_flag" = xyes; then
+if test "x$falign_loop_flag_cv_" = xyes; then
        ALIGN_FLAGS="-falign-jumps=1 -falign-loops=1 -falign-functions=1 \
 -falign-labels=1 -fno-inline -fstrength-reduce"
 else

Regards
Felix
