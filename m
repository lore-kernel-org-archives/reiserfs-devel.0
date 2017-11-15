From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for 4.13.0/1 patches and transparent-compression
Date: Wed, 15 Nov 2017 22:19:45 +0100
Message-ID: <54fddf1f-7797-fa7a-fd2a-4e3ac38fcc18@gmail.com>
References: <20171115104006.DAFF9EBFEE5@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=znWs1jWrR0nuInZK0bemaS3alos5anRGMJlnNmgd8Ck=;
        b=MhqoW/tJXZFspZPHeqEw0jTSo+wVLEBudrGjBwpzBvNiH565cKYuuDzWAJcDgQy8dS
         NaPsIFyFL7/Buxxp06HfkupxU9zGCaGHpErNx6J90LTDoiHoisFJrl9b8JOJzXAxJVY1
         rrIXyt9i7kx0Ty3E+KnLtpFcl/AvAK41jPdj3XRvtU5qhTXQ6bA4wW9TXM2vPoA4YM6k
         mWMPn5M61GPx30W/Xu/FCJ1TLEstOLzQbpuRVSnFETq15AuzFzj2Xnr+YvMJXmKJD3U2
         P0cavfZP1+eyPwU7hfg24VkTcuuV1P6uHJ7duDgylNpBteCS9qusNJUvU8vs6UuQRt4z
         039A==
In-Reply-To: <20171115104006.DAFF9EBFEE5@huitzilopochtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metztli Information Technology <jose@huitzilopochtli.metztli-it.com>, reiserfs-devel@vger.kernel.org

On 11/15/2017 11:40 AM, Metztli Information Technology wrote:
> Niltze, Ed-
>
> Here is some additional feedback on reiser4 transparent-compression:
>
>
> Under Google Compute Engine (GCE) using resources: --custom-cpu=2 --custom-memory=4GB
>
> Below dmesg lapse occurred while using VBoxManage (command line utility from headless VirtualBox 5.1.30) under latest reiser4-for-4.13.1.patch kernel
> < https://sourceforge.net/projects/metztli-reiser4/files/Reiser4-Linux-4.13.12-1_for-Stretch/ >
> while converting a 2TB virtual machine into its disk.raw equivalent (11-14-2017):
>
> [..]
> [  207.416756] reiser4: sda4: found disk format 4.0.1.
> [  207.488274] reiser4: sda4: using Hybrid Transaction Model.
> [  965.372697]  sdb: sdb1
> [ 1020.422370] reiser4: sdb1: found disk format 4.0.1.
> [ 1044.098194] reiser4: sdb1: using Hybrid Transaction Model.
> [ 2256.307429] vboxdrv: loading out-of-tree module taints kernel.
> [ 2256.314916] vboxdrv: Found 2 processor cores
> [ 2256.333498] vboxdrv: TSC mode is Invariant, tentative frequency 2199993485 Hz
> [ 2256.340792] vboxdrv: Successfully loaded version 5.1.30 (interface 0x002a0000)
> [ 2265.565041] VBoxNetFlt: Successfully started.
> [ 4898.939952] reiser4[ktxnmgrd:sdb1:r(12134)]: commit_current_atom (/usr/src/build/kernel/tekitl-4.13.12/linux/fs/reiser4/txnmgr.c:1052)[nikita-317
> 6]:
>                 WARNING: Flushing like mad: 16384

Along with complaint "Too many iterations" it is to detect silent
corruptions of a storage tree. If it is rare, then no problems.
If it is flood-like, then "hello fsck".

> ------------------------------------------------
>
> Older:
> with previous patch reiser4-for-4.13.0.patch.gz: logged neary 5k lines snapshot
>   during heavy load (using VirtualBox 5.1.28/30, etc.) and other applications in my local machine.
>   Had to reboot machine as there was no way to stop dmesg flow (Oct 22, 2017):
>
>
> [24068.404896] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
>                 WARNING: convert_ctail: nothing to attach
> [24068.404938] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
>                 WARNING: convert_ctail: nothing to attach
> [24068.404950] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
>                 WARNING: convert_ctail: nothing to attach
> [24068.404962] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
>                 WARNING: convert_ctail: nothing to attach
> [24068.404974] reiser4[DOMCacheThread(29961)]: assign_conversion_mode (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/item/ctail.c:1588)[edward-1021]:
>                 WARNING: convert_ctail: nothing to attach
> [24068.404986] reiser4[DOMCacheThread(29961)]: checkout_logical_cluster (/usr/src/build/kernel/tekitl-4.13/linux/fs/reiser4/plugin/file/cryptcompress.c:1980)[edward-1430]:
>                 WARNING: alloc stream failed with ret=-12

Here kernel can not allocate 64K for compression. This is due to
a "progress" in kernel's memory management. Ugly workarounds are
required. We need to teach the flush procedure to insert uncompressed
logical chunk represented by a number of dirty pages.

Edward.
