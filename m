From: Paolo Correnti <paolunix@yahoo.com>
Subject: REISER4 corruptions errors
Date: Mon, 26 Jan 2004 05:52:18 -0800 (PST)
Message-ID: <20040126135218.20053.qmail@web21506.mail.yahoo.com>
References: <20040123151214.56545.qmail@web21503.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16622-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040123151214.56545.qmail@web21503.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: REISER LIST <reiserfs-list@namesys.com>

In my last message "REISER4 strange partition size"
I wrote:

"... making intensive writing test on this
reiser4 partition (for example: writing 1 million rows
on an Oracle table in archivelog mode) on each test I
obtain a corrupted redolog file [sometimes is
recoverable, sometimes I've to rebuild the entire
DB)."

And Nikita answered:

"It is not clear how to diagnose this. What oracle
are you using? Is it available freely?"

Really I think this test is not so easy to prepare
(you have to download Oracle, install it and bla bla
...) but I think my last test is more "human".

I recomplied Kernel 2.6.0 with
CONFIG_REISER4_BADBLOCKS=y

I'm using 2.6.0 + 20031223 snapshot because 
2.6.1 + 20040119_fixed always gives me some file
corrupted and I was spending too much time re-creating
Oracle DB.

Reiser4 partition is mounted with tmgr.atom_max_age=20
option.

I noticed that if you copy a large amount of data (at
least 500 Mb) from a partition to a Reiser4 partition,
umounting Reiser4 part and using fsck.reiser4
you always obtain from 5 to 40 (and more) fixable
corruptions detected.

It seems that with 2.6.0 + 20031223 snapshot these
corruptions are not so "dangerous" to corrupt files
(I mean, also with these corruptions I'm able to work
with Oracle). Unfortunately I cannot say the same
with 2.6.1 and latest snapshot.

Any idea ?

All the best

Paolo






__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/
