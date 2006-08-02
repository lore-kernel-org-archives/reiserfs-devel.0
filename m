From: Alexander Zarochentsev <zam@namesys.com>
Subject: new reiser4 patch for linux-2.6.16 is available, upgrade from reiser4-for-2.6.16-4 recommended.
Date: Wed, 2 Aug 2006 23:55:45 +0400
Message-ID: <200608022355.46464.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29439-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

reiser4-for-2.6.16-4.patch contains a bug which can cause fs corruption 
(it is the same bug as is in the first reiser4 patches for 
linux-2.6.17, now fixed).  

If you use that buggy patch, please upgrade you kernel and reiser4 code 
to 2.6.17/reiser4-for-2.6.17-3 or use new reiser4-for-2.6.16-5.patch.gz 
from ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/.

The bug fix is available as a separate patch 
reiser4-for-2.6.16-4--missing-unlock-fix.diff at 
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/hotfixes/

--
Alex.

