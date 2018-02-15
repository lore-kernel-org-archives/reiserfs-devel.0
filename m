From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 \(SFRN\) 4.0.2 and linux 4.14.x cold boot kernel hang
 frequency.
Date: Thu, 15 Feb 2018 13:35:56 +0100
Message-ID: <9a985900-5103-66de-daaa-0b8ec3664722@gmail.com>
References: <20180215101738.9C9CB11C79C0@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=VpzgwV44WGm0ADuZ5YijS34iluhzvL9xil2SLIqfSMk=;
        b=h7S+pANAIaXk+wHpyVtVyIIXLQA3FVB/c0RQrd6okRtnJXXqqcT92zGzWYGzIgHMq4
         pP+Jt86iu1mWDA3Bxot6TOQYB9EuQ1TtbFdMim3H+IcX3lQLgaoKkxXkFuqZ3QuLVv7v
         lENk0YxMBzzCSXGey2NKZ1nx/1jx9ComozvqnkuSyjQpMGO+eB7fB8v0QZ9QwC/XfRUs
         7Yi1/q2PdwfQKIeJ75L+78pMcL8afEwd/+zJliJOU3E63jY9FehYAtP17F/u3qwQ/irC
         7w0Dc3TJsOI8KpG2qWd00aBctSp8QrmL/g75IOEGfjH3fvH8qKXtpqSWmBi7ACYxy9xC
         ACvg==
In-Reply-To: <20180215101738.9C9CB11C79C0@huitzilopochtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metztli Information Technology <jose.r.r@metztli.com>, reiserfs-devel@vger.kernel.org

Hello.

On 02/15/2018 11:17 AM, Metztli Information Technology wrote:
> Niltze, Ed-
>
> I came across this (fixed) issue in ZFS which touches on Reiser4:
>
> 'Reiser4's maintainer decided to modify the kernel VFS to export the old function' [1]
> https://github.com/zfsonlinux/zfs/pull/7021
>
> I am currently running:
>
> uname -a
> Linux huitzilopochtli 4.14.0-3+reiser4.0.2-amd64 #1 SMP Debian 4.14.17-1+reiser4.0.2 (2018-01-16) x86_64 GNU/Linux
>
> There are no Reiser4 related apparent operating issues as in this environment I have built GCC7 and VirtualBox 5.1.32  -- the latest that fully supports reiser4 format/create/installation as done with Metztli-Reiser4 Debian Stretch AMD64 netboot in virtual machines creation and software 'cold boots':
> < https://metztli.it/blog/index.php/ixiptli/?disp=posts#item_143 >
> < https://metztli.it/blog/index.php/ixiptli >
>
> No virtual or physical data loss but after Linux 4.14.x reiser4-patched kernels I am experiencing more frequent cold boot kernel hangs in physical hardware (i.e., laptop scenarios) -- until finally kernel boots appropriately into userland XDM. [2]
>
> I do not know if it is due to Zstd not appropriately being loaded initially for my particular transparent compression ~ 1.2Tb reiser4 SFRN 4.0.2 partition daily development machine.
>
> For long running instances (including those with transparent compression) -- as in cloud and or remote hosting instances the issue is, of course, less prevalent as I only reboot kernels sporadically.
>
> Just wondering if [1] might have any relevance to [2] ?

Nope. Irrelevant.
[1] is for people who want to use ZFS and Reiser4 on the same machine.
[2] is long reboot, where almost all time is actually occupied by umount
(not by boot). Depending on workload it may take more than 1 hour. It's
an old problem. At least, Dushan Tcholich reported 10 years ago. I think
this is because of a mistake somewhere in reiser4 flush/commit procedures.
Substantial profiling is needed..

Thanks,
Edward.

>
> Of course, FYI, Ed.
>
>
> Best professional Regards.
>
> P.S. I will provide more detailed information as I am able to capture it from booting kernel.

