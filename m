From: David Masover <ninja@slaphack.com>
Subject: Re: future r4 maintenance question
Date: Sat, 22 Jul 2006 14:42:17 -0500
Message-ID: <44C27F99.3050109@slaphack.com>
References: <1992401892.20060722173244@wp.pl> <1153594386.6659.172.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29144-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153594386.6659.172.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Benoit <ipso@snappymail.ca>
Cc: Pysiak Satriani <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

Mike Benoit wrote:

> Just like many other applications that support plugins/extensions/addons
> ( like Firefox, Thunderbird, Azureus ) I would be incredibly surprised
> if Reiser4 doesn't spawn a large community of people completely
> independent of Namesys that create plugins from the useless, to the
> amazingly useful for years to come.

You would hope.  The problem is, most of the ideas we have for 
amazing/useless/practical plugins have already been done as specialized 
filesystems in FUSE.  What's more, FUSE doesn't usually require root 
privileges to run, causing some people to do such useless things as 
support for various filesystems already in the kernel (so you can 
loop-mount filesystems without using the loop device or having root 
privileges).

Although, there is one other thing to consider -- NTFS in the kernel has 
stagnated for something like 10 years without write support, while 
userspace tools like ntfsck and resize_ntfs, using libntfs, have 
actually gotten relatively stable at dealing with all kinds of ntfs 
oddities.  For awhile, we had captive-ntfs (also done in FUSE), but more 
recently, someone wrote a FUSE driver for libntfs, making the first 
reasonably stable fully featured read/write NTFS driver for Linux.

It's also reasonably fast, sometimes faster than ext2/3, I'm told.

The big advantage of that is, FUSE is easier to deal with than the 
kernel, and userland daemons can crash, but if something in the kernel 
crashes, there goes your OS.

Also, userland just has more options.  Some FUSE drivers are written in 
Perl, others in Ruby.

I realize there are some things that are really better done in the 
kernel, like crypto/compression support, and Reiser4 will support things 
that FUSE currently doesn't do very well.  But if we're to pull any 
filesystem hackers away from FUSE, we need to provide as good or better 
an API, both in-kernel, and for userspace daemons.
