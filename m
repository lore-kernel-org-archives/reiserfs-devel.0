From: <doiggl@velocitynet.com.au>
Subject: This is the sequence of --checks and --build-fs times of Reiser4 volume on disk /dev/sdb
Date: Tue, 24 Feb 2015 18:33:13 +1100
Message-ID: <1f5fbbb35f95abcfdef3d985be537e9b@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
This is the sequence of --checks and --build-fs times of Reiser4 volume on
disk /dev/sdb
--Glenn

--check    Mon Feb 23 01:34:22 2015
--build-fs Mon Feb 23 13:09:25 2015
--check    Tue Feb 24 17:03:22 2015
--build-fs Tue Aug 26 17:22:24 2014
--build-fs Fri Sep 20 15:50:44 2013

commands used
-------------
# fsck.reiser4 --check /dev/sdb
# fsck.reiser4 --build-fs --force  /dev/sdb

References
----------
http://www.spinics.net/lists/reiserfs-devel/msg04665.html
http://www.spinics.net/lists/reiserfs-devel/msg04206.html
http://www.spinics.net/lists/reiserfs-devel/msg04663.html
http://www.spinics.net/lists/reiserfs-devel/msg04661.html
http://www.spinics.net/lists/reiserfs-devel/msg04596.html
http://www.spinics.net/lists/reiserfs-devel/msg04203.html
http://www.spinics.net/lists/reiserfs-devel/msg04202.html
http://www.spinics.net/lists/reiserfs-devel/msg04205.html
http://www.spinics.net/lists/reiserfs-devel/msg03575.html

