From: Jose R R <jose@metztli-it.com>
Subject: Re: Bug#858849: installation-reports: Successful Jessie installation
 with backported kernel 4.9.16-1+reiser4.0.1 on i915 system AMD64
Date: Wed, 29 Mar 2017 09:27:42 -0700
Message-ID: <CAM12Q5TtciuHO-mPiyXE6E_WmvVM_A5N_fxrYVbqZdrCUSxcXQ@mail.gmail.com>
References: <20170327163053.8989.51286.reportbug@xiuhcohuatl.metztli-it.com>
 <20170328030000.GC27809@mraw.org> <CAM12Q5QoPtqyE7V0oshZRQOraVJV-82PrYFhytNfwRNBoaRA9g@mail.gmail.com>
 <20170329154839.GE17320@mraw.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=JYIZmEKX8bwzrfniK/muX/kdlRHMDOXX5TGOtUvBE3Y=;
        b=C/6keQchzBAOVseAui7u+36j05L0GzTfUJqmeL547UCX5A7tjs2FD5m9LKuiDgR7Pv
         REue444CCSRxIR8cdEJ4Z9aYZQn9VVvjSjJyGFIuQRC4qRCJyI0rx0gSzxryiN6dUEDe
         1i6Egk3nN705WAvHv+hUJsLRDtgEma2krDBnk27t5DvCHSX9ACPOHzjlhMLVeGu+dkXB
         sSXq7WOmwREZtC38FOB+tT5M5YC2BQWe0nL1uyk9OSBnkC6P2PnBCr4xcMKPAS6WcndP
         b7P6AdNJnP7BXzZLkQ2HJoTTYGxZWlpWGVASRsNxUwR6yWhOA98O0KLtm/fSIjsTe/af
         hZtw==
In-Reply-To: <20170329154839.GE17320@mraw.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Cyril Brulebois <kibi@debian.org>
Cc: 858849@bugs.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Niltze,

On Wed, Mar 29, 2017 at 8:48 AM, Cyril Brulebois <kibi@debian.org> wrote:
> Hi,
>
> Jose R R <jose@metztli-it.com> (2017-03-29):
>> With all due respect, 99% of the build code for the debian-installer
>> is yours. As well as the build pulls 99% UDEBs from official debian
>> repositories.
>
> That doesn't mean that everything built on top of it has to be reported
> on Debian mailing lists and bug tracker. See derivative distributions,
> they have their own issue tracker, and only forward specific issues.
>
>> i.e., this is a Debian issue, not mine -- as I did not even touch that
>> code and/or modules -- which 1 month ago actually did work smooth:
>>
>> Netboot debian-installer was unable to load firmware from second USB
>> for wifi connection; accordingly, in another virtual screen, I mounted
>> the 2nd USB and manually copied the firmware directory onto the
>> installer environment /lib. d-i then detected the wifi signal, etc.
>>
>>
>> Second, report on this unofficial jessie-backports kernel
>> 4.9.16-1+reiser4.0.1 sheds light on the fact I experienced *no issue*
>> with module i915, as had been reported by (maintainer?): <
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D858078 > thus, in a
>> collateral manner, I am contributing to official debian development.
>
> If you want to reply to submitters/maintainers, reply to specific bug
> reports/threads, instead of sending lengthy mails to other people?
>
>> Finally, I am not requesting *any* support. I am simply reporting that
>> your d-i pulling official UDEBs actually have been successful, with
>> minor modifications and a few extra UDEBs of mine, in my installation
>> experience, following Debian documentation guidelines:
>
> I haven't put words in your mouth and suggested you were requesting some
> support. I'm just not convinced such reports are useful. If you
> encounter specific issues, report specific bug reports against the
> relevant component.
>
> debian-boot@ isn't and shouldn't be the destination of each and every
> thing connected to, or merely using, Debian Installer.
>
>> "We also encourage installation reports to be sent even if the
>> installation is successful, so that we can get as much information as
>> possible on the largest number of hardware configurations." <
>> https://www.debian.org/releases/stable/amd64/ch05s04.html.en#submit-bug
>> >
>
> Sure, with official images.
>
>> If you are still 'bothered' with my sporadic submissions, I encourage
>> you to modify the documentation to specifically exclude the glaring
>> omission.
>
> I could be adding a specific =E2=80=9Cwe don't need reiser4-specific repo=
rts=E2=80=9D

Please do add that phrase; thus removing any ambiguities and cover the
glaring omission in the Debian documentation.

That clarification will prevent other individuals -- who have
downloaded the netboot installer from SourceForge -- from potentially
reporting via the debian mechanism -- once the installation completes.

Additionally, appending =E2=80=9Cwe don't need reiser4-specific reports=E2=
=80=9D will
be a welcome *explicit* change in policy from other FOSS projects,
like GNU Parted, where the unspoken censorship on reiser4 bites anyone
who submits patches in support of the
'Batman Machine': Reiser4
< https://metztli.it/readOnlyEphemeral/Batman_Machine-Reiser4.pdf >


Again, thank you.


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
