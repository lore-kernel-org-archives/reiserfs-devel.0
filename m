From: Sandro Souza <escovadordebits@gmail.com>
Subject: Question about the Reiser4 patch for kernel 2.6.38
Date: Sat, 24 Mar 2012 20:10:46 -0300
Message-ID: <CANish_m0MWeeQxywQzeAqCEMSoCbuu7-0ixOLC6Qk0Api+x9=g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=vOe1lGwEFi7Qf7v4rqqZzYnER88CTFlIzJuowXPP5sk=;
        b=smnkmtjLCdx6G3nNrZOR8Ff8gEmzu9jOEZO4CC2v55+Q67CGftly8XqpOR/HcxpiuQ
         bPw+yCjbuh/Gr4xMLI6SnR77ZJSVa1D9gq94ICCDTTFnAhtKQK1o9ZbaPB9qoesslmcZ
         AL6QR5r8pS10IUIYiw80oz3pdqwsdXsu35FUAoXEnlnY5AU92Whq51b+oJPK46gbedVZ
         YP6QjUjjtHg7bkI/Y9jAZw2Iez471aoOhZrQpB82xgZBfBy85dICxtlwTlUUx89bUenU
         X9jXbbDBA6mhzbCG7XYTMRhjDL3T0jtc0msCtvO//nP82v6EeGpNc7Kgr3klXzCNZJv7
         YhwA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello my friends. : D

Firstly, sorry for my bad English (I'm just a brazilian newbie).

Recently, I downloaded the 2.6.38 kernel sources, and I applied the
Reiser4 patch for this kernel version (for Ubuntu 11.04 - Natty).

But I saw that the file "page_cache.c" has the same change (Riffard's
patch) showed in page http://linuxhelp.150m.com/jews/saboteurs.htm

This left me worried. :(

May you (Reiser4 developers) tell me if I can compile and use the
kernel this way?

May you tell me if that page is showing "unwanted" changes in the
Reiser4 source code?

Thanks in advance.
