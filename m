From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Autoconf error
Date: Wed, 30 Jul 2003 22:49:56 +0400
Message-ID: <16168.4948.764071.889907@laputa.namesys.com>
References: <3F255543.8010409@mrs.umn.edu>
	<3F255920.3070804@mrs.umn.edu>
	<1059455220.7235.13.camel@haron.namesys.com>
	<1059459151.14479.5.camel@localhost>
	<1059459291.27547.3.camel@haron.namesys.com>
	<1059460212.1881.1.camel@localhost>
	<1059460229.10291.0.camel@haron.namesys.com>
	<3F26C062.4070409@mrs.umn.edu>
	<1059542267.14095.11.camel@haron.namesys.com>
	<16168.4042.555742.436499@laputa.namesys.com>
	<16168.4402.451095.462365@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15116-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16168.4402.451095.462365@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: Yury Umanets <umka@namesys.com>, reiserfs-list@namesys.com

Nikita Danilov writes:
 > Nikita Danilov writes:
 >  > Yury Umanets writes:
 >  >  > On Tue, 2003-07-29 at 22:43, Grant Miner wrote:
 >  >  > > Ok, I tried reiser4progs-0.4.10 with libaal-0.4.8, then used that 
 >  >  > > mkfs.reiser4 to make a fs.  Trying to mount, mount said "wrong mount 
 >  >  > > type, too many filesystems, etc." so I went back to the other snapshot 
 >  >  > > (libaal-0.4.7 and reiser4progs-0.4.9) and used that mkfs.reiser4.  After 
 >  >  > > that I could mount the filesystems!
 >  >  > 
 >  >  > Hello,
 >  >  > 
 >  >  > The problem probably is that, since 0.4.10 large keys are supported in
 >  >  > reiser4progs and they are used by mkfs as default key policy. But, you
 >  >  > also should enable large keys in reiser4 kernel code.
 >  >  > 
 >  >  > Or just use mkfs option --keys=SHORT
 >  >  > 
 >  >  > >   So I copied my system over to this 
 >  >  > > reiser4 fs and ran it a bit; so for it works great, no corruptions etc. 
 >  >  > >   Although stuff like "echo "500" > file/..uid" seemes to lock up the 
 >  >  > > file system requiring a reboot.
 >  > 
 >  > Very interesting. Is there anything in the logs (/var/log/messages), or
 >  > on the console?
 >  > 
 >  > Can you compile with  Kernel-Hacking/Magic-Sysrq turned on, press
 >  > sysrq-T on lock up and send us its output?
 > 
 > OK. I found an error. Wait a second, I shall send you a patch.

Try this:
----------------------------------------------------------------------
===== fs/reiser4/context.h 1.28 vs edited =====
--- 1.28/context.h	Tue Jul 29 20:06:27 2003
+++ edited/fs/reiser4/context.h	Wed Jul 30 22:42:09 2003
@@ -229,8 +229,11 @@
  * directory. Commit will be performed by ktxnmgrd. */
 static inline void context_set_commit_async(reiser4_context * ctx)
 {
-	ctx->nobalance = 1;
-	ctx->trans->flags |= TXNH_DONT_COMMIT;
+	reiser4_context *context;
+
+	context = ctx->parent;
+	context->nobalance = 1;
+	context->trans->flags |= TXNH_DONT_COMMIT;
 }
 
 extern int reiser4_exit_context(reiser4_context * context);
----------------------------------------------------------------------

 > 
 >  > 
 >  >  > 
 >  >  > Probably mr. Nikita will comment this.
 >  >  > 
 >  >  > Thanks.
 >  >  > 
 >  >  > -- 
 >  >  > We're flying high, we're watching the world passes by...
 >  >  > 
 >  >  > 
 >  > 
 > 

Nikita.
