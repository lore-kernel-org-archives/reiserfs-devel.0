From: John Dalbec <jpdalbec@ysu.edu>
Subject: Re: Trying to port data-logging to RH 2.4.18-19.7.x kernel
Date: Wed, 05 Feb 2003 09:24:34 -0500
Message-ID: <3E411EA2.8000306@ysu.edu>
References: <3E3A8B15.80300@ysu.edu>	 <1044024906.15685.206.camel@tiny.suse.com>  <3E3A99A1.2010600@ysu.edu>	 <1044029165.15685.226.camel@tiny.suse.com>  <3E3AEA73.1090607@ysu.edu> <1044290509.15685.391.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12653-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Chris Mason wrote:
> So your two basic choices are adding the BKL to reiserfs_read_inode2, or
> going into the nfsd source and putting them around the iget4 call.  You
> might want to double check to see if their source had the BKL in
> reiserfs_read_inode2 before you started the data logging port.

It did not.

> 
> If not, you should be able to reproduce the oops on an unmodified redhat
> kernel (compiled with SMP on), and I'd appreciate it if you could send
> them a bug report as well.

I cannot reproduce the oops on an unmodified Red Hat kernel because they 
don't call reiserfs_check_lock_depth in search_by_key.  That was added 
by your data-logging patch.

> 
> -chris
> 
> 
> 



