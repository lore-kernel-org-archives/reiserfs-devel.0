From: Chris Mason <mason@suse.com>
Subject: Re: Strange errors with 2.4.22 patches (from Chris) and bonnie++
Date: Thu, 04 Dec 2003 11:28:43 -0500
Message-ID: <1070555322.27612.181.camel@tiny.suse.com>
References: <bq8f7u$ufn$1@sea.gmane.org>
	 <1070286549.12807.22.camel@tiny.suse.com> <bqhisl$7il$1@sea.gmane.org>
	 <1070478784.27611.105.camel@tiny.suse.com>  <bqna7g$8gg$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16226-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <bqna7g$8gg$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Benecke <jens-unibw@spamfreemail.de>
Cc: reiserfs-list@namesys.com

On Thu, 2003-12-04 at 07:44, Jens Benecke wrote:
> Chris Mason wrote:
> 
> >> so... the worst-case impact on this bug is that reiserfs will report
> >> "disk full" when you still have some space available. Right? No data
> >> loss, corruption, or similar Bad Things(tm)?
> >> 
> > Correct.  I'll have a fix available today along with a remerge of data
> > logging and quota against 2.4.23.

The -ENOSPC fix is attached, 2.6 should have the same bug (it was
introduced with the new allocator) so I'm porting the fix there. 
Basically after a data block allocation fails, we need to trigger and
wait on a commit so we can reclaim any blocks freed in transactions that
have not yet been comitted.

>  
> >> btw, what are the patches that SuSE uses? IIRC, SuSE ships with
> >> data-logging enabled, right?
> > SUSE ships data logging and the xattr patches, along with a few others.
> 
> What patches exactly? 

Well there are a few basic categories:

Major featuers -- data logging, xattrs/acls
Backports of fixes
Support for new generic code - aio, laptop mode, barriers, o_direct
minor performance tweaks

Any significant feature or big performance tweak ends up posted here,
the minor stuff I tend to try out in the suse qa/testing process to see
if it is worth maintaining over the long haul.

> Are they available in public to be applied to a vanilla kernel?
> 

The nosrc src kernel rpms (perhaps the worst named thing on the planet)
have the individual patch files.  The suse kernel has quite a few
patches, and most of the changes I don't upload to pub/people/mason are
dependent in some large way on other patches in the suse kernel.

-chris



