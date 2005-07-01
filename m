From: Bryan Henderson <hbryan@us.ibm.com>
Subject: Re: XFS corruption during power-blackout
Date: Fri, 1 Jul 2005 11:24:20 -0700
Message-ID: <OF23DC8299.F6F2200B-ON88257031.005B3A9B-88257031.00650D8F@us.ibm.com>
References: <42C53CD4.4000205@emc.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <42C53CD4.4000205@emc.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ric Wheeler <ric@emc.com>
Cc: Al Boldi <a1426z@gawab.com>, Chris Wedgwood <cw@f00f.org>, linux-fsdevel@vger.kernel.org, linux-xfs@oss.sgi.com, Steve Lord <lord@xfs.org>, 'Nathan Scott' <nathans@sgi.com>, reiserfs-list@namesys.com

>We have been playing around with various sync techniques that allow you 
>to get good data safety for a large batch of files (think of a restore 
>of a file system or a migration of lots of files from one server to 
>another).  You can always restart a restore if the box goes down in the 
>middle, but once you are done, you want a hard promise that all files 
>are safely on the disk platter.
>
>Using system level sync() has all  of the disadvantages that you mention 
>along with the lack of a per-file system barrier flush.
>
>You can try to hack in a flush by issuing an fsync() call on one file 
>per file system after the sync() completes, but whether or not the file 
>system issues a barrier operation is file system dependent.
>
>Doing an fsync() per file is slow but safe. Writing the files without 
>syncing and then reopening and fsync()'ing each one in  reasonable batch 
>size is much faster, but still kludgey.
>
>An attractive, but as far as I can see missing feature, would be the 
>ability to do a file system specific sync() command.  Another option
>would be a batched AIO like fsync() with a bit vector of descriptors to 
>sync.  Not surprising, but the best performance is reached when you let 
>the writing phase working asynchronously and let the underlying file 
>system do its thing and wrap it up with a group cache to disk sync and a 
>single disk write cache invalidate (barrier) at the end.

Hear, hear to all of that.  sync() has gotten to be really old-fashioned.

You can sync an invidual filesystem image if the filesystem is on a block 
device or a suitable simulation of one, by opening a block device special 
file for the device and doing fsync().

What you'd really like is to fsync a multi-file unit of work (transaction) 
-- and not just among open files.  You'd like to open, write, and close 
1000 files in a single transaction and then commit that transaction, with 
no syncing due to timers in the meantime.  If you're really greedy, you'd 
also ask for complete rollback if the system fails before the commit.

I've always found it awkward that any user can do a sync(), when it's a 
system-wide control operation.

In the Storage Tank Linux filesystem driver I designed, you could turn off 
safety cleaning with a mount option (and could mount the filesystem 
multiple times in order to work with multiple options).  You could also 
turn it off for a particular file with a "temporary file" attribute, and a 
file which was not linked to a directory was also understood to be 
temporary.  Safety cleaning is what sync() and the internal timers do.

Safety cleaning doesn't make much sense unless it goes down inside the 
storage device as well.

--
Bryan Henderson                     IBM Almaden Research Center
San Jose CA                         Filesystems

