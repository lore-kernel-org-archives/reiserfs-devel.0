From: Oleg Drokin <green@namesys.com>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Fri, 17 May 2002 19:54:45 +0400
Message-ID: <20020517195445.A1032@namesys.com>
References: <200205171736.50971.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10368-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200205171736.50971.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, Manuel Krause <manuelkrause@netscape.net>, ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Fri, May 17, 2002 at 05:36:50PM +0200, Dieter N?tzel wrote:

> > It is not necessarily happened to files direectly to a crash.
> > Any open file, that was deleted, cannot be deleted until it is closed.
> > e.g. if you'd do "sleep 1000000 </path/somefile ; rm /path/somefile",
> > /path/somefile won't be deleted until sleep finishes.
> > If system crash occured and there were still some open, but deleted files,
> > these files gets removed as part of recovery from crash process.
> > And it is not possible to find file's names/paths because corresponding
> > directory entries were already deleted.
> > BTW it is absolutely the same thing happens with ext2, once you see
> > e2fsck complains about "DTIME is zero", it deletes
> > not-yet-deleted-but-scheduled-for-deletion files.
> Sorry Oleg, that I jump in, here...
> I get from time to time corrupted files (after reboot and replay) which are 
> _NOT_ written during/before crash!!!

What is the corruption pattern?

> It happes during huge C++ compilation of one of my 3D VIS apps.

atime is still updated, I think. What was the crash, btw?
Hard power loss?

> A similar thing happen during kernel compilations.
> When the system crash (due to kernel devel stuff) some *.o or mostly 
> .*.o.flags files are broken after replay/reboot. Yes, this time they are 

This is expected.

> written before/during crash and rebuild during replay, but it should much 
> more usefull if they were only _REMOVED_ during replay. Because the "next" 
> kernel build can't run smooth without "make clean" or deletion by hand.
> What do you think?

These files are not deleted, so why fs should delete these?

> Have a look into the falsely "rebuild" broken files in the attachment, too.

Later today

Bye,
    Oleg
