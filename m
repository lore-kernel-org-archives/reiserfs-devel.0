From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
Date: Mon, 18 Sep 2023 15:26:14 +0200
Message-ID: <20230918132614.zmmuc72purc2psik@quack3>
References: <20230910232640.113938-1-peter@n8pjl.ca>
 <20230918125744.4342-1-peter@n8pjl.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJ3giEy9fL6PkLfO3PERCu0WihovpktmHIIiJC0J4RY=; b=rE41GGMAfkpPiY
	/1X8Bzm54l/bv6IAL3kVlzDCFB1fA+MZn1ZCzpT6xbwWw3xD0fP43pyZj9HagXCyt2AXVBnnjVm4F
	HdOa3gbSspfAEIdQb6aUaY/os70Rasd5VxhSDAjtZfYkSv2p26kyF7a6yJtvt+9cyOo71TXDD3dC5
	lcf8foOPyHEkbDUkyVybo7r6CK2vEXkS7yE9wulxR26ts2lkrRUe+WGoGuB3iHBvzJVI9VcU7BS6Q
	bVJaWc0vNwOecQzUSZ7MF+AUdaVT7Dtozme5K3qISpaD+xwQ1icN5cLMvT1mO1sIgKt7BRgGZezEI
	mJss7ZluKNPV1vnN1Wqg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1695043575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CptKVtlJsn1lzDDkoAwpgGBZfa1qJH+GKj8YGELD9pE=;
	b=pgW55TSiIzxpbssBsNVF2lC+9A7nQfP2VLFIdBOjbI419ZxOHAODbOQkpl1JzLcbGAKROa
	cqRK0rcs9MUFhffVbsxV603nZklMWr7nHEWABvvbknPKslNnqTPMgaYdLPmEH5l3UhMgAe
	6ZY8HnFG+xx6X/iI05kn8AzNwdOaYsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1695043575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CptKVtlJsn1lzDDkoAwpgGBZfa1qJH+GKj8YGELD9pE=;
	b=jtw/3Mcp80MGTZv4eCty+vRjAu4Oloz+0t+B28GaA3b7kXi6AHoUvpWIFFJ+qEhg4tj4AY
	YbbyfgYelATWggAA==
Content-Disposition: inline
In-Reply-To: <20230918125744.4342-1-peter@n8pjl.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-um/>
List-Post: <mailto:linux-um@lists.infradead.org>
List-Help: <mailto:linux-um-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-um>,
 <mailto:linux-um-request@lists.infradead.org?subject=subscribe>
Sender: "linux-um" <linux-um-bounces@lists.infradead.org>
Errors-To: linux-um-bounces+glud-user-mode-linux-devel=m.gmane-mx.org@lists.infradead.org
To: Peter Lafreniere <peter@n8pjl.ca>
Cc: linux-um@lists.infradead.org, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, reiserfs-devel@vger.kernel.org, jack@suse.cz

On Mon 18-09-23 12:58:26, Peter Lafreniere wrote:
> ReiserFS has been deprecated for a year and a half, yet is still built
> as part of a defconfig UML kernel.
> 
> According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
> filesystem is slated to be removed in 2025. Remove it from the defconfig
> profile now, as part of its deprecation process.
> 
> Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>

Makes sense but I've noticed there are many more architectures that define
CONFIG_REISERFS_FS in their defconfig (sh, powerpc, mips, m68k, ia64, arm,
alpha). So perhaps we should do this for all of them when we are at it?

								Honza

> ---
> Fixed invalid DKIM settings causing the previous patch to be rejected.
> 
>  arch/um/configs/i386_defconfig   | 1 -
>  arch/um/configs/x86_64_defconfig | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/um/configs/i386_defconfig b/arch/um/configs/i386_defconfig
> index e543cbac8792..9c9c77f1255a 100644
> --- a/arch/um/configs/i386_defconfig
> +++ b/arch/um/configs/i386_defconfig
> @@ -61,7 +61,6 @@ CONFIG_UML_NET_DAEMON=y
>  CONFIG_UML_NET_MCAST=y
>  CONFIG_UML_NET_SLIRP=y
>  CONFIG_EXT4_FS=y
> -CONFIG_REISERFS_FS=y
>  CONFIG_QUOTA=y
>  CONFIG_AUTOFS_FS=m
>  CONFIG_ISO9660_FS=m
> diff --git a/arch/um/configs/x86_64_defconfig b/arch/um/configs/x86_64_defconfig
> index 939cb12318ca..03b10d3f6816 100644
> --- a/arch/um/configs/x86_64_defconfig
> +++ b/arch/um/configs/x86_64_defconfig
> @@ -59,7 +59,6 @@ CONFIG_UML_NET_DAEMON=y
>  CONFIG_UML_NET_MCAST=y
>  CONFIG_UML_NET_SLIRP=y
>  CONFIG_EXT4_FS=y
> -CONFIG_REISERFS_FS=y
>  CONFIG_QUOTA=y
>  CONFIG_AUTOFS_FS=m
>  CONFIG_ISO9660_FS=m
> -- 
> 2.42.0
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
