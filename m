From: David Bernick <bernz@bernztech.org>
Subject: Network Raid (possibly OT sorry)
Date: Sun, 14 Mar 2004 17:14:34 -0500
Message-ID: <4054D94A.8080400@bernztech.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17205-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

hello fellow Reiser-lovers.

So Reiser rocks. It's great for a single system. But recently i've wanted to 
build a network raid: A disk on host-a be mirrored in real-time (or near 
real-time) to a disk on host-b. I know DRBD does this, but I'd like to read from 
both disks and write to a master. DRBD makes the slave disk non-readable. I've 
been playing with Intermezzo, which sort of does the trick but it seems to be 
fairly unsupported as far as active mailing lists are concerned.

So the question, as off-topic as it may be, is what do you use for a mirrored 
(replicated?) filesystem, if you use one? Any suggestions would be great.

Thanks!

d


-- 
David Bernick
bernz@bernztech.org

"They that can give up essential liberty to obtain a little temporary
safety deserve neither liberty nor safety."
		-- Benjamin Franklin, 1759
