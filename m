From: Christian Kujau <lists@nerdbynature.de>
Subject: reiser4 inclusion?
Date: Sat, 18 Apr 2009 13:14:22 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.0904181302440.6162@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org


With still no project page in sight, I find it hard to track[0] the 
progress of the work being towards an inclusion of reiser4 into 
mainline. Unable to help out with real code, I look at the 
reiser4-for-2.6.29 diffstat (sans the fs/reiser4 parts!) and see:

 Documentation/Changes                         |   12 
 Documentation/filesystems/reiser4.txt         |   75 
 fs/Kconfig                                    |    1 
 fs/Makefile                                   |    1 
 fs/buffer.c                                   |    9 
 fs/fs-writeback.c                             |    5 
 include/linux/fs.h                            |    3 
 include/linux/mm.h                            |    2 
 mm/filemap.c                                  |    4 
 mm/page-writeback.c                           |   48 

So, with 4 of them being "just" documentation and build magic, I take 
it that we're 6 files and less than 100 lines of code away from at least 
putting this file system into the new staging/ tree perhaps?

Thoughts?

Thanks,
Christian.

[0] http://tinyurl.com/dexfq9
-- 
An autographed picture of Bruce Schneier is all you need to securely wipe any
hard-drive.
