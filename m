From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 11:09:38 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com>
 <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org> <20040828170515.GB24868@hh.idb.hist.no>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040828170515.GB24868@hh.idb.hist.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helge Hafting <helgehaf@aitel.hist.no>
Cc: Rik van Riel <riel@redhat.com>, Spam <spam@tnonline.net>, Jamie Lokier <jamie@shareable.org>, Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com, Al Viro <viro@parcelfarce.linux.theplanet.co.uk>



On Sat, 28 Aug 2004, Helge Hafting wrote:
>
> > I think that lack of distinguishing power is more serious for 
> > directories. The more I think I think about it, the more I wonder whether 
> > Solaris did things right - having a special operation to "cross the 
> > boundary".
> > 
> > I suspect Solaris did it that way because it's a hell of a lot easier to 
> > do it like that, but regardless, it would solve the issue of real 
> > directories having both real children _and_ the "extra streams".
> 
> There are many ways of doing this. Several extra streams to a directory
> that aren't ordinary files in the directory?

Well.. Yes. We already have "." and "..", which are "special extra
streams" in a sense. However, people expect them, and know to ignore them. 
The same wouldn't be true of new naming.

> It seems to me that we can get a lot of nice functionality in a simpler way:
> Instead of thinking about a number of streams attached to something
> that is either an ordinary file or directory, just say that the only
> change will be that a directory may have a _single_ file stream in
> addition to being a plain directory.

That doesn't really help us. What would the name be, and how could you 
avoid clashes? 

> If the VFS is to be extended in order to support file-as-directory (or
> vice versa) then hopefully it can be done in a simple way.

I'm pretty confident that we can extend the VFS layer to support named
streams (see the technical discussion with Al, rather than the flames in
this thread). I also clearly believe that it is worth it, but I'm starting
to wonder if we should have a special open flag to make people select the
stream.

If you look at the Solaris interface, the _nice_ part about "openat()" is 
that you can do something like

	file = open(filename, O_RDONLY);
	if (file < 0)
		return -ENOENT;
	icon = openat(file, "icon", O_RDONLY | O_XATTR);
	if (icon < 0)
		icon = default_icon_file;
	..

and it will work regardless of whether "filename" is a directory or a 
regular file, if I've understood correctly.

Now, I think that makes sense for several reasons:
 - single case
 - race-free (think "stat()" vs "fstat()" races).
 - I think we want to do "openat()" regardless of whether we ever 
   support extended attributes or not ("openat()" is nice for doing 
   "namei()" in user space even in the absense of any attributes or 
   named streams).

So what we can do is
 - implement openat() regardless, and expect to do the Solaris thing for 
   it if we ever do streams.
 - _also_ support the "implied named attributes" for regular files, so 
   that you don't have to use "openat()" to access them.

Comments? Does anybody hate "openat()" for any reason (regardless of 
attributes)? We can easily support it, we'd just need to pass in the file 
to use as part of the "nameidata" thing or add an argument (it would also 
possibly be cleaner if we made "fs->pwd" be a "struct file").

		Linus
