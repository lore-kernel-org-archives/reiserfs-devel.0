From: Johannes Hirte <hirtejs@idmt.fraunhofer.de>
Subject: Re: reiser4 experimental patch
Date: Fri, 10 Nov 2006 15:39:45 +0100
Message-ID: <200611101539.46266.hirtejs@idmt.fraunhofer.de>
References: <200611091723.20881.smyows@youare.not.br> <200611100957.05438.smyows@youare.not.br> <200611101059.30441.smyows@youare.not.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30134-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200611101059.30441.smyows@youare.not.br>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Am Freitag, 10. November 2006 13:59 schrieb Guilherme Covolo:
> the diference between my an  Johannes Hirte's patch is:
>
> /fs/reiser4/plugins/item/item.h
>
> <       ssize_t (*write) (struct file *, const char __user *, size_t,
> loff_t *pos);
> ---
>
> >       int (*write) (struct file *, const char __user *, size_t, loff_t
>
> *pos);
> *********************************************************
Don't know, if this is only cosmetic or really necessary. See below.

> /fs/reiser4/super_ops.c
>
> 290c290
> < static int reiser4_statfs(struct dentry *dentry, struct kstatfs *statfs)
> ---
>
> > static int reiser4_statfs(struct super_block *super, struct kstatfs
> > *statfs)
>
> 292,293d291
> <       struct super_block *super = dentry->d_sb;
> <
> 571a570,571
>
> > // alterado
>
> 575,576c575
> <                                         void *data,
> <                                         struct vfsmount *mnt)
> ---
>
> >                                         void *data, struct vfsmount *mnt)
>
> 582c581,582
> < static struct file_system_type reiser4_fs_type = {
> ---
>
> > // alterado
> > struct file_system_type reiser4_fs_type = {

Ok, with gcc-4.1 your patch won't even compile. After fixing this, it should 
work. Please consider that this code ist still buggy and will oops if the 
filesystem runs full. Don't use it in productive environment.

> *********************************************************
>
> i change my super_ops.c but why you alter te int to ssize_t on item.h?

This is for fixing a compiler warning on x86_64, where size_t is 64bit:
  CC      fs/reiser4/plugin/item/item.o
fs/reiser4/plugin/item/item.c:561: warning: initialization from incompatible 
pointer type
fs/reiser4/plugin/item/item.c:615: warning: initialization from incompatible 
pointer type
  CC      fs/reiser4/plugin/security/perm.o

I'm still not shure, if this is really necessary.
