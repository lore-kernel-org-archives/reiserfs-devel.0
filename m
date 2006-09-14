From: Quinn Harris <lists@qutek.net>
Subject: Re: Relocating files for faster boot/start-up on reiser(fs/4)
Date: Wed, 13 Sep 2006 21:10:43 -0600
Message-ID: <200609132110.45703.lists@qutek.net>
References: <200609131451.42474.lists@qutek.net> <ee9s4k$f58$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29878-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ee9s4k$f58$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Peter,

I think you misunderstood what and why I was doing this.  Let me try to 
clarify.

My test is far from perfect.  Its mearly an exercise to verify the basic idea.

> Just by copying you are allowing reiser to optimize the dir.
Exactly, but I am copying in a way that implicitly suggests what order those 
files will be accessed in.

I was attempting to reorder the data on disk to minimize disk 
seeks with knowledge of the order that data will be accessed.  This was done 
by taking advantage of the way reiser assigns keys to files based on their 
name and its affinity to match key order with block order.  

> You're trying to duplicate what a tree-based design does automatically.
This works because of the tree-based design of reiser.

The reiser must assign each file (item actually) some key, why not take 
advantage of knowledge of the order those items will be accessed in?  The 
current key assignment algorithm is a best guess at that given the limited 
information it has (file/directory name).  Remember key assignment roughly 
translates to on disk position.

The relocate script can leave the file system in the exact same state from a 
semantic standpoint (what files and directories are there) but relocate the 
data on disk.  Copying those files to single directory with numeric names was 
a kludge to implicitly tell the file system to place those files in a 
specific order and near each other on disk.  The rename step is to switch the 
old unoptimized file position with the new more optimized position.

> Moreover, remember that reiser packs
> files into clusters so that you may read more than just your one file from
> time to time which could end up adding time to your test.
The boot optimization was over 3885 files.  Ideally those files would be 
ordered head to tail in a sequence that perfectly matches the order they will 
be read.  As a result multiple items in a node will all need to be read at 
nearly the same time.  That didn't happen in my test, but it was much closer 
to that after I ran the relocate script than before.  Hence the performance 
improvement.  With this script, reiser4 and a repacker I have reason to 
believe the ordering will be nearly perfect.  Of course, that is excluding 
random access patterns inside the same file and the directory data needed to 
get at the files.

This basic technique can be made into a boot script much like the readahead 
script already in Ubuntu, just improved.  Boot once with a profile option, it 
measures read patterns (already does this), then reorders data on disk with 
this trick, or maybe something better.  Then the next time you boot its 
1.5-2x faster.  Better yet, including this profile information in the distro 
packages.  When a package is installed this info is used to help assign item 
keys resulting in a better disk layout and faster boot times and no weird 
file copy rename mumbo jumbo.

I bring this up here because I expect with reiser4, a repacker, and this 
trick, reiser4 could deliver at least 50% better reproducible real world boot 
and app load performance than any other file system.  At least until other 
file system implement something similar, like what MS did with XP.  Can 
something similar be done (or has been) on ext(2/3/4), XFS, JFS or other 
linux file systems?

Windows XP boots much faster than Windows 2000 in part because it does what I 
am talking about.  File access is recorded at boot, then the disk is defraged 
with this knowledge.  Check out
http://msdn.microsoft.com/msdnmag/issues/01/12/xpkernel/default.aspx
under "Prefetch".

Also look at http://kerneltrap.org/node/2157

MS's implementation required implementing a defrag utility with a specific 
feature that could position disk data based on access logs.  Reiser4 can do 
the same thing as part of its basic functionality with the addition of a much 
much simpler tool to help assign keys based on that access log.  Then a 
repacker (when it devaporizes) can further optimize for that access pattern 
without any code specific to that purpose.  Seems like good orthogonal design 
to me.

Hope that clarifies.  Like my previous post, whatever it did, it did it in way 
to many words.



On Wednesday 13 September 2006 15:10, Peter wrote:
> On Wed, 13 Sep 2006 14:51:39 -0600, Quinn Harris wrote:
> > Thoughts?
>
> Yes. Why on earth would you do this? By copying the files and renaming and
> hardlinking them is nothing a sysadmin would ever do. Just by copying you
> are allowing reiser to optimize the dir. You're trying to duplicate what a
> tree-based design does automatically. Moreover, remember that reiser packs
> files into clusters so that you may read more than just your one file from
> time to time which could end up adding time to your test.
>
> If reiser needs speedup it certainly won't be done by renaming files!
>
> JM$0.02

-- 
Quinn Harris

