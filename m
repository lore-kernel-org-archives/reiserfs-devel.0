From: Christoph Hellwig <hch@infradead.org>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 10:42:23 +0100
Message-ID: <20050627094223.GB5470@infradead.org>
References: <20050620235458.5b437274.akpm@osdl.org> <42B92AA1.3010107@slaphack.com> <20050626170203.GC18942@infradead.org> <200506271330.07451.zam@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24686-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200506271330.07451.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Zarochentsev <zam@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Jeff Garzik <jgarzik@pobox.com>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Mon, Jun 27, 2005 at 01:30:06PM +0400, Alexander Zarochentsev wrote:
> -- procfs  has seq_file and sysconfig interfaces below the VFS and l-k people 
> do not complain each day about layering violation ;-)  Procfs is taken as an 
> example because it deals with objects of different types, actually anybody 
> may create own procfs objects more or less general way.

seq_file actually works at the file_operations level, that's exactly
what I'm telling you to do.  The old sub-callbacks are on their way out.

> I don't belive that you want to see all reiser4-specific things as item 
> plugins, disk format plugins in the VFS.

If you'd read the previous discussions you'd see that no one complained
about disk format plugins.

