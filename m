From: Chris Mason <mason@suse.com>
Subject: Re: Quicker alternative to "find /"?
Date: Mon, 16 Aug 2004 11:49:44 -0400
Message-ID: <1092671383.12138.215.camel@watt.suse.com>
References: <20040815231640.3c926886.felix.klee.reiserfs@gmx.net>
	 <1092660765.28417.4.camel@leto.cs.pocnet.net>
	 <1092661560.12138.24.camel@watt.suse.com>
	 <1092670430.19943.6.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20337-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1092670430.19943.6.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christophe Saout <christophe@saout.de>
Cc: "Felix E. Klee" <felix.klee.reiserfs@gmx.net>, reiserfs-list@namesys.com

On Mon, 2004-08-16 at 11:33, Christophe Saout wrote:
> Am Montag, den 16.08.2004, 09:06 -0400 schrieb Chris Mason:
> 
> > This gets tricky quickly.  Many threads reading many different
> > directories at once will introduce a lot of seeks, since the directories
> > are likely to be far apart on disk.  It is far better for the filesystem
> > to realize a sequential scan of the directory is in progress and do
> > smarter readahead based on that.  
> 
> You are right. I just tried and the result was catastrophic (on ReiserFS
> 3). Probably because the other threads running concurrently make
> readahead unusable (VM decides to drop it before it is used) or
> something...?
> 
It probably isn't related to the VM, but only to disk layout.  For ext2,
the directories are in the page cache, so the generic VM based readahead
comes into the game.  For reiserfs v3, the only readahead is done during
the readdir call, and that is only in 2.6.8 or higher.

> On the contrary it works very well for reading the contents of a lot of
> files.
> 

This will depend on the files and the disk as well.  In general what the
linux filesystems try to do is store files in the same directory close
to each other.  This means it is pretty likely the disk readahead will
have the data blocks for file 2 in cache once you're done reading file
1.  It also means that if you try to concurrently read files in a
different directory, you're probably seeking.

If your data is on a striped disk, and you're reading a lot of small
files (smaller then the stripe size), it is possible that multiple
threads will help significantly.  In this case you wouldn't want more
then 1 thread per spindle.

-chris




