From: Kevin <coggy@redefine.org>
Subject: access beyond end of device
Date: Sat, 15 Jun 2002 11:03:07 -0700
Message-ID: <93554601344.20020615110307@redefine.org>
Reply-To: Kevin <coggy@redefine.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10738-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I checked the mailing list archive, and I didn't see any solutions.
It also seemed the the similar problems happened after a crash, which
is not so in my case.  Recently I was trying to extract a file and I
got read errors.  I checked dmesg and found the following repeated:

  attempt to access beyond end of device
  38:01: rw=0, want=788705992, limit=58633312
  attempt to access beyond end of device
  38:01: rw=0, want=788705992, limit=58633312

Running reiserfsck --check gave me a bunch of things similar to this:
bad_indirect_item: block 16371: item 2014 2043 0x1 IND (1), len 1276,
location 96 entry count 0, fsck need 0, format new has a pointer 131
to the block 9437328 which is in tree already
9437328 which is in tree already

It also found one broken file, and said that there was 1 corruption
that required --rebuild-tree.  I haven't done this yet because I'm a
little worried it might die in the middle of the rebuild.  Anyone have
any idea what I should do?

I am running 2.4.18, and reiserfsprogs 3.x.1c-pre4.

