From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: [patch 0/7] per-bdi flushing model improvements. reiser4
Date: Tue, 23 Feb 2010 23:12:40 -0800 (PST)
Message-ID: <alpine.DEB.2.01.1002232307380.28195@bogon.housecafe.de>
References: <201002020255.46920.edward.shishkin@gmail.com> <20100202081728.GA2384@infradead.org> <4B6843E9.9070600@gmail.com> <20100202194208.GD5733@kernel.dk> <5e2ec5ac1002021345g569c743dtc5ccf77cde6738ae@mail.gmail.com> <4B68A68C.6030001@gmail.com>
 <20100222084753.0a5d613c.buchner.johannes@gmx.at>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20100222084753.0a5d613c.buchner.johannes@gmx.at>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Buchner <buchner.johannes@gmx.at>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ronni Holm-Nielsen <theronni@gmail.com>, Jens Axboe <jens.axboe@oracle.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

On Mon, 22 Feb 2010 at 08:47, Johannes Buchner wrote:
> It'd be great if someone could solve this, as the reiser4 patch is
> not usable in its current state, with or without my illfated attempts
> to fix it.

FWIW, I'm running Linus' latest -git with refs/heads/reiser4 on top[0], no 
issues during 2.6.33-git so far. Try it, if you don't like 
manually applying patches either :-)

Christian.

[0] http://git.zen-kernel.org/?p=kernel/zen.git;a=shortlog;h=refs/heads/reiser4
-- 
BOFH excuse #275:

Bit rot
