From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH 4/4] kill-the-bkl/reiserfs: panic in case of lock imbalance
Date: Tue, 25 Aug 2009 04:32:50 +0200
Message-ID: <1251167570-5233-5-git-send-email-fweisbec@gmail.com>
References: <1251167570-5233-1-git-send-email-fweisbec@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer:in-reply-to:references:to;
        bh=KQcS4Lkj6OpdmtKTtVn33xExwBw2v4GWUx3XH55hDlA=;
        b=qzr9EfVqkswliAyq3dZDvAe3alG5J/LatbI/P24qn4XyOg1XXSUO8r1+ip/LxiJQrk
         rF+Tpd6Q8QTDtc8uy7sWOHJlyDKLwW7YNahE2wjuKYM4HEAeWdBtQWHDQV2CLYmnDA+e
         bVwhZABRguN+9x7loBE3Ui0hNBV39uQxzqFO8=
In-Reply-To: <1251167570-5233-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, Chris Mason <chris.mason@oracle.com>, Roland Dreier <rdreier@cisco.com>, Ingo Molnar <mingo@elte.hu>, Andi Kleen <andi@firstfloor.org>, Jeff Mahoney <jeffm@suse.com>, Alexander Beregalov <a.beregalov@gmail.com>, Bron Gondwana <brong@fastmail.fm>, Reiserfs <reiserfs-devel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andrea Gelmini <andrea.gelmini@gmail.com>, "Trenton D. Adams" <trenton.d.adams@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Alessio Igor Bogani <abogani@texware.it>, Marcel Hilzinger <mhilzinger@linuxnewmedia.de>, Edward Shishkin <edward.shishkin@gmail.com>, Laurent Riffard <laurent.riffard@free.fr>

Until now, trying to unlock the reiserfs write lock whereas the current
task doesn't hold it lead to a simple warning.
We should actually warn and panic in this case to avoid the user datas
to reach an unstable state.

Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Chris Mason <chris.mason@oracle.com>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Alexander Beregalov <a.beregalov@gmail.com>
Cc: Laurent Riffard <laurent.riffard@free.fr>
---
 fs/reiserfs/lock.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/lock.c b/fs/reiserfs/lock.c
index cb1bba3..ee2cfc0 100644
--- a/fs/reiserfs/lock.c
+++ b/fs/reiserfs/lock.c
@@ -37,11 +37,10 @@ void reiserfs_write_unlock(struct super_block *s)
 
 	/*
 	 * Are we unlocking without even holding the lock?
-	 * Such a situation could even raise a BUG() if we don't
-	 * want the data become corrupted
+	 * Such a situation must raise a BUG() if we don't want
+	 * to corrupt the data.
 	 */
-	WARN_ONCE(sb_i->lock_owner != current,
-		  "Superblock write lock imbalance");
+	BUG_ON(sb_i->lock_owner != current);
 
 	if (--sb_i->lock_depth == -1) {
 		sb_i->lock_owner = NULL;
-- 
1.6.2.3

