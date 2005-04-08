From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiser4 pokes into R3
Date: Fri, 08 Apr 2005 10:30:32 +0400
Message-ID: <1112941832.3777.77.camel@tribesman.namesys.com>
References: <Pine.LNX.4.61.0504061941430.26625@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-6Q1TUBJHs8pXMutIgVN7"
Return-path: <reiserfs-list-return-23805-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.61.0504061941430.26625@yvahk01.tjqt.qr>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: reiserfs-list@namesys.com

--=-6Q1TUBJHs8pXMutIgVN7
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Wed, 2005-04-06 at 21:47, Jan Engelhardt wrote:
> [please Cc, i'm not subscribed atm]
> 
> Hello list,
> 
> 
> after I started using a loop-mounted reiser4 fs, I was getting
> 
> ReiserFS: hda1: warning: clm-2100: nesting info a different FS
> 

would you try to see whether the attached patch helps?

Are there any nfs mounts/shares when you get this problem?

> randomly. (BTW, there's a spelling mistake: info -> into.)
> Below clm-2100, I added a printk in the sources to see what's going on...:
> (fs/reiserfs/journal.c)
> 
>             reiserfs_warning(p_s_sb, "clm-2100: nesting info a different FS");
> +            printk(KERN_INFO "clm-2100+1: p_s_sb=%s (%p), t_super=%s (%p)\n",
> +              reiserfs_bdevname(p_s_sb), p_s_sb,
> +              reiserfs_bdevname(cur_th->t_super), cur_th->t_super
> +            );
> 
> After I booted the newly compiled kernel with this printk, I even got a 
> oops-or-similar when entering this branch, which "should never
> ** really happen...". Wonder why?

cur_th points not to struct reiserfs_transaction_handle, but to
reiser4_context. 

>  Well, the paging request for "4b1b5e4b"
> looks out-of-kernelspace, so I suppose _something_ in R4 pokes heavily in 
> memory and upsets the R3 code.
> 
> I am using the 2.6.11.4 (SUSE KOTD from March 29 2005.)
> 
> 
> 
> 
> Jan Engelhardt

--=-6Q1TUBJHs8pXMutIgVN7
Content-Disposition: attachment; filename=reiserfs-do-not-create-negative-dentry-for-dead-dir.patch
Content-Type: text/plain; name=reiserfs-do-not-create-negative-dentry-for-dead-dir.patch; charset=koi8-r
Content-Transfer-Encoding: 7bit

 fs/reiserfs/namei.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletion(-)

diff -puN fs/reiserfs/namei.c~reiserfs-do-not-create-negative-dentry-for-dead-dir fs/reiserfs/namei.c
--- linux-2.6.12-rc1-mm3/fs/reiserfs/namei.c~reiserfs-do-not-create-negative-dentry-for-dead-dir	2005-04-08 10:22:47.953093269 +0400
+++ linux-2.6.12-rc1-mm3-vs/fs/reiserfs/namei.c	2005-04-08 10:23:21.235990760 +0400
@@ -363,7 +363,8 @@ static struct dentry * reiserfs_lookup (
     if (inode)
 	    return d_splice_alias(inode, dentry);
     
-    d_add(dentry, inode);
+    if (!IS_DEADDIR(dir))
+	    d_add(dentry, inode);
     return NULL;
 }
 

_

--=-6Q1TUBJHs8pXMutIgVN7--

