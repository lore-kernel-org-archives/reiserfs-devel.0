From: <doiggl@velocitynet.com.au>
Subject: Are these patches needed with a kernel patched with reiser4-for-4.5.0.patch [sdb]
Date: Tue, 03 May 2016 01:51:33 +1000
Message-ID: <2c909c545e04f1ddeefbd999b945c016@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello,

A Question,
Are these patches[1] needed with a kernel patched with
reiser4-for-4.5.0.patch
I ask as the last mount point command failed ?
--Glenn

# mount /dev/sdb  /media/disk
mount: mount(2) failed: No such file or directory

commands used
-------------
# fsck.reiser4 --check /dev/sdb
# fsck.reiser4 --build-fs --force  /dev/sdb

--check or --build-fs  sequences

--check    Mon Feb 23 01:34:22 2015
--build-fs Mon Feb 23 13:09:25 2015
--check    Tue Feb 24 17:03:22 2015
--build-fs Tue Aug 26 17:22:24 2014
--build-fs Fri Sep 20 15:50:44 2013

[1]
[PATCH 1/3] reiser4: fix filesystem init error path.
> 1/3 < http://marc.info/?l=reiserfs-devel&m=144218573602435&w=2 >

[PATCH 2/3] reiser4: fix reiser4_init_csum_tfm() error path; return real
(negative) error code.
> 2/3 < http://marc.info/?l=reiserfs-devel&m=144218573602436&w=2 >

[PATCH 3/3] reiser4: report an error on checksum engine load failure.
> 3/3 < http://marc.info/?l=reiserfs-devel&m=144218573702437&w=2 >


references
http://www.spinics.net/lists/reiserfs-devel/msg04667.html
http://www.spinics.net/lists/reiserfs-devel/msg05017.html
http://www.spinics.net/lists/reiserfs-devel/msg04847.html

