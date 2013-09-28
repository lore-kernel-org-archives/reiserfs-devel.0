From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Sat, 28 Sep 2013 12:06:47 -0400
Message-ID: <5246FE97.5040908@gmail.com>
References: <20130919151403.Horde.VoBIXKovROrctv021aPeYw7@mail.thieu.so> <5240900B.90800@gmail.com> <524156A3.7030103@gmail.com> <20130925003101.Horde.LeGCF4lD1Sg2dzqXeu9cdw1@mail.thieu.so> <52422F8F.1080605@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=4gfQEzA3285mW8axNY8GQxHFJqT6hdvxbAysm7Gj44o=;
        b=M0FbTH5sfxJNK8EZ/XLZFhgjsqaPFslD20oP73mDWrlvDrC/V/W8mqSFTMzDFiAiUh
         EhbchaECz7TLy9K4gTINefBI484vPCLyDROVIImr0jcuOEecSVq3FnH9LNRgJ0joVo/z
         SYIpIHEjg2y/sKOerwwQSL+ZgxXtGQuwqWq29z6xWEE+M+VIM0gAmotFF6GPDjVpQfID
         EluEs62ddsjazZg65INh36OmQxm8EALXQyVIey7c2BXVF3RxLtLKyzyeOgRjpn04mw5y
         VeSZ39QfaQRQD0xRIb59GfXvf8CejJuiIpoqDaAlsergUCBSeH6FSPSWFwuWE2KdisNg
         sd7w==
In-Reply-To: <52422F8F.1080605@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mathieu Belanger <m@thieu.so>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Quick update..... Matt your tree is solid as a rock compiling and
running mighty fine with the newest linux-next ****27 patch applied,
UKSM, and custom CFLAGS for kernel (march = native option in kernel
config + added cflags to make file -O2 -march=native -mtune=native
-mvzeroupper -mno-aes) on 2nd gen. Corei7 3930k

Your patches and Ivans and rock solid, awesome to see.

Any way you could send the latest 3.12-rcxx patches seperately? I'd like
to apply them to some other kernels, I have some old 20 kernels in
/usr/src/ I'd like to try on the 3.12's if that' would be OK with you.
If not , totally understandable.

Thanks again,
Chris

On 09/24/13 20:34, Chris Gentile wrote:
> Awesome, did it compile? I was using that rc2+a linux-next patch from
> Linus but I don't think that's the stablest of ideas :)
>
> I'll grab it in a few mins
>
> C
>
> On 09/25/13 00:31, Mathieu Belanger wrote:
>> I just uploaded the kernel 3.12-rc2 in my git will all the patchs.
>>

