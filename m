From: Jan Kara <jack@suse.cz>
Subject: Re: Is it time to remove reiserfs?
Date: Thu, 17 Mar 2022 10:43:44 +0100
Message-ID: <20220317094344.5s3shqk54qfpumey@quack3.lan>
References: <1a5cd8ce-e7c7-5aa8-e475-ad7810e2f057@winds.org>
 <842c582a-ecb6-31a1-fad1-54a4e9c05b94@simula.no>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1647510226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DFWUSkd4grL19DFDB5+w67woVPRC/6JXoVuQx8Tt1BE=;
        b=UgY4MmIo/99tez4EdWkQdmC30OGtPfhCa7QDm+cGJhcCGJeMGCHvovlsnBgfDHWem+ELuF
        glYTZ2nBNQNdURK8PnccbBbGq+cNZF2WOdnF3EtCcvcQ5Uj7A3dQ1f0OzsTFgzm6viJ0rf
        zKTT05afs/HmaXfUC5a7nETQ6ZAqTMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1647510226;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DFWUSkd4grL19DFDB5+w67woVPRC/6JXoVuQx8Tt1BE=;
        b=2pw/H3XZRxrPCe7n/gPiLACwOASm1Xr54f79xLwFNzAZTE/qyULNihLSzsGDSjrgeQX5O+
        2PjKV+ND4zvyO4Dw==
Content-Disposition: inline
In-Reply-To: <842c582a-ecb6-31a1-fad1-54a4e9c05b94@simula.no>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Dreibholz <dreibh@simula.no>
Cc: gandalf@winds.org, david@fromorbit.com, jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, willy@infradead.org

Hi!

On Thu 17-03-22 09:53:22, Thomas Dreibholz wrote:
> I just noticed the thread about ReiserFS deprecation. We are currently still
> using ReiserFS on ca. 50 production machines of the NorNet Core
> infrastructure (https://www.nntb.no/). While newer machines use BTRFS
> instead, the older machines had ReiserFS used, due to its stability and
> better performance in comparison to ext4. At their installation time, we did
> not consider BTRFS being mature enough. A deprecation period of ca. 5 years
> from now seems to be reasonable, although it would be nice to have at least
> a read-only capability available for some longer time, for the case it
> becomes necessary to read an old ReiserFS file system on a newer system.

Thanks for your feedback! So the current plan is to remove the support from
current upstream kernel in ~3 years, as people noted, you can still use
upstream -stable kernels branched at the end of the deprecation period for
another two years which gives you around 5 years to migrate if you are
using upstream stable kernels. 

You can still use sufficiently old kernel (VM?) or FUSE (although someone
motivated would probably need to write proper support module but e.g. grub2
has reiserfs support in userspace implemented) to get data out of
Reiserfs partitions after that... At least that's the current plan.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
