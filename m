From: Wang Sheng-Hui <shhuiw@gmail.com>
Subject: [PATCH] reiser4: fix comment typo in znode.c
Date: Fri, 14 Feb 2014 14:47:10 +0800
Message-ID: <52FDBBEE.90409@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=n5Dd0jF+QLnvNt8Zu9mO0hzN4t3ynpgmzX9L7xeqg2g=;
        b=a+MXS697H2dQ8vRW5TZpMzavi5uT0xCscfjduuiVeX3V0GFvUXyAoOMgTz5x88u532
         hkjLr8leD2oQNUrYoKwDqan4HccNzUY1mazk4h5+YNVMVlsT+67zIGNKIaJy4YOScTH0
         F8FDkmVGMAm/Vry8H4PUcqWF/v5iOfYvPECUOXx7yc7B/zf9XQMvPhQ4r0dxeJZnBzta
         v4lS6aVE0JrYQQXm+yFymsfroGyxE5KW2AAy0+hqbatiWANwN9I47Kg12xCjgFd/6gBq
         HRzvecfNgFOOKrbT9g6uRhF5efVMvh4qMs2RwqcEvCgHKCAnHVAqNKNE06LebBMXOMN/
         ucaw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


The comment is mis-placed. Fix the typo.

Signed-off-by: Wang Sheng-Hui <shhuiw@gmail.com>
---
 fs/reiser4/znode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/reiser4/znode.c b/fs/reiser4/znode.c
index 4ff9714..22499a6 100644
--- a/fs/reiser4/znode.c
+++ b/fs/reiser4/znode.c
@@ -661,7 +661,7 @@ unsigned znode_free_space(znode * node /* znode to query */ )
        return node_plugin_by_node(node)->free_space(node);
 }

-/* left delimiting key of znode */
+/* right delimiting key of znode */
 reiser4_key *znode_get_rd_key(znode * node /* znode to query */ )
 {
        assert("nikita-958", node != NULL);
@@ -671,7 +671,7 @@ reiser4_key *znode_get_rd_key(znode * node /* znode to query */ )
        return &node->rd_key;
 }

-/* right delimiting key of znode */
+/* left delimiting key of znode */
 reiser4_key *znode_get_ld_key(znode * node /* znode to query */ )
 {
        assert("nikita-974", node != NULL);
-- 
1.8.3.2

