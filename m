From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: reiserfs locking (v2)
Date: Fri, 2 Jul 2010 16:34:21 +0200
Message-ID: <20100702143419.GC5324@nowhere>
References: <20100702093451.GA3973@swordfish.minsk.epam.com> <20100702131248.GA5324@nowhere> <1278078267.1917.254.camel@laptop>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=otaV1PVM0kG59gQ6h9/MgWaEUtqXZTbBBV3g1hTh6vw=;
        b=rltCM+6ZwCOp3d8EacXRB+R8xZ7xZFpsU9c5g2pVzWubwqQOKtedW9sGkJc69gpW0d
         nCNYjJw6sYUIrK6UVEHXRDiUHKrljUmGjp4QUeW6VR7RTbRdVGvIw0epLhqiJJ+j9oCd
         cysRYF7Eh+WYKm4D7mo3A87Y+7FnwUbTGBJCY=
Content-Disposition: inline
In-Reply-To: <1278078267.1917.254.camel@laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Mason <chris.mason@oracle.com>, Jeff Mahoney <jeffm@jeffreymahoney.com>

On Fri, Jul 02, 2010 at 03:44:27PM +0200, Peter Zijlstra wrote:
> On Fri, 2010-07-02 at 15:12 +0200, Frederic Weisbecker wrote:
> > 
> > I don't think the deadlock can really happen, as we can't release the directory while
> > we are reading it. Plus I guess we can't mmap a directory (someone correct me if
> > I'm wrong).
> > 
> 
> > Is there someone who could give me a hint here?
> 
> If its purely directories you can try and give directory inode locks a
> different class.


We have a static layout in include/linux/fs.h:

enum inode_i_mutex_lock_class
{
	I_MUTEX_NORMAL,
	I_MUTEX_PARENT,
	I_MUTEX_CHILD,
	I_MUTEX_XATTR,
	I_MUTEX_QUOTA
};


I fear none of them fits in our scheme, except the normal one.

And playing with a supplementary set of classes only used in
a single place would make the lockdep checks useless there,
even worse it would make us missing a lot of right checks.

vfs_readdir() locks the directory before calling the fs, and none
of the nested classes would be in its good right there, as the
directory is the current inode to work on, not a parent nor a
child or so.

And unfortunately it's the same in reiserfs_file_release() that
can close about whatever inode, we are locking the current inode,
not a parent, child, xattr, or so.


So changing the nesting class here would not be a good thing to do
I fear.

