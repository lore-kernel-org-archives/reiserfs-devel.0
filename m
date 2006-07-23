From: Sander Sweers <sander.sweers@gmail.com>
Subject: Re: future r4 maintenance question
Date: Sun, 23 Jul 2006 13:11:03 +0200
Message-ID: <1153653064.7877.13.camel@localhost>
References: <1992401892.20060722173244@wp.pl>
	 <1153594386.6659.172.camel@ipso.snappymail.ca>
	 <44C27F99.3050109@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C27F99.3050109@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Mike Benoit <ipso@snappymail.ca>, Pysiak Satriani <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

On Sat, 2006-07-22 at 14:42 -0500, David Masover wrote:
> Mike Benoit wrote:
> 
[...]
> 
> You would hope.  The problem is, most of the ideas we have for 
> amazing/useless/practical plugins have already been done as specialized 
> filesystems in FUSE.  What's more, FUSE doesn't usually require root 
> privileges to run, causing some people to do such useless things as 
> support for various filesystems already in the kernel (so you can 
> loop-mount filesystems without using the loop device or having root 
> privileges).
> 
> Although, there is one other thing to consider -- NTFS in the kernel has 
> stagnated for something like 10 years without write support, while 
> userspace tools like ntfsck and resize_ntfs, using libntfs, have 
> actually gotten relatively stable at dealing with all kinds of ntfs 
> oddities.  For awhile, we had captive-ntfs (also done in FUSE), but more 
> recently, someone wrote a FUSE driver for libntfs, making the first 
> reasonably stable fully featured read/write NTFS driver for Linux.
> 
> It's also reasonably fast, sometimes faster than ext2/3, I'm told.

I am using the official libntfs fuse module but it is not all that fast
if you compare how much more cpu power is needed. And even then it is
NOT faster then ext2/3. I am copying a couple of 650mb iso's and I have
100% cpu utilisation and it still takes tens of minutes to copy just 1.

Fuse is nice for things like gmailfs or beaglefs but if you really want
performance, kernelspace imho is the only place to implement a
filesystems.

Greets
Sander

