From: jose.r.r@metztli.com (Metztli Information Technology)
Subject: Re: Reiser4 Linux 4.17.19-1 hangs in Google cloud VM, too.
Date: Tue, 29 Jan 2019 05:54:59 -0800 (PST)
Message-ID: <20190129135507.0815B30EF36B@huitzilopochtli.metztli-it.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1548770428; h=From: Date: Message-Id: To: Subject: Sender;
 bh=TqKiz41PU0GqKcph3uvA+kDO1wbwXtznhhNP32MseZo=; b=uZQcmGKf7Suvy7mfFLQassCAttnqFWFRAyToDWfZLCqhX3ypXmke/7FFAZAYYHUDCr5SSrlZ
 vTkvjnQCnZEivqdWBCjXzyQRnPa7pV2/JDIyybrEayzXD1wyakIo3xMOu9RKdGk1mNLzqrfU
 YAwvOO69AHd8XxKRoepsZoWOKIs=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@zeniv.linux.org.uk, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org



On Mon, Oct 22, 2018 at 8:38 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Oct 22, 2018 at 03:19:12AM -0700, Metztli Information Technology wrote:
> > I installed reiser4 -enhanced Linux kernel 4.17.19-1 --thus replacing the prior hung reiser4 -patched kernel 4.18.15-1 in the Google Compute Engine (GCE) cloud instance. After less than 24 hours the 4.17.19-1 hung in similar way to the 4.18.15-1.
> >
> > Please note that I had been running my custom Metztli Reiser4 Debian Stretch image with reiser4 linux 4.14.20-1 without issues for several months
> > < https://github.com/Metztli/reiser4-debian-kernel-packaging-4.14.20 >  --until I decided to upgrade to newer kernel(s).
>
> Er...  Does anybody maintain reiser4 these days?  I can't recall a single mail
> along the lines of "such-and-such VFS/VM/scheduler/etc. change would break reiser4"
> in quite a few years (more than a decade, most likely)...

Issue has been mostly resolved (Thanks to Mr. Edward Shishkin -- reiser4 developer)
< https://sourceforge.net/projects/reiser4/ >

Specifically at:
< https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/ >

*yet* digging deeper, hang issues in Reiser4/Zstd transparent compression were in large part due to a downstream change in the kernel configuration, i.e., Debian packaging for Linux kernel 4.14.xy, had this default setting in linux/debian/config/config:
# CONFIG_NUMA_BALANCING_DEFAULT_ENABLED is not set

However, in Debian packaging for Linux kernel 4.15.xy, and up to current 4.20.xy, default in
linux/debian/config/config was changed to:
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y

*That* change was causing my Debian reiser4 stretch-backports for AMD64 kernel builds most of the issues that I described.

Specifically *this* setting (reprinted again below for emphasis):
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y

in a reiser4-patched kernel Debian node hosting [a] type 2 hypervisor VirtualBox
directly caused a range of my VirtualBox 5.2.x to 6.0.x successful builds to *hang* their VMs during formatting/executing in reiser4 instances of 2TB root fs slices. Further, it caused corruption of VirtualBox previously built virtual machines which root fs was reiser4.

Modifying setting in downstream Debian Packaging for Linux kernel configuration as:
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=n

in linux/debian/config/config , my subsequent kernel builds in my development environment fixed most of the issues that made me reach out for help:
% uname -a
Linux huitzilopochtli 4.20.0-1+reiser4.0.2-amd64 #1 SMP Debian 4.20.4-1+reiser4.0.2 (2018-12-26) x86_64 GNU/Linux


Thank you, Al.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch w/ Linux 4.20 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/

