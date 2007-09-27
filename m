From: Christoph Hellwig <hch@infradead.org>
Subject: Re: 2.6.23-rc8-mm2: BUG near reiserfs_xattr_set
Date: Thu, 27 Sep 2007 21:26:07 +0100
Message-ID: <20070927202607.GA3812@infradead.org>
References: <20070927022220.c76a7a6e.akpm@linux-foundation.org> <46FC021F.8060109@free.fr> <20070927124833.d2691813.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20070927124833.d2691813.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Laurent Riffard <laurent.riffard@free.fr>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Dave Hansen <haveblue@us.ibm.com>

On Thu, Sep 27, 2007 at 12:48:33PM -0700, Andrew Morton wrote:
> >  __fput+0x124/0x1a9
> >  fput+0x31/0x35
> >  reiserfs_xattr_set+0x291/0x2b0 [reiserfs]
> >  user_set+0x4c/0x57 [reiserfs]
> >  reiserfs_setxattr+0x81/0xf1 [reiserfs]
> >  vfs_setxattr+0x7d/0xfa
> >  setxattr+0xb9/0xd1
> >  sys_lsetxattr+0x4c/0x85
> >  sysenter_past_esp+0x57/0x85
> > 
> > EIP: mnt_drop_write+0x5b/0x9d
> > 
> 
> Hi, Dave!

This sure looks like a result of the reiserfs xattr code beeing
really sucky and passing a NULL vfsmount to dentry_open.

Dave will probably find a bandaid to work around this, but the
right fix is to stop using a file struct here entirely.  If you
look at reiserfs_xattr_set it's not actually used at all except
for passing it to ->prepare_write and ->commit_write which then
don't use it at all.  All that crap should be rewritten to just
pass the dentry around.  Note that all this should not acquire
writer counts on the vfsmount - we have done this already
before calling into the xattr methods.
