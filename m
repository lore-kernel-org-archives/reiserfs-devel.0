From: Zhihui Zhang <bf20761@binghamton.edu>
Subject: A few questions of ReiserFS
Date: Thu, 6 Nov 2003 13:25:11 -0500 (EST)
Message-ID: <Pine.GSO.4.58.0311061302240.23244@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15993-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

First, I would like to say I am impressed by ReiserFS. ReiserFS definitely
handles a file system from a different perspective from other file systems.
I would appreciate if you can clarify some internals of ReiserFS for me:

(1) On disk space leakage.   The comment in wander.c says that the usage
    information of wander blocks are not written to disk and a special
    logging of the bitmaps is used to avoid space leakage.  How can you
    achieve this?  Does it has anything to do with working and permanent
    bitmap?

(2) On dancing tree.   Is it true that the parent of a *dirty* node is
    always relocated even if the child is not the most left child?  If
    the child is the leftmost one, does it mean we always relocate its
    parent, grand-parent, and so on?  In addition, I guess that the znode
    must be ordered in order to write them sequentially.  When you
    allocate an ancestor, you must put it in the correct place in the list
    of znode to be flushed, is this right?

Thanks for your enlightenment.

-Zhihui

-- 
