From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs logging patches udpated
Date: Thu, 25 Mar 2004 15:50:47 -0500
Message-ID: <1080247847.2926.0.camel@watt.suse.com>
References: <1080149399.14737.77.camel@watt.suse.com>
	 <20040324143516.3162cbfe.akpm@osdl.org>
	 <1080168379.14743.124.camel@watt.suse.com>
	 <200403250147.54246.bernd-schubert@web.de> <40625867.4060800@matchmail.com>
	 <1080224062.26677.3.camel@watt.suse.com> <406343F1.2050504@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17480-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <406343F1.2050504@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Bernd Schubert <bernd-schubert@web.de>, reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>

On Thu, 2004-03-25 at 15:41, Mike Fedyk wrote:
> Chris Mason wrote:
> > On Wed, 2004-03-24 at 22:56, Mike Fedyk wrote:
> > 
> > 
> >>And after having the difference of a block level journal (ext3), instead 
> >>of a "virtual" journal(reiserfs, jfs, xfs) explained to me (check the 
> >>ext3-users archives...) -- and how it can save your ass when there are 
> >>hardware problems.  I was convinced and switched everything back to ext3.
> > 
> > 
> > reiserfs does block based logging ;-)
> 
> I stand corrected.
> 
> Thanks Chris, I feel much better about reiserfs now, especially with 
> your ordered/data journaling patches.

One other point, the current patch set only does data=ordered.  I wanted
that fully stabilized before I enabled data=journal.

-chris


