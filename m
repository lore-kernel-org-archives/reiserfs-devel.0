From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far (was Reiser4: "pseudo file
 namespace" suggestion)
Date: Sat, 13 Sep 2003 23:46:27 -0400 EDT
Message-ID: <16762094557-BeMail@cr593174-a>
References: <20030914015610.GB26701@matchmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15662-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030914015610.GB26701@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs-list@namesys.com

Mike Fedyk wrote on Sat, 13 Sep 2003 18:56:10 -0700:
> > Sometimes I want attributes on my attributes.  Things like thumbnails for a graphic, stored in a Thumbnails directory that's under the graphic "file".
> > 
> > Graphic.jpeg
> > Graphic.jpeg/Author
> > Graphic.jpeg/Thumbnails/Icon32x32.ico
> > Graphic.jpeg/Thumbnails/Icon64x64.png
> > Graphic.jpeg/Thumbnails/Icon64x64.png/Width
> > Graphic.jpeg/Thumbnails/Icon64x64.png/Height
> > 
> 
> And loose your attributes as soon as the file is copied with nfs2/3, http,
> ftp, or etc...  (nfs4 does/will support attributes besides acls right?)

Same problem with FTP and directories.  If you transfer a directory, the
contents don't get copied.  How annoying!  Instead you zip it up.  Or use
an FTP program which understands recursion.  Admittedly a hassle.  But
worth it.  Similarly it will be worth it to have FTP which understands
things that are files AND directories simultaneously.  By the way, I'd
rather call them Fildirutes (files, directories and attributes combined)
rather than the over-used "thing".  Coincidentally, there are BeOS FTP
clients and servers which have extensions for transferring attributes.
Other FTP extensions won't be impossible...

> Have you actually worked on the macintosh before?  Receiving a file from a
> Mac user is attrocious.  You loose a lot of state data kept in the resource
> fork (the mac's form of attributes).  You have to know what kind of file it
> is by looking at the data (the unix file(1) command doesn't cover a lot of
> macintosh file formats unfortunately).

Yes, and a lot of those resources are awkward to access (though ResEdit is
nice).  With a file system, they would be exposed as individual files and
be easier to handle.

> The only saving grace, was that the file types I have recieved (quark and
> such) don't actually put anything from the file format needed for transfer
> to another OS.

Yup.  Coincidentally Apple has been moving away from resources to bundles
of files in a directory that appears to be an application, and file name
extensions.

> Please concentrate on cross platform file formats.

Cross platform is a lower priority for me, since I want to try something new.
I suppose ReiserFS has similar leanings, if it will have directories and
files as the same thing, though I can't speak for them.  I'm just working on
experimental file systems for BeOS (since it actually uses attributes and
other fancy doodads that haven't yet shown up in mainstream OSes).

For cross platform exports, it's easy enough to represent - each fildirute
"thing" becomes a directory, with a data file to represent its contents (for
operating systems which don't think directories can also be treated like
files).  Other tricks are possible.  For example:

Graphic.jpeg
Graphic.jpeg/Author
Graphic.jpeg/MIME
Graphic.jpeg/Thumbnails/Icon32x32.ico

gets modified for export to ignorant file systems by splitting the
fildirute thing into a separate file and directory such as:

Graphic.jpeg (a file)
Graphic.jpeg.attributes (a directory)
Graphic.jpeg.attributes/Author (a file)
Graphic.jpeg.attributes/MIME (a file containing "image/jpeg")
Graphic.jpeg.attributes/Thumbnails/Icon32x32.ico (a file)

> How is this going to be exported with nfs or samba?

Using an export format like that.  Or later on a modified API which
allows you to read data from a directory.

> > I'd also like to attach a BeOS style MIME type attribute to everything,
> 
> So now you have to read an attribute just to find out that it's a text file,
> once for each file.  Talk about performance...
> 
> Compare that to just reading the directory listing once.

More reliable than trying to figure it out by the extension.  Plus it can
store the preferred application for opening it as an attribute, and other
things you can't stuff into an extension.  Or we could have multiple
extensions: "Graphics.jpeg.prefapp=photoshop.width=640.height=480"  Hmmm,
maybe you're on to something there, as a cheap alternative to attributes.

Admittedly, a more expressive directory listing facility could help.  I've
thought of changing directory reading operations to return more than a name
and an inode.  Perhaps readdir (dir_handle, "NAME,MIME,PREFERRED_APP")
would return dirent style records that have 3 extra fields with the current
attribute values rather than just the current one name field per record.
For some BeOS file systems, the attributes are usually right in the inode
(unless they overflow), so this is relatively cheap (usually).  With ReiserFS
they would hopefully be near the inode metadata.  In BeOS there's also a
readdir call which returns several dirent records, filling a user provided
buffer.  Great for apps which are trying to draw icons of all the files in
a directory (just one OS call gives you the names, MIME type, possible
explicit icon, etc).

It seems like a slow directory listing implementation, but it's faster
than the alternative of opening and closing lots of attribute files to
get the attribute values.

> > Graphic.jpeg/MIME/Primitive contains "true", or maybe a single byte
> > value that is non-zero.  Pick one.
> > 
> 
> Woah, what does this get you when you can just add a little code here?  If
> the mime attr isn't in ascii, then it's not mime, now is it?

The MIME attribute itself is a string.  But the attribute on the MIME
attribute is just a boolean that tells you that the MIME attribute is
primitive.  Internally the file system does have some hard coded facts,
such as MIME attributes shouldn't have user attributes added to them.
This is just a way of exposing those implementation limitations.

- Alex
