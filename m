From: Chris Mason <mason@suse.com>
Subject: Re: Strange errors with 2.4.22 patches (from Chris) and bonnie++
Date: Wed, 03 Dec 2003 14:13:05 -0500
Message-ID: <1070478784.27611.105.camel@tiny.suse.com>
References: <bq8f7u$ufn$1@sea.gmane.org>
	 <1070286549.12807.22.camel@tiny.suse.com>  <bqhisl$7il$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16213-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <bqhisl$7il$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Benecke <jens-unibw@spamfreemail.de>
Cc: reiserfs-list@namesys.com

On Tue, 2003-12-02 at 03:35, Jens Benecke wrote:
> Chris Mason wrote:
> 
> > On Fri, 2003-11-28 at 16:38, Jens Benecke wrote:
> > 
> >> b) bonnie++ on a (previously created) reiserfs partition (with
> >>    mkreiserfs 3.6.6) exited with random "disk full" errors, although
> >>    the disk was never full. This didn't happen before.
> >> (...)
> >> I would appreciate any help. Thank you! :-)
> > 
> > Ugh, the new block allocator isn't properly forcing a commit when an
> > allocation fails, so we don't reclaim blocks deleted in an uncommitted
> > transaction.  I thought this fix got pulled out of the suse kernel when
> > namesys and I pulled out the important bug fixes, but it got missed.
> > 
> > porting.
> 
> Hi Chris,
> 
> so... the worst-case impact on this bug is that reiserfs will report "disk
> full" when you still have some space available. Right? No data loss,
> corruption, or similar Bad Things(tm)?
> 
Correct.  I'll have a fix available today along with a remerge of data
logging and quota against 2.4.23.

> I have two servers here that are supposed to be deployed next week and use
> ReiserFS. I've had some bad issues with MySQL files becoming corrupted
> after a crash in the past so I'd really like to put these into production
> with data-logging patches.
> 
> btw, what are the patches that SuSE uses? IIRC, SuSE ships with data-logging
> enabled, right?
> 

SUSE ships data logging and the xattr patches, along with a few others.

-chris


