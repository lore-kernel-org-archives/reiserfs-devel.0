From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Debian progress in automatic download/install of Reiser4 AMD64 kernel
Date: Wed, 24 Feb 2016 03:56:40 -0800
Message-ID: <CAM12Q5TOyzDMGUdJQuacYot7hkWr2c4wMZYkLLkbDNbrKk7Xkw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:date:message-id:subject:from:to:cc:content-type;
        bh=4oMmJ1DmQpbkvrncJfhC8FUAs4co12WEPnQLAHM9584=;
        b=S2P58c4bM2CEsmWcQtDt6CpDDLDvMVCeMjT/I2Vd4nl1kDEttvFon02kUzX10Bh23G
         Rz5NTIR2Vhp0ORlEZWFezJ7Oa0jyA9ZCmYvAuqIITWKrKrqaCKJB3osJfk6oZ5tMyMW5
         WyTZfyyYbnCIbaJ/NWK/mmEe27DHjmIvNyGPwKIioflwrBWwND6PJi6bUCdJ2iCYaOYF
         +5ANt6KZIANSG+gCmVGbMFowmFaPocZa72t91OXGNGcUq475cZg7jD2RL0+V2bLYnIuC
         xJZGJu3/lEqGgoMwOPkHCN8gwk2fxrlPGL20tQGHl+lk5ue2Z1kLEhcCurUdDACVTmY0
         xaXA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: debian-boot@lists.debian.org, onelove@devuan.org

Niltze, all-

I have hacked (literally) additional UDEB components of the Unstable
Debian-Installer (d-i) which basically resolve the automatic
modification of /etc/initramfs-tools/modules, SSL download of the
Reiser4-enabled Linux kernel (from my site, as Debian.org and
Devuan.org obviously are not interested) and create initramfs with
Reiser4 support.

Below is my first custom Reiser4 installation into 'Necoc Yaotl' host
virtual machine -- 'remotely' ;-) via ssh -- from another virtual
machine (Cohuatlicue host); this latter executes the menu-driven
expert Debian-Installer (that's how I monitored the successful Reiser4
kernel installation procedure).

https://pbs.twimg.com/media/Cb-bQDRUkAAqD5H.png:large

Only requirement was not to select (any) default Debian kernel(s) from
menu *but* to select to install GRUB (option) to the virtual disk --
*even* if I had not selected any kernel to install. The finish-install
procedure [script(s)] at the end actually performed the 'magic' for
this Reiser4 support hack (took me a while, but worked :)

My next aim is to include the Reiser4 Kernel into the default
menu-driven d-i so as to allow the user to select it. And finally to
create Stable Debian (Jessie) images for a relatively normal user
installation of Reiser4 filesystem.


Best professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
