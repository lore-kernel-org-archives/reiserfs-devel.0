From: Zhihui Zhang <bf20761@binghamton.edu>
Subject: Question of file holes
Date: Wed, 19 Nov 2003 18:44:57 -0500 (EST)
Message-ID: <Pine.GSO.4.58.0311191836030.26453@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16126-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

In ReiserFS V3, holes are pointed to by NULL indirect pointers and are a
source of inefficiency when creating a file with a large hole.  In
Reiser4, this is replaced by NULL extents whose starting address is zero.
This is fine.  But I just cannot figure out why we must represent holes
with NULL pointers or NULL extents. If a search fail to find a valid
block, we can assume we hit a hole, right?  Also, what the differences
between the two following cases.  They both seem to refer to holes:

#define HOLE_EXTENT_START 0
#define UNALLOCATED_EXTENT_START 1

Thanks for your help.

-Zhihui
-- 
