From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4 disk formats (was http://www.namesys.com/snapshots/2004.08.09-internal.testing/)
Date: Sun, 15 Aug 2004 15:24:34 +0400
Message-ID: <200408151524.34396.vitaly@namesys.com>
References: <20040813171827.GA15303@raptus.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20298-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040813171827.GA15303@raptus.homelinux.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@tiscali.it>, reiserfs-list@namesys.com

On Friday 13 August 2004 21:18, Domenico Andreoli wrote:
> hi all,
>
> On Mon, Aug 09, 2004 at 11:49:31PM +0400, Vitaly Fertman wrote:
> > and it has a converter from the previous format to the new one -- if you
> > already created a reiser4 fs with the mkfs from some previous version
> > of reiser4progs, first of all run
> >     $ debugfs.reiser4 -C device
>
> [ why i can't find any -C option in the debugfs.reiser4' manpage? it
> is instead present in the help of debugfs.reiser4. probably i'll add
> it to the debian manpage. ]

ok. I will add it also.

> if i launched this command using reiser4progs 1.0.0 would it make all
> the required conversions to bring up to date the disk format?
>
> the problem is that in debian currently i have two versions of
> reiser4progs, 0.5.3 and 0.5.6. in the next few days i want to upload also
> 1.0.0 to push it into sarge (the next debian stable due to being released
> in few weeks and for which the uploads will be closed on 17th August).
>
> hence i must explain to the user what she is required to do in order
> to update her filesystems and kernel.
>
> IIRC 0.5.3, 0.5.6 and 1.0.0 have all different disk format, haven't them?
>
> are the following the commands required to properly convert the disk
> formats?
>
> to convert a 0.5.3 to a 0.5.6:
>   $ fsck.reiser4 <device>
>
> to convert a 0.5.6 to 1.0.0:
>   $ debugfs.reiser4 -C <device>
>
> to convert a 0.5.3 to a 1.0.0:
>   $ fsck.reiser4 [--fix] <device>
>   $ debugfs.reiser4 -C <device>

there were a few format changes in 0.5.5. The first one is the formatting policy 
id was changed, to fix this 
	fsck.reiser4 --build-sb device
is needed. The second is object plugin sets. It was supposed to run
	fsck.reiser4 --fix device
to add pset to the root directory. Actually you could merely run
	fsck.reiser4 device
and it tells you what to do next.

To jump from 0.5.3 to 1.0.0 it would be better to run:
	fsck.reiser4 --build-sb device
	debugfs.reiser4 -C device
	fsck.reiser4 --fix device
all tools are from 1.0.0 here.

The converter (debugfs.reiser4 -C) is supposed to be run on consistent fs of 
course, so probably it is worth to check/fix it with the current reiser4progs 
before any update.

-- 
Thanks,
Vitaly Fertman

