From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Subject: Stacked Reiser4 filesystems
Date: Fri, 23 Apr 2004 23:20:24 +0200
Message-ID: <40898898.3000907@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18186-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>

Hi,

one of the really bad (read: unecpected) deficiencies of reiserfs is the
fact that storing the image of another reiserfs filesystem as a file on a
reiserfs filesystem will confuse reiserfsck --rebuild-tree to no end.

IIRC somebody said this cannot happen with reiser4 anymore. Is this true?

And what happens if I store an (incomplete) image of a certain reiser4
partition as a file on the very same partition? Will the metadata from the
file confuse fsck.reiser4 in rebuild-tree mode?

Since reiser4 is now heading for inclusion in mainline, I would like to
know whether the above flaws in reiserfs are fixed in reiser4.

Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

