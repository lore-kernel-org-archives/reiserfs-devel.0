From: Denis Vlasenko <vda@ilport.com.ua>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sat, 17 Sep 2005 14:15:50 +0300
Message-ID: <200509171415.50454.vda@ilport.com.ua>
References: <432AFB44.9060707@namesys.com> <20050917092247.GA13992@infradead.org> <200509171356.14497.vda@ilport.com.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509171356.14497.vda@ilport.com.ua>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

> At least reiser4 is smaller. IIRC xfs is older than reiser4 and had more time
> to optimize code size, but:
> 
> reiser4        2557872 bytes
> xfs            3306782 bytes

And modules sizes:

reiser4.ko        442012 bytes
xfs.ko            494337 bytes
--
vda
