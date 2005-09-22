From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: compilation problems with gcc4
Date: Thu, 22 Sep 2005 16:26:06 +0400
Message-ID: <4332A2DE.3040904@namesys.com>
References: <200509221326.49204@gj-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010204000602070603050601"
Return-path: <reiserfs-list-return-26230-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509221326.49204@gj-laptop>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Grzegorz Piotr Jaskiewicz <gj@kdemail.net>
Cc: reiserfs-list@namesys.com

--------------010204000602070603050601
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello

Grzegorz Piotr Jaskiewicz wrote:
> Trying to get beast to compile for me, to do review and testing here, I get 
> following problems with gcc 4.0.2:
> 
>   CC [M]  fs/reiser4/debug.o
> In file included from fs/reiser4/jnode.h:12,
>                  from fs/reiser4/lock.h:16,
>                  from fs/reiser4/context.h:15,
>                  from fs/reiser4/debug.c:32:
> fs/reiser4/txnmgr.h: In function 'spin_unlock_atom':
> fs/reiser4/txnmgr.h:559: warning: comparisons like X<=Y<=Z do not have their 
> mathematical meaning
> 

would you pleas try the attached patch to see whether it helps.

> That's reiserfs4 patch from ftp.namesys.com called:
> reiser4-for-2.6.12-3.patch
> gcc (GCC) 4.0.2 20050917 (prerelease)
> 
> I already requested that patch update to possible newest snapshot from 
> namesys'es cvs or whatever they use.
> 

the latest reiser4 code is available at ftp://ftp.namesys.com/pub/reiser4-for-2.6/git-snapshots/

> Thanks.
>  


--------------010204000602070603050601
Content-Type: text/plain;
 name="reiser4-typo-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-typo-fix.patch"

 fs/reiser4/spin_macros.h |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

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

_

--------------010204000602070603050601--
