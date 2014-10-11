From: <doiggl@velocitynet.com.au>
Subject: patchset query
Date: Sat, 11 Oct 2014 21:42:43 +1100
Message-ID: <4454820674fe4b5749f1664aba6704e1@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Question: Does this patchset apply to a particular version of the linux
kernel ?
If so, which one ?

http://www.spinics.net/lists/reiserfs-devel/msg04338.html

[PATCH 0/12 v2] Moving i_dquot out of struct inode
[PATCH 01/12] quota: Allow each filesystem to specify which quota types it
supports
[PATCH 02/12] gfs2: Set allowed quota types
[PATCH 03/12] xfs: Set allowed quota types
[PATCH 04/12] fs: Generic infrastructure for optional inode fields
[PATCH 05/12] quota: Use optional inode field for i_dquot pointers
[PATCH 06/12] ext2: Convert to private i_dquot field
[PATCH 07/12] ext3: Convert to private i_dquot field
[PATCH 08/12] ext4: Convert to private i_dquot field
[PATCH 09/12] ocfs2: Convert to private i_dquot field
[PATCH 10/12] reiserfs: Convert to private i_dquot field
[PATCH 11/12] jfs: Convert to private i_dquot field
[PATCH 12/12] vfs: Remove i_dquot field from inode

Cheers Glenn

