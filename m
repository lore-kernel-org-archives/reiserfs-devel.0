From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Question of file holes
Date: Fri, 21 Nov 2003 13:40:53 +0300
Message-ID: <16317.60341.405726.629862@laputa.namesys.com>
References: <Pine.GSO.4.58.0311191836030.26453@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16140-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GSO.4.58.0311191836030.26453@bingsun2.cc.binghamton.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zhihui Zhang <bf20761@binghamton.edu>
Cc: reiserfs-list@namesys.com

Zhihui Zhang writes:
 > Hi,
 > 
 > In ReiserFS V3, holes are pointed to by NULL indirect pointers and are a
 > source of inefficiency when creating a file with a large hole.  In
 > Reiser4, this is replaced by NULL extents whose starting address is zero.
 > This is fine.  But I just cannot figure out why we must represent holes
 > with NULL pointers or NULL extents. If a search fail to find a valid
 > block, we can assume we hit a hole, right?  Also, what the differences

Well, you _can_ implement file plugin that doesn't store extent units
for holes, but its write method will be slightly less efficient.

Suppose you have a file consisting of:

1. extent of 1 block (E1);
2. hole of 2 block (H1);
3. extent of 1 block (E2).

Suppose further that we don't keep items for holes, so that file
consists of two items E1, and E2. It may so happen that in the tree E1
is stored in node N1, and E2 is stored in another node N2.

Now, suppose we are trying to overwrite portion of the file, starting
from somewhere in the E1 and extending through into hole H1.
So we start tree lookup for a key that is within E1.

Search will end up in the node N1, where E1 is. We start overwrite by
overwriting part of E2. But once we finished with E2 we don't know what
to do next: there is no item for H1, and to understand what to do we
have to look into right neighboring node N2, which is additional IO.

Specifically, in our case we are going to overwrite part of the hole,
which means insertion of new extent unit into N1. But looking only at N1
we cannot distinguish our file from the file consisting only of two
extents without any hole between them. In latter case we would have to
continue overwrite by overwriting second extent.

OK, hope this is understandable.

 > between the two following cases.  They both seem to refer to holes:
 > 
 > #define HOLE_EXTENT_START 0
 > #define UNALLOCATED_EXTENT_START 1

No, UNALLOCATED_EXTENT extent is extent whose blocks haven't yet got
block numbers allocated. In reiser4 when you write into file and new
block is created this block is initially "unallocated"---it doesn't have
disk block number assigned to it. Block numbers are assigned as part of
"flushing" (see flush.c) which is done as a preparation for transaction
commit.

 > 
 > Thanks for your help.
 > 
 > -Zhihui
 > -- 

Nikita.
