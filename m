From: Chris Mason <mason@suse.com>
Subject: Re: symlink has wrong sd_blocks count
Date: 18 Feb 2003 08:41:47 -0500
Message-ID: <1045575706.16046.0.camel@tiny.suse.com>
References: <3E5210A5.1030108@dsvr.net> <20030218144243.A6891@namesys.com>
	 <1045572986.13746.3.camel@tiny.suse.com>
	 <20030218163719.A15406@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12814-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030218163719.A15406@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Nick Burrett <nick@dsvr.net>, reiserfs-list@namesys.com

On Tue, 2003-02-18 at 08:37, Oleg Drokin wrote:
> > The quota code can have special checks for symlinks, but the sd_block
> > accounting is somewhat complex, and I've been hesitant to make it even
> > more so with the symlink checks.
> 
> Symlinks are counted the same way as directories.
> If you round up directory size to 512 bytes, same can be done with symlinks.
> But as I see it in quota (generic quota) code, the extra "i_bytes" are always
> being rounded up to blocksize. And that what's causing a problem.

Right, it should be possible.  I'm just finishing testing on the latest
batch of quota code, so I'll work it in.

-chris


