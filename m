From: rwhron@earthlink.net
Subject: Re: [2.6 patch] remove four superfluous BUG's in ReiserFS
Date: Wed, 23 Jul 2003 19:11:35 -0400
Message-ID: <20030723231135.GA30572@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15015-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bunk@fs.tum.de, reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org, trivial@rustcorp.com.au


The patch is a cleanup.  It saves 85 bytes on x86.

size hashes.o*
text    data     bss     dec     hex filename
1333      16       0    1349     545 hashes.o
1248      16       0    1264     4f0 hashes.o.new

I tested the patch on uniprocessor x86 on filesystems
created with:

yes  "y" | mkreiserfs --format 3.6 -h tea /dev/hdc1
mount -t reiserfs -o defaults,noatime,notail /dev/hdc1 /fs1

The keyed_hash function has 20 less instructions on x86,
but performance improvement is very small.

The default hash is r5, so in the common case, the patch
doesn't do anything except save a few bytes.

Time to run "dbench-2.0 32" 4x and "dbench-2.0 64" 5x.
2.6.0-test1-ac2-r	8560 seconds  (patched)
2.6.0-test1-ac2-t	8615 seconds

The patched version is about .5% faster.

Oddly, the 3rd dbench 32 run on the unpatched version had 2
dbench processes that stayed Sleeping.  Killing the
dbench processes let everything continue.  Because of that
one skewed run,  I deleted the 3rd dbench time from the
"seconds" above for both kernels.

bonnie++-1.03a didn't have much different between
patched and unpatched except for sequential block i/o.

                                 Sequential Output
                                 ------Block------
Kernel                     Size  MB/sec  %CPU   Eff
reiserfs-2.6.0-test1-ac2-r  1024  19.22  75.0 25.63  (patched)
reiserfs-2.6.0-test1-ac2-t  1024  18.18  70.0 25.97

tiobench-0.3.3 improvement with the patch was also small.

-- 
Randy Hron
http://home.earthlink.net/~rwhron/kernel/bigbox.html

