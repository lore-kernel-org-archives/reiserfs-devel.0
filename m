From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 15:08:17 -0700
Message-ID: <20030806220817.GG21290@matchmail.com>
References: <20030806182055.A28562@bitwizard.nl> <3F31303A.6020408@namesys.com> <3F314BE8.50300@suse.com> <20030806212107.A3975@bitwizard.nl> <20030806213623.C3975@bitwizard.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15208-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030806213623.C3975@bitwizard.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Cc: Jeff Mahoney <jeffm@suse.com>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Wed, Aug 06, 2003 at 09:36:23PM +0200, Rogier Wolff wrote:
> P.S. We also sometimes do: 
> 
> 	while (1)
> 	   seek to random position (in randomly chosen 1G file)
> 	   write 1k
> 
> we might benefit from a call that tells the filesystem:
> Pretend that this file WILL grow to 1Gb, but leave it sparse for
> now.
> 
> So, the block to allocate if we seek to 500Mb past the beginning of the
> file would be 500Mb further along the disk. That way the eventual image
> will be linear. But leaving the intermediate blocks unallocated will 
> allow us to  eventually use up that free space if we DO NOT end up
> writing that area. 

Ahh, but sparse files are not handled effeciently at all with reiserfs.  It
is fixed properly in reiser4 though.  There was a thread recently on this
issue on the reiserfs list within the last week about this.

If you use reiserfs, avoid large sparse files like the plague.
