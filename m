From: Christoph Hellwig <hch@infradead.org>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 20:22:43 +0100
Message-ID: <20050627192243.GA21932@infradead.org>
References: <20050620235458.5b437274.akpm@osdl.org> <200506271330.07451.zam@namesys.com> <20050627094223.GB5470@infradead.org> <200506271528.49674.zam@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24712-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200506271528.49674.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Zarochentsev <zam@namesys.com>
Cc: Christoph Hellwig <hch@infradead.org>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>, linux-kernel@vger.kernel.org

On Mon, Jun 27, 2005 at 03:28:49PM +0400, Alexander Zarochentsev wrote:
> not exactly.  I meant that seq_file has its own VFS-like thing struct 
> seq_operations.

It's not that VFS-like, it's more a set of callback than actual methods.
But yes, if you're actually doing work at a significant lower layer
adding abstractions make sense.  Note that seq_file.c while not beeing
the VFS is also a generic library that you can use with any filesystem
if you want to implement sequential synthetic files.

