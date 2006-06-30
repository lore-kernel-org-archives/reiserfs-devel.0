From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] reiserfs:fix journaling issue regarding fsync()
Date: Thu, 29 Jun 2006 20:47:13 -0400
Message-ID: <200606292047.14973.mason@suse.com>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>, reiser@namesys.com, reiserfs-dev@namesys.com, linux-fsdevel@vger.kernel.org

On Tuesday 20 June 2006 04:43, Hisashi Hifumi wrote:
> Hi,
>
>   When write() extends a file(i_size is increased) and fsync() is
> called, change of inode must be written to journaling area
> through fsync().
> But,currently the i_trans_id is not correctly updated when i_size
> is increased. So fsync() does not kick the journal writer.

Thanks for the patch.  One problem is this will bump the transaction marker 
for atime updates too.  I'd rather see the change done inside 
reiserfs_file_write.

reiserfs_file_write already updates the transaction when blocks are allocated, 
but you're right that to be 100% correct we should cover the case when i_size 
increases but new blocks are not added.  Was this the case you were trying to 
fix?

-chris
