From: Andreas Dilger <adilger@sun.com>
Subject: Re: [PATCH 0/20] return f_fsid for statfs(2)
Date: Mon, 19 Jan 2009 21:44:47 -0700
Message-ID: <20090120044447.GM3286@webber.adilger.int>
References: <4974B8C4.3070703@suse.de>
 <1232393334.5893.42.camel@norville.austin.ibm.com>
 <20090119233651.GK3286@webber.adilger.int>
 <1232419149.19468.3.camel@norville.austin.ibm.com>
 <20090120041349.GL3286@webber.adilger.int> <49755376.3000100@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-reply-to: <49755376.3000100@suse.de>
Content-disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Coly Li <coly.li@suse.de>
Cc: Dave Kleikamp <shaggy@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, "Sergey S. Kostyliov" <rathamahata@php4.ru>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Bob Copeland <me@bobcopeland.com>, Anders Larsen <al@alarsen.net>, reiserfs-devel@vger.kernel.org, Phillip Lougher <phillip@lougher.demon.co.uk>, Christoph Hellwig <hch@infradead.org>, Evgeniy Dushistov <dushistov@mail.ru>, Jan Kara <jack@suse.cz>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Jan 20, 2009  12:30 +0800, Coly Li wrote:
> Ext[234] is sophisticated to have on-disk uuid record. Most file systems
> in the patches (except jfs and reiser3) do not have a persistent uuid,
> a reasonable/feasible solution without media format modification is fsid
> in boot/mount life cycle. That's why huge_encode_dev(sb->s_bdev->bd_dev)
> is used here.  For jfs and reiserfs3, is there any use case for
> persistent fsid cross boots ?

I would say yes, this is worthwhile to do, or the fsid can change between
boots unnecessarily.

Cheers, Andreas
--
Andreas Dilger
Sr. Staff Engineer, Lustre Group
Sun Microsystems of Canada, Inc.

