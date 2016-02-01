From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Booting uncompressed kernel images
Date: Mon, 1 Feb 2016 02:37:30 -0800
Message-ID: <CAM12Q5T5ZJDCUDyExcBrCUK71NH=r00LwsEqZ5AgR9yF9U4M+Q@mail.gmail.com>
References: <CALdTKe-JA3LfHzqjSWKxjEYdfg=dGSC+juH-rm3ZvFN2FrXn7A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=eFCwjI7UPQZxokHG2rVmUO3v6Yvv3oTpyjkP6UOtBG8=;
        b=q0xnV3JOnliIhoFxsAmyFAfjIRfEe+MJtVF04+cWJWZyZqyGA8cFL9rUTg/8IwW/D7
         FYE9sgq5avOR7kUZgdW0IvDfGguDXrNCFsqzfnJyhM6ZLCsUAhiLwPvF7JlQsnLGovww
         m/1RckffgPWc2a7vwAiJ8Itj+zpnjCzHX/5/YQcwRNRQltjpEZeTZHizVrj8Wy/fr5NW
         h3ZOzSw/pTUgMUa5bI/OmRLH5alsTMxFztjzrtAJ63YBHu7eNAlJqF+2pOvlsqbgit0G
         UvodcyDIw2Y0o2pC+sv8DRQlqm2b1eIlgUzLuW1LqTiAYj7qtQDj6TRZDLccrB2Y68gm
         9cpg==
In-Reply-To: <CALdTKe-JA3LfHzqjSWKxjEYdfg=dGSC+juH-rm3ZvFN2FrXn7A@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tiago Ilieve <tiago.myhro@gmail.com>
Cc: debian-kernel@lists.debian.org, debian-cloud <debian-cloud@lists.debian.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Mon, Feb 1, 2016 at 12:03 AM, Tiago Ilieve <tiago.myhro@gmail.com> wrote:
> Hi,
>
> I have a scenario[1] where the default Linux kernel compressed with XZ
> (from Jessie and up) cannot be booted. The first thing that I've tried
> was to uncompress it using "extract-linux"[2] and it didn't worked by
> the time, so I decided to rebuild the entire "linux-image-*" package
> changing "CONFIG_KERNEL_XZ=y" to "CONFIG_KERNEL_GZIP=y". This, of
> course, implies that it would be needed to recompile the kernel every
> time a new version of the package is released, which is an overkill
> for a such simple requirement.

Does the kernel boot after after you rebuild it with GZIP=y?

>
> Yesterday, Ben Hutchings itself suggested[3] me to write a hook that
> decompresses the kernel at package installation time, something which
> I find a great idea. The problem is that, again, I couldn't boot a
> machine (tried on VirtualBox and Xen) after uncompressing its
> "/boot/vmlinuz-*" using "extract-linux".

The script is not without its issues, apparently, but you can modify
xxx[1] in script if that is causing your hang.

> I can generate an initrd file
> from this uncompressed image, "update-grub" detects it fine, but if I
> reboot it the following error appears:
>
>     Loading Linux 3.16.0-4-amd64 ...
>     error: invalid magic number.
>     Loading initial ramdisk ...
>     error: you need to load the kernel first.
>
> The same error happens if this uncompressed image is compressed again
> with "gzip", for instance.
>
> Given this situation, I have two questions:
>
> - If a kernel is configured to be compressed at build time, it can't
> be booted if uncompressed later? I have some doubts about this,
> because there is more than one report of successfully booting
> uncompressed kernels[4][5].
> - Is "extract-linux" stripping some essential information (the script
> looks for an offset to start the decompression process) from the
> kernel image that is needed to boot it later? If so, is there a way to
> recover and insert it on the uncompressed image?

In Google Cloud Engine (GCE) I have not experienced those issues as I
have created several images in Jessie and Stretch -- manually at the
moment. They are Debian vanilla except for Reiser4 -patched kernel and
root (/) Reiser4 -formatted.


Best Professional Regards.

PS I have also found binwalk [2] useful when examining contents of
compressed kernel
apt-get install binwalk


Was not aware that Oracle had such an outdated cloud infrastructure ;-)

[1] http://stackoverflow.com/questions/12002315/extract-vmlinux-from-vmlinuz-or-bzimage
[2] http://unix.stackexchange.com/questions/163346/why-is-it-that-my-initrd-only-has-one-directory-namely-kernel

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
