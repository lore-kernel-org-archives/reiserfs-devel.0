From: <doiggl@velocitynet.com.au>
Subject: Fwd: fsck.reiser4 questions
Date: Fri, 24 Jun 2016 00:24:59 +1000
Message-ID: <03c4d1e758ea1926333f6adff7ee75ba@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hello,
Some reiser4 questions for Edward Shishkin.

Is fsck broken in version reiser4progs-1.1.0  ?

What reiser4 checks and tests can I run on the the r4 meta data to see if
it is  ok ? 
Packed with 
- I packed r4 meta-data with command

# debugfs.reiser4 -P /dev/sdb  | gzip -9 > r4meta-sdb.gz

I use:
# fsck.reiser4 --build-sb --build-sb /dev/sdb
# fsck.reiser4 --build-fs --build-fs /dev/sdb
# fsck.reiser4 --fix  /dev/sdb

Thanks
--Glenn

#  rpm -qa | grep -i reiser4progs
reiser4progs-1.1.0-35.1.x86_64

a copy of [reiser4 /dev/sdb] meta-data see:
http://www.4shared.com/file/-RA17cXlba/metadata-sdb.html

metadata-sdb.bz2
2,049,018 KB | 2016-05-30

Packed with with command

# debugfs.reiser4 -P /dev/sdb  | gzip -9 > metadata-sdb.gz


Background history
==================
http://www.spinics.net/lists/reiserfs-devel/msg04206.html
