From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far
Date: Tue, 16 Sep 2003 15:15:59 -0400 EDT
Message-ID: <2596553532-BeMail@cr593174-a>
References: <874qzgt2yo.fsf@labatt.uhoreg.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15676-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <874qzgt2yo.fsf@labatt.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Hubert Chan wrote on Sun, 14 Sep 2003 00:21:19 -0400:
> Alexander> To avoid too much recursion, "ls" and other utilities should
> Alexander> know which things are primitive things, and avoid trying to
> Alexander> list their contents.  The easiest way to cram that in would
> Alexander> be to add another attribute:
> 
> Alexander> Graphic.jpeg/MIME/Primitive contains "true", or maybe a
> Alexander> single byte value that is non-zero.  Pick one.
> 
> I think that the easiest thing would be to just say that if MIME
> doesn't contain a MIME attribute, then it's "primitive" (or whatever).

Good idea.  For legitimate but not currently classified files, a MIME
type of "application/unclassified" could be used (or just the existing
generic "application/octet-stream").

I recently thought of another way, just turn off the "x" permission bit
for examining or changing the "directory" of a primitive attribute.
Or perhaps deny directory type operations with a suitable error code.
Or both.  Though that would be a hack - you couldn't tell if it was
a primitive thing or if someone had just turned off the permissions.

Unfortunately Unix has overused the "x" bit in the rwx permissions set;
it has different interpretations depending on whether the thing is a file
or a directory.  We'd have to add a new bit, or get rid of the x == execute
functionality (the MIME type of the file would take over that duty).  Or
just toss out the whole file mode thing and use ACLs and other more modern
attribute based techniques for permissions.  Sure, they won't be as fast,
but modern hardware (and ReiserFS!) makes it possible to take the speed
hit in return for more flexibility in storing data.

- Alex
