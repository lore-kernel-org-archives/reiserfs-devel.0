From: Andreas Dilger <adilger@sun.com>
Subject: Re: [PATCH 0/20] return f_fsid for statfs(2)
Date: Tue, 20 Jan 2009 07:36:51 +0800
Message-ID: <20090119233651.GK3286@webber.adilger.int>
References: <4974B8C4.3070703@suse.de>
 <1232393334.5893.42.camel@norville.austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-reply-to: <1232393334.5893.42.camel@norville.austin.ibm.com>
Content-disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
Cc: coly.li@suse.de, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, "Sergey S. Kostyliov" <rathamahata@php4.ru>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Dave Kleikamp <shaggy@austin.ibm.com>, Bob Copeland <me@bobcopeland.com>, Anders Larsen <al@alarsen.net>, reiserfs-devel@vger.kernel.org, Phillip Lougher <phillip@lougher.demon.co.uk>, Christoph Hellwig <hch@infradead.org>, Evgeniy Dushistov <dushistov@mail.ru>, Jan Kara <jack@suse.cz>, linux-fsdevel <linux-fsdevel@vger.kernel.org>

On Jan 19, 2009  13:28 -0600, Dave Kleikamp wrote:
> ext[234] return a portion of the uuid in f_fsid.  There is a theoretical
> chance of those values being non-unique.  Since there doesn't appear to
> be any case for the fsid to be persistent between boots, I guess
> huge_encode_dev() is probably a better choice.  In practice it probably
> makes no difference.

I'm not sure what you mean about "no case for fsid to be persistent"?
The whole point of fsid (for NFS) is that this identifies the filesystem
over reboot, even if the block device ID changes, or if the filesystem
doesn't have a block device at all (e.g. cluster filesystem).

Cheers, Andreas
--
Andreas Dilger
Sr. Staff Engineer, Lustre Group
Sun Microsystems of Canada, Inc.

