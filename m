From: Jose R R <Jose.r.r@metztli-it.com>
Subject: SFRN 4.0.1 Reiser4-enabled netboot iso/USB
Date: Thu, 17 Mar 2016 13:33:47 -0700
Message-ID: <CAM12Q5QofV+9co-CUjXcvkDLTqs8UAKF54_==zwbbNbSp6797Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:date:message-id:subject:from:to:cc;
        bh=PyxXGyW2caqeu8KNlhiwIMSzdPLj0i2XJf4JWwkwmYA=;
        b=jZpvV8d3UqOqYR4T/DDcnSxZm0GZdTyOX8oXghKdx7aJhVyLmmBoQDxhnfrQe/sfKf
         cPOtDpJPHLza1WscaLLeBp9aKs8unClEcFb5FPSYBRESJtu+8BfmF41Pbyz9qv3YpNEL
         M9lavcEMWaDJXjqh/XzIZr7a6apjXv0SJaq8UEVxTrkRm88i8nisV9rIgrMwv2PWmG7s
         SB9HSS2SUzd2X0i2Mayf04lSS8jD+WitCo8c59Fok8SeHVzoZTDRGgU0HonJSHwDpNPb
         3sdPd5E4YP8gBqagFB8BqcZm6XbkUlEBhyzDpcfbFXhQoZ0BRk2bYD7YbFF0Z2FPxnGg
         6cCA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: debian-boot@lists.debian.org

Niltze, all!

Reiser4 -enabled Debian-Installer with user selectable Reiser4-patched
kernel has been submitted to an open minded media organization for
evaluation:

---------- Forwarded message ----------
From: Jose R Rodriguez <jose.rdrzzzzzz@metztli.com>
Date: Thu, Mar 17, 2016 at 4:47 AM
Subject: Re: XXXXXXYYYYYYY.com Inquiry
To: XXXXXX YYYYYYY <XXXXXX@xxxxxyyyyyy.com>


Good morning, XXXXXX-

Here is a link to an approximately 42 MB Reiser4-enabled
Debian-Installer (d-i) netboot: metztli.iso
https://metztli.it/readOnlyEphemeral/metztli.iso
https://metztli.it/readOnlyEphemeral/metztli.SHA256

If you wanna burn the metztli.iso file to a USB device -- to boot from
bare metal, for instance:
(sudo) dd if=metztli.iso of=/dev/sdb bs=4M; sync
where, of course, /dev/sdb represents your USB device

I recommend doing an expert install from the d-i menu and to install
Sid -- as d-i is gonna work until the next unstable kernel becomes
default* (around the weekend). Of course, you may also fall back to
Stretch -- but not Jessie (stable) as we are using unstable d-i.

Most important: please create a small /boot partition (say 100 - 150
MB formatted in ext2), since default GRUB2 installer does not
recognize Reiser4.

Note: since the metztli.iso image runs a streamlined (UDEB) custom
reiser4-enabled kernel, please ignore the warning (as exemplified in
snapshot attached). Thus, select yes to continue the install without
loading (debian repository) kernel modules.
https://pbs.twimg.com/media/CdxuY-EUEAAC398.jpg:large

And finally when presented with menu list of Linux kernels AMD64
available to install, of course, select "linux-reiser4-amd64." After a
successful Debian installation, you'll find syslog at
/var/log/installer.

Thank you in advance, XXXXXX.


Best Professional Regards.

P.S Care has bee taken to provide a usable software -- as well as
limited virtual and/or physical testing -- but as in all free
software, no implicit and/or explicit warranties are offered by
Metztli IT.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
