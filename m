From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Sat, 28 Aug 2004 15:29:33 -0700
Message-ID: <4131074D.7050209@namesys.com>
References: <Pine.LNX.4.44.0408272158560.10272-100000@chimarrao.boston.redhat.com> <Pine.LNX.4.58.0408271902410.14196@ppc970.osdl.org> <20040828170515.GB24868@hh.idb.hist.no> <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21027-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408281038510.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Helge Hafting <helgehaf@aitel.hist.no>, Rik van Riel <riel@redhat.com>, Spam <spam@tnonline.net>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Diego Calleja <diegocg@teleline.es>, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, hch@lst.de, linux-fsdevel@vger.kernel.org, Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com, Al Viro <viro@parcelfarce.linux.theplanet.co.uk>

I object to openat().....

My reason is that the things that distinguish between objects should be 
the names, not the choice of system call.  The reason for this is that 
it improves closure and namespace unification to do so, because it 
allows all the objects to be accessed within the same namespace.

Yes, it can be useful to allow a namespace to exclude some objects, but 
that exclusion should not be mandated.  If you want to exclude, you 
should cd or chroot to /proc/nopseudos and find a view of the filesystem 
that excludes metas, or mount with -nopseuodos.

Do you see why I say this?  I can say a lot more about the damage of 
fragmenting namespaces into multiple apis.... Why look at xattrs....;-)

Hans


Linus Torvalds wrote:

>
>
>I'm pretty confident that we can extend the VFS layer to support named
>streams (see the technical discussion with Al, rather than the flames in
>this thread). I also clearly believe that it is worth it, but I'm starting
>to wonder if we should have a special open flag to make people select the
>stream.
>
>If you look at the Solaris interface, the _nice_ part about "openat()" is 
>that you can do something like
>
>	file = open(filename, O_RDONLY);
>	if (file < 0)
>		return -ENOENT;
>	icon = openat(file, "icon", O_RDONLY | O_XATTR);
>	if (icon < 0)
>		icon = default_icon_file;
>	..
>
>and it will work regardless of whether "filename" is a directory or a 
>regular file, if I've understood correctly.
>
>Now, I think that makes sense for several reasons:
> - single case
> - race-free (think "stat()" vs "fstat()" races).
> - I think we want to do "openat()" regardless of whether we ever 
>   support extended attributes or not ("openat()" is nice for doing 
>   "namei()" in user space even in the absense of any attributes or 
>   named streams).
>
>So what we can do is
> - implement openat() regardless, and expect to do the Solaris thing for 
>   it if we ever do streams.
> - _also_ support the "implied named attributes" for regular files, so 
>   that you don't have to use "openat()" to access them.
>
>Comments? Does anybody hate "openat()" for any reason (regardless of 
>attributes)? We can easily support it, we'd just need to pass in the file 
>to use as part of the "nameidata" thing or add an argument (it would also 
>possibly be cleaner if we made "fs->pwd" be a "struct file").
>
>		Linus
>-
>To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>Please read the FAQ at  http://www.tux.org/lkml/
>
>
>  
>

