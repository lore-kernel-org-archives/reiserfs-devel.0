From: Dirk Mueller <dmuell@gmx.net>
Subject: reiserfsck --check and orphaned inodes
Date: Wed, 21 Aug 2002 21:47:00 +0200
Message-ID: <20020821194700.GA23300@matrix.wg>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11277-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi, 

it seems reiserfsck --check isn't correctly accounting orphaned inodes. when 
you reiserfsck immediately after a hard crash, you get lots of bitmap 
mismatches. after mounting it you see lots of "Removing ..." debug output 
(when will this be shortened to soemthing useful, like i.e. ext3 does, which 
just reports "removed XX orphaned inodes". ) and afterwards reiserfsck 
--check does no longer complain about filesystem corruption. 


-- 
Dirk (received 881 mails today)
