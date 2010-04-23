From: Bartosz Szreder <cfiend.ml@gmail.com>
Subject: Re: Long rm times of ccreg40 R4 files
Date: Fri, 23 Apr 2010 11:26:52 +0200
Message-ID: <o2w720793691004230226ta20fb604x36b47da5102f73c3@mail.gmail.com>
References: <z2la08621851004230137s75d5c7e4h89ee72477fca56ba@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:content-type;
        bh=SdIfj1CkNpWqwr9IPx6WoYDR1EDeR+A+yBW6d9loNxQ=;
        b=CokK+qyylezuROxe+46bRe6Gcb+gbjHgFEJ/1m3etHGzPQop4iXnuD66WvLsFOBvSN
         yZnWuJu1Os/26qothozVRVVNyoxnja7tyWkWt66babR0bIiLlCHukqEcsdiw4QiPWtRy
         adMMuXNyKg8eyvNIJaD+oBTX5R5jgiHm7hO6Q=
In-Reply-To: <z2la08621851004230137s75d5c7e4h89ee72477fca56ba@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

I confirm. It takes quite some time to delete anything bigger than 100 MiB.

cfiend@Ebola ~ $ uname -a
Linux Ebola 2.6.33-tuxonice-r1 #1 SMP Tue Apr 13 09:39:51 CEST 2010
x86_64 Pentium(R) Dual-Core CPU T4200 @ 2.00GHz GenuineIntel GNU/Linux

/dev/sda2               /               reiser4         noatime,nodiratime 0 1
