From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: i/o error (lost+found) with reiser4
Date: Mon, 23 Feb 2004 20:23:30 +0300
Message-ID: <20040223172330.GD1712@backtop.namesys.com>
References: <200402222338.23623.henning-04@die.informatik.uni-siegen.de> <20040223152003.GA1712@backtop.namesys.com> <20040223170017.GC1712@backtop.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16896-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040223170017.GC1712@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: reiserfs-list@namesys.com

On Mon, Feb 23, 2004 at 08:00:17PM +0300, Alex Zarochentcev wrote:
> On Mon, Feb 23, 2004 at 06:20:03PM +0300, Alex Zarochentcev wrote:
> > On Sun, Feb 22, 2004 at 11:38:23PM +0100, Henning Westerholt wrote:
> > > Hello all,
> > > 
> > > after the regular stat data error, i try to fix the fs as usual. Today the 
> > > fsck program complains the first time about a fatal corruption. I attached 
> > > the output from the first fsck run.
> 
> Can you tell more about workload which caused the corruption?  Also, we like
> to know reiser4 verion, kernel and hardware configuration.
> 
> > > 
> > > I run fsck with option "build-fs" as recommended, and it seems to fix the 
> > > error. But now a "ls" in the root of the reiser4 partiton complains about a 
> > > input/ output error on the directory "lost+found". 
> > > Output from the system log:
> > > 
> > > +++++++++
> > > reiser4[ls(14750)]: check_open_format40 
> > > (fs/reiser4/plugin/disk_format/disk_format40.c:551)[vpf-1360]:
> > > WARNING: The object with the oid 3441763 greater then the max used oid 3441762 
> > > found.
> 
> If there was no fs activity (file creation/deletion) after "build-sb",
> you can erase blocks ##19, 20 on the fs:
> 
> backup:
> dd if=/dev/hdd8 skip=19 bs=4096 count=2 of=hdd8.19-20x4k.dat
> 
> erase:
> dd if=/dev/zero of=/dev/hdd8 seek=19 bs=4096 count=2 conv=notrunc


Those blocks are journal header and footer, they may contain nr_files, last
used object id and free_blocks counters which are different from the super
block values.  It is due to a journalling optimization.  The fsck --build-fs
should have invalidated the duplicated info in the journal footer but it
hasn't. 

So, the command above invalidates the data by erasing all journal control
blocks content, and completes the fsck --build-fs run.

-- 
Alex.
