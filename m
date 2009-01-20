From: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/20] return f_fsid for statfs(2)
Date: Mon, 19 Jan 2009 20:39:09 -0600
Message-ID: <1232419149.19468.3.camel@norville.austin.ibm.com>
References: <4974B8C4.3070703@suse.de>
	 <1232393334.5893.42.camel@norville.austin.ibm.com>
	 <20090119233651.GK3286@webber.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090119233651.GK3286@webber.adilger.int>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Dilger <adilger@sun.com>
Cc: coly.li@suse.de, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, "Sergey S. Kostyliov" <rathamahata@php4.ru>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Bob Copeland <me@bobcopeland.com>, Anders Larsen <al@alarsen.net>, reiserfs-devel@vger.kernel.org, Phillip Lougher <phillip@lougher.demon.co.uk>, Christoph Hellwig <hch@infradead.org>, Evgeniy Dushistov <dushistov@mail.ru>, Jan Kara <jack@suse.cz>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Tue, 2009-01-20 at 07:36 +0800, Andreas Dilger wrote:
> On Jan 19, 2009  13:28 -0600, Dave Kleikamp wrote:
> > ext[234] return a portion of the uuid in f_fsid.  There is a theoretical
> > chance of those values being non-unique.  Since there doesn't appear to
> > be any case for the fsid to be persistent between boots, I guess
> > huge_encode_dev() is probably a better choice.  In practice it probably
> > makes no difference.
> 
> I'm not sure what you mean about "no case for fsid to be persistent"?
> The whole point of fsid (for NFS) is that this identifies the filesystem
> over reboot, even if the block device ID changes, or if the filesystem
> doesn't have a block device at all (e.g. cluster filesystem).

I guess that just demonstrates how little I know about what the fsid is
about.  Would it be preferable for file systems that have a uuid to use
that instead?  Of course anything is an improvement over zeroes.

Shaggy
-- 
David Kleikamp
IBM Linux Technology Center

