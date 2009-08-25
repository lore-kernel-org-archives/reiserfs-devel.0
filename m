From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 1/4] kill-the-bkl/reiserfs: fix "reiserfs lock" / "inode mutex" lock inversion dependency
Date: Tue, 25 Aug 2009 04:32:47 +0200
Message-ID: <1251167570-5233-2-git-send-email-fweisbec@gmail.com>
References: <1251167570-5233-1-git-send-email-fweisbec@gmail.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754214AbZHYCdn@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references:to;
        bh=d0nL5uSdA1EEIvusWLtmEdBAKYCs84Qkgclr4sLD4lk=;
        b=yD3JKDvi/WzmKkm0ePIuFGQ7ETFDt9A+WnkQlkmFJ6gunWy2fqV9q0JZvrUVLf6RWe
         qC1+bNZQkjD08aj/E7f17ZHu/y0AmQz7EawKcePDvEuWTCM/+eKPdGSVqoMVVO7Ewp2v
         Gn9RFdGBI1iDTcjBSqnH7ysDY5Qbj2lyu0w/o=
In-Reply-To: <1251167570-5233-1-git-send-email-fweisbec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Chris Mason <chris.mason@oracle.com>, Roland Dreier <rdreier@cisco.com>, Ingo Molnar <mingo@elte.hu>, Andi Kleen <andi@firstfloor.org>, Jeff Mahoney <jeffm@suse.com>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>, Laurent Riffard <laurent.riffard@free.fr>

reiserfs_xattr_init is called with the reiserfs write lock held, but
if the ".reiserfs_priv" entry is not created, we take the superblock
root directory inode mutex until .reiserfs_priv is created.

This creates a lock dependency inversion against other sites such as
reiserfs_file_release() which takes an inode mutex and the reiserfs
lock after.

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Chris Mason <chris.mason@oracle.com>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Laurent Riffard <laurent.riffard@free.fr>
---
 fs/reiserfs/xattr.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 59870a4..58aa8e7 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -1004,7 +1004,7 @@ int reiserfs_xattr_init(struct super_block *s, int mount_flags)
 		goto error;
 
 	if (!privroot->d_inode && !(mount_flags & MS_RDONLY)) {
-		mutex_lock(&s->s_root->d_inode->i_mutex);
+		reiserfs_mutex_lock_safe(&s->s_root->d_inode->i_mutex, s);
 		err = create_privroot(REISERFS_SB(s)->priv_root);
 		mutex_unlock(&s->s_root->d_inode->i_mutex);
 	}
-- 
1.6.2.3
