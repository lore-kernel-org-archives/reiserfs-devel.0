From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: compilation problems with gcc4
Date: Thu, 22 Sep 2005 17:00:24 +0400
Message-ID: <4332AAE8.6050308@namesys.com>
References: <200509221326.49204@gj-laptop> <4332A2DE.3040904@namesys.com> <200509221443.37414@gj-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040107020600010008080202"
Return-path: <reiserfs-list-return-26233-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509221443.37414@gj-laptop>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Grzegorz Piotr Jaskiewicz <gj@kdemail.net>
Cc: reiserfs-list@namesys.com

--------------040107020600010008080202
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello

Grzegorz Piotr Jaskiewicz wrote:
> still some warnings:

new verison of patch (undo previous one first), please

>   CC [M]  fs/reiser4/znode.o
> fs/reiser4/znode.c: In function 'znode_set_ld_key':
> fs/reiser4/znode.c:729: warning: comparisons like X<=Y<=Z do not have their 
> mathematical meaning
> and the error. 
>   CC [M]  fs/reiser4/znode.o
> fs/reiser4/znode.c: In function 'znode_set_ld_key':
> fs/reiser4/znode.c:729: warning: comparisons like X<=Y<=Z do not have their 
> mathematical meaning
> 
> It might be thou, because I am compiling against 2.6.13.2 not 2.6.14.X right ?
> 

yes, you got quite old code.

--------------040107020600010008080202
Content-Type: text/plain;
 name="reiser4-typo-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-typo-fix.patch"

 fs/reiser4/spin_macros.h |    2 +-
 fs/reiser4/znode.c       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff -puN fs/reiser4/spin_macros.h~reiser4-typo-fix fs/reiser4/spin_macros.h
--- linux-2.6.12/fs/reiser4/spin_macros.h~reiser4-typo-fix	2005-09-22 16:22:20.563302069 +0400
+++ linux-2.6.12-vs/fs/reiser4/spin_macros.h	2005-09-22 16:23:20.924412525 +0400
@@ -173,7 +173,7 @@ static inline int  spin_trylock_ ## NAME
 static inline void spin_unlock_ ## NAME (TYPE *x)				\
 {										\
 	__ODCA("nikita-1375", LOCK_CNT_GTZ(spin_locked_ ## NAME));		\
-	__ODCA("nikita-1376", LOCK_CNT_GTZ(spin_locked > 0));			\
+	__ODCA("nikita-1376", LOCK_CNT_GTZ(spin_locked));			\
 	__ODCA("nikita-2703", spin_ ## NAME ## _is_locked(x));			\
 										\
 	spin_ ## NAME ## _dec();						\
diff -puN fs/reiser4/znode.c~reiser4-typo-fix fs/reiser4/znode.c
--- linux-2.6.12/fs/reiser4/znode.c~reiser4-typo-fix	2005-09-22 16:56:47.764336017 +0400
+++ linux-2.6.12-vs/fs/reiser4/znode.c	2005-09-22 16:57:00.139793859 +0400
@@ -726,7 +726,7 @@ znode_set_ld_key(znode * node, const rei
 	assert("nikita-2940", node != NULL);
 	assert("nikita-2941", key != NULL);
 	assert("nikita-2942", rw_dk_is_write_locked(znode_get_tree(node)));
-	assert("nikita-3070", LOCK_CNT_GTZ(write_locked_dk > 0));
+	assert("nikita-3070", LOCK_CNT_GTZ(write_locked_dk));
 	assert("nikita-2943",
 	       znode_is_any_locked(node) ||
 	       keyeq(&node->ld_key, min_key()));

_

--------------040107020600010008080202--
