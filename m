From: Chris Mason <mason@suse.com>
Subject: Re: udpated data logging available
Date: 22 Jun 2003 22:45:43 -0400
Message-ID: <1056336342.5545.376.camel@tiny.suse.com>
References: <1055764071.24111.650.camel@tiny.suse.com>
	 <1055944613.5545.22.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14656-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1055944613.5545.22.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed, 2003-06-18 at 09:56, Chris Mason wrote:
> Hello again,
> 
> ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21/experimental
> 
> Has two additional patches.  The first is io-stalls-logging-6.diff,
> which is very similar to the io stalling code I've been posting on the
> linux kernel list.  It's unrelated to reiserfs really, and fixes some
> fairness issues at the block device layer.
> 
> The second is reiserfs-jh-1, which changes where the lists live for
> data=ordered and tail buffers.  It allows us to do a few things:

Hello all, I've updated the reiserfs-jh patch, it's now at
reiserfs-jh-2.  The major changes are tested O_DIRECT + data=ordered
support, and a bug fix for an oops under memory pressure.

In general the patch has had a few more hours of testing on it now, and
I'm less worried about it making your computer catch on fire if you give
it a try.

-chris



