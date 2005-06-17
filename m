From: "Andrew Bilinsky" <abilinsky@delias.com>
Subject: out of disk space Aborted
Date: Thu, 16 Jun 2005 22:26:56 -0400
Message-ID: <000f01c572e4$0878eda0$6701a8c0@kitchen>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24397-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

A 1.0 Terrabyte filesystem of mine filled up, and the box it
was on crashed promptly after that.

After the crash, mount would no longer mount the filesystem.
A reiserfsck would fail after a while, telling me
to --rebuild-tree.

The first --rebuild-tree failed with this message at the
start of phase 2:

out of disk space
Aborted


I dd'ed the broken filesystem to a new machine.  This one
had a 1.14T raid array.  I was hoping this would prevent the
out of disk space error.

After 2 days of --rebuild tree, it failed again right as it
hit 100% of pass 1:

Flushing..finished
        Selected hash: "r5"
        Read formatted blocks: 245100054
        Read leaves (corrected/empty/wrong hash): 42571934
(18/20/0)
        Wrong indirect pointers (zeroed): 262
        Objectids found: 190645510
Pass 1 (will try to insert 42571914 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....Not enough allocable
blocks, checking bitmap...there are 1 allocable blocks, btw

out of disk space
Aborted

I was using the latest reiserfs tools, and the kernel is:
Linux temp-nas 2.6.9 #1 Tue Jun 14 23:26:40 EDT 2005 i686
athlon i386 GNU/Linux

What other options do I have for recovering this filesystem?

Thanks,
Andrew

