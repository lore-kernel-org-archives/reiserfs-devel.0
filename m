From: <doiggl@velocitynet.com.au>
Subject: r4 meta data query - commands to run on [r4metadata-sdb.gz] packed from [/dev/sdb]
Date: Fri, 06 May 2016 16:22:45 +1000
Message-ID: <8846518a426816cf74254c991a6e2748@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Shapovalov <intelfx100@gmail.com>, Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello,
Edward ,Ivan

- on a copy of reiser4 unpacked metda-data [1]
Q1. Are there there tools or commands to do a detailed analyzses of a copy
of reiser4 unpacked metda-data and do a repairs on the copy of reiser4
metda-data [r4metadata-sdb] ?

Seems to have 'Wrong order of keys' problem

I can try new things out on a copy of reiser4 metadata and report results
back.
Thanks
--Glenn

[1]
I packed and un-packed and metadata using the following:

- packed reiser4 metadata via command:
# debugfs.reiser4 -P /dev/sdb  | gzip -9 > r4metadata-sdb.bz2

I unpacked metadata via command"
# gunzip r4metadata-sdb.bz2

# ll
-rw-r--r-- 1 root users 24733058856  Apr 14 04:24 [r4metadata-sdb]


Looks like binary data to me. [r4metadata-sdb]

-kernel 
# rpm -qa |grep -i reiser4 |sort
kernel-reiser4-4.1.6-7.1.gd2bbe7f.x86_64

- What commands do you run against unpacked metadata ?

I know files and data are on disk but just trying to access it.
Thank you for any help the commands to run on meta.

-- How can code be altered so it jumps to correct branch 

[I can test on a copy of r4metadata and report results back results] 

-- Can it print out the branch name and identifiable details which is used

Background history
==================
http://www.spinics.net/lists/reiserfs-devel/msg04853.html
Thank you
-- Glenn

