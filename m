From: Chris Mason <mason@suse.com>
Subject: Re: Trying to port data-logging to RH 2.4.18-19.7.x kernel
Date: 03 Feb 2003 11:41:49 -0500
Message-ID: <1044290509.15685.391.camel@tiny.suse.com>
References: <3E3A8B15.80300@ysu.edu>
	 <1044024906.15685.206.camel@tiny.suse.com>  <3E3A99A1.2010600@ysu.edu>
	 <1044029165.15685.226.camel@tiny.suse.com>  <3E3AEA73.1090607@ysu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E3AEA73.1090607@ysu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Dalbec <jpdalbec@ysu.edu>
Cc: reiserfs-list@namesys.com

On Fri, 2003-01-31 at 16:28, John Dalbec wrote:

> The immediate caller is the "ReiserFS specific hack" in 
> fs/inode.c:get_inode signed <mason@suse.com>.  Is the BKL supposed to be 
> held when get_inode is called?  

Traditionally, the BKL is supposed to be held when iget or iget4 is
called.  RedHat might have patches that do away with that and simply
missed reiserfs, but it is more likely they have a patch to reduce BKL
use in NFS that missed the iget4 case.

So your two basic choices are adding the BKL to reiserfs_read_inode2, or
going into the nfsd source and putting them around the iget4 call.  You
might want to double check to see if their source had the BKL in
reiserfs_read_inode2 before you started the data logging port.   

If not, you should be able to reproduce the oops on an unmodified redhat
kernel (compiled with SMP on), and I'd appreciate it if you could send
them a bug report as well.

-chris


