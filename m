From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsprogs-3.6.5-pre1
Date: Wed, 4 Dec 2002 18:52:14 +0300
Message-ID: <200212041852.14436.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12106-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi all, 

The new pre version is available at our ftp site:
ftp.namesys.com/pub/reiserfsprogs/pre

It includes speedup for pass0, which becomes quite important for 
hignly fragmented object id maps, and a few fixed bugs:
- bug in balancing code led to abort when a leaf could be viewed 
as a block of another type;
- bug in checking statdata size for symlinks allowed to have 
symlinks with holes at the end.
- bug in direct-indirect item convertion let symlinks to be created 
of wrong format.

-- 

Thanks,
Vitaly Fertman
