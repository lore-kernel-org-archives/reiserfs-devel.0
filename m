From: Paolo Correnti <paolunix@yahoo.com>
Subject: REISER4 "strange" partition size
Date: Fri, 23 Jan 2004 06:46:52 -0800 (PST)
Message-ID: <20040123144652.31406.qmail@web21501.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16616-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: REISER LIST <reiserfs-list@namesys.com>

Hallo,

as anyone experience with this e-mail object ?

I'm testing kernel 2.6.1 + latest snapshot
and I've noticed that if a use mkreiserfs 
and mkfs.reiser4 on 2 partitions of the same size
with df I obtain that reiser4 partition has "lost"
about 5% of space (for example on a 4 Gb partition
I see 3,8 Gb).

Then making intensive writing test on this reiser4
partition (for example: writing 1 million rows on an
Oracle table in archivelog mode) on each test I obtain
a corrupted redolog file [sometimes is recoverable,
sometimes I've to rebuild the entire DB).


I've never had this kind of problem with kernel 2.6.0
and last 2003 snapshot.

Best regards

Paolo

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/
