From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 15:28:49 +0400
Message-ID: <200506271528.49674.zam@namesys.com>
References: <20050620235458.5b437274.akpm@osdl.org> <200506271330.07451.zam@namesys.com> <20050627094223.GB5470@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24688-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050627094223.GB5470@infradead.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, linux-kernel@vger.kernel.org

On Monday 27 June 2005 13:42, Christoph Hellwig wrote:
> On Mon, Jun 27, 2005 at 01:30:06PM +0400, Alexander Zarochentsev wrote:
> > -- procfs  has seq_file and sysconfig interfaces below the VFS and l-k
> > people do not complain each day about layering violation ;-)  Procfs is
> > taken as an example because it deals with objects of different types,
> > actually anybody may create own procfs objects more or less general way.
>
> seq_file actually works at the file_operations level, that's exactly
> what I'm telling you to do.  The old sub-callbacks are on their way out.

not exactly.  I meant that seq_file has its own VFS-like thing struct 
seq_operations.

So I may assume that having own objects and their operations is allowed.  The 
complains are about adding unnecessary level of indirection in the trivial 
reiser4 wrappers as reiser4_write().   

> > I don't belive that you want to see all reiser4-specific things as item
> > plugins, disk format plugins in the VFS.
>
> If you'd read the previous discussions you'd see that no one complained
> about disk format plugins.

