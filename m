From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: SFRN 4.0.1 Reiser4-enabled netboot iso/USB
Date: Sun, 27 Mar 2016 05:01:18 -0700
Message-ID: <CAM12Q5S5zZvaLiP15cb7rKhw307Dw0N-vQ4gzXKaEMWvgP_-ew@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:date:message-id:subject:from:to:cc;
        bh=9rpFO4h+u5cqhcUyl4eqtPCMqvEqyZ/13e6fLeK6GgU=;
        b=IguTCSe3O+xOtXLkpkKAZnqs3oE4SOmlTymT+/V8Lrr0nzx94Tv8gYHI84FhCFSeq5
         b/4EbBya4psNVQkHcPMF8Hb7awyQSg9WVbqp0jyR8KY4D/0x3AI6fWA/4DRiy+dUrGnJ
         wqcoNXFbPYfeaoEnSqCpHuqxCflk1JCIb0sZZ+WNbWAe6s9cna8zpFNgNDBZKvvbAdIe
         TqBgVH8NpDRStZTVmCp7JCVnG/Qhjt2QT8YMr4W/IPY1fN+/5cnHSjcBsKrKAQYtZB0a
         8SoXVqoSlWBFQO2sKrQ/sbamom/OKuSjUctchp82jbKhG90Zk0kwRbo3SX7qf4Hbp5xz
         sGVg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: debian-boot@lists.debian.org

Rather than continue spamming this list(s) every time I build another
Reiser4 enabled iteration of fast changing Unstable (Sid)
Debian-Installer (d-i), I will just replace the resource(s) pointed by
the links:

https://metztli.it/readOnlyEphemeral/metztli.iso
https://metztli.it/readOnlyEphemeral/metztli.SHA256

If you download a Reiser4-enabled netboot image and, upon installation
procedure, Debian stops midway complaining about Packages.xz
(security) not being found and/or selected -- or unable to find
selected version, it is likely the case that Unstable (Sid) Debian is
in transition state and it takes a few days for the repositories to
stabilize again.

Accordingly, as Reiser4-enabled d-i aims at a fast moving target, if
you experience issues like those described, please wait a few days and
then download the ISO image again -- as more likely I will already
have upgraded the netboot ISO image to one that works. As I refine the
image, the build (and test install) may likely be automated so as to
decrease these transition nasty surprises.

On Thu, Mar 17, 2016 at 1:33 PM, Jose R R <Jose.r.r@metztli-it.com> wrote:
> Niltze, all!
>
> Reiser4 -enabled Debian-Installer with user selectable Reiser4-patched
> kernel has been submitted to an open minded media organization for
> evaluation:
>
> ---------- Forwarded message ----------
> From: Jose R Rodriguez <jose.rdrzzzzzz@metztli.com>
> Date: Thu, Mar 17, 2016 at 4:47 AM
> Subject: Re: XXXXXXYYYYYYY.com Inquiry
> To: XXXXXX YYYYYYY <XXXXXX@xxxxxyyyyyy.com>
>
>
> Good morning, XXXXXX-
>
> Here is a link to an approximately 42 MB Reiser4-enabled
> Debian-Installer (d-i) netboot: metztli.iso
> https://metztli.it/readOnlyEphemeral/metztli.iso
> https://metztli.it/readOnlyEphemeral/metztli.SHA256
>
> If you wanna burn the metztli.iso file to a USB device -- to boot from
> bare metal, for instance:
> (sudo) dd if=metztli.iso of=/dev/sdb bs=4M; sync
> where, of course, /dev/sdb represents your USB device
>
> I recommend doing an expert install from the d-i menu and to install
> Sid -- as d-i is gonna work until the next unstable kernel becomes
> default* (around the weekend). Of course, you may also fall back to
> Stretch -- but not Jessie (stable) as we are using unstable d-i.
>
> Most important: please create a small /boot partition (say 100 - 150
> MB formatted in ext2), since default GRUB2 installer does not
> recognize Reiser4.
>
> Note: since the metztli.iso image runs a streamlined (UDEB) custom
> reiser4-enabled kernel, please ignore the warning (as exemplified in
> snapshot attached). Thus, select yes to continue the install without
> loading (debian repository) kernel modules.
> https://pbs.twimg.com/media/CdxuY-EUEAAC398.jpg:large
>
> And finally when presented with menu list of Linux kernels AMD64
> available to install, of course, select "linux-reiser4-amd64." After a
> successful Debian installation, you'll find syslog at
> /var/log/installer.
>
> Thank you in advance, XXXXXX.
>
>
> Best Professional Regards.
>
> P.S Care has bee taken to provide a usable software -- as well as
> limited virtual and/or physical testing -- but as in all free
> software, no implicit and/or explicit warranties are offered by
> Metztli IT.
>

Best Professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
