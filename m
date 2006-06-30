From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] reiserfs:fix journaling issue regarding fsync()
Date: Fri, 30 Jun 2006 08:24:10 -0400
Message-ID: <200606300824.12352.mason@suse.com>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2> <200606292047.14973.mason@suse.com> <6.0.0.20.2.20060630094908.0411c9d0@172.19.0.2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <6.0.0.20.2.20060630094908.0411c9d0@172.19.0.2>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>
Cc: reiserfs-list@namesys.com, reiser@namesys.com, reiserfs-dev@namesys.com, linux-fsdevel@vger.kernel.org

On Thursday 29 June 2006 21:36, Hisashi Hifumi wrote:
> Hi,
>
> At 09:47 06/06/30, Chris Mason wrote:
>  >Thanks for the patch.  One problem is this will bump the transaction
>  > marker for atime updates too.  I'd rather see the change done inside
>  >reiserfs_file_write.
>
> I did not realize that an atime updates is also influenced.
>
>  >reiserfs_file_write already updates the transaction when blocks are
>  > allocated, but you're right that to be 100% correct we should cover the
>  > case when i_size increases but new blocks are not added.  Was this the
>  > case you were trying to fix?
>
> Yes, that's right.
>
> So, I remade my patch as follows.
> I tested this patch and confirmed that the kernel with this patch work
> well.

This is correct, excpet you need to put the update_inode_transaction call 
inside reiserfs_write_lock/unlock.

-chris
