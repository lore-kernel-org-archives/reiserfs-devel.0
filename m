From: Viji V Nair <viji@fedoraproject.org>
Subject: reiser4progs-1.0.7 compilation error.
Date: Tue, 20 Oct 2009 14:05:12 +0530
Message-ID: <84c89ac10910200135i2f8c3b11q5850d08bb63ab1e0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=38li6MGzzLcz2qEG1QdgXLgVya2qZqey7gvTvlmox9A=;
        b=PYdOr41VfrmTB/TO3ZeJMydZcU6m9/JhhKmGZO8yrHuASq7sJF5yL4l4fZXD6YKDtD
         NrZsO2i/HjCEO2TZ+Rm8U0K8ZN69wIBqQSUX9DxalOBoZAzQdg/dNFOtWvXIqxYAXoKt
         vdME5kPvSULlgK06SSP3jFSOKqMsCDMcXUWcw=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hi,

I am trying to compile reiser4progs-1.0.7 on a Fedora 11 64 bit
machine and it is throwing the following error.

<snip>
checking aal/libaal.h usability... yes
checking aal/libaal.h presence... yes
checking for aal/libaal.h... yes
checking for libaal version = 1.0.5... no
</snip>

I was followed the step in the following URL except the "sed" part.
(even with sed it is showing the same error)

http://reiser4.wiki.kernel.org/index.php/Reiser4_Howto/GRUB

The command which I have run is "CFLAGS="-fno-stack-protector
-I/usr/local/include" LDFLAGS="-L/usr/local/lib" ./configure"

I have installed libaal to /usr/local/ and there is no error while
compiling this, add lib path to ldconfig also

While googling I have found some old bug releated to this.

Any help on the same is greatly appreciated.

Viji
