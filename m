From: Phil Howard <phil-reiserfs@ipal.net>
Subject: using reiserfs as a DB
Date: Sun, 21 Apr 2002 15:53:28 -0500
Message-ID: <20020421205328.GA8407@vega.ipal.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Given the balanced tree directory structure of reiserfs, it seems it
could be usable as a DB in place of a DB library (such as Berkeley DB).
Has anyone done any timing/benchmarks of reiserfs used as a replacement
for a DB library, as compared to one such as Berkeley DB?  There would
be an advantage to using conventional file tools to access the data
instead of having to code some up for a DB library.  The issue would
certainly involve the open/read/close timings for reiserfs for each
piece of data accessed.  The uses for which I have an interest in doing
this would most be small data, usually less than 128 bytes, and almost
always less than 512 bytes.  For example, one use involves indexing a
lot of (100s to maybe even 1000000) URLs under special short keywords.

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://phil.ipal.org/     |
-----------------------------------------------------------------
