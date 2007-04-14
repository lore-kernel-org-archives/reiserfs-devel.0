From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Subject: [KJ] [PATCH 04/04]use set_current_state in fs
Date: Sat, 14 Apr 2007 14:20:11 +0530
Message-ID: <20070414085011.GE14084@arun.site>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <kernel-janitors-bounces@lists.linux-foundation.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors>,
	<mailto:kernel-janitors-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linux-foundation.org/pipermail/kernel-janitors>
List-Post: <mailto:kernel-janitors@lists.linux-foundation.org>
List-Help: <mailto:kernel-janitors-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors>,
	<mailto:kernel-janitors-request@lists.linux-foundation.org?subject=subscribe>
Sender: kernel-janitors-bounces@lists.linux-foundation.org
Errors-To: kernel-janitors-bounces@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
To: kernel-janitors@lists.osdl.org, reiserfs-list@namesys.com
Cc: akpm@linux-foundation.org, reiserfs-dev@namesys.com, linux-kernel@vger.kernel.org

use set_current_state(TASK_*) instead of current->state =3D TASK_*, in fs/r=
eiserfs

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---

 journal.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)


diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 7280a23..864b15a 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2918,7 +2918,7 @@ static void queue_log_writer(struct super_block *s)
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	if (test_bit(J_WRITERS_QUEUED, &journal->j_state))
 		schedule();
-	current->state =3D TASK_RUNNING;
+	set_current_state(TASK_RUNNING);
 	remove_wait_queue(&journal->j_join_wait, &wait);
 }
 =


-- =

Milind Arun Choudhary
