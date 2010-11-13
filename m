From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Little report on reiser4 with 2.6.35.7
Date: Sat, 13 Nov 2010 13:14:33 +0100
Message-ID: <4CDE8129.6050708@gmail.com>
References: <AANLkTincE-JHOYPoZkrBrbqs7eo__s8Vjn3bbEKVzGEB@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=qMqn+c9xInEgnUUQABXBN3QEd7vQub0Gnyfuap0RO2s=;
        b=fmA/piAHDndsgCyXvTAkFPb+XiVT99dXHCuFcfC91pLZgmqGisfgsnppS0sfOkNaIb
         nRomQMwf/LoE4yTmfjXtI3dX2gckCDSJmDBSD9uEJvOH4BFTrTHB8BD88o0XAMN7vFSM
         71RIyHnx4zd3ZUcEFlc5+VQnPU3LTtYk1DSG0=
In-Reply-To: <AANLkTincE-JHOYPoZkrBrbqs7eo__s8Vjn3bbEKVzGEB@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Magicloud Magiclouds <magicloud.magiclouds@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Magicloud Magiclouds wrote:
> Hi,
>   I compiled 2.6.35.7 kernel with reiser4 patch on debian sid. And I
> found a serious problem. When the reiser4 fs was full, it broke down,
> which lead the module to "bus error". Then I fscked it, I had to "fix"
> and "build file system". At last, I lost some files (not sure of the
> contents of the left files), which are not created right before it
> broke down.
>   

Yes, I have reproduced some problems, when running out of disk space.
It seems ENOSPC is handled incorrectly, and there is a problem in reading
(partially converted) files. I'll take a look..

Thanks,
Edward.
