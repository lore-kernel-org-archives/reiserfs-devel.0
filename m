From: Chris Mason <mason@suse.com>
Subject: Re: Trying to port data-logging to RH 2.4.18-19.7.x kernel
Date: 05 Feb 2003 11:00:38 -0500
Message-ID: <1044460837.15684.876.camel@tiny.suse.com>
References: <3E3A8B15.80300@ysu.edu>
	 <1044024906.15685.206.camel@tiny.suse.com>  <3E3A99A1.2010600@ysu.edu>
	 <1044029165.15685.226.camel@tiny.suse.com>  <3E3AEA73.1090607@ysu.edu>
	 <1044290509.15685.391.camel@tiny.suse.com>  <3E411EA2.8000306@ysu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12654-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E411EA2.8000306@ysu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Dalbec <jpdalbec@ysu.edu>
Cc: reiserfs-list@namesys.com

On Wed, 2003-02-05 at 09:24, John Dalbec wrote:

> > 
> > If not, you should be able to reproduce the oops on an unmodified redhat
> > kernel (compiled with SMP on), and I'd appreciate it if you could send
> > them a bug report as well.
> 
> I cannot reproduce the oops on an unmodified Red Hat kernel because they 
> don't call reiserfs_check_lock_depth in search_by_key.  That was added 
> by your data-logging patch.
> 

Heh, I added a bunch of those during the 2.4.0-test porting, I guess I
hit an odd bug during data logging coding and thought I needed a few
more.

Even though the check is only introduced in the data logging code, the
non-data logging code needs the BKL in search_by_key all the time.  So,
if you could please forward the details to redhat I'd appreciate it.

-chris


