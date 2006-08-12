From: =?utf-8?B?wWtvcyBNYXLzeQ==?= <darkeye@tyrell.hu>
Subject: reiserfs panic (device null superblock)  check_internal_block_head
Date: Sat, 12 Aug 2006 18:07:24 +0200 (CEST)
Message-ID: <59354.212.108.198.148.1155398844.squirrel@mail.tyrell.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29585-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm experiencing a very strange issue with my reiserfs partition. I was
trying to delete a file, when I saw that the rm command segfaulted. then
my whole system froze.

it turned out, that a kernel panic occured when I tried to delete the
file, probably in the reiserfs driver. now whenever I try to mount the
partition read-write, it tries to replay the delete, which produces the
same kernel panic. the message I get is about the following:

reiserfs panic (device null superblock)  check_internal_block_head

(couldn't copy the whole of it, as the machine itself freezes afterwards)

strangely enough, doing a reiserfsck says that all is OK with the
partition. I can also mount it read-only (obviously the journal is not
played back at that time). also tried to mount with -o nolog, but that
didn't give better results.

how would I solve this issue? should I rebould the superblock?


Akos

