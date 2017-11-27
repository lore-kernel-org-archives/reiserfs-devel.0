From: Felix Zielcke <fzielcke@z-51.de>
Subject: Re: Reiser4 for Linux-4.14, Reiser4progs-1.2.0, Libaal-1.0.7,
 Format 4.0.2
Date: Mon, 27 Nov 2017 14:10:05 +0100
Message-ID: <1511788205.5344.2.camel@z-51.de>
References: <2cf6aac6-650d-4940-359d-316dc70a183d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=z-51.de;
        s=exim; h=Subject:Content-Transfer-Encoding:Mime-Version:Date:Content-Type:
        References:In-Reply-To:To:From:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=JM/kH1BOidhPk2sf3StqaP7+0LH83i5CML4m1ftRtRY=; b=gFliN6FywzQPYRrjnzqITWRmn2
        mCRHjNx11T5WwnXVhu+VqIg2CqHLWB4pe50Jec3ELkyk3Q4efkDv4y6Q4ycuXGLqpvwc9Oocs2eBx
        t1xF5/CSv46uc1205Qr5fLpAE4FItDVjrmPyR2kLThckdvV48FnoUO3oW64gYqNf8dl4=;
In-Reply-To: <2cf6aac6-650d-4940-359d-316dc70a183d@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Am Montag, den 27.11.2017, 00:01 +0100 schrieb Edward Shishkin:
> Hi all,
> 
> ZSTD compression support in Reiser4 is brought for you by BratSinot.
> We recommend it as a replacement of gzip1. To enjoy ZSTD compression,
> please build and install kernel stuff for linux-4.14, reiser4progs-
> 1.2.0,
> and specify mkfs option "-o compress=zstd1".
> 
> In accordance with Reiser4 development model we announce a new
> software framework release 4.0.2 of Reiser4 kernel module and
> Reiser4progs. So, before the next mount session please don't forget
> to check your old reiser4 partitions by new fsck to update things
> (not urgently).
> 
> The latest stuff can be found here:
> https://sourceforge.net/projects/reiser4/files
> https://github.com/edward6/
> 
> Thanks,
> Edward.
> 

Hi Edward,

I have now uploaded the new versions of reiser4progs and libaal to
Debian. But reiser4progs fail to build now on every architecture except
amd64 and i386
See: https://buildd.debian.org/status/package.php?p=reiser4progs
Previous 1.1.0 version worked fine.

Regards,
Felix
