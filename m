From: Pekka J Enberg <penberg@cs.Helsinki.FI>
Subject: Re: -mm -> 2.6.13 merge status
Date: Mon, 27 Jun 2005 10:49:19 +0300 (EEST)
Message-ID: <Pine.LNX.4.58.0506271048310.26869@sbz-30.cs.Helsinki.FI>
References: <p73d5qgc67h.fsf@verdi.suse.de> <42B86027.3090001@namesys.com>
 <20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com>
 <84144f0205062223226d560e41@mail.gmail.com> <42BB0151.3030904@suse.de>
 <20050623114318.5ae13514.akpm@osdl.org> <20050623193247.GC6814@suse.de>
 <1119717967.9392.2.camel@localhost> <20050627072449.GF19550@suse.de>
 <20050627072832.GA14251@wotan.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24677-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050627072832.GA14251@wotan.suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@suse.de>
Cc: Jens Axboe <axboe@suse.de>, Andrew Morton <akpm@osdl.org>, Jeff Mahoney <jeffm@suse.de>, penberg@gmail.com, reiser@namesys.com, flx@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Mon, 2005-06-27 at 09:28 +0200, Andi Kleen wrote:
> You can just dump the expression (with #argument). That is what
> traditional userspace assert did forever.
> 
> It won't help for BUG_ON(a || b || c || d || e) but these
> are bad style anyways and should be avoided.

Sounds good to me. Jens, would this work for you?

			Pekka

Show BUG_ON expression when assertion fails.

Signed-off-by: Pekka Enberg <penberg@cs.helsinki.fi>
---

 bug.h |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletion(-)

Index: 2.6/include/asm-generic/bug.h
===================================================================
--- 2.6.orig/include/asm-generic/bug.h
+++ 2.6/include/asm-generic/bug.h
@@ -13,7 +13,12 @@
 #endif
 
 #ifndef HAVE_ARCH_BUG_ON
-#define BUG_ON(condition) do { if (unlikely((condition)!=0)) BUG(); } while(0)
+#define BUG_ON(condition) do { \
+	if (unlikely((condition) != 0)) { \
+		printk("kernel BUG '%s' at %s:%d!\n", #condition, __FILE__, __LINE__); \
+		panic("BUG!"); \
+	} \
+} while(0)
 #endif
 
 #ifndef HAVE_ARCH_WARN_ON

