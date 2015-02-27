From: Vladimir Shebordaev <vladimir.shebordaev@gmail.com>
Subject: Re: sequence of commands in a loop on reiser4progs
Date: Fri, 27 Feb 2015 09:17:49 +0300
Message-ID: <1425017869.29064.27.camel@home.ted.local>
References: <e77dcfb39f9466493767d5ff6e1599ad@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version:content-transfer-encoding;
        bh=FHndb9xTlDrLkLdhMsKDu/TB96CskoZoFOpaH1SeqaA=;
        b=HVyUOyWbl6kcPeKgZ4GXM8xc/EuknrGrG1TRVeI4gJBvIqzKDIzJgnFVcndn2KQp2b
         DJJqZZsY+ghdKxzAzNbbhrK2zfT15SNuddD2kdNy9gxiRnaW9jY1b8sIxiio/mrCMl3X
         fxYnLVMYIkMI4k6WdoPdJMZ0JxZOhjnrdaRwoB0IDlQQZRM+zERqGMC5jD29HqZio8ou
         66dJ8+PBemaMo7hyGbknh1/9YtCZrdIxPKvX4Ha7IMMCk0jYtU9QmMw7vutfdP2Kqu/I
         KQ/Ujl8VA3+5BWNGR/iOqmGlUcNXSSiequNLBZkmWsEbap4M1I/B925Ky2DgNkWz+wL+
         qvOg==
In-Reply-To: <e77dcfb39f9466493767d5ff6e1599ad@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On Fri, 2015-02-27 at 15:39 +1100, doiggl@velocitynet.com.au wrote:
> Hello,
> 
> The sequence[1] gets stuck in a loop because of the problem of the:
> 
> bug in fsck: it jumps to wrong branch for some reasons.
> 

Well, as far as I can recall, the problem originally was that you can
not mount the filesystem any more. 

Would you please answer a few questions before you proceed.

1. What is the exact procedure to get that supposedly buggy behavior?

I mean, can you take clean disk partition, format it with mkfs.reiser4,
mount it, then do what you were doing to it last summer and get this bug
for sure?

2. Is the problem reproducible with stock reiser4progs and reiser4 from
sf.net and stock kernel from kernel.org? If not, what reiser4progs,
kernel, reiser4 patch, gcc and binutils do you use? When the issue
exactly arose?

3. Can you find root directory entry and its stat data, when your first
fsck fails to identify its plugin for the first time? 

If you can't use grep to process debugfs output, can you send the tree
dump in modestly sized chunks compressed with xz -9? It would be nice if
you use a file service not to spam this list.

4. Can you get debugging output of your filesystem at runtime? Do you
have the source code that could be rebuilt to enable debugging output?


> The process goes around in a loop from --build-fs to --check and back to
> --build-fs again.
> 
>  "Wrong order of keys" Never gets corrected. 
> 
> A Question:
> What can be done to fix this problem ?
> Thank you Glenn 
> 
> see below:
> 
> [1] commands used:
> # fsck.reiser4 --build-fs --force  /dev/sdb
> # fsck.reiser4 --check /dev/sdb
> 
> 
> References
> ----------
> http://www.spinics.net/lists/reiserfs-devel/msg04209.html
> 
> History so far:
> --------------
> --check    Mon Feb 23 01:34:22 2015
> --build-fs Mon Feb 23 13:09:25 2015
> --check    Tue Feb 24 17:03:22 2015
> --build-fs Tue Aug 26 17:22:24 2014
> --build-fs Fri Sep 20 15:50:44 2013
> 
> using reiser4progs version 1.0.9
> 
> http://www.spinics.net/lists/reiserfs-devel/msg04667.html
> 
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


