From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] reiserfs:fix journaling issue regarding fsync()
Date: Sat, 1 Jul 2006 15:34:21 -0400
Message-ID: <200607011534.24157.mason@suse.com>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2> <200606300824.12352.mason@suse.com> <56260.61.127.129.98.1151708358.squirrel@serv1.oss.ntt.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <56260.61.127.129.98.1151708358.squirrel@serv1.oss.ntt.co.jp>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>
Cc: reiserfs-list@namesys.com, reiser@namesys.com, reiserfs-dev@namesys.com, linux-fsdevel@vger.kernel.org

On Friday 30 June 2006 18:59, Hisashi Hifumi wrote:
> Hi.
>
> > This is correct, excpet you need to put the update_inode_transaction call
> > inside reiserfs_write_lock/unlock.
>
> Again, I remade my patch.

Thanks, this one looks good.

> I have a question.
> I understand update_inode_transaction must be inside reiserfs_write_lock.
> Is update_inode_transaction needed to be inside journal_begin/end ?

reiserfs_write_lock is enough, do_journal_end has reiserfs_write_lock while it 
is updating j_current_jl and j_trans_id.  We just need to make sure the 
transid and the jl pointer are consistent with each other.

-chris
