From: "Randy.Dunlap" <rddunlap@osdl.org>
Subject: Re: [PATCH] reiserfs: fix a few  'empty body in an if-statement' 
 warnings.
Date: Thu, 14 Apr 2005 18:49:13 -0700
Message-ID: <20050414184913.72831860.rddunlap@osdl.org>
References: <Pine.LNX.4.62.0504150255090.3466@dragon.hyggekrogen.localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23880-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.62.0504150255090.3466@dragon.hyggekrogen.localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jesper Juhl <juhl-lkml@dif.dk>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Fri, 15 Apr 2005 02:58:54 +0200 (CEST) Jesper Juhl wrote:

| When building with  gcc -W  fs/reiserfs/namei.c:602 has a few warnings 
| about 'empty body in an if-statement'. This patch silences those warnings.

So fix include/linux/reiserfs_xattr.h:
change
#define reiserfs_mark_inode_private(inode)
to
#define reiserfs_mark_inode_private(inode)	do { } while (0)


and not as below.

| Signed-off-by: Jesper Juhl <juhl-lkml@dif.dk>
| 
| --- linux-2.6.12-rc2-mm3-orig/fs/reiserfs/namei.c	2005-04-11 21:20:55.000000000 +0200
| +++ linux-2.6.12-rc2-mm3/fs/reiserfs/namei.c	2005-04-15 02:54:53.000000000 +0200
| @@ -352,8 +352,9 @@ static struct dentry * reiserfs_lookup (
|          }
|  
|  	/* Propogate the priv_object flag so we know we're in the priv tree */
| -	if (is_reiserfs_priv_object (dir))
| +	if (is_reiserfs_priv_object (dir)) {
|  	    reiserfs_mark_inode_private (inode);
| +	}
|      }
|      reiserfs_write_unlock(dir->i_sb);
|      if ( retval == IO_ERROR ) {
| @@ -599,8 +600,9 @@ static int reiserfs_create (struct inode
|  
|      reiserfs_write_lock(dir->i_sb);
|  
| -    if (locked)
| +    if (locked) {
|          reiserfs_write_lock_xattrs (dir->i_sb);
| +    }
|  
|      retval = journal_begin(&th, dir->i_sb, jbegin_count);
|      if (retval) {
| @@ -640,8 +642,9 @@ static int reiserfs_create (struct inode
|      retval = journal_end(&th, dir->i_sb, jbegin_count) ;
|  
|  out_failed:
| -    if (locked)
| +    if (locked) {
|          reiserfs_write_unlock_xattrs (dir->i_sb);
| +    }
|      reiserfs_write_unlock(dir->i_sb);
|      return retval;
|  }
| @@ -668,8 +671,9 @@ static int reiserfs_mknod (struct inode 
|  
|      reiserfs_write_lock(dir->i_sb);
|  
| -    if (locked)
| +    if (locked) {
|          reiserfs_write_lock_xattrs (dir->i_sb);
| +    }
|  
|      retval = journal_begin(&th, dir->i_sb, jbegin_count) ;
|      if (retval) {
| @@ -714,8 +718,9 @@ static int reiserfs_mknod (struct inode 
|      retval = journal_end(&th, dir->i_sb, jbegin_count) ;
|  
|  out_failed:
| -    if (locked)
| +    if (locked) {
|          reiserfs_write_unlock_xattrs (dir->i_sb);
| +    }
|      reiserfs_write_unlock(dir->i_sb);
|      return retval;
|  }
| @@ -743,8 +748,9 @@ static int reiserfs_mkdir (struct inode 
|      locked = reiserfs_cache_default_acl (dir);
|  
|      reiserfs_write_lock(dir->i_sb);
| -    if (locked)
| +    if (locked) {
|          reiserfs_write_lock_xattrs (dir->i_sb);
| +    }
|  
|      retval = journal_begin(&th, dir->i_sb, jbegin_count) ;
|      if (retval) {
| @@ -799,8 +805,9 @@ static int reiserfs_mkdir (struct inode 
|      d_instantiate(dentry, inode);
|      retval = journal_end(&th, dir->i_sb, jbegin_count) ;
|  out_failed:
| -    if (locked)
| +    if (locked) {
|          reiserfs_write_unlock_xattrs (dir->i_sb);
| +    }
|      reiserfs_write_unlock(dir->i_sb);
|      return retval;
|  }


---
~Randy
