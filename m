From: doiggl@velocitynet.com.au
Subject: Timing result of removal of 8012 files in 2 directories
Date: Fri, 25 Jul 2008 23:25:45 +1000 (EST)
Message-ID: <11010.202.168.22.19.1216992345.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Timing result of removal of 8012 files in 2 directories:

Removal of files test:

Count 8012 files in 2 directories.

Size:
# du -m /reiser4/old.rpms/
22      /reiser4/old.rpms/.repodata
11350   /reiser4/old.rpms/

# time rm -rf /reiser4/old.rpms

real    0m7.084s
user    0m0.004s
sys     0m3.192s

Glenn

