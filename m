From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: 02 Jul 2002 14:16:04 -0400
Message-ID: <1025633764.5878.432.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10900-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1025272280.1685.6.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hello again,

Yet another data logging patch is available (once the mirror updates)
at:

ftp.suse.com/pub/people/mason/patches/data-logging

We're getting closer to stability here, so I'm very interested in
workloads where the patch performs poorly.

New in 03-beta-data-logging-13.diff:

Fix BUG() due to missing BKL before calling journal_begin

Make reiserfs unpack ioctl force a log flush in data journaling mode. 
This is required to make things safe if you crash after running lilo. 
It is also slow, but there is no other fix possible at the moment.

When the running transaction has many writers, the count of log blocks
reserved is much higher than the number actually used.  If a new writer
finds the transaction full, he now tries to let an existing writer
finish instead of forcing a commit.  This increases the average
transaction size when you have many procs writing to the log.

Smarter code to collect writers before forcing a commit during fsync.

In benchmarks with akpm's synctest program (it tries to simulate postfix
load), these last two changes brought the number of transactions during
a 50 thread run down from 6000 to 3300.  Not as good as I wanted, but it
is 20% faster than the last patch, so I'll take it.

Overall, for most mail server workloads, using the new patches +
data=journal should be around 3-4 times as fast as the stock 2.4.19-rc1
kernel.  I'm trying to get verification on this from actual mail server
benchmarks, instead of just simulations ;-)

-chris


