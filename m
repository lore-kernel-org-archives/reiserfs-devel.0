From: Jake Maciejewski <maciejej@msoe.edu>
Subject: AMD64/reiser4 sync mode test, documented corruption
Date: Sat, 20 Nov 2004 22:55:12 -0600
Message-ID: <1101012912.7783.11.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22458-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Vladimir,

I did another test, my typical dd and make, this time with kernel
2.6.10-rc2-mm2 and reiser4 mounted in sync mode. I'm still having
problems with bitmap.c. Details can be found at
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/11-20-04/sync_mount/
Should I repeat the test with the bitmap.c.diff patch you sent me
(http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/bitmap.c.diff)?


Vitaly,

I had the corruption problem again. --check came up clean after
--build-fs. Details can be found at
http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/11-20-04/sync_mount/corruption/

-- 
Jake Maciejewski <maciejej@msoe.edu>

