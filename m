From: Chris Mason <mason@suse.com>
Subject: [PATCH] updated data=ordered patch for 2.6.3
Date: Wed, 18 Feb 2004 23:36:13 -0500
Message-ID: <1077165373.22253.45.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16849-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello everyone,

I've updated the reiserfs logging speedups and data=ordered support to
2.6.3, and fixed a few bugs:

i_block count not properly updated on files with holes
oops when the disk is full
small files were not being packed into tails

Also, the code has some extra performance tweaks to smooth out
performance both with and without data=ordered.  There are new
mechanisms to trigger metadata/commit block writeback and to help
throttle writers.  The goal is to reduce the huge bursts of io during a
commit and during data=ordered writeback.

I'm very interested in benchmarks here and info about how the patches
feel for interactive performance.

Please note that data=ordered is not the default yet, you have to mount
with -o data=ordered to get it.

You can get the patches from:

ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.3

(once the suse mirror copies it over there)

-chris

