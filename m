From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Status of quota support for reiserfs on 2.6.x kernels
Date: Wed, 15 Dec 2004 07:19:21 +0100
Message-ID: <200412150719.22069.christian.mayrhuber@gmx.net>
References: <20041123105332.02470503.philippe.gramoulle@mmania.com> <200411231406.43497.christian.mayrhuber@gmx.net> <loom.20041215T011250-550@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22779-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <loom.20041215T011250-550@post.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, Klaus Thorn <klaus@trillke.net>

On Wednesday 15 December 2004 01:29, Klaus Thorn wrote:
> Christian Mayrhuber <christian.mayrhuber <at> gmx.net> writes:
> 
> > Quotas are in kernel 2.6 and supported by ext2,ext3,reiserfs,xfs.
> > Reiserfs doesn't need an extra patch for quotas, data journalling
> > or extended attributes. Everything is right there for
> > kernels > 2.6.5 if I remember right.
> 
> I tried to use quota with 2.6.7 and got two serious problems:
> 
> 1. soft quotas were treated like hard quotas
> (grace time 8 days but behaved like 0 days)
> 
> 2. after a few days no access to the file system was possible,
> fs-options usrquota and grpquota were doubled
> when listed by the mount command.
> (all 14 clients, samba and nfs paralyzed,
> a whole radio station silent, yes I had better days)
> After reboot the problem was gone but I turned quota off.
> 
> so imho quota with reiserfs is experimental and buggy
> 
> > I guess it would be wise to wait with the migration till these patches
> > make it into some official 2.6 kernel release.
> 
> damn. I can't switch to ext3 since my filesystem is too big
> to be copied somewhere else.
> I'm stuck and need quota with reiserfs and linux 2.6.
> What can I do?
There is a deadlock bug in the linux quota system (not just reiserfs) and a 
fix for it in the -mm (2.6.10-rc3-mm1 for instance).
See:
http://marc.theaimsgroup.com/?l=linux-fsdevel&m=110085813716139&w=2
http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.10-rc3/2.6.10-rc3-mm1/announce.txt

I don't know how stable these patches are nor how stable 2.6.10-rc3-mm1 is, 
nor if you need those. Maybe you just hit the quota race fixed in 2.6.8.

There are quite a lot of quota and nfs changes between 2.6.7 and newer 
kernels. (See the kernel changelogs and search for nfs and quota)

As nfs is involved you may want to bug linux-fsdevel@vger.kernel.org, too.

-- 
lg, Chris
