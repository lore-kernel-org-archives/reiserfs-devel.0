From: Christoph Hellwig <hch@infradead.org>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 12:06:58 +0100
Message-ID: <20050918110658.GA22744@infradead.org>
References: <432AFB44.9060707@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26032-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <432AFB44.9060707@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

I threw in your new codedrop into a compilation and the byte-order
mess is _still_ now sorted out.  Please kill the d* as struct type
crap and just use __le types directly.

Also lots of "memset with byte count of 0" warnings from sparse.
