From: Quinn Harris <lists@qutek.net>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Mon, 18 Sep 2006 16:32:30 -0600
Message-ID: <200609181632.33930.lists@qutek.net>
References: <200609131451.42474.lists@qutek.net> <200609151520.39826.lists@qutek.net> <op.tf2ibi00cigqcu@apollo13>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29932-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.tf2ibi00cigqcu@apollo13>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 18 September 2006 03:36, PFC wrote:
> 	Windows already does this.
I am familiar with this, it was in part the inspiration for this idea.

>
> 	It has a service which monitors filesystem usage, and writes data to disk
> ; the defragmenter uses this data to lay the files on disk so that boot is
> very fast.
Yep, my tests suggest for Ubuntu boot that typical improvements will be on the 
order of 5-15s (substantially dependent on how fragmented the file system is 
and complexity of boot).  The system needs about 70MB of data to boot.  
Typical fragmentation on a fresh filesystem will cause 2-3x slowdown over 
perfect packing.  70MB at 20MB/s is 2.5s so our gain would be 5s.  The 
improvement wasn't as good as I was originally expecting but still very 
measurable.

I am not sure this is enough of a win to justify integrating this idea in a 
major distro.  But without a 

>
> 	However think it optimizes only the time to the login screen ; so windows
> boot is extremely fast ; of course, once you have logged in, you have to
> wait forever until all the crap system tray apps launch themselves and eat
> all your RAM...
In practice what I am doing improves system responsiveness.  This is because I 
am measuring all file access to an idle state then reallocating and 
preloading all that data.  Gnome still has a bit of data to page in after the 
menus are available (like menu icons)

>
> 	My own repacker is very simple, and it handles any filesystem !
>
> - boot from Kanotix CD
> - tar cv /mnt/my_disk | lzop -c | ssh -c blowfish other_machine "cat
>
> >backup.tar.lzo"
>
> - umount, mkfs, mount
> - ssh -c blowfish other_machine "cat backup.tar.lzo" | lzop -cd | tar xv
>
> 	You can also use an USB disk, or other disks in the machine. The effects
> are pretty visible.
> 	I do the first part often to make a full disk backup to a USB harddrive.
>
> 	Anyway, IMHO the best way to have a super responsive system would be :
>
Are you essentially copying all the files off a file system, recreating a 
fresh fs and writing them back?  This allows the file system to reconstruct 
the files in a good defraged order.  Problem is it takes along time and takes 
the system down (or at least the fs).  The Reiser4 repacker would have the 
same effect but without any downtime.  Windows defrag does the same.

This doesn't place files used at boot right next to each other on disk like 
what I am doing, but both our approaches reduces fragmentation.

My script can do its thing in about 10s (for just one thing like better 
bootup) and without disrupting the running system.  (Actually I have seen it 
break some things, but I expect this can be mitigated by avoiding repacking 
open files)

> Have a daemon which monitors which files, or parts of files, are read, and
> in what context :
>
> - boot to fully loaded KDE/Gnome
> - launching an application
>
> You already have this apparently...
>
> The repacker would then use this information to lay files on disk (just
> like windows does).
The python script I am using to measure fragmentation shows that what I am 
doing results in packing that is within 1% of idea in terms of disk read 
time.  This only works well on a fresh filesystem with large contiguous 
unallocated space but not so well on a heavily fragmented fs.

This suggests for reiser (maybe other fs), a special kernel or defrag tool for 
this type of reallocation is unnecessary.


>
> Then, the daemon would trigger readahead, when booting or detecting the
> launch of an application, and read everything in (which would be a nice
> sequential read)...

I hope in a good time to write a python script that allows the user to do 
something like "reallocate.py oowriter".  It will profile Open Office writer 
on startup using inotify to generating a readahead log.  Then reallocate with 
the copy trick.  If the command is run again, it will readahead the files for 
oowriter and launch the app.  I think this could double cold start times.  
Part from just the readahead and part from the reallocation.

It is evident that the inotify file monitoring (using Ubuntu readahead-watch) 
is not catching everything.  If I readahead for oowriter then lanuch it, it 
takes 6-7s.  But it takes 3.6 to start after immediately closing it.  In 
principal, I would think the readahead should be able to load all files 
oowriter needs into cache getting the 3.6s time after readahead.

Also this doesn't monitor access patterns within a file.  How much of the data 
in a file is really needed?  I am not sure I would be able to pack only parts 
of files, but I might with sparse files.


