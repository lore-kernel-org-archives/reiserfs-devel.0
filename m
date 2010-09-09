From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [Bug] possible circular locking in reiserfs_unpack
Date: Thu, 9 Sep 2010 03:53:52 +0200
Message-ID: <20100909015346.GA5999@nowhere>
References: <20100905113121.GA1876@del.dom.local> <20100908153730.5ad13f71.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=h3vKjHfYgomBd3C3qg5VyvG/cw6IYW6klPbJ0GZGkxw=;
        b=rfNG0RvuIlz1+k7qRLAsLKbRz3wpOm9ctM11bPbwmBxHtoufeeMgyovdDDxFm/S5GL
         mZzPFlFDcwd2eqYZe0vinQy7S8zlUoSS9fn70uWN+n8e0m3c1Dm007ssvo83yYMlIiHJ
         1ZkDUROhU+Vo6ls8bKcduExks+jrJlUhsPFxw=
Content-Disposition: inline
In-Reply-To: <20100908153730.5ad13f71.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jarek Poplawski <jarkao2@gmail.com>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>

On Wed, Sep 08, 2010 at 03:37:30PM -0700, Andrew Morton wrote:
> On Sun, 5 Sep 2010 13:31:21 +0200
> Jarek Poplawski <jarkao2@gmail.com> wrote:
> 
> > Hi,
> > I get this warning on every lilo write with 2.6.35.4 and a bit/git
> > later too.
> > 
> 
> Can you tell us the latest kernel version which did *not* have this
> bug?  That way we can narrow the problem down a bit.
> 
> Thanks.



Ah, when you see &REISERFS_SB(s)->lock in a bug report, don't hesitate to blame me :-)

This is a problem resulting from the bkl conversion to a mutex that introduced
a lot of new locking dependencies. Most of them have been fixed, but for less
tested paths like ioctl, we hear about it later.

Does the following patch fixes the issue?
If so, I'll make a proper changelog and put the appropriate 2.6.33-35 stable
tags for the backport.

Thnaks!


diff --git a/fs/reiserfs/ioctl.c b/fs/reiserfs/ioctl.c
index f53505d..679d502 100644
--- a/fs/reiserfs/ioctl.c
+++ b/fs/reiserfs/ioctl.c
@@ -188,7 +188,7 @@ int reiserfs_unpack(struct inode *inode, struct file *filp)
 	/* we need to make sure nobody is changing the file size beneath
 	 ** us
 	 */
-	mutex_lock(&inode->i_mutex);
+	reiserfs_mutex_lock_safe(&inode->i_mutex, inode->i_sb);
 	reiserfs_write_lock(inode->i_sb);
 
 	write_from = inode->i_size & (blocksize - 1);

