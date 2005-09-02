From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] fix problems related to journaling in Reiserfs
Date: Thu, 1 Sep 2005 22:03:21 -0400
Message-ID: <20050901220321.454985a3@watt.suse.com>
References: <6.0.0.20.2.20050831191551.03fdbac0@129.60.53.12>
	<43167718.5080702@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25811-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43167718.5080702@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Hifumi Hisashi <hifumi.hisashi@lab.ntt.co.jp>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

On Wed, 31 Aug 2005 20:35:52 -0700
Hans Reiser <reiser@namesys.com> wrote:

> Thanks much Hifumi!
> 
> Chris, please comment on the patch.

The problem is that I'm not always making the inode dirty during the
reiserfs_file_write.  The get_block based write function does an
explicit commit during O_SYNC mode.  I've got a cleanup related to this
for quotas and other things, but I didn't realize it would help O_SYNC
as well.

I'll diff/test against mainline in the morning and send out.

-chris
