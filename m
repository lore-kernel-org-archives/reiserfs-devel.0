From: Jose R R <jose.r.r@metztli.com>
Subject: Re: Reiser4 Linux 4.17.19-1 hangs in Google cloud VM, too.
Date: Mon, 22 Oct 2018 21:28:29 -0700
Message-ID: <CAM12Q5Q5qfrKQrw-2f_PX_FBgFsC6C=dde0gwn8ugBXEx05S_g@mail.gmail.com>
References: <20181022101912.3CE2E292B005@huitzilopochtli.metztli-it.com> <20181023033852.GR32577@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RMQv7HvnEqrZ8wBhwlspCtiBJ0pAc4OUXAVj9Moim58=;
        b=m+UOoMuTRK/wzpDdCBUyS4bBzt5l0hLFvchYyvzDiWUeLjKhrmvbw32GyuR77Ku3i9
         HS6Xnd3O2WFBdpKPhORIvJRraS1BvajYx9y0QoVdyks6JymKwhAkcAgVSykz184mVpSu
         CItS0yAPPhlTRpb+Hav9JLUw5kQNdsD4pA17fwuuWmNC1ORszzSda57zfq5B/FhRWy4D
         9u+hmPMRiIcWDjV4C2EmlGWHWof8cVmU5MEzJbGqzLOzERiyQt17yB17cwEcB1mwR2V9
         zzEYsoeBRKLOCfER270u7ifrlJLMqu38VbQf+0TSACFgyaAoYXsdJWyqMw5NIGrc61H9
         80ng==
In-Reply-To: <20181023033852.GR32577@ZenIV.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@zeniv.linux.org.uk
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Thank you for replying, Al-

On Mon, Oct 22, 2018 at 8:38 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Oct 22, 2018 at 03:19:12AM -0700, Metztli Information Technology wrote:
> > I installed reiser4 -enhanced Linux kernel 4.17.19-1 --thus replacing the prior hung reiser4 -patched kernel 4.18.15-1 in the Google Compute Engine (GCE) cloud instance. After less than 24 hours the 4.17.19-1 hung in similar way to the 4.18.15-1.
> >
> > Please note that I had been running my custom Metztli Reiser4 Debian Stretch image with reiser4 linux 4.14.20-1 without issues for several months
> > < https://github.com/Metztli/reiser4-debian-kernel-packaging-4.14.20 >  --until I decided to upgrade to newer kernel(s).

That link you referenced is just my hack for the corresponding Debian
kernel packaging (wrapper) to build 'Reiser4 the Debian Way', i.e,
generating reiser4 module & kernel -- suitable for installation media
-- in addition to Debian's.

>
> Er...  Does anybody maintain reiser4 these days?  I can't recall a single mail
> along the lines of "such-and-such VFS/VM/scheduler/etc. change would break reiser4"
> in quite a few years (more than a decade, most likely)...

This is the actual patch for the Linux 4.14.xy series:
< https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/reiser4-for-4.14.1.patch.gz/download
>

And yes, Mr. Edward Shishkin, still develops/maintains reiser4, please see:
< https://github.com/edward6/reiser4 >

I have a couple of reiser4 custom Google Compute Engine (GCE) cloud
instances which have been running LAMP for a while. One of them runs
reiser4 -enabled Linux kernel 4.15.x whereas the other one was running
4.14.x (both for several months/years already) until I decided to
upgrade the 4.4.20-1 to newer reiser4 -enabled kernels. By the way
this last kernel that I installed:
uname -a
Linux cohuatl 4.16.0-2+reiser4.0.2-amd64 #1 SMP Debian 4.16.18-2
(2018-06-27) x86_64 GNU/Linux

seems to be performing nicely --if things continue fine I can assume
that the drastic change affecting reiser4 hacked kernels occurred
beginning with upstream Linux series 4.17.x and on...


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch w/ Linux 4.17 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
