From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: Carrying Attributes too Far (was Reiser4: "pseudo file namespace" suggestion)
Date: Sat, 13 Sep 2003 18:56:10 -0700
Message-ID: <20030914015610.GB26701@matchmail.com>
References: <3F60925F.9000004@namesys.com> <3122307789-BeMail@cr593174-a>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15658-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3122307789-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: Hans Reiser <reiser@namesys.com>, Reiserfs-list@namesys.com, Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>

On Sat, Sep 13, 2003 at 07:59:07PM -0400, Alexander G. M. Smith wrote:
> Hans Reiser wrote on Thu, 11 Sep 2003 19:18:55 +0400:
> > I think that a distinction between attributes and contained objects can
> > only be a style convention, because for some objects/attributes there is
> > no proper division.
> >
> > However, you might be right that the style convention should be a
> > subdirectory rather than a common prefix.
> 
> Sometimes I want attributes on my attributes.  Things like thumbnails for a graphic, stored in a Thumbnails directory that's under the graphic "file".
> 
> Graphic.jpeg
> Graphic.jpeg/Author
> Graphic.jpeg/Thumbnails/Icon32x32.ico
> Graphic.jpeg/Thumbnails/Icon64x64.png
> Graphic.jpeg/Thumbnails/Icon64x64.png/Width
> Graphic.jpeg/Thumbnails/Icon64x64.png/Height
> 

And loose your attributes as soon as the file is copied with nfs2/3, http,
ftp, or etc...  (nfs4 does/will support attributes besides acls right?)

Have you actually worked on the macintosh before?  Receiving a file from a
Mac user is attrocious.  You loose a lot of state data kept in the resource
fork (the mac's form of attributes).  You have to know what kind of file it
is by looking at the data (the unix file(1) command doesn't cover a lot of
macintosh file formats unfortunately).

The only saving grace, was that the file types I have recieved (quark and
such) don't actually put anything from the file format needed for transfer
to another OS.

Please concentrate on cross platform file formats.

How is this going to be exported with nfs or samba?

> I'd also like to attach a BeOS style MIME type attribute to everything,

So now you have to read an attribute just to find out that it's a text file,
once for each file.  Talk about performance...

Compare that to just reading the directory listing once.

> even attributes (and you wouldn't have to name the file .jpeg any more).
> Of course, you will eventually get to primitive attributes that are only
> a coded byte in the metadata rather than a whole file.  But the user
> shouldn't be able to tell, and even the MIME type attribute could have a
> fake attribute on it saying that it is of type "text/plain", or perhaps
> more explicitly "text/mime-string".
> 
> Graphic.jpeg/MIME contains "image/jpeg"
> Graphic.jpeg/Thumbnails/Icon64x64.png/MIME contains "image/png"
> Graphic.jpeg/MIME/MIME contains "text/mime-string"
> 
> To avoid too much recursion, "ls" and other utilities should know which
> things are primitive things, and avoid trying to list their contents.
> The easiest way to cram that in would be to add another attribute:
> 
> Graphic.jpeg/MIME/Primitive contains "true", or maybe a single byte
> value that is non-zero.  Pick one.
> 

Woah, what does this get you when you can just add a little code here?  If
the mime attr isn't in ascii, then it's not mime, now is it?

> Note it's not Graphic.jpeg/MIME/.Primitive since using a dot prefix to
> hide things may no longer be necessary - another attribute could take over
> that job, perhaps call it HideFromUser.
> 
> Graphic.jpeg/MIME/HideFromUser contains "true".
> 
> Thought that may be carring attributes too far :-)

No kidding.
