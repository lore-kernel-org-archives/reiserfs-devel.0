From: Zhihui Zhang <bf20761@binghamton.edu>
Subject: ReiserFS white paper
Date: Sat, 15 Nov 2003 10:21:40 -0500 (EST)
Message-ID: <Pine.GSO.4.58.0311151016160.20395@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16097-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

I spent some time on ReiserFS white paper.  It is difficult to read. Can
you explain a little bit about closure and keyword systems or give me some
pointers?

Incidentally, the new plugin infrastructure is nice. But it does not seem
to be the same as OOP.  Same type of items share the same array of
methods.  But they does not have private data members.  In addition, will
Reiser4 plan to support full database semantics (e.g., rollback,
isolation) in the future?  My guess is that it will be prohibitively
expensive.  If so, you still have to build a storage layer on top of
ReiserFS.

Thanks,

-Zhihui

-- 
