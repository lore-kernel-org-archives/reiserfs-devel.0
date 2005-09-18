From: David Masover <ninja@slaphack.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 13:10:15 -0500
Message-ID: <432DAD87.2090500@slaphack.com>
References: <432AFB44.9060707@namesys.com> <432B1F84.3000902@namesys.com> <20050917092247.GA13992@infradead.org> <200509171356.14497.vda@ilport.com.ua> <20050918102357.GA22210@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26036-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050918102357.GA22210@infradead.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christoph Hellwig <hch@infradead.org>
Cc: Denis Vlasenko <vda@ilport.com.ua>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Christoph Hellwig wrote:
> On Sat, Sep 17, 2005 at 01:56:14PM +0300, Denis Vlasenko wrote:
> 
>>At least reiser4 is smaller. IIRC xfs is older than reiser4 and had more time
>>to optimize code size, but:
>>
>>reiser4        2557872 bytes
>>xfs            3306782 bytes
> 
> 
> and romfs is smaller than ext2, damn.  Should we remove all filesystems but
> romfs now?
> 
> 
> and yeah, if you didn't get the hint compare the feature sets.

XFS does have a nice feature set, sure.  So does Reiser4.

XFS can "freeze" the filesystem, take a live snapshot, and do some 
other, similar tricks.  Reiser4 can show file metadata as files 
themselves, compress on-the-fly (last I checked, the compression code is 
in there, just not being used), and pack small files incredibly well.

XFS has xattrs.  Reiser has metas, and will eventually provide an xattr 
interface to them.

You may not value Reiser's feature set, but that doesn't make it less 
complex.  Romfs is actually simpler than ext2, and its whole "feature" 
seems to be having a tiny implementation.
