From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH] reiserfs:fix journaling issue regarding fsync()
Date: Sun, 2 Jul 2006 18:36:52 -0700
Message-ID: <20060702183652.9612309b.akpm@osdl.org>
References: <6.0.0.20.2.20060620153929.040f0750@172.19.0.2>
	<200606300824.12352.mason@suse.com>
	<56260.61.127.129.98.1151708358.squirrel@serv1.oss.ntt.co.jp>
	<200607011534.24157.mason@suse.com>
	<44A7E790.3050003@namesys.com>
	<6.0.0.20.2.20060703095844.04122500@172.19.0.2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28895-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <6.0.0.20.2.20060703095844.04122500@172.19.0.2>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com, linux-fsdevel@vger.kernel.org, reiser@namesys.com, mason@suse.com

On Mon, 03 Jul 2006 10:31:49 +0900
Hisashi Hifumi <hifumi.hisashi@oss.ntt.co.jp> wrote:

> When write() extends a file(i_size is increased) and fsync() is called,
> change of inode must be written to journaling area through fsync().
> But,currently the i_trans_id is not correctly updated when i_size
> is increased. So fsync() does not kick the journal writer.
> 
> Reiserfs_file_write() already updates the transaction when blocks are allocated,
> but the case when i_size increases and new blocks are not added is not
> correctly treated.

How can i_size be increased without adding blocks?  Are you referring to a
write which remains wholly within the final block of the file?  And/or to
an expanding lseek?

And what are the user-visible consequences of this bug?

Thanks.
