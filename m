From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Fri, 17 May 2002 19:05:30 +0200
Message-ID: <200205171905.30804.Dieter.Nuetzel@hamburg.de>
References: <200205171736.50971.Dieter.Nuetzel@hamburg.de> <20020517195445.A1032@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-10370-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020517195445.A1032@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, Manuel Krause <manuelkrause@netscape.net>, ReiserFS List <reiserfs-list@namesys.com>

On Friday 17 May 2002 17:54, Oleg Drokin wrote:
> Hello!
>
> On Fri, May 17, 2002 at 05:36:50PM +0200, Dieter N?tzel wrote:
> > > It is not necessarily happened to files direectly to a crash.
> > > Any open file, that was deleted, cannot be deleted until it is closed.
> > > e.g. if you'd do "sleep 1000000 </path/somefile ; rm /path/somefile",
> > > /path/somefile won't be deleted until sleep finishes.
> > > If system crash occured and there were still some open, but deleted
> > > files, these files gets removed as part of recovery from crash process.
> > > And it is not possible to find file's names/paths because corresponding
> > > directory entries were already deleted.
> > > BTW it is absolutely the same thing happens with ext2, once you see
> > > e2fsck complains about "DTIME is zero", it deletes
> > > not-yet-deleted-but-scheduled-for-deletion files.
> >
> > Sorry Oleg, that I jump in, here...
> > I get from time to time corrupted files (after reboot and replay) which
> > are _NOT_ written during/before crash!!!
>
> What is the corruption pattern?

Have a look into the two examples.

> > It happes during huge C++ compilation of one of my 3D VIS apps.
>
> atime is still updated, I think.

Yes, could be the case. The partition is not mounted with "noatime".

> What was the crash, btw?
> Hard power loss?

No.
"Only" hard lookup. Sadly SysReq is not working ;-(

> > A similar thing happen during kernel compilations.
> > When the system crash (due to kernel devel stuff) some *.o or mostly
> > .*.o.flags files are broken after replay/reboot. Yes, this time they are
>
> This is expected.
>
> > written before/during crash and rebuild during replay, but it should much
> > more usefull if they were only _REMOVED_ during replay. Because the
> > "next" kernel build can't run smooth without "make clean" or deletion by
> > hand. What do you think?
>
> These files are not deleted, so why fs should delete these?

Yes, you are right. But semantically they are worthless 'cause they are 
"broken"...

> > Have a look into the falsely "rebuild" broken files in the attachment,
> > too.
>
> Later today

Hey, it's weekend then...;-)

Happy Whitsun everyone!

Regards,
	Dieter
