From: Phil Howard <phil-reiserfs@ipal.net>
Subject: DNS server reading directly from reiserfs
Date: Thu, 2 May 2002 05:39:32 -0500
Message-ID: <20020502103932.GA23420@vega.ipal.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10209-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Continuing from an earlier discussion I had regarding the use of reiserfs
based files in place of databases, I was thinking about the issues involved
in serving DNS data directly from files.  The concern I had previously was
the performance hit from open(),read(),close() to access a single piece of
data to answer a query.  Today I realized that DJBDNS uses the CDB format
and does an open(),read(),close() sequence for each query as well.  So it
can't be that bad.  This would come down to reiserfs vs CDB for which is the
faster in finding the desired piece of data, not the syscall interfaces, in
terms of comparing these two.  Assuming all data is in a single directory,
or maybe is in a directory tree structured TLD-first, what performance level
might one expect doing this?  With ext2 it could be quite costly due to the
O(N) lookup.  With reiserfs tree structure, this would be a lot better.  And
with tail-packing, less RAM would be needed to keep lots of data in cache
for large servers.  Any thoughts or benchmark data along these lines?

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://phil.ipal.org/     |
-----------------------------------------------------------------
