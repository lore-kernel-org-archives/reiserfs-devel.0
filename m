From: Hans Reiser <reiser@namesys.com>
Subject: Latest Reiser4 Snapshot
Date: Wed, 25 Feb 2004 16:40:28 +0300
Message-ID: <403CA5CC.5040207@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16931-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel@vger.kernel.org, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello,

new reiser4 snapshot against 2.6.3 kernel is available at

http://www.namesys.com/snapshots/2004.02.25

It contains bug fixes and stability improvements. On-disk format is
compatible with the previous snapshot. Also,

  * raid0 preliminary support, and

  * improved loop back support

were added.

In "standard" configuration reiser4 is stable except for a multiple umount/mount 
issue we are still analyzing. See the READ.ME file for not-well-supported 
features and options.

Hopefully our next snapshot will be ready for inclusion, and hopefully it is 
just a few days away.



