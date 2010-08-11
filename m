From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] fix reiserfs_evict_inode end_writeback second call
Date: Wed, 11 Aug 2010 14:37:51 +0100
Message-ID: <20100811133751.GG31363@ZenIV.linux.org.uk>
References: <20100811110701.GA5362@swordfish.minsk.epam.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100811110701.GA5362@swordfish.minsk.epam.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Aug 11, 2010 at 02:07:01PM +0300, Sergey Senozhatsky wrote:
> reiserfs_evict_inode calls end_writeback two times hitting
> kernel BUG at fs/inode.c:298 becase inode->i_state is I_CLEAR already.

Applied, thanks.
