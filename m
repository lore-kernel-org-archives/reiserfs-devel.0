From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: ReiserFS Maximum file size (in practice)
Date: Wed, 19 May 2004 16:04:49 -0400
Message-ID: <40ABBDE1.9000804@suse.com>
References: <40AA74CA.5040306@suse.com>	 <1084927507.27142.2.camel@watt.suse.com>  <40AB4F5B.7050109@suse.com> <1084971454.27142.12.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1084971454.27142.12.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Chris Mason wrote:
> We can probably talk Jan Kara into fixing dquot_transfer, and probably
> talk Andrew Morton into allowing a resolution on the inode->i_bytes
> mess.  ext2/3 suffer from the same problem (read ext[23]_max_size).

The comment on ext[23]_max_size doesn't only refer to the in-memory 
i_blocks, but also to the on-disk one as well. Unlike ReiserFS, Ext[23] 
doesn't track blocks as a multiple of the filesystem block size. It 
tracks it as a multiple of 512B blocks, just like the in memory one. 
(see ext[23]_read_inode and ext[23]_do_update_inode; There's no 
blocksize translation)

ReiserFS is artificially limited by the VFS layer (and in its own use of 
i_blocks to update stat_data->sd_blocks); Ext[23] is limited by its own 
disk format. Other than its i_blocks, ext[23]'s triple indirection 
should be able to support files up to ~ 4TB.


> I think I'd rather just fix the quota problem right now, it's a smaller
> change.

I think there's going to be a decent amount of work in either case. 
Definately moreso than the patch I posted earlier. There are two scenarios:

1) Fix just reiserfs. This means adding a sd_blocks field to the 
in-memory inode, increasing every reiserfs inode by 4 bytes. It also 
means that every time a quota operation occurs, we need to follow it 
with an update to our internal block count as well. It's easy enough to 
do, just not pretty.

2) Fix the VFS layer. Fixing the VFS layer is simple, but there are 
filesystems that assume i_blocks is 32-bit already and they'd need to be 
cleaned up also.

Unfortunately, all this may be a moot point anyway. If a file is created 
on a kernel supporting file sizes > 2 TB, and is then updated on a 
previous kernel, wrapping will occur and cause breakage.

-Jeff

-- 
Jeff Mahoney
SuSE Labs
