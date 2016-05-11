From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Bug#823986: installation-reports: "hardware" errors on virtualbox
Date: Tue, 10 May 2016 19:36:52 -0700
Message-ID: <CAM12Q5QAV6LV__eahx16_rLxtT3zNuZnxKXVXbpExLkAzo5LNg@mail.gmail.com>
References: <146293002411.13267.14445852398726516532.reportbug@umbar.angband.pl>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=t10Wh7+fiQiM5EWBC9npu6Q8xy0Rcf2xhiussFX7md0=;
        b=a6TXfFXl07ln0TpoR39UdJindMlwH0CfO8pzgbx2oCyzDIQZX91jrAACBktEvGz1As
         hxuEDE6uVTno3e7oEmcB76TEbq52NZ/ri6yYRjCXnjzVNA/NbjDn+NtGPv+PH4SLGBCb
         qgoKnNz7soymeRn60xT38iV+bXarPKr+oIn/JzmyXC0+XzFgSfH5jNL1Kz8X/6ztnKUl
         n/4RPjOAgtSoDAk0GHzAbP+jUbub2TMV+x1f6ymUucqXNyvJi8HK11CgKdIdLnHrN868
         owAjPtiNvstXcJBE2OYT2Se2OTTVoHV8QA9qCuJLAIyazyWsxkRaOp9ERZ1V6sWegB71
         gS6w==
In-Reply-To: <146293002411.13267.14445852398726516532.reportbug@umbar.angband.pl>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Borowski <kilobyte@angband.pl>, 823986@bugs.debian.org
Cc: Debian Bug Tracking System <submit@bugs.debian.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

"02:29 < kilobyte> reproduced in virtualbox: lots of I/O errors: ata1.00:
                  failed command: WRITE FPDMA QUEUED"

As I frequently test Reiser4-enabled unstable Debian-Installers on
VirtuaBox 5.0.16 (my latest version), on a frequent basis I come
across similar I/O errors: ata related as well as some other
idiosyncrasies related to unstable nature of my d-i builds. Wait a few
days for the debian-installer component UDEBs to stabilize and work
better together --in harmony-- then try your installation again.


On Tue, May 10, 2016 at 6:27 PM, Adam Borowski <kilobyte@angband.pl> wrote:
> Package: installation-reports
> Severity: normal
>
>
> 00:37 < calops> hi, is there any known issue about the testing installer
>                 (netinst and CD) failing around the "selecting packages"
>                 step?
> 00:39 < calops> it happens to me both natively on my machine, and as a
>                 virtualbox guest
> 01:35 < Sledge> calops: anything in syslog?
> 02:29 < kilobyte> reproduced in virtualbox: lots of I/O errors: ata1.00:
>                   failed command: WRITE FPDMA QUEUED
>
> Syslog attached.  The failed step was "Select and install software", no
> error message was given other than "installation step failed".
>
> No hardware or software errors on the host, other VMs work fine, so this is
> not a fault of the new version of virtualbox (current unstable --
> 5.0.20-dfsg-1).  And that calops guy reports it's failing on bare metal too.
>
>
> -- System Information:
> Debian Release: stretch/sid
>   APT prefers unstable
>   APT policy: (500, 'unstable'), (150, 'experimental')
> Architecture: amd64 (x86_64)
> Foreign Architectures: i386
>
> Kernel: Linux 4.6.0-rc6-debug2+ (SMP w/6 CPU cores)
> Locale: LANG=C.UTF-8, LC_CTYPE=C.UTF-8 (charmap=UTF-8)
> Shell: /bin/sh linked to /bin/dash
> Init: sysvinit (via /sbin/init)



-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
