From: Christoph Hellwig <hch@infradead.org>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 11:23:57 +0100
Message-ID: <20050918102357.GA22210@infradead.org>
References: <432AFB44.9060707@namesys.com> <432B1F84.3000902@namesys.com> <20050917092247.GA13992@infradead.org> <200509171356.14497.vda@ilport.com.ua>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26030-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200509171356.14497.vda@ilport.com.ua>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Denis Vlasenko <vda@ilport.com.ua>
Cc: Christoph Hellwig <hch@infradead.org>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Sat, Sep 17, 2005 at 01:56:14PM +0300, Denis Vlasenko wrote:
> At least reiser4 is smaller. IIRC xfs is older than reiser4 and had more time
> to optimize code size, but:
> 
> reiser4        2557872 bytes
> xfs            3306782 bytes

and romfs is smaller than ext2, damn.  Should we remove all filesystems but
romfs now?


and yeah, if you didn't get the hint compare the feature sets.

