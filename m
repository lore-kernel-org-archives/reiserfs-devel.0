From: Zhihui Zhang <bf20761@binghamton.edu>
Subject: A question about slum and relocate
Date: Mon, 24 Nov 2003 18:50:07 -0500 (EST)
Message-ID: <Pine.GSO.4.58.0311241820230.6503@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16154-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi,

After reading some code, it seems to me that a slum does not have to be
relocated.  If a slum is small , it will use the overwrite strategy.  Is
this understanding correct?  Also, at the leaf level, if the number of
dirty nodes exceeds FLUSH_RELOCATE_THRESHOLD (64), they are always
relocated.  Is there any similar threshold for an internal level?  Does
Reiser4 relocate internal nodes separately (i.e. not as part of the slum
involving leaf nodes.  Note a slum can grow backwards if a dirty node is
the leftmost child of a parent at an internal level)?  Thanks for your
enlightenment.

-Zhihui

-- 
