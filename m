From: rwhron@earthlink.net
Subject: best reiserfs mount options for generic benchmarking
Date: Sat, 14 Sep 2002 07:09:02 -0400
Message-ID: <20020914110902.GA12161@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11444-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I want to use a consistent set of "best" mount options
for various i/o benchmarks on reiserfs.  (bonnie++,
tiobench, dbench).

I've been using "noatime", and was thinking of adding
"notail".  tail packing helps on the bonnie++ "lots
of small files" test, but for most cases, "notail"
may be better.

alloc=preallocmin=4:preallocsize=9 was needed in 
2.4.20-pre2 to eliminate a tiobench regression when
thread count is high.  Is that needed in 2.4.20-pre7
and 2.5.34 and beyond?

Also, mke2fs has an option to create a larger journal.
For ext3, I create a 400MB journal.  (one of the tests
creates 256 (12888 / 256) MB files).  Is a non-default
journal size available/desireable for reiserfs?

Any other recommendations?

-- 
Randy Hron
http://home.earthlink.net/~rwhron/kernel/bigbox.html

