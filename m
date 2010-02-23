From: hank peng <pengxihan@gmail.com>
Subject: reiserfs issuce on MPC8548 board
Date: Tue, 23 Feb 2010 10:14:52 +0800
Message-ID: <389deec71002221814u29f19356ucd449762473dbdde@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=BI9/u12uhqTzkQF7+3gy0ky2w4/F8I1ds6NIUDWXYx0=;
        b=YeyA4zWGcES44V67PmrX6etD7ikgU955vPj8ghhM+ewP0Qx37Yy2OgGpgEH0ssbWWq
         wBh5Wsa/IdQULg3YC+SsOuCrw7iyhwtc357KZOAP75e8xhNLfW2nI0nXraIUSZvc/t6z
         MPxq42M5hdbJkVyeJFYOg7OfK9TiZtneFSGfU=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hi, everybody:
I am running reiserfs on a self-built MPC8548(powerpc arch) based
board. Kernel version is 2.6.31.6.
The filesystem has been working fine for several days until it become
read-only, kernel message is like this:

Feb  5 14:45:36 axAC123 user.crit kernel: REISERFS error (device
dm-1): reiserfs-2025 reiserfs_cache_bitmap_metadata: bitmap block 0 is
corrupted: first bit must be 1
Feb  5 14:45:36 axAC123 user.notice kernel: REISERFS (device dm-1):
Remounting filesystem read-only
Feb  5 14:45:36 axAC123 user.warn kernel: REISERFS warning (device
dm-1): clm-6006 reiserfs_dirty_inode: writing inode 95249 on readonly
FS

Is it a reiserfs BUG or some other problem?

-- 
The simplest is not all best but the best is surely the simplest!
