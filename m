From: "David Dabbs" <david@dabbs.net>
Subject: RE: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Tue, 10 Aug 2004 16:26:44 -0500
Message-ID: <20040810213448.BBF7915DD4@mail03.powweb.com>
References: <20040810210630.GV9811@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040810210630.GV9811@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Alex Zarochentsev' <zam@namesys.com>
Cc: 'Hans Reiser' <reiser@namesys.com>, 'ReiserFS List' <reiserfs-list@namesys.com>


> > I have been running benchmarks with SYNC=off, as the mongo page
> recommends
> > against doing so. In configs where SYNC=ON we would omit the syncs/wais,
> > yes?
> 
> not sure. metadata need to be synched still.
> 
> > David
> 
> --
> Alex.


See also below. I'm pretty sure my IDE disks are write cache-enabled.
Perhaps the statement below that "ide write caches must be disabled for
reliable fsync operations with Linux" is an explanation for the errors I saw
during my benchmarking. Will look more into the "IDE barrier and true 
fsync() in Linux on IDE" threads.


David


Subject: Re: Why O_SYNC is faster than fsync on ext3 
Date: Sun, 21 Mar 2004 11:45:18 +0100 
-------------------------------------------------------------------------
Yusuf Goolamabbas wrote:


>I sent this to Bruce but forgot to cc pgsql-hackers, The patches are
>likely to go into 2.6.6. People interested in extremely safe fsync
>writes should also follow the IDE barrier thread and the true fsync()
>in Linux on IDE thread

Actually the most interesting part of the thread was the initial post from
Peter Zaitsev on a fcntl(fd, F_FULLSYNC, NULL): He wrote that this is
necessary for Mac OS X to force a flush of the write caches in the disks.
Unfortunately I can't find anything about this flag with google.

Another interesting point is that right now, ide write caches must be
disabled for reliable fsync operations with Linux. Recent suse kernels
contain partial support. If the existing patches are completed and merged,
it will be safe to enable write caching.

Perhaps Bruce's cache flush test could be modified slightly to check that
the OS isn't lying about fsync: if fsync is faster than the rotational delay
of the disks, then the setup is not suitable for postgres. This could be
recommended as a setup test in the install document.

