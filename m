From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: A bold idea (Re: Carrying Attributes too Far)
Date: Fri, 05 Dec 2003 10:44:14 +0100
Sender: hjclaes@web.de
Message-ID: <1070617453.5605.13.camel@schlappix.schnulli.de>
References: <1065247084.3f7e616c94ec9@webmail.st-andrews.ac.uk>
	 <3FCE3716.8000509@namesys.com>
	 <1070584227.3fcfd1a3d67f4@webmail.st-andrews.ac.uk>
	 <3FD00272.7040607@ninja.dynup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16240-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD00272.7040607@ninja.dynup.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <jedi@ninja.dynup.net>
Cc: reiserfs-list@namesys.com

Am Fr, 2003-12-05 um 04.58 schrieb David Masover:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> lrc1@st-andrews.ac.uk wrote:
> 
>  >Quoting Hans Reiser <reiser@namesys.com>:
>  >
>  >...
>  >
>  >
>  >
>  >>lrc1@st-andrews.ac.uk wrote:
>  >>
>  >>
>  >>
>  >>>Sorry for the delay in replying.
>  >>>
>  >>>Quoting Hubert Chan <hubert@uhoreg.ca>:
>  >>>
>  >>>
>  >
>  >...
>  >
>  >
>  >
>  >>>Yes, it is impossible to hard-link between two files on different 
> volumes
>  >>>(except at mount points) in the Unix filesystem, but it shouldn't 
> be. (More
>  >>>generally, with the necessary permissions it should be possible to 
> make any
>  >>>
>  >>>
>  >>file
>  >>
>  >>
>  >>>the child of any directory via a hard link, except where doing so would
>  >>>
>  >>>
>  >>create a
>  >>
>  >>
>  >>>cycle.)
>  >>>
>  >>>
>  >>>
>  >>This implies that two filesystems can share an identification number
>  >>between them.
>  >>
>  >>
>  >
>  >I would suggest that for every link to a file on a different 
> filesystem, the
>  >linking directory should store both an identifier for the child file's
>  >filesystem and the child file's on-disk inumber on that filesystem.* 
> The reverse
>  >
>  >
>  >
> Here's a crazy idea -- maybe performance can be improved to the point
> where it's actually more efficient to have one large partition to begin
> with?  Back to hda1 is /boot, hda2 is /, and hda3 is swap?
> 
> That gets rid of the hardlink problem, and also the problem of making
> decisions about partitioning.  Other features of Reiser4 like plugins
> eliminate any need that might arise from things like Cryptoloop.  In
> fact, maybe other filesystems will be implemented as Reiser4 plugins to
> a .img file, but that's probably going a bit far.
> 
If you want to have a flexible size for a filesystem, the are
possiblities with LVM (or others) which gives you also the possibility
to create a raid - which you normally want on such filesystems.
Hardlinks between different partitions gives another problem: What is,
if the other partition is not available (unmounted or crashed)? What is,
if the other partition is an NFS-mounted partition with all the
possiblities that can happen?
 
> I agree that hardlinking directories should be allowed, and I think it's
> worth it to check whether it creates a loop, unless rm can be modified
I think hard linking directories is a very good idea. The should be a
count for the number of hard links and it should be handled like with
normal files. I directly have an application with would have a great
benefit of this kind of hard linked directories, but up to now they are
not available in linux :-(


> to simply rm the directory, and the filesystem (and maybe VFS) would be
> modified to have directories have link counts that don't include . or
> .., so when a directory is to be deleted, the system does its own manual
> deletion of each of the files within it.  Then, if I type 'rm loop' and
> it removes the link of 'loop/loop' to 'loop', there are now no more
> links to 'loop' and it gets destroyed.
> 

Heinz-Josef Claes                     hjclaes@web.de
project: http://sourceforge.net/projects/storebackup
      -> snapshot-like backup to another disk



