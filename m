From: <doiggl@velocitynet.com.au>
Subject: Is there some code [to run on Linux r4 enabled kernel] to extract a list of file-names from the reiser4 meta-data ?
Date: Fri, 27 May 2016 20:09:39 +1000
Message-ID: <7b03074bb1b11427df5af0874ac93f77@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Is there some code [to run on Linux r4 enabled kernel] to extract a list
of file-names from the reiser4 meta-data ?
Thanks
--Glenn

meta data 

# ll
total 48362807
-rw-r--r-- 1 root users 24,733,058,856 Apr 14 04:24 r4meta-sdb

packed     # debugfs.reiser4 -P /dev/sdb  | gzip -9 > r4meta-sdb.gz
- metadata packed ok.

un-packed  # - I Unpacked r4 metadata with command as follows, metadata
unpacked ok.

# gunzip r4meta-sdb.gz
- metadata un packed ok.
