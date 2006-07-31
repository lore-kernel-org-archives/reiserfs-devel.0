From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 18:54:06 +0200
Message-ID: <20060731165406.GA8526@merlin.emma.line.org>
References: <20060731175958.1626513b.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29303-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060731175958.1626513b.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

(resending complete message to the list).

Adrian Ulrich schrieb am 2006-07-31:

> Hello Matthias,
> 
> > This looks rather like an education issue rather than a technical limit.
> 
> We aren't talking about the same issue: I was asking to do it
> on-the-fly. Umounting the filesystem, running e2fsck and resize2fs
> is something different ;-)

There was stuff by Andreas Dilger, to support "online" resizing of
mounted ext2 file systems. I never cared to look for this (does it
support ext3, does it work with current kernels, merge status) since
offline resizing was always sufficient for me.

> A colleague of mine happened to create a ~300gb filesystem and started
> to migrate Mailboxes (Maildir-style format = many small files (1-3kb))
> to the new LUN. At about 70% the filesystem ran out of inodes;

Well - easy to fix, newfs again with proper inode density (perhaps 1 per
2 kB) and redo the migration. Of course you're free to pay for a new
file system if your fellow admin can't be bothered to remember newfs's
-i option.

> > Well, such "silly limitations"... looks like they are mostly hot air
> > spewn by marketroids that need to justify people spending money on their
> > new filesystem.
> 
> Have you ever seen VxFS or WAFL in action?

No I haven't. As long as they are commercial, it's not likely that I
will.

> Great to see that Sun ships a state-of-the-art Filesystem with
> Solaris... I think linux should do the same...

I think reallocating inodes for UFS and/or ext2/ext3 is possible, even
online, but someone needs to write, debug and field-test the code to do
that - possibly based on Andreas Dilger's earlier ext2 online resizing
work.

-- 
Matthias Andree
