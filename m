From: Anmol Karn <anmol.karan123@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] fs: reiserfs: xattr: Fix null pointer derefernce in open_xa_root()
Date: Thu,  1 Oct 2020 14:35:47 +0530
Message-ID: <20201001090547.431840-1-anmol.karan123@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+n930xyfkrF12hPhSCQSJtiGdIh1Oqz/H5hvm0xQ2E=;
        b=a34Jtsu0JJNqL+ebJlBV+1sTp5jHO3arcKpfJkh+K55BWhKHBDp8S6SnJuYgbxiSlu
         lp0eNiBLX4pIxo0IYgTgfhm2zuhBh8O2UmvP3uyptpYO3utovwbzTMKftqNx5K2iRNzo
         BXLpa+WfF2X0AYr3TGL0QXZbgP3cVCn5Uo+ujromNLp9vD46zb+fhEaZUpma+evsCE0E
         +zNHnLIvPH2lurCRUak86+bY6jblUfw7iKQbRK/+oZzRg0pFivsxwmF4jyUaAJ8IYUI4
         iVsDC3gEPjT8tjVYZkWoS0282eVasCq3uwkps5VJGd/4aa5FjUFmL8S5LzI9VJPhwxtn
         GzgA==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jack@suse.cz, jeffm@suse.com
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, syzkaller-bugs@googlegroups.com, anmol.karan123@gmail.com, syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com

d_really_is_negative() checks for the dentry->d_inode whether it's NULL or not, 
but in open_xa_root(), when it checks 'privroot->d_inode', it doesn't check whether
privroot is NULL or not, this leads to a null pointer dereference while calling it 
from open_xa_dir() while initializing xaroot.

- fs/reiserfs/xattr.c
The bug seems to get triggered at this line:
	
if (d_really_is_negative(privroot))
		return ERR_PTR(-EOPNOTSUPP);

Fix it by adding a NULL check for privroot. 

Reported-and-tested-by: syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com 
Link: https://syzkaller.appspot.com/bug?extid=9b33c9b118d77ff59b6f 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
 fs/reiserfs/xattr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 28b241cd6987..a75480d0ee7e 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -121,8 +121,9 @@ static struct dentry *open_xa_root(struct super_block *sb, int flags)
 	struct dentry *privroot = REISERFS_SB(sb)->priv_root;
 	struct dentry *xaroot;
 
-	if (d_really_is_negative(privroot))
+	if (!privroot || d_really_is_negative(privroot)) {
 		return ERR_PTR(-EOPNOTSUPP);
+	}
 
 	inode_lock_nested(d_inode(privroot), I_MUTEX_XATTR);
 
-- 
2.28.0

