From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfs tails and disk space
Date: Fri, 20 Jan 2006 01:00:57 +0300
Message-ID: <200601200100.58038.vitaly@namesys.com>
References: <20060117181548.GB11010@untroubled.org> <200601182134.49888.vitaly@namesys.com> <20060119195349.GC11010@untroubled.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27804-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060119195349.GC11010@untroubled.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>

On Thursday 19 January 2006 22:53, Bruce Guenter wrote:
> On Wed, Jan 18, 2006 at 09:34:49PM +0300, Vitaly Fertman wrote:
> > thank you for the report, the attached patch should fix 
> > the broken mount options. please try it.
> 
> It does indeed fix the problem.  What other mount options would have
> been affected by this problem?  

it does not seem to brake anything else.

> In what version of the kernel was this 
> problem introduced?

2.6.13.

-- 
Vitaly
