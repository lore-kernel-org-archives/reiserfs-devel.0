From: Oleg Drokin <green@namesys.com>
Subject: Re: symlink has wrong sd_blocks count
Date: Tue, 18 Feb 2003 16:37:19 +0300
Message-ID: <20030218163719.A15406@namesys.com>
References: <3E5210A5.1030108@dsvr.net> <20030218144243.A6891@namesys.com> <1045572986.13746.3.camel@tiny.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12813-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1045572986.13746.3.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Nick Burrett <nick@dsvr.net>, reiserfs-list@namesys.com

Hello!

On Tue, Feb 18, 2003 at 07:56:26AM -0500, Chris Mason wrote:
> > > I'm running a stock 2.4.20 kernel with the reiserfs quota patches applied.
> > > Simply creating a symlink and then running reiserfsck shows errors like 
> > > this:
> > >    /foofile 2 4 has wrong sd_blocks 8, has to be 1
> > > I've reproduced this 100% on 100 filesystems on two servers.
> > Aha, I see.
> > Ignore this message for now for directories and symlinks.
> > This is because when reiserfs calculates number of blocks file would use,
> > in case of no quota, reiserfs code does this and can do this precisely
> > (up to 512 bytes), but with quota patches applied, quota code takes
> > account of blocks used. And it round everything up to blocksize, hence
> > the difference. And reiserfsck uses only 1st variant of the code.
> > I am not yet sure on how to deal with the issue.
> > Just ignore this message for now.
> The quota code can have special checks for symlinks, but the sd_block
> accounting is somewhat complex, and I've been hesitant to make it even
> more so with the symlink checks.

Symlinks are counted the same way as directories.
If you round up directory size to 512 bytes, same can be done with symlinks.
But as I see it in quota (generic quota) code, the extra "i_bytes" are always
being rounded up to blocksize. And that what's causing a problem.

Bye,
    Oleg
