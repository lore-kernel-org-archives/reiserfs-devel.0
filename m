From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL RESEND] vfs: Add support for timestamp
 limits
Date: Fri, 30 Aug 2019 18:23:43 +0200
Message-ID: <CAK8P3a3WUmeewmNscdKpUf3fB3eLV1X=YdLQt8cvS_tqq7OroQ@mail.gmail.com>
References: <CAK8P3a1XjOMpuS12Xao1xqOLFOuz1Jb8dTAfrhLcE643sSkC5g@mail.gmail.com>
 <20190830154744.4868-1-deepa.kernel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B6+OAXXxl2dEgnQY4Uq2+qZqkvaxmBKnbK7dC2TYwZ0=; b=OhQPs0V0RNpNmAir9+sCa8+XjA
 8FPvHbzUDPU7FZB4Lzh8TyjOMbxHbe6UDfnaxheQSTRAPOXJr8VI1Br6EfbwHWHdIkKjv/V8KESb3
 ki+/v7yx9Rlsp64EJ3YhL53RiqFrFVIo0e4NKfuqzVkKa4YP3pmI9fwk9PGYoCLwJs9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B6+OAXXxl2dEgnQY4Uq2+qZqkvaxmBKnbK7dC2TYwZ0=; b=GbPT+0RPjicG5XMFqzmKElh+sn
 WTT07I9kCpniUHG3+a5NhRaN0LDjBeLWEoQAW7K8TU5lSMmPwq6k/NvsB/02tFOAKxTW17ZnTZJyT
 6pcA6R/vUiyOUtHWHRF38Z0Ra99Asb1G/K1H7PwSdCPfUIA5aX+yIUgG5o7FG9A4ixIo=;
In-Reply-To: <20190830154744.4868-1-deepa.kernel@gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Martin Brandenburg <martin@omnibond.com>, jfs-discussion@lists.sourceforge.net, Dave Kleikamp <shaggy@kernel.org>, Anders Larsen <al@alarsen.net>, Bob Copeland <me@bobcopeland.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mtd <linux-mtd@lists.infradead.org>, mikulas@artax.karlin.mff.cuni.cz, Christoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>, Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org, Zheng Yan <zyan@redhat.com>, Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>, y2038 Mailman List <y2038@lists.linaro.org>, Richard Weinberger <richard@nod.at>, Steve French <sfrench@samba.org>, Anton Vorontsov <anton@enomsg.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, codalist@coda.cs.cmu.edu, Christoph Hellwig <hch@infradead.org>, coda@cs.cmu.edu, V9FS Developers <v9fs-devel>

On Fri, Aug 30, 2019 at 5:48 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> [resending, rebased onto linux v5.3-rc6, and dropped orangefs patch from the series]
>
> Hi Al, Arnd,
>
> This is a pull request for filling in min and max timestamps for filesystems.
> I've added all the acks, and dropped the adfs patch. That will be merged through
> Russell's tree.
>
> Dropped orangefs until the maintainers decide what its limits should be.

I've merged this into my
git://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git y2038
branch. Since you did not include a tag description, I took the text from
the last patch series as the commit text, with a link to the pull request
on lore.kernel.org.

Al, let me know in case you have any objections to this going through
the y2038 branch, and you would rather take it through vfs.git.

     Arnd
