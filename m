From: Chris Mason <mason@suse.com>
Subject: Re: what do you do that stresses your filesystem?
Date: 06 Jan 2003 10:14:30 -0500
Message-ID: <1041866070.16279.47.camel@tiny.suse.com>
References: <3E06F360.7000708@namesys.com>
	 <002001c2aaa1$08650550$0200000a@ringo>  <3E082A86.8050501@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12285-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E082A86.8050501@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Haynes <chris@harvington.org.uk>, ReiserFS <reiserfs-list@namesys.com>

On Tue, 2002-12-24 at 04:36, Hans Reiser wrote:

> Chris Haynes wrote:
> >
> >I'm about to deploy an on-line transaction-based service.. All
> >service-specific software is in 1000+ Java classes. The OS is SuSE
> >7.3, and Java version 1.4

You'll get better performance from the suse update kernels (or anything
with the data logging patches.

> >
> >The heavist uses of the file store are:
> >
> >During development:
> >+ javadoc
> >
> >During service deployment / update:
> >+ rsync
> >+ When using a tripwire-like Java program which checks the SHA digest
> >of all deployable files against zipped JARs
> >
> >During production operation:
> >+ atomic, synchronized writes to multiple files (typically 3 - 4 files
> >in different directories, the first is the creation of a new 4 kb
> >file, others are usually updates of existing files - growing typically
> >1kb per update). This files system is mounted on a RAID-1 pair.

Is this the only type of write being done?  If so, mounting with
data=journal will give you a pretty big boost.  Regardless of which data
mode you use, the io pattern you want to try for looks like this:

write(file1)
write(file2)
write(fileX) ...
fsync(fileX)
fsync(fileX-1) ...
fsync(file1)

This allows for the biggest transaction before the fsync comes in and
forces a commit.  By doing an fsync on the newest file first, you
greatly increase the chances that all the transactions for all the old
files will be committed by the fsync(fileX).  When this happens, the
rest of the fsyncs just trigger writes on the data blocks.

If you are using data=journal, the rest of the fsyncs become noops,
since the fsync(fileX) will also commit all the data blocks of all the
previous writes.

If there are other types of writes going on (large non-synchronous
writes), data=journal will hurt performance because it involves writing
all the data blocks twice.  In this case your best bet will be a
dedicated logging device.

If the synchronous writes for a single transaction are the only writes
to the FS, and you are doing writes to many different files, you can
also just do all the writes/creates, and then run sync().

This will get all the data block writes scheduled at once, and then
write to the log.

> >+ rsync
> >+ Successive reading of all files in a directory sub-tree (up to 10M
> >files)
> >in filestore-defined order (i.e. the program makes no demands or
> >assumptions about the order - it uses the order supplied by Java's
> >File.files()).
> >
> >
> >The greatest performance concern I have is with the file writes. As
> >these are atomic transactions, I use a separate thread for each file's
> >write (to give the kernel's escalator a chance to work), and require
> >that the write operations be individually hardware-synchronized  using
> >Java's FileDescriptor.sync() method. I then use a counter to detect
> >when all threads have reported that their files have been written -
> >this indicating successful commitment of the transaction.
> >
> >I handle read-and write-locking in the application.
> >
> >Usually, there are no lock conflicts, so there can be many concurrent
> >transaction commitments. I use a thread pool of  50 threads to handle
> >the individual file writes (the 50 being a guess at the likely point
> >of diminishing returns).
> >
> >My expectation/hope is that, so long as there are enough threads
> >available in this pool, all transactions will be completed within one
> >disk rotation period(regardless of the number of concurrent
> >transactions or number of files per transaction and the fact that I'm
> >using software RAID-1). I've not yet been able to validate this
> >(theoretically or practically).

It won't happen, you've got a chance in data=journal mode, but otherwise
there will be seeks to and from the log area as you write and wait on
the data blocks and the log blocks.

> >
> >I would *really* like  to be able to group all the file writes for a
> >transaction  into a single logical  API call and have the kernel/file
> >system report successful completion of all data and metadata aspects
> >of the transaction using a single application thread.
> >

The kernel doesn't have this right now, but the aio code in 2.5.x is
close.  

-chris


