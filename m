From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] updated data=ordered patch for 2.6.3
Date: Mon, 01 Mar 2004 09:01:57 -0500
Message-ID: <1078149717.2147.216.camel@watt.suse.com>
References: <1077165373.22253.45.camel@watt.suse.com>
	 <1078147812.7623.4.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16988-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1078147812.7623.4.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christophe Saout <christophe@saout.de>
Cc: reiserfs-list@namesys.com

On Mon, 2004-03-01 at 08:30, Christophe Saout wrote:
> Hi,
> 
> > Also, the code has some extra performance tweaks to smooth out
> > performance both with and without data=ordered.  There are new
> > mechanisms to trigger metadata/commit block writeback and to help
> > throttle writers.  The goal is to reduce the huge bursts of io during a
> > commit and during data=ordered writeback.
> 
> It seems you introduced a bug here. I installed the patches yesterday
> and found a lockup on my notebook when running lilo (with /boot on the
> root reiserfs filesystem).
> 
> A SysRq-T showed that lilo is stuck in fsync:
> 

Ugh, I use grub so I haven't tried lilo.  Could you please send me the
full sysrq-t, this is probably something stupid.

-chris


