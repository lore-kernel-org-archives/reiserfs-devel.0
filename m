From: Chris Mason <mason@suse.com>
Subject: Re: Trying to port data-logging to RH 2.4.18-19.7.x kernel
Date: 31 Jan 2003 09:55:07 -0500
Message-ID: <1044024906.15685.206.camel@tiny.suse.com>
References: <3E3A8B15.80300@ysu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12591-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E3A8B15.80300@ysu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Dalbec <jpdalbec@ysu.edu>
Cc: reiserfs-list@namesys.com

On Fri, 2003-01-31 at 09:41, John Dalbec wrote:
> I'm trying to port Chris's data-logging patches to the Red Hat 
> 2.4.18-19.7.x kernel.  My first effort works fine on my workstation with 
> ReiserFS and NFS, but not on the production server:
> 
> > Jan 31 05:47:28 mail03 kernel: search_by_key called without kernel lock held

This is a debugging check that shows our search_by_key function was
called without first taking the big kernel lock, and the trace below
shows it happened during a call to reiserfs_read_inode2.  So, what you
need to do is put lock_kernel() calls into reiserfs_read_inode2, or more
likely into reiserfs_lookup.

But, as new kernels come out, I don't usually back port data logging
fixes to the old kernels.  So the 2.4.18 data logging code is missing a
number of fixes the later code has.  Which version of the data logging
code are you running on?

-chris


