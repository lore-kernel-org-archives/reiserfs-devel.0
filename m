From: Jose R R <jose@metztli-it.com>
Subject: Re: Bug#858849: installation-reports: Successful Jessie installation
 with backported kernel 4.9.16-1+reiser4.0.1 on i915 system AMD64
Date: Wed, 29 Mar 2017 05:10:27 -0700
Message-ID: <CAM12Q5QoPtqyE7V0oshZRQOraVJV-82PrYFhytNfwRNBoaRA9g@mail.gmail.com>
References: <20170327163053.8989.51286.reportbug@xiuhcohuatl.metztli-it.com> <20170328030000.GC27809@mraw.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=ttfQuvHLIozLmj2j4AZdcX8AhTKqTkODGHyiim0g0JQ=;
        b=rHlyRJnkGnodctC+MCp3+BfBOwTWqLgV6uMQSaRmNKsiVaPi9dUbgRpPIke6nfQVwM
         pDp1v2QKXYgo76J/pks6jiJiJgSYu6AfI7fUpQEGa0pVks2klS/OYUUXFilwW6uy/0+e
         PAA+pGzaqVnc+TaD97HJnpSz079Q54htKIGa0TZSseBasqOLSRNjAIz8eqJkTeEfzal/
         BoaBMWc6M+vmn1WcaWUwxe+byz9H5DJUeXS43Qtic9UVb3AQ2q08h1j2ZgVJdgNCESpS
         obStinB5/UYRE/pxbPVYHGPLxy1gdUXC/3jxqwht1Vx4sEOBc2wxWyq1CVSvtPbo95N1
         lW4Q==
In-Reply-To: <20170328030000.GC27809@mraw.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Cyril Brulebois <kibi@debian.org>
Cc: 858849@bugs.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Niltze,

On Mon, Mar 27, 2017 at 8:00 PM, Cyril Brulebois <kibi@debian.org> wrote:
> Hi,
>
> Metztli Information Technology <jose@metztli-it.com> (2017-03-27):
>> Boot method: CD/USB
>> Image version: https://metztli.it/readOnlyEphemeral/xiuhcohuatl.iso buil=
t on Mar 25 08:35 (2017)
>> Date: Mar 26, 2017, 01:49
>
> A couple of months ago, I asked:
> | Do we need to get installation reports for non-Debian installers?
> | This isn't something we produce, publish, or support, so=E2=80=A6
>
> It would be nice if those installation reports could be sent elsewhere;
> thanks already.
>
>
> KiBi.

With all due respect, 99% of the build code for the debian-installer
is yours. As well as the build pulls 99% UDEBs from official debian
repositories.

i.e., this is a Debian issue, not mine -- as I did not even touch that
code and/or modules -- which 1 month ago actually did work smooth:

Netboot debian-installer was unable to load firmware from second USB
for wifi connection;
accordingly, in another virtual screen, I mounted the 2nd USB and
manually copied the firmware
directory onto the installer environment /lib. d-i then detected the
wifi signal, etc.


Second, report on this unofficial jessie-backports kernel
4.9.16-1+reiser4.0.1 sheds light on the fact I experienced *no issue*
with module i915, as had been reported by (maintainer?):
< https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D858078 >
thus, in a collateral manner, I am contributing to official debian developm=
ent.

Finally, I am not requesting *any* support. I am simply reporting that
your d-i pulling official UDEBs actually have been successful, with
minor modifications and a few extra UDEBs of mine, in my installation
experience, following Debian documentation guidelines:

"We also encourage installation reports to be sent even if the
installation is successful, so that we can get as much information as
possible on the largest number of hardware configurations."
< https://www.debian.org/releases/stable/amd64/ch05s04.html.en#submit-bug >

If you are still 'bothered' with my sporadic submissions, I encourage
you to modify the documentation to specifically exclude the glaring
omission.


Best Professional Regards.

--=20
Jose R R
http://metztli.it
---------------------------------------------------------------------------=
------------------
Download Debian-Reiser4 for AMD64 https://sf.net/projects/debian-reiser4/
---------------------------------------------------------------------------=
------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------=
------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
