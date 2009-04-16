From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: 2.6.30-rc2: reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
Date: Thu, 16 Apr 2009 23:23:50 +0400
Message-ID: <a4423d670904161223r2e026b6u903137c709318551@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=ULCsbHaaUGwfT4Th5DbbB5ygk2CBKx64WqV3O8vSylo=;
        b=teRj0Fi9uOczDksQZBFfzdEWPhT1sRCkLu+K9yfe+YrMb9rkLd59aETqWAPgxzDrfl
         sxCFApIeIyyllV/9SezpooKCIDoeFHAkiku5o5GGXe6fL5dVRw+YwCrhvP1mbqEqP64C
         A70xO20xUQ63svyDTBUS2XQEssOdQZlMAwSZY=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi Jeff

The kernel prints this message every 20seconds
[  836.973100]
[  836.983494] REISERFS warning (device sda2): jdm-20004
reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
[  836.983496]
[  894.203634] REISERFS warning (device sda2): jdm-20004
reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
[  894.203636]
[  894.205784] REISERFS warning (device sda2): jdm-20004
reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)

commit a41f1a4715

CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set
# CONFIG_REISERFS_FS_XATTR is not set

I did not enable XATTR before,
should I enable it now ?
