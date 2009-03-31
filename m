From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [patch 18/35 xattr-rework] reiserfs: Clean up xattrs when
	REISERFS_FS_XATTR is unset
Date: Tue, 31 Mar 2009 14:44:02 -0400
Message-ID: <20090331184402.GA28520@infradead.org>
References: <20090330180215.951354436@suse.com> <20090330181011.592648722@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090330181011.592648722@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Mon, Mar 30, 2009 at 02:02:33PM -0400, Jeff Mahoney wrote:
>  The current reiserfs xattr implementation will not clean up old xattr
>  files if files are deleted when REISERFS_FS_XATTR is unset. This results
>  in inaccessible lost files, wasting space.
> 
>  This patch compiles in basic xattr knowledge, such as how to delete them and
>  change ownership for quota tracking. If the file system has never used
>  xattrs, then the operation is quite fast: it returns immediately when
>  it sees there is no .reiserfs_priv directory.

What about just making xattr suppose unconditional?  That's what most
never filesystems do, and it really shouldn't be a whole lot of code.

