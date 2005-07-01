From: Ric Wheeler <ric@emc.com>
Subject: Re: XFS corruption during power-blackout
Date: Fri, 01 Jul 2005 08:53:40 -0400
Message-ID: <42C53CD4.4000205@emc.com>
References: <OFBC8F19C9.0A8B9C84-ON88257030.006EB89B-88257030.00725493@us.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <OFBC8F19C9.0A8B9C84-ON88257030.006EB89B-88257030.00725493@us.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bryan Henderson <hbryan@us.ibm.com>
Cc: Chris Wedgwood <cw@f00f.org>, Al Boldi <a1426z@gawab.com>, linux-fsdevel@vger.kernel.org, linux-xfs@oss.sgi.com, Steve Lord <lord@xfs.org>, 'Nathan Scott' <nathans@sgi.com>, reiserfs-list@namesys.com

Bryan Henderson wrote:

>
>It's because of the words before that:  "everything that was buffered when 
>sync()
>started is hardened before the next sync() returns."  The point is that 
>the second sync() is the one that waits (it actually waits for the 
>previous one to finish before it starts).  By the way, I'm not talking 
>about Linux at this point.  I'm talking about so-called POSIX systems in 
>general.
>
>But it does sound like Linux has a pretty firm philosophy of synchronous 
>sync (I see it documented in an old man page), so I guess it's OK to rely 
>on it.
>
>There are scenarios where you'd rather not have a process tied up while 
>syncing takes place.  Stepping back, I would guess the primary original 
>purpose of sync() was to allow you to make a sync daemon.  Early Unix 
>systems did not have in-kernel safety clean timers.  A user space process 
>did that.
>
>--
>Bryan Henderson                     IBM Almaden Research Center
>San Jose CA                         Filesystems
>  
>
We have been playing around with various sync techniques that allow you 
to get good data safety for a large batch of files (think of a restore 
of a file system or a migration of lots of files from one server to 
another).  You can always restart a restore if the box goes down in the 
middle, but once you are done, you want a hard promise that all files 
are safely on the disk platter.

Using system level sync() has all  of the disadvantages that you mention 
along with the lack of a per-file system barrier flush.

You can try to hack in a flush by issuing an fsync() call on one file 
per file system after the sync() completes, but whether or not the file 
system issues a barrier operation is file system dependent.

Doing an fsync() per file is slow but safe. Writing the files without 
syncing and then reopening and fsync()'ing each one in  reasonable batch 
size is much faster, but still kludgey.

An attractive, but as far as I can see missing feature, would be the 
ability to do a file system specific sync() command.  Another option 
would be a batched AIO like fsync() with a bit vector of descriptors to 
sync.  Not surprising, but the best performance is reached when you let 
the writing phase working asynchronously and let the underlying file 
system do its thing and wrap it up with a group cache to disk sync and a 
single disk write cache invalidate (barrier) at the end.



