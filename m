From: Hans Reiser <reiser@namesys.com>
Subject: Re: DNS server reading directly from reiserfs
Date: Thu, 02 May 2002 14:37:17 +0400
Message-ID: <3CD116DD.5010808@namesys.com>
References: <20020502103932.GA23420@vega.ipal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10210-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Phil Howard <phil-reiserfs@ipal.net>
Cc: reiserfs-list@namesys.com

Phil Howard wrote:

>Continuing from an earlier discussion I had regarding the use of reiserfs
>based files in place of databases, I was thinking about the issues involved
>in serving DNS data directly from files.  The concern I had previously was
>the performance hit from open(),read(),close() to access a single piece of
>data to answer a query.  Today I realized that DJBDNS uses the CDB format
>and does an open(),read(),close() sequence for each query as well.  So it
>can't be that bad.  This would come down to reiserfs vs CDB for which is the
>faster in finding the desired piece of data, not the syscall interfaces, in
>terms of comparing these two.  Assuming all data is in a single directory,
>or maybe is in a directory tree structured TLD-first, what performance level
>might one expect doing this?  With ext2 it could be quite costly due to the
>O(N) lookup.  With reiserfs tree structure, this would be a lot better.  And
>with tail-packing, less RAM would be needed to keep lots of data in cache
>for large servers.  Any thoughts or benchmark data along these lines?
>
>  
>
You never know until you measure.  Try it!

Hans


