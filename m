From: <doiggl@velocitynet.com.au>
Subject: sequence of commands in a loop on reiser4progs
Date: Fri, 27 Feb 2015 15:39:29 +1100
Message-ID: <e77dcfb39f9466493767d5ff6e1599ad@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

The sequence[1] gets stuck in a loop because of the problem of the:

bug in fsck: it jumps to wrong branch for some reasons.

The process goes around in a loop from --build-fs to --check and back to
--build-fs again.

 "Wrong order of keys" Never gets corrected. 

A Question:
What can be done to fix this problem ?
Thank you Glenn 

see below:

[1] commands used:
# fsck.reiser4 --build-fs --force  /dev/sdb
# fsck.reiser4 --check /dev/sdb


References
----------
http://www.spinics.net/lists/reiserfs-devel/msg04209.html

History so far:
--------------
--check    Mon Feb 23 01:34:22 2015
--build-fs Mon Feb 23 13:09:25 2015
--check    Tue Feb 24 17:03:22 2015
--build-fs Tue Aug 26 17:22:24 2014
--build-fs Fri Sep 20 15:50:44 2013

using reiser4progs version 1.0.9

http://www.spinics.net/lists/reiserfs-devel/msg04667.html

