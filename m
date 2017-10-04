From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Real status of ReiserFS4?
Date: Wed, 4 Oct 2017 13:12:13 +0200
Message-ID: <2027a1de-0aac-97f2-40f0-401e585e38ae@gmail.com>
References: <F9C551623D2CBB4C9488801D14F864C60154C6BE9F@ex-mb1.corp.adtran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=e32/Ub0YmZeWbVft7x2h8HgDq/gkSjDZI6W1daK9Y9I=;
        b=KfxRLeMLVp5r3nYNgPfPld3TrEG06VS8VxjaZWRPb5xQ1JXwQwdrBpPaAySvGfIuX9
         YIDy5dMd09uMP1nc2nqqcinvZ0XQS1D1s8rI5z9GQ2jx1oo+kvHGAba+2ChUHoEG4g87
         zQisDz9mwH5zUsAU+qpt+xucSMcTM1lBRlbJB6qpficRjZQTTYGHoODGZSiKkcYuTI3E
         U2Oa7QGaV1rrw3mRqtxu7BVe6h0Wc2QloP2jSZiDGcwioLLF6m6YSRwjspzqDY+a78Ad
         UuHwHPULVrF/CmxU60hUTd/d56y3bo4A6Ex38JVbPpPnAkol7ANaeoHTqsnCkUkv/0sB
         vGMA==
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C60154C6BE9F@ex-mb1.corp.adtran.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>, "'reiserfs-devel@vger.kernel.org'" <reiserfs-devel@vger.kernel.org>

Hello.

Basically, it is stable (as of the latest stuff release). However,
I would recommend reiser4 only for personal needs, not for production
(corporate use). The latter requires some work to be done in active
collaboration with administrators of production systems. Reiser4 has a
number of open tickets/bugreports, but all of those problems are hard
reproducible. Every sophisticated file system has a list of such
issues, though.

It is really hard to corrupt a reiser4 partition in a way that fsck
will refuse to fix it. Nevertheless, I wouldn't recommend to use too
large partitions. The smaller partition, the larger chances, that I'll
take a look at it, if any problems with fsck. Also, keep in mind that
intelligent compression (default mode) is not optimal for large media-
files (see https://reiser4.wiki.kernel.org/index.php/Reiser4_Howto for
details).

Reiser4 is better in all items (performance, features, implementation,
maintainability, etc) than its predecessor ReiserFS(v3).

Thanks,
Edward.

On 10/04/2017 12:29 AM, ANDY KENNEDY wrote:
> All,
>
> I've searched around on the web a bit and found various folks spouting
> off about Reiser4 here and there.  I am about to reinstall a system and
> want to choose the right filesystem.  I read some report about ReiserFS
> v3 not being multi-thread safe and that ext4 ran circles around it.  I
> was disappointed at the hanging I was getting on ext4, so switched back
> to ReiserFS and got more consistent high performance.  I have a power-
> house system built with a large HW Raid 5 drive and want to reformat
> and repartition that sucker up.  In your opinion, what is the best
> filesystem to use right now?  Keeping in mind that I do low-level
> driver work for my company and am used to hacking around in the kernel,
> so patching a kernel doesn't frighten me at all.
>
> It looks like Reiser4 still isn't in the mainline kernel... which is
> disappointing to me that we developers also allow political
> bureaucracy to shadow over potentially better solutions.  So, what is
> the sate of Reiser4 and should I go with that for my 16-core system,
> stick with Reiser3, or grab hold to ext4?
>
> Thanks for your opinion in advance!
>
> Andy
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

