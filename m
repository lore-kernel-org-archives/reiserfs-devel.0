From: Hans Reiser <reiser@namesys.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Tue, 24 Dec 2002 12:36:06 +0300
Message-ID: <3E082A86.8050501@namesys.com>
References: <3E06F360.7000708@namesys.com> <002001c2aaa1$08650550$0200000a@ringo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12237-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <002001c2aaa1$08650550$0200000a@ringo>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Haynes <chris@harvington.org.uk>
Cc: ReiserFS <reiserfs-list@namesys.com>, mason <mason@namesys.com>

Chris Haynes, maybe as we bring atomic transactions into use we should 
work with you to see if they address your needs.

Chris Mason, maybe you might want to comment on what he is doing with 
threads and how it interacts with V3 journal commits?  (I bet you are on 
vacation though?)

Hans


Chris Haynes wrote:

>Hans,
>
>Thanks for asking!
>
>I'm about to deploy an on-line transaction-based service.. All
>service-specific software is in 1000+ Java classes. The OS is SuSE
>7.3, and Java version 1.4
>
>The heavist uses of the file store are:
>
>During development:
>+ javadoc
>
>During service deployment / update:
>+ rsync
>+ When using a tripwire-like Java program which checks the SHA digest
>of all deployable files against zipped JARs
>
>During production operation:
>+ atomic, synchronized writes to multiple files (typically 3 - 4 files
>in different directories, the first is the creation of a new 4 kb
>file, others are usually updates of existing files - growing typically
>1kb per update). This files system is mounted on a RAID-1 pair.
>+ rsync
>+ Successive reading of all files in a directory sub-tree (up to 10M
>files)
>in filestore-defined order (i.e. the program makes no demands or
>assumptions about the order - it uses the order supplied by Java's
>File.files()).
>
>
>The greatest performance concern I have is with the file writes. As
>these are atomic transactions, I use a separate thread for each file's
>write (to give the kernel's escalator a chance to work), and require
>that the write operations be individually hardware-synchronized  using
>Java's FileDescriptor.sync() method. I then use a counter to detect
>when all threads have reported that their files have been written -
>this indicating successful commitment of the transaction.
>
>I handle read-and write-locking in the application.
>
>Usually, there are no lock conflicts, so there can be many concurrent
>transaction commitments. I use a thread pool of  50 threads to handle
>the individual file writes (the 50 being a guess at the likely point
>of diminishing returns).
>
>My expectation/hope is that, so long as there are enough threads
>available in this pool, all transactions will be completed within one
>disk rotation period(regardless of the number of concurrent
>transactions or number of files per transaction and the fact that I'm
>using software RAID-1). I've not yet been able to validate this
>(theoretically or practically).
>
>I would *really* like  to be able to group all the file writes for a
>transaction  into a single logical  API call and have the kernel/file
>system report successful completion of all data and metadata aspects
>of the transaction using a single application thread.
>
>HTH
>
>Chris Haynes
>
>
>
>
>  
>


