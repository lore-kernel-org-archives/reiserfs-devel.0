From: "Artem B. Bityuckiy" <dedekind@oktetlabs.ru>
Subject: Reiser4+Flash: first considerations
Date: Thu, 26 May 2005 20:09:23 +0400
Message-ID: <4295F4B3.4050307@oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24161-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

Here I list several issues which are relevant to Flash but may be not 
envisioned by Reiser4.

1. Bad Blocks. NAND flashes are shipped with bad blocks randomly 
scattered over flash. Also new bad blocks may appear dynamically. Flash 
file system should handle this. Does Reiser4 take care about bad blocks 
(e.g., it should never access them) or it expects the underlying device 
hides bad blocks doing the required remapping transparently?

2. The tree position. Is the Reiser4 tree is expected to physically 
reside in some fixed HDD area? Or its nodes my be placed anywhere?

Since Flash blocks (NAND pages) may be written only once, any change of 
the tree node means that the node will be moved to another block, not at 
the same block where it was before the change. This also means that all 
nodes which refer this block (the whole path up to the root) must be 
changed as well.

3. Garbage Collector (GC) thread. Are there ways to add one more thread 
to Reiser4?

I've started exploring the source code. Due to the large number of 
optimizations it is difficult to read it. It probably will take month(s) 
to become well aware of Reiser4. So please, if it is possible, comment 
on the above 3 points. Some *general/conceptual* info is welcome. The 
referrals to the corresponding source code peaces too.

P.S. If you really interested in my research of the opportunities to 
make Reiser4 flash-aware, probably adding more plugin interfaces, etc., 
but don't know Flash specifics and common flash file system issues, let 
me know, I'll provide some docs.

P.P.S. If there is a paper about Reiser4 exist except the one accessible 
from namesys.com, let me know please.

Thanks.

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
