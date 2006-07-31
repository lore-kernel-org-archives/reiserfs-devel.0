From: Theodore Tso <tytso@mit.edu>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 15:41:28 -0400
Message-ID: <20060731194127.GA13912@thunk.org>
References: <20060731175958.1626513b.reiser4@blinkenlights.ch> <20060731165406.GA8526@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29321-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060731165406.GA8526@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Ulrich <reiser4@blinkenlights.ch>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Mon, Jul 31, 2006 at 06:54:06PM +0200, Matthias Andree wrote:
> > > This looks rather like an education issue rather than a technical limit.
> > 
> > We aren't talking about the same issue: I was asking to do it
> > on-the-fly. Umounting the filesystem, running e2fsck and resize2fs
> > is something different ;-)
> 
> There was stuff by Andreas Dilger, to support "online" resizing of
> mounted ext2 file systems. I never cared to look for this (does it
> support ext3, does it work with current kernels, merge status) since
> offline resizing was always sufficient for me.

With the latest e2fsprogs and 2.6 kernels, the online resizing support
has been merged in, and as long as the filesystem was created with
space reserved for growing the filesystem (which is now the default,
or if the filesystem has the off-line prepration step ext2prepare run
on it), you can run resize2fs on a mounted filesystem and grow an
ext2/3 filesystem on-line.  And yes, you get more inodes as you add
more disk blocks, using the original inode ratio that was established
when the filesystem was created.

						- Ted
