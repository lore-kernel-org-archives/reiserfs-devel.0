From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: reiser4: writing plugins
Date: Thu, 22 Dec 2005 19:37:24 -0600
Message-ID: <1135301844.18109.12.camel@gentoo>
References: <1134763128.18089.10.camel@localhost.localdomain>
	 <200512171032.34752.pvh@uvic.ca>
	 <27c2ef000512182132y4a82637cv64805fcb1a21ceda@mail.gmail.com>
	 <b14e81f00512221624q67927794ya1e813fcecedf3dd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27487-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00512221624q67927794ya1e813fcecedf3dd@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: Ryan Nordman <spacerobots@gmail.com>, reiserfs-list@namesys.com, danny.milo@gmx.net

On Thu, 2005-12-22 at 19:24 -0500, michael chang wrote:
> On 12/19/05, Ryan Nordman <spacerobots@gmail.com> wrote:
> > I don't know how useful it'd be, I think it'd be great for getting you
> > familiar with the code base.  It'd add a bit of overhead that's not really
> > that necessary, don't you think?  Unless somebody really needs to know disk
> > usage *really* often.  What's the case for doing this in kernel space
> > instead of just using the du utility?
> 
> Well, my first instinctive thought is that it might help thwart or
> postpone any potential persons thinking of switching to
> OpenSolaris+ZFS because of the so-called 'pooled storage' thinking. 
> (ZFS has the ability to have multiple filesystems, even nested within
> each other, all sharing space from the same partition(s), and uses
> 'df' as opposed to du to find disk space, apparently df is 'cheaper'
> in terms of time used.  Apparently, with ZFS, you can do a 'df' and
> suddenly know how much space is used and free in any one folder
> provided it's a seperate filesystem of it's own.  A bit of an ...
> unusual abstraction to do things, but...)

Being able to use "df" or "zfs list" instead of "du" is a side effect.
The real reason for the "unusual abstraction" is to have finer grained
control over quotas, reservations, snapshots, checksums, compression,
NFS sharing, etc.

> If done *correctly* in the kernel, I imagine it should be faster - du
> does what would be the equivilant of listing all the files in the
> directory and summing all the file sizes it gets (du -s) -- and it is
> affected by the user's permissions (if I have a directory in the
> directory i'm du-ing that I can't read, du will fail to account for
> the files within that directory).
> 
> Last thing would be (hopefully) an ability to turn this thing on and
> off, and maybe to display the size of a folder's contents rather than
> the size of the directory's metadata in various utilities (if I 'ls
> -d' a directory, I usually get something like 2048B or 4096B depending
> on the number of files in there, although IIRC some big folders 'grow'
> to 16 KB, containing who knows what inside).
> 
> > > On December 16, 2005 11:58 am, dannym wrote:
> > > > Hi,
> > > >
> > > > So I want to start writing a small plugin to get a feel for the
> > > > architecture...
> > > > As for what I thought would be a nice intro thing for me to write is:
> > > >
> > > > Adds a pseudo file "tree-contents-size" for directories.
> > > > Pseudo file contains the "du" starting from this directory.
> > > >
> > > > What it should do is cache some kind of "du"-like value per directory.
> > > > When you change a file size (or delete a file, add a file, ...) in the
> > > > dir or one of it's subdirs, it shall set a dirty flag on the value.
> > > > When the pseudo file is accessed, it shall calculate it anew, also
> > > > updating the subdirs' pseudo files if so needed, and store it actually
> > > > on disk...
> > > > (could also be updated periodically without anyone requesting it, but
> > > > that's just a detail)
> 
> --
> ~Mike
>  - Just the crazy copy cat.
-- 
Jake Maciejewski <maciejej@msoe.edu>

