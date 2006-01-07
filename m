From: David Masover <ninja@slaphack.com>
Subject: Re: Space lost?
Date: Sat, 07 Jan 2006 04:07:23 -0600
Message-ID: <43BF92DB.5010409@slaphack.com>
References: <43BF4857.8070901@eriberto.pro.br> <3405.66.131.16.74.1136610974.squirrel@x2a.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3405.66.131.16.74.1136610974.squirrel@x2a.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Bastien-Filiatrault <joe@x2a.org>
Cc: Eriberto <eriberto@eriberto.pro.br>, reiserfs-list@namesys.com

Jonathan Bastien-Filiatrault wrote:
> Eriberto said:
> 
>>Hello!
>>
>>I have a partition with 19.535.040 KB (fdisk -l). However after a
>>ReiserFS formatting df -k command shows 19.534.436 KB (total space). The
>>difference is 604 KB. Why the amount of  space decreased after formatting?
>>
>>Thanks!
>>
>>
>>
> 
> Any filesystem has sturctural overhead. For example, by default, ReiserFS
> has a 32MB journal and other data structures. These data structures are
> the ones that "take away" space from you. These data structures are
> mandatory to any filesystem, ReiserFS is known for having very little
> overhead compared to other file systems.

In other words, those 604 KB are things like the magic number, so
utilities like "file" can guess what FS it is, or what type of file if
it's an image, and mostly things like the journal and the amount of
space it takes to represent one empty folder.

And btw, if you put exactly 100KB on your disk, split into 1KB files,
you're probably going to notice your disk usage going up by more than
exactly 100KB.  How much it goes up by is going to be roughly equivalent
to how much space it takes to store the name of each 1KB file.

Here's another interesting experiment:  Take a directory tree of lots of
small files.  Gentoo's /usr/portage is a good example.  Copy it to ext3,
XFS, reiserfs, and Reiser4, then run "du -s" on each copy.  I can almost
guarentee that Reiser4's is going to be significantly smaller, enough to
show up on even "du -sh".  Smaller by tens of megabytes, at least.

ReiserFS is definitely bigger than Reiser4, but if you have tail packing
turned on, it may still be significantly smaller than XFS or ext3.

In fact, Reiser4 reserves an aggressive 5% of the disk, so out of your
19,535,040 KB, you'd have 976,752 KB reserved -- that's almost a full
gigabyte out of a 20 gig drive.  And yet, if you used that drive for
small text files, you'd probably find that you saved almost that much
space anyway, if not more, by using Reiser4 instead of ext3.

So you really shouldn't complain about your lost 604 KB.
