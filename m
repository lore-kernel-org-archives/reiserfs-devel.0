From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 23:40:50 +0400
Message-ID: <200308062340.50625.vitaly@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <3F314BE8.50300@suse.com> <20030806212107.A3975@bitwizard.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15202-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030806212107.A3975@bitwizard.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, Jeff Mahoney <jeffm@suse.com>
Cc: Hans Reiser <reiser@namesys.com>, Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Wednesday 06 August 2003 23:21, Rogier Wolff wrote:
> On Wed, Aug 06, 2003 at 02:41:44PM -0400, Jeff Mahoney wrote:
> > What is the workload that is producing the horrible slowdowns?
>
> write at 20Mb per second into files of 1Gb each.
>
> It was reported, and you guys told me it was a bug that had
> been fixed.  we refused to upgrade to the recommended version
> back then. But we might have gotten an upgrade due to a general
> kernel upgrade since then. But we try to keep the filesystem
> at < 90% full anyway.
>
> Recommendation: Make that "10%" a variable, settable by the
> "reserved-for-root" parameter...
>
> Is there a way that allows me to see the fill-percentage of
> our block groups?

debugreiserfs -m prints out bitmap blocks, so
debugreiserfs -m /dev/xxx | grep "^used" would do so.

-- 
Thanks,
Vitaly Fertman
