From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: Status of fsync() wrt mail servers
Date: Thu, 11 Sep 2003 14:33:25 +0200
Message-ID: <m3ekynbj3e.fsf@merlin.emma.line.org>
References: <20030910002953.C14172@unbeatenpath.net>
	<20030910105102.GA535@rahul.net>
	<1063192474.18154.355.camel@tiny.suse.com>
	<20030910114103.GA26767@rahul.net>
	<1063197048.18155.357.camel@tiny.suse.com>
	<20030910101821.A15923@unbeatenpath.net>
	<20030910213244.GD1461@matchmail.com>
	<20030910173343.A16677@unbeatenpath.net>
	<20030910234927.GE1461@matchmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15628-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030910234927.GE1461@matchmail.com> (Mike Fedyk's message of
 "Wed, 10 Sep 2003 16:49:27 -0700")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: reiserfs-list@namesys.com

Mike Fedyk <mfedyk@matchmail.com> writes:

> During the processing of a message the MTA will do several renames, moves,
> and other calls that manipulate its directory entry. 

Different MTAs implement their queue differently. Postfix doesn't rename
the file into place, unlike qmail, it just drops a file, fsync()s it and
that's it.

> Without dirsync, it is up to the filesystem and memory pressure to
> determine when the meta-data from those calls actually makes it to the
> disk.  (5 seconds with ext3 and 30 seconds with reiserfs3).  With
> dirsync, once the directory operation call is made, it will not return
> to the userspace program until the meta-data has made it the disk
> (because during the rename and directory operation calls, there is no
> data only meta-data which is filesystem accounting data (directory
> entries and etc.))

Does reiserfs3.6 support dirsync? I thought it was ext3-specific until
now.

Please take care to distinguish (file) meta data from directory data.

> So nothing about the effect of fsync() was mentioned, only that with -o sync
> it was pointless, since each write() call was already syncronous, and
> without -o sync, you would have the data, but not nessicarily know what its
> delivery state is (if the crash is at the wrong time).

Basically, what we know is that with Linux 2.4, ext3fs, reiserfs and XFS
will flush all pending transactions (per file system) that were
requested prior to a synchronous operation (fsync, sync, umount, ...)
out to disk.

This can heftily bite your back if you're running your MTA's queue on a
large file system that has other sustained write load (logging, data
bases, ...).

I recently helped one qmail user debug this; the symptom was that the
first mail in a burst of mails took 2 seconds to queue, subsequent mails
were queued much quicker (70 ms). He was using ext3fs, and had one huge
/ (root) file system and so the "synch the whole file system" behaviour
made his qmail-queue synch *all* his dirty blocks to disk...

-- 
Matthias Andree

Encrypt your mail: my GnuPG key ID is 0x052E7D95
