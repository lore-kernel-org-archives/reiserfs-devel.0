From: Oleg Drokin <green@namesys.com>
Subject: Re: reiser4 snapshot for August 26th.
Date: Wed, 27 Aug 2003 11:38:49 +0400
Message-ID: <20030827073849.GA29071@namesys.com>
References: <20030826102233.GA14647@namesys.com> <20030826232844.25e0e9b3.aradorlinux@yahoo.es>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15456-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030826232844.25e0e9b3.aradorlinux@yahoo.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Diego Calleja Garc?a <aradorlinux@yahoo.es>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Hello!

On Tue, Aug 26, 2003 at 11:28:44PM +0200, Diego Calleja Garc?a wrote:

> btw, I suppose this feature will be removed if/when reiser4 is merged?:
> config REISER4_FS_SYSCALL
>         bool "Enable reiser4 system call"

No. It will be fixed.

> dmesg errors:
> (fs/ext3/inode.c, 2728): ext3_write_inode: called recursively, non-PF_MEMALLOC!
> Call Trace:
>  [<c018c715>] write_inode+0x45/0x50
>  [<c018c9af>] __sync_single_inode+0x28f/0x310
>  [<c018cd00>] generic_sync_sb_inodes+0x1c0/0x2e0

Hm. Interesting Thank you for the report. We will fix it.

Bye,
    Oleg
