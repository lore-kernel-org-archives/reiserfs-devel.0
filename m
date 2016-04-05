From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Bug#820038: Copy signatures into udebs
Date: Mon, 4 Apr 2016 22:20:48 -0700
Message-ID: <CAM12Q5TX-tV62LQfoWv80jYBUuU=eM6qCYD84+gyghB2hbRdqw@mail.gmail.com>
References: <145981096603.17822.3867789910821924612.reportbug@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=duEBqB3WiVO+6cjA6u21R1sgePSrVcS9rhyFTAu81pA=;
        b=Bd9qBy4lXNlbHGm6e/kmZrM23HF6+3wZn+FpwTnZGY+dOE3RQ9ceAubvAOteWsFa/B
         OpNWs4/roV3PXvqxbr7NPHaFHV2d28UTWJbW7Sz28ZD4pbVkIFCBkhJgxqeqEnpBaD7H
         NFV6YRsTSXeHWID6eqloTincre0lvpWd0yFJePP2puSmlfW6PRs6slrdw/qnQSAczSI4
         WF3J+NOVMnduDsKED/I0qZKVfM5LQI3JiwPt6ZtUUyt+FxZfsrBcwzjg5YcqsrGuojup
         U4YFtb/K2nD89OJawmaS60EyIkRzf3eoOpcR1TJIAwllw1iIactEvaTddovRybdxkA9V
         ip/w==
In-Reply-To: <145981096603.17822.3867789910821924612.reportbug@deadeye.wl.decadent.org.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Hutchings <ben@decadent.org.uk>, 820038@bugs.debian.org
Cc: Debian Bug Tracking System <submit@bugs.debian.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Thus, in practice it means that an out of Linux source tree module,
like Reiser4, will be a reason for Debian-Installer (d-i) to baulk at
install?

On Mon, Apr 4, 2016 at 4:02 PM, Ben Hutchings <ben@decadent.org.uk> wrote:
> Package: kernel-wedge
> Version: 2.94
> Severity: normal
>
> We will probably implement module signing using detached signatures
> which kmod will concatenate to the modules at load time (see #820010).
> mkinitramfs will need to copy the detached signatures along with all
> the modules it includes in each udeb.
>
> It might also be necessary to add special support for signed kernel
> images, although linux-signed may end up generating the udebs for
> that directly.
>
> Ben.
>
> -- System Information:
> Debian Release: stretch/sid
>   APT prefers unstable
>   APT policy: (500, 'unstable'), (500, 'stable'), (1, 'experimental')
> Architecture: amd64 (x86_64)
> Foreign Architectures: i386
>
> Kernel: Linux 4.4.0-1-amd64 (SMP w/4 CPU cores)
> Locale: LANG=C.UTF-8, LC_CTYPE=C.UTF-8 (charmap=UTF-8)
> Shell: /bin/sh linked to /bin/dash
> Init: systemd (via /run/systemd/system)
>
> Versions of packages kernel-wedge depends on:
> ii  debhelper  9.20160313
> ii  make       4.1-9
>
> kernel-wedge recommends no packages.
>
> kernel-wedge suggests no packages.
>
> -- no debconf information
>



-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
