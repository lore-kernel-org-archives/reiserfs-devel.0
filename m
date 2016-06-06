From: Jeff Mahoney <jeffm@suse.com>
Subject: =?UTF-8?Q?[PATCH]_reiserfs:_fix_=22new=5finsert=5fkey=e2=80=99_may_?=
 =?UTF-8?Q?be_used_uninitialized_...=22?=
Date: Mon, 6 Jun 2016 13:25:47 -0400
Message-ID: <5eca5ffb-2155-8df2-b4a2-f162f105efed@suse.com>
References: <5748aeb6.fN9D/KJvuQPxmFHi%akpm@linux-foundation.org>
 <20160530071757.GA3690@quack2.suse.cz> <5731468.VTTDqzParZ@wuerfel>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5731468.VTTDqzParZ@wuerfel>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>
Cc: akpm@linux-foundation.org, viro@zeniv.linux.org.uk, reiserfs-devel@vger.kernel.org

new_insert_key only makes any sense when it's associated with a
new_insert_ptr, which is initialized to NULL and changed to a
buffer_head when we also initialize new_insert_key.  We can key off
of that to avoid the uninitialized warning.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/ibalance.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/ibalance.c b/fs/reiserfs/ibalance.c
index b751eea..5db6f45 100644
--- a/fs/reiserfs/ibalance.c
+++ b/fs/reiserfs/ibalance.c
@@ -1153,8 +1153,9 @@ int balance_internal(struct tree_balance *tb,
 				       insert_ptr);
 	}
 
-	memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
 	insert_ptr[0] = new_insert_ptr;
+	if (new_insert_ptr)
+		memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);
 
 	return order;
 }
-- 
2.7.1



-- 
Jeff Mahoney
SUSE Labs
