From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 OOPSes and panics when out of memory
Date: Tue, 18 Jul 2006 18:18:47 +0400
Message-ID: <1153232327.6355.41.camel@tribesman.namesys.com>
References: <63591.70.224.221.228.1153071893.squirrel@people.msoe.edu>
	 <1153145428.6311.43.camel@tribesman.namesys.com>
	 <1153157891.6311.71.camel@tribesman.namesys.com>
	 <1153205527.9866.20.camel@gentoo>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-UhSEgkh5pMSVl61BU0Xj"
Return-path: <reiserfs-list-return-29060-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153205527.9866.20.camel@gentoo>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: reiserfs-list@namesys.com

--=-UhSEgkh5pMSVl61BU0Xj
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Tue, 2006-07-18 at 00:52 -0600, Jake Maciejewski wrote:
> Thanks for the patch, but I can still reproduce the problem. I've been
> running the attached program to try to speed up the testing process a
> bit. Interrupting and restarting the compilation loop also seems to
> help.
> 

ok

> If I had hours to wait, it would probably crash eventually without
> additional encouragement, but I'm doing everything as an unprivileged
> user, so I don't think my tests are unreasonable.
> 
> Anyway, I'm still getting a panic with debug enabled:
> 
> reiser4 panicked cowardly: reiser4[find(16411)]: reiser4_dirty_inode (fs/reiser4/super_ops.c:173)[]:
> Kernel panic - not syncing: reiser4[find(16411)]: reiser4_dirty_inode (fs/reiser4/super_ops.c:173)[]:
> 

The attached patch should fix the above.

> Without debug enabled I've seen:
> 
> http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060718/messages1.txt.gz
> http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060718/fsck1_--check.txt.gz
> http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060718/fsck1_--fix.txt.gz
> http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060718/fsck1_--check_after_--fix.txt.gz
> 
> but usually I get:
> 
> http://people.msoe.edu/~maciejej/patches/AMD64_reiser4_debug/20060718/messages3.txt.gz
> 
> with no corruption (although I've been rebooting before complete
> failure).
> 
> On Mon, 2006-07-17 at 21:38 +0400, Vladimir V. Saveliev wrote:
> > Hello
> > 
> > On Mon, 2006-07-17 at 18:10 +0400, Vladimir V. Saveliev wrote:
> > > Hello
> > > 
> > > On Sun, 2006-07-16 at 12:44 -0500, maciejej@msoe.edu wrote:
> > > > Has my previous post
> > > > (http://marc.theaimsgroup.com/?l=reiserfs&m=115259665831650&w=2) been
> > > > overlooked, or have I not provided enough information? Do I need to
> > > > reproduce these issues on 2.6.18-rc1-mm2? Should I be trying any patches?
> > > > 
> > > 
> > 
> > please try the attached patch.
> > 
> > > your test crashes reiser4 on my test box. I hope to get a patch ready
> > > later today. Not sure that I got the same problem as you, though. We
> > > will see. 
> > > 
> > > > The bottom line is with 2.6.17-mm6, I've always been able to OOPs or panic
> > > > reiser4 on my amd64 machine (haven't tried x86 yet) by using all available
> > > > physical memory.
> > > > 
> > > > 
> > > 
> > > 

--=-UhSEgkh5pMSVl61BU0Xj
Content-Description: 
Content-Disposition: inline; filename=fix-readdir.patch
Content-Type: text/x-patch; charset=utf-8
Content-Transfer-Encoding: 7bit

readdir has to txn_restart, therefore, grab space for stat data update has to be forced

---
commit f1cea9c0a8db0977077d54562677514d6d736690
tree 95479706299276d7c23efd337216501b0dfd69c2
parent bbf99f71c140d7758a6223a557fa4a4d2b5c384e
author Vladimir V. Saveliev <vs@tribesman.namesys.com> Tue, 18 Jul 2006 18:13:05 +0400
committer Vladimir V. Saveliev <vs@tribesman.namesys.com> Tue, 18 Jul 2006 18:13:05 +0400

 plugin/file_ops_readdir.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/plugin/file_ops_readdir.c b/plugin/file_ops_readdir.c
index 04ada21..dfdb68d 100644
--- a/plugin/file_ops_readdir.c
+++ b/plugin/file_ops_readdir.c
@@ -629,7 +629,7 @@ int readdir_common(struct file *f /* dir
 	detach_fsdata(f);
 
 	/* try to update directory's atime */
-	if (reiser4_grab_space(inode_file_plugin(inode)->estimate.update(inode),
+	if (reiser4_grab_space_force(inode_file_plugin(inode)->estimate.update(inode),
 			       BA_CAN_COMMIT) != 0)
 		warning("", "failed to update atime on readdir: %llu",
 			get_inode_oid(inode));

--=-UhSEgkh5pMSVl61BU0Xj--

