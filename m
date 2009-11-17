From: Christian Kujau <lists@nerdbynature.de>
Subject: reiser4 for 2.6.33?
Date: Tue, 17 Nov 2009 14:29:05 -0800 (PST)
Message-ID: <alpine.DEB.2.01.0911171420480.27639@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

It's autumn[0] already and even with 2.6.32 not quite ready yet, let me 
be the one asking the inevitable question:
 What are the plans for reiser4 being included in 2.6.33? The 
diffstat for the 2.6.31 patch looks rather promising, at least to me:

$ diffstat reiser4-for-2.6.31.patch | grep -v fs/reiser4
 Documentation/Changes                         |   12 
 Documentation/filesystems/reiser4.txt         |   75 
 fs/Kconfig                                    |    1 
 fs/Makefile                                   |    1 
 fs/fs-writeback.c                             |    5 
 include/linux/fs.h                            |    3 
 include/linux/mm.h                            |    1 
 mm/filemap.c                                  |    3 
 mm/page-writeback.c                           |   26 
 170 files changed, 77581 insertions(+), 1 deletion(-)

Or maybe it can find a place in -staging if there are still strong 
objections against a general inclusion?

Thanks,
Christian.

[0] http://marc.info/?l=reiserfs-devel&m=124904274311847&w=2
-- 
BOFH excuse #70:

nesting roaches shorted out the ether cable
