From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-3.6
Date: Sun, 21 Oct 2012 21:15:56 +0200
Message-ID: <508449EC.8090301@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=ts/dtxeVrsp5FQ3plxds5fXFLICHPQi169NI/phoYe4=;
        b=DC8i5nyhpnoGiAy0afMYYuSy4slMPv5MPD55isGhMBaMJS63mBX3LHV4wyBsa+nUZr
         6CSL+cHDv0gPNjCYdKvi6wHrJqzyrtijGDHLRttlUtgMsgzSkmsEdLWMQTQac6kpaqGm
         7khcdWtP7+qKshKVHpvph69CW5Bht7ZSTBUymk1o7hnfnKwFumwEZ5a6c4erhOVs0MHW
         anjM0+pl/vnkxSycGCSW5PBfARNFtoDapFO4pbtgpN08lQkFltDVpEAcRHeVtk00VfFI
         TlgfO1pBlgA71gklOfEm1G6raRNYSMjOFAVKOz++npwGNprlqwl9/eLWLIr4uSZi2ZHw
         /pPA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Changes:

Ivan Shapovalov

. i_dentry is now hlist;
. kill write_super of super_ops:
   upstream commit f0cd2dbb6cf387 "vfs: kill write_super and
   sync_supers". It kills ->write_super() along with its sole
   user, thread sync_supers. Removed from reiser4.
. kunmap_atomic became single:
   upstream commit 167885e593 "feature-removal-schedule.txt:
   remove kmap_atomic(page, km_type)". The second argument was
   actually unused long ago. Kill it.
. create and lookup do not take nameidata

Edward Shishkin

. fixups in cryptcompress plugin:
   Fix up the main search procedure of cryptcompress plugin:
   . make full-fledged tree traversal in the case when we
     encountered empty right neighbor;
   . unlock the left neighbor only in the case when we moved
     to right.
. lock the wb-list, when calling writeback_sb_inodes;
. Capture super block when syncing fs to synchronize the
   superblock with the other stuff. Make gcc happy.

Current status:
The bug which leads to key inconsistency is not yet fixed.
The update is that INSERT_FLOW carry primitive is NOT the culprit,
the problem seems to be in another place.

Download at:
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x

Thanks,
Edward.
