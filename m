From: Tuomas Jormola <tjormola@cc.hut.fi>
Subject: Re: LVM array, one disk failed
Date: 03 Jan 2003 00:04:01 +0200
Message-ID: <1041545041.13918.7.camel@ganga>
References: <1041044851.5964.32.camel@ganga>
	 <20021228113942.A6599@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12263-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021228113942.A6599@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sat, 2002-12-28 at 10:39, Oleg Drokin wrote:
> Hello!
> 
> On Sat, Dec 28, 2002 at 05:07:31AM +0200, Tuomas Jormola wrote:
> > I have a 110GiB LVM array constructed using EVMS. It consists of three
> > IDE hard disks from which the last one died the other day. The
> > filesystem is ReiserFS, of course. Array is a linear one and there was
> > about 15GiB free space when disk died so I'm hoping there was a somewhat
> > resonable way to recover the data on two disks that are full and in
> > front of the array. The failed disk is totally dead, not just a couple
> > of bad sectors. It spins but it's not detected on boot. When I try to
> > mount the volume with only two disks connected, it get this:
> > sh-2029: reiserfs read_bitmaps: bitmap block (#19234816) reading failed
> > reiserfs_read_super: unable to read bitmap
> 
> This is hardware problem ;)
> 
> But if your raid setup does not use any stripping, this is possible to
> rercover from such a situation.
> The easiest way that comes to mind is to add another disk instead failed one so
> that all of the FS blocks still accessible.
> Then you can mount the FS and all the data would be intact (only bitmaps and
> other stuff from failed disk would be corrupted).
> 
> If you do not plan to add anymore drives or if you just don't have
> spare drive, you probably can run reiserfsck --rebuild-sb and after
> couple of questions it will write updated superblock that
> respects changed filesystem size (actually for this to work you first need
> to tell your LVM to report current volume size that is now shorter
> than it was at creation time).
reiserfsck says

Reiserfs with standard journal found, but there was specified a journal dev

I guess guess it's bad thing :/

-- 
Tuomas Jormola <tjormola@cc.hut.fi>

