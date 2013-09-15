From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 3.11x Testing
Date: Sun, 15 Sep 2013 21:38:32 +0200
Message-ID: <52360CB8.1040403@gmail.com>
References: <CABYXC3ZjpxAEfyHhfGJ6PRyg2_XoAvS9Ui7h=NBsqVFm1CtbFw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=88K2n8zqFdJoU1RMB8/9YPxpUxWTGFXq1TYFFqDiCJ8=;
        b=k4rJDbalSyXHt+lYxc0macuGwca8RGp3U33/kvON48kDECLqQVQoDT3T8k6PVVwzvX
         fHAGu4voziOxbT2aTBO/FnNmy3xWPrcepA+tJg6a2qgVO2G7PQ28087s4NsBf/o6QffA
         Hm1RFXZ4W9KI3DdHmzsO86qPhCjYdofYaCerESrW0j/w3HhhIiGlV0/KnC8UPvQkx9Q5
         p6Xky1nAaaTOATsXIOJCJTg+kd5YxfxFbR/ZxLH4P0mj4fxjs7PaVTlkBHVvt25k7ZoN
         skLdfu5lTRwoG7gjOhNrR+/ODkhvvxfhfwfnRIzs1HDlRSUPC3YcIFsv6X9K6XURpvEp
         bS4w==
In-Reply-To: <CABYXC3ZjpxAEfyHhfGJ6PRyg2_XoAvS9Ui7h=NBsqVFm1CtbFw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christopher Gentile <cnjgentile@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Thanks for the report!

Edward.


On 09/15/2013 03:53 AM, Christopher Gentile wrote:
> Hello all,
>
> Thank you for having me.
>
> I received kindly from Ivan a copy of his Reiser4 enablement kernel
> patch for 3.11.x kernels.  I am in testing as we speak on my rootfs
> after backing up data and wanted to introduce myself.
>
> I am not a developer, just a heavy Linux enthusiast/amateur kernel
> hacker. I loved Reiser4 on 3.10.xx and earlier kernels and have been
> awaiting the functionality in the 3.11 series.
>
> I am here to be useful, post results, ask some questions, and do
> testing for you.
>
> I have a beefy system so I can test most scenarios in an x86_64 environment.
>
> 3 SSD arrays and on large 10TB SATA3 array on a Corei7 3930K hexacore
> with 32GB of DDR3 quad-channel RAM.
>
> Because of these specs I can test essentially whatever you like,
> however not being a developer I don't know how except for the fact
> that:
>
> -I use Gentoo linux
> -Gentoo (if you're not familiar) is a rolling source-based distro,
> tons of small files, all compiled.  Lots of compression/decompression
> going on access to small files, as wel as my own personal large files.
>
> If you need benchmarks done, need any commands executed looking for a
> rest result please just ask, it's the least I could do.
>
> Currently I am running Reiser4 on root on sSD raid0, re-compiling my
> entire world file (compiling 1500+ packages from extracted from
> .xz,.gz,bz2 source tarballs). I am 500 packages into the compile
> without a hitch thus far, using kernel stable 3.11.1 from kernel.org ,
> patched with the BFS 442 CPU scheduler, the kernel-gcc4.8 patch to
> enable "-march=native" kernel compilation, and the UKSM patch for
> online memory deduplication.
>
> If anybody needs testing on non-patched kernels, or with a specific
> patch/kernel, please let me know. Storage is not an issue and
> compilation is fast and thus not an issue.  All I ask is please let me
> know when the new patches come up for Reiser4.
>
> The Reiser4 patch was supposed to be included in the mailing list
> thread as per Ivan's earlier message however there was an issue where
> it didn't attach.  Per Ivan's request I have refrained from posting it
> as an attachment until Edward has a chance to review it.
>
> Best Regards,
>
> Chris Gentile
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

