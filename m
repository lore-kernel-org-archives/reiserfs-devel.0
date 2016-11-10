From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Bug#842040: Please add https support
Date: Thu, 10 Nov 2016 01:14:33 -0800
Message-ID: <CAM12Q5TKLd8q-++E0xGOfVjikWf8b8gruQwBsG8bNJZA_Auk5w@mail.gmail.com>
References: <CAM+PWT2rpx_7qTL=Vga8RgDWiyryxkcxpErphFWsAyZNe6Vqxw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=KFsN5byf9PGQ18zAEacDbRExP7SfrYXSkHAhNPUJKK0=;
        b=O03Kpn8HX8FOLrGRwTCuwm8hX/5jIbJ8sJLB7AN1w0+1lPutuzXA7AXVURUQlUjyBb
         NXzYN/r6Be1c26X0v3dP6VuiozYAVYWRIPZLWbWkH3wBQ0uJIpHVikjLb1HODaw2+Af6
         ScR4SJ2uqdj0PPHldLlQTy+rFcKBjqcMwZ9hI3nObfViZ1PAfLgMJuHSw1hYoSEdHnTr
         UT9tvIPbYcvNja6m3KqJayU8idOp23AbI8gsZT1tG2Js+LVMkr0sjjQ5JMVbhPhta7T4
         UEw1zOebhgyT4uyVRkkw3kN8F3cK+fwMhWHdOi/xsUC/hna2raH87O1646vE6KS2JFRs
         wXEA==
In-Reply-To: <CAM+PWT2rpx_7qTL=Vga8RgDWiyryxkcxpErphFWsAyZNe6Vqxw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marga Manterola <marga@google.com>, 842040@bugs.debian.org
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Niltze [Hello]!

On Tue, Oct 25, 2016 at 6:17 AM, Marga Manterola <marga@google.com> wrote:
> Package: debian-installer
> Severity: normal
>
> The installer currently doesn't support downloading packages from https
> mirrors, because busybox's wget doesn't support https.

In order to add SSL support to BusyBox wget, itself to be used wih
ssl_helper, I used matrixssl-3-4-2-open.tgz
< http://www.matrixssl.org/ >

to build my custom BusyBox udeb for my Reiser4-enabled Debian-Installer
< https://sf.net/projects/debian-reiser4/ >

No idea if suggestion fulfills bug need - just my 2 cents ;-)

>
> The wget package has been changed to provide a udeb, compiled against the
> libssl udeb, so that it provides https support.
>
> The change needed in d-i is to add the wget udeb and it's dependencies
> (libcrypto1.0.2, libssl1.0.2 and libpcre3) to the initrd.
>
> Regarding total size (as this was mentioned when I discussed this in the
> past), this is the size of the needed udebs:
> -rw-r----- 1 marga marga 878072 Sep 26 20:17
> libcrypto1.0.2-udeb_1.0.2j-1_amd64.udeb
> -rw-r----- 1 marga marga 153852 Aug 19 12:59 libpcre3-udeb_8.39-2_amd64.udeb
> -rw-r----- 1 marga marga 141318 Sep 26 20:17
> libssl1.0.2-udeb_1.0.2j-1_amd64.udeb
> -rw-r----- 1 marga marga 147960 Sep 26 15:19 wget-udeb_1.18-4_amd64.udeb
>
> And this is the size difference of the old initrd and the new one:
> -rw-r----- 1 marga eng 22580707 Oct 25 02:07 initrd.gz
> -rw-r----- 1 marga eng 23381570 Oct 25 15:11 newinitrd.gz
>
> So, approximately 780k extra for the initrd image (3.5% increase)
>
> Thanks!
> --
> Cheers,
> Marga


Best Professional Regards

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
