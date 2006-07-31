From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Tue, 1 Aug 2006 00:53:48 +0200
Message-ID: <20060731225348.GB16440@merlin.emma.line.org>
References: <20060731175958.1626513b.reiser4@blinkenlights.ch> <20060731165406.GA8526@merlin.emma.line.org> <20060731194127.GA13912@thunk.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29345-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060731194127.GA13912@thunk.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Tso <tytso@mit.edu>, Adrian Ulrich <reiser4@blinkenlights.ch>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Theodore Tso schrieb am 2006-07-31:

> With the latest e2fsprogs and 2.6 kernels, the online resizing support
> has been merged in, and as long as the filesystem was created with
> space reserved for growing the filesystem (which is now the default,
> or if the filesystem has the off-line prepration step ext2prepare run
> on it), you can run resize2fs on a mounted filesystem and grow an
> ext2/3 filesystem on-line.  And yes, you get more inodes as you add
> more disk blocks, using the original inode ratio that was established
> when the filesystem was created.

That's cool.

The interesting part for some people would be, if I read past postings
correctly, to change the inode ratio in an existing (perhaps even
mounted) file system without losing data.

(I'm not sure how many blocks have to be moved and/or changed for that
purpose, because I know too little about the on-disk ext2 layout, but
since block relocating is already in place for shrink support in the
offline resizer, some of the work appears to be done already.)

-- 
Matthias Andree
