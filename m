From: Chris Mason <mason@suse.com>
Subject: Re: symlink has wrong sd_blocks count
Date: 18 Feb 2003 07:56:26 -0500
Message-ID: <1045572986.13746.3.camel@tiny.suse.com>
References: <3E5210A5.1030108@dsvr.net>  <20030218144243.A6891@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12812-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030218144243.A6891@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Nick Burrett <nick@dsvr.net>, reiserfs-list@namesys.com

On Tue, 2003-02-18 at 06:42, Oleg Drokin wrote:
> Hello!
> 
> On Tue, Feb 18, 2003 at 10:53:25AM +0000, Nick Burrett wrote:
> 
> > I'm running a stock 2.4.20 kernel with the reiserfs quota patches applied.
> > Simply creating a symlink and then running reiserfsck shows errors like 
> > this:
> >    /foofile 2 4 has wrong sd_blocks 8, has to be 1
> > I've reproduced this 100% on 100 filesystems on two servers.
> 
> Aha, I see.
> Ignore this message for now for directories and symlinks.
> This is because when reiserfs calculates number of blocks file would use,
> in case of no quota, reiserfs code does this and can do this precisely
> (up to 512 bytes), but with quota patches applied, quota code takes
> account of blocks used. And it round everything up to blocksize, hence
> the difference. And reiserfsck uses only 1st variant of the code.
> I am not yet sure on how to deal with the issue.
> Just ignore this message for now.

The quota code can have special checks for symlinks, but the sd_block
accounting is somewhat complex, and I've been hesitant to make it even
more so with the symlink checks.

-chris

