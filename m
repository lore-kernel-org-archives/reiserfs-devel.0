From: Russell Coker <russell@coker.com.au>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Sat, 17 May 2003 21:09:53 +1000
Message-ID: <200305172109.53538.russell@coker.com.au>
References: <200305172030.58775.russell@coker.com.au> <20030517105633.GA20463@namesys.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14136-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030517105633.GA20463@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Sat, 17 May 2003 20:56, Oleg Drokin wrote:
> > When machines crash it seems that there is a risk of a file system
> > corruption, a crash on boot seems reasonably likely to damage the root
> > file system.  My laptop (my main test machine) has had two serious
> > corruptions of the root file system this year which caused kernel
> > crashing on boot.
>
> Well, if you cannot mount root fs and kernel crashes during that process,
> you must boot off some other media because your fsck is still located on
> this root filesytem.
> This is true for any filesystem.

The difference is that with other file systems the kernel code seems to be 
considerably less likely to crash.

The last time I had such a problem with Ext2 was in kernel 1.3.x days.

If the kernel tries to mount a file system and finds it to be extremely 
corrupt and the mount fails then naturally the result will be a panic if the 
file system in question is the root fs.

If the kernel can mount a file system but some directory entries, inodes, or 
other meta-data are corrupt then there is no excuse for crashing.  The files 
or directories should simply be inaccessable.  Ideally the kernel will log a 
message and either re-mount the file-system read-only or panic (in an orderly 
fashion) at the administrator's choice.

Having the kernel just trash system memory because of bad data on disk is a 
bug.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

