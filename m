From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Fastest way to "find / -mtime +7".....
Date: Wed, 20 Jul 2005 08:33:49 -0400 EDT
Message-ID: <1450655248-BeMail@AlexDualP3>
References: <1121810424.15596.19.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25209-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1121810424.15596.19.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: ewalker@surfcity.net, reiserfs-list@namesys.com, reiserfs@ragnark.vestdata.no

Jonathan Briggs wrote on Tue, 19 Jul 2005 16:00:23 -0600:
> On Tue, 2005-07-19 at 22:09 +0200, Ragnar Kj=F8rstad wrote:
> > Readdir will return the filenames in hash order. Find will then go and
> > stat each file, still in hash order.
> >=20
> > Problem is, the inodes are not sorted in directory hash order on the
> > disk. They tend to be in approximate creation order. So, the disk access
> > pattern is nearly random access, meaning every stat is likely to touch a
> > new block and readahead is completely useless.
> [snip]
> How about some kind of stat-data readahead logic?  If the first two or
> three directory entries are stat'd, queue up the rest (or next
> hundred/thousand) of them.  If the disk queue is given the whole pile of
> stat requests at once instead of one at a time, it should be able to
> sort them into a reasonable order.
>=20
> This might even be a VFS thing to do instead of per-FS.

I noticed the same limitation for reading large numbers of attributes in Be=
OS
(like icons for all the files in a directory or in the result set from a qu=
ery).
My idea is to expand ReadDir to return more than just the file names in the
directory/query.  You would specify which metadata you wanted (mtime, filen=
ame,
attribute name, etc) and then SuperReadDir would traverse the directory/que=
ry
and pack all the requested data items into one memory buffer for the calling
program to use.  Thus avoiding the overhead of multiple kernel calls for ea=
ch
individual file.  Suddenly displaying a file browser window with a directory
with thousands of files is many times faster!

But for full functionality this needs a global metadata naming and typing
system, so you can find out what data types are available, and how to proce=
ss
them.  It would describe mtime as being a 4 byte integer time, SMALL_ICON as
being a bitmap, FILE_NAME as being a variable length string and so on.  This
can be related to the file type system (like the nice one Apple now has in
OS X Tiger), so that file types and metadata types can be described by a
common API.  Unfortunately BeOS has them as separate systems (a list of four
character codes for the metadata types, MIME strings for the files).  Then
there's the issue of cross platform type sharing, an enum with different va=
lues
here and there for the metadata type codes will make it hard to share data
discs, so something more sophisticated is needed...

- Alex
