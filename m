From: Grant Miner <mine0057@mrs.umn.edu>
Subject: r4 v. ext3, quick speed vs. cpu experiments
Date: Tue, 05 Aug 2003 17:06:12 -0500
Message-ID: <3F302A54.2050204@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15161-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

"mozilla-1.5a.tar" is mozilla 1.5alpha source tar, uncompressed. 
Partition mkfs.ext3 or mkfs.reiser4 --keys=SHORT is run before each run. 
Linux is 2.6.0-test2.

untar mozilla-1.5a.tar (file is on a reiser3 partition):
ext3: 17.64s 28% cpu
reiser4: 10.79s 67% cpu
sum: reiser4 0.61x time, 2.39x cpu

cp -a mozilla-src mozilla-src-copy, same partition:
ext3: 0:56.35sec 11% cpu
reiser4: 0:16.50 55% cpu
sum: reiser4 0.29x time, 5x cpu

tar c mozilla-src > mozilla.tar, same partition:
ext3: 0:36.47sec 10%cpu
reiser4: 0:16.90sec 25%cpu
sum: reiser4 0.46x time, 2.5x cpu

i'm impressed!


