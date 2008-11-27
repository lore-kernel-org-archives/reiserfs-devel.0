From: Nick Piggin <npiggin@suse.de>
Subject: Re: [patch 1/2] reiser4: adjust to the new aops
Date: Thu, 27 Nov 2008 15:48:11 +0100
Message-ID: <20081127144811.GS28285@wotan.suse.de>
References: <20080924234116.GC30307@wotan.suse.de> <20081017173445.GA10293@infradead.org> <1224269128.15582.9.camel@badari-desktop> <20081021062020.GA17785@wotan.suse.de> <20081021174305.0320f52f.akpm@linux-foundation.org> <4927DB6A.50802@gmail.com> <20081127103418.GK28285@wotan.suse.de> <492EAFF2.9070605@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <492EAFF2.9070605@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, torvalds@linux-foundation.org, hch@infradead.org, linux-fsdevel@vger.kernel.org, pbadari@us.ibm.com, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

On Thu, Nov 27, 2008 at 05:34:26PM +0300, Edward Shishkin wrote:
> reiser4_write_{begin,end} works only in splice.c (i.e. only for
> loopback functionality) in the chunk of code which looks like this:
> 
> pagecache_write_begin();
> ...
> memcpy(.., to_page);
> ...
> pagecache_write_end(.., to_page, ..);
> 
> i.e. there can not be short writes and everything is uptodate.
 
Ah OK, indeed you are right. Although that's not to say that some
other kernel code may not be able to start doing interruptible
copies, although it would be fairly unlikely. Maybe if you just have
a BUG_ON(!(flags & AOP_FLAG_UNINTERRUPTIBLE)); or something to just
make sure?

> reiser4_write() has its own means to fight with short writes.
> Not everything is excellent here though, but this is another topic..

OK, well in that case, I don't see any problem with your patch.

Thanks,
Nick
