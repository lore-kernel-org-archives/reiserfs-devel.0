From: Tom Vier <tmv@comcast.net>
Subject: reiser4: first impression (vs xfs and jfs)
Date: Tue, 23 May 2006 11:51:02 -0400
Message-ID: <20060523155102.GB25889@zero>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28665-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I finally decided to try a few different fs'es on my 250gig raid1. (I use
reiserfs3 most of the time.) Here's some things i noticed, between r4, xfs,
and jfs.

Both r4 and xfs suffer from io pauses. This is on a dual 2.6ghz opteron,
btw. I don't see high cpu usage, but clock throttling could be screwing up
top's % calcs (tho i think all usage is measured by time, so it shouldn't).

What i'm doing is rsyncing from a slower drive (on 1394) to the raid1 dev.
When using r4 (xfs behaves similarly), after several seconds, reading from
the source and writing to the destination stops for 3 or 4 seconds, then
brief burst of writes to the r4 fs (the dest), a 1 second pause, and then
reading and periodic writes resume, until it happens again.

It seems that both r4 and xfs allow a large number of pages to be dirtied,
before queuing them for writeback, and this has a negative effect on
throughput. In my test (rsync'ing ~50gigs of flacs), r4 and xfs are almost
10 minutes slower than jfs.

One thing that surprised me was, once r4 does write out, it is very fast.
Fast enough that i wasn't sure it was actually writing whole files! However,
i did a umount; mount and ran cksum, and sure enough, the files were good.
8)

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
