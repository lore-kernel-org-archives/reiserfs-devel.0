From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Carrying Attributes too Far (was Reiser4: "pseudo file namespace"
 suggestion)
Date: Sat, 13 Sep 2003 19:59:07 -0400 EDT
Message-ID: <3122307789-BeMail@cr593174-a>
References: <3F60925F.9000004@namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15657-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F60925F.9000004@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Reiserfs-list@namesys.com, Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>

Hans Reiser wrote on Thu, 11 Sep 2003 19:18:55 +0400:
> I think that a distinction between attributes and contained objects can
> only be a style convention, because for some objects/attributes there is
> no proper division.
>
> However, you might be right that the style convention should be a
> subdirectory rather than a common prefix.

Sometimes I want attributes on my attributes.  Things like thumbnails for a graphic, stored in a Thumbnails directory that's under the graphic "file".

Graphic.jpeg
Graphic.jpeg/Author
Graphic.jpeg/Thumbnails/Icon32x32.ico
Graphic.jpeg/Thumbnails/Icon64x64.png
Graphic.jpeg/Thumbnails/Icon64x64.png/Width
Graphic.jpeg/Thumbnails/Icon64x64.png/Height

I'd also like to attach a BeOS style MIME type attribute to everything,
even attributes (and you wouldn't have to name the file .jpeg any more).
Of course, you will eventually get to primitive attributes that are only
a coded byte in the metadata rather than a whole file.  But the user
shouldn't be able to tell, and even the MIME type attribute could have a
fake attribute on it saying that it is of type "text/plain", or perhaps
more explicitly "text/mime-string".

Graphic.jpeg/MIME contains "image/jpeg"
Graphic.jpeg/Thumbnails/Icon64x64.png/MIME contains "image/png"
Graphic.jpeg/MIME/MIME contains "text/mime-string"

To avoid too much recursion, "ls" and other utilities should know which
things are primitive things, and avoid trying to list their contents.
The easiest way to cram that in would be to add another attribute:

Graphic.jpeg/MIME/Primitive contains "true", or maybe a single byte
value that is non-zero.  Pick one.

Note it's not Graphic.jpeg/MIME/.Primitive since using a dot prefix to
hide things may no longer be necessary - another attribute could take over
that job, perhaps call it HideFromUser.

Graphic.jpeg/MIME/HideFromUser contains "true".

Thought that may be carring attributes too far :-)

- Alex
