From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux 4.9-2
Date: Thu, 26 Jan 2017 16:55:58 +0100
Message-ID: <bd6692bb-7ecc-f5ab-28cb-a9cc26c53e95@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=clu72mzQ6DtQwHnHEAAl7EoQNslfOHKVjU4+VP4FIyA=;
        b=rvOjVgXgArOJuJp6twWUmcBwhjoRo+e9HHkBL11OUT/9o7ZbBhi3F0r6NNWeMpaIyw
         p9u5WCrFBSs2rq+1s3RnQObUnBoHNoSsXoRDX1j/LBWkuTYIMvJEl/RVBaRsj8zLXW5L
         C+oDAa9gy9pTvRl1HdZkx+QSVhLCWQ9gMdx1s3n3nDLI5+4HfXbzH7DvZjeGVbK1F401
         C4LAZGzA/1eDiPj0jNXhodD2MieDhniyS2vnW+tYsYebr68fPfvVOzhMDZtx+seY5iK0
         +FMXbyd0S8TiQPPQeeS3NhG3TbupCdqmnx5H49RBusYvHRjymEaGGhPzBCowwRK9gi92
         2mjg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

IMPORTANT! This is a must-upgrade for all users, who use transparent
compression with lzo. That is, almost for everyone, since lzo-compression
is a default mode in reiser4.

Changes since reiser4-for-4.9.1:

. Fixed typo in lzo1_overrun calculation found by BratSinot. This is an old
   bug, which can lead to memory corruption when using lzo-compression.
. Use __GFP_REPEAT flag for costly memory allocation in init_tree();
. Use vmalloc instead of kmalloc to alloacte znode hash table.

Please, find here:
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/

Thanks,
Edward.
