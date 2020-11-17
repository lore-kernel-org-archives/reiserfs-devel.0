From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4progs - linking to libreiser4 gives "undefined reference
 to misc_str2long"
Date: Tue, 17 Nov 2020 22:11:10 +0100
Message-ID: <66031259-74b7-74a7-9ec9-c57651942214@gmail.com>
References: <20201116161230.7be6dcf0@pineapple>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j4IcoXzUqFMWpCk5Z9AvsqglYcjkhrwOQqL8wGeKYrM=;
        b=T4GhzaQDElLPI+g0KtwxS2vwaYLmN60vHbq7Qf4MaCvC7fHtqKDu3PdIpc/8GUGrFT
         VoiT6qCy/j7CPzFc8LbAFIF5FUyZ4ZBYqdZWGiEzCbyaW1D2nwvSbWdng2bcFdHnlmCI
         98VEFlZZF3k7tKbrACgqWr0CVNsbrVT1iZNr2HQzLHloNIm7HRXnMo5HCebsGtUjzkwF
         RxleEJj5FsDxGz+mO+oJpTw/LvYn1RSMuudVJARPFqx04QD3R0wAd5/Q31bb5dOojV2r
         sqYguLeJ4zgrFsof/NiD1UgC1GORArh90iECeElOqJjOQPbjgLisHb6EAtJF6ssmRK34
         mYAg==
In-Reply-To: <20201116161230.7be6dcf0@pineapple>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthew White <mehw.is.me@inventati.org>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

On 11/16/2020 04:15 PM, Matthew White wrote:
> Hello,

Hi Matthew,

> 
> I was having problems linking to libreiser4 once it is installed into my
> system, even compiling a dumb program fails (see test-libreiser4.c).


Ummm, indeed, it doesn't work. The next surprise for me is that it
also doesn't work if we build/install reiser4progs rolled back to the
old commits. Whereas reiser4 support in grub also includes libreiser4.h
header:

https://github.com/edward6/reiser4progs/blob/master/grub-0.97-reiser4-20060227.diff

It could happen that I missed something though..

> 
> Compiler: gcc (Gentoo 9.3.0-r1 p3) 9.3.0
> OS: Gentoo GNU/Linux
> reiser4progs versions tested: v1.2.1, v2.0.2, v2.0.3, v2.0.4 (github)
> 
> $ /usr/bin/ld: /lib64/libreiser4-1.2.so.1: undefined reference to `misc_str2long'
> $ collect2: error: ld returned 1 exit status
> 
> I attach the dumb program used for testing 'test-libreiser4.c' and also
> patches to https://github.com/edward6/reiser4progs [master (v1.2.1) and
> format41 (v2.0.4) branches].
> 
> Details are in the patches and also here: https://bugs.gentoo.org/754924
> 
> The solution I adopted is to compile libreiser4 (libreiser4/Makefile.am)
> linking it also to the libmisc convenience library (static libtool).
> 
> Is there a specific reason to not making libmisc an installable library?


I don't know such reasons. I'll merge your patches.
Double thanks for the "format41" branch :)

Edward.


> Or, instead, why not linking libreiser4 to a static libmisc, and then to
> use just libreiser4 when lining demo/* and progs/* (Makefile.am files)?
> 
> Thanks.
> - Matthew
> 
> --
> 
> Matthew White <mehw.is.me@inventati.org>
> 
