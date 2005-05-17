From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: file as a directory
Date: Mon, 16 May 2005 21:25:40 -0400 EDT
Message-ID: <92232506676-BeMail@cr593174-a>
References: <ff80108405051605321df0d764@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24065-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ff80108405051605321df0d764@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Leo Comerford <leocomerford@gmail.com>
Cc: sean.mcgrath@propylon.com, reiserfs-list@namesys.com, Peter.Foldiak@st-andrews.ac.uk

Leo Comerford wrote on Mon, 16 May 2005 13:32:19 +0100:
> Probably the biggest barrier is the fact that it's nigh-impossible to
> take a specific (non-directory) file and find its pathnames! We need
> the ability to do this for any file, directory or otherwise, and for
> all types of pathnames applied to the file.

Not imposible with doubly linked directory entries, rather than the
traditional single links.  Been there, done that, the price is
performance, which we can now afford due to modern hardware?

> So a relation-directory can express arbitrary relationships between
> files. It's a bit like the relational model's weakly-typed sister,
> where /(something)/description is a table, aardvark: is a row, and
> ~/photos/dessau-bauhaus is aardvark's entry in the column
> /(something)/description/(the various relation-directories):described.
> In OOese, /(something)/description is an association, aardvark: is one
> of the links of that association, and (the various
> relation-directories):described is a role name. (At least, that's the
> Rumbaugh-Blaha-Premerlani-Eddy-and-Lorensen version; the UMLese may
> vary.)

As for the rest of your ideas, let me sum up what I think
you're talking about, please correct me if I got it wrong:

Group similar files together by linking them from a common parent
directory (files are allowed to have multiple parents) - which
serves mainly to give them an association.  You had a colon in
the directory name to mark that functionality, though it could
just be a regular directory in all but name.

Or is it about adding relations by attaching sub-files to give more
info about something?

So if I have a photograph of my aunt's cottage, I'd like to file it
in a directory for "Cottage" stuff and another one for "Aunt" things.
But when I want to add a descriptive text file, I'd rather have
it as a kind of attribute attached to the photo - making the
description a sub-file of the photo (treating the photo "file"
as a directory) so that it is preserved when I move the photo "file"
around.  The alternative of having a special description association
directory for all files that have the same description seems kind of
awkward (there's usually only one file per description).

Are both methods useful?  Yup.  What's the difference between
associations and properties?  Many-to-one and one-to-one?

Actually both can exist in the file system - when you do a directory
listing of a thing (the photo "file"), you get the subfile listing
(the text description file's name) and the parent directories listed
too (like ".." in regular directory listings, but you'd have ..photos
and ..aunt).

And then there are ReiserFS plugins, which might give you a magic
directory that when read for data, yields the concatenation of its
children's data contents.

> On the other hand, garbage collection will be a significant hurdle,
> for two reasons. One is cycles. [...]  The other is more
> sophisticated needs for automatic deletion.

Neither are impossible, we just have to pay the performance price
for the luxury features.

- Alex


P.S. Here's the example warped into an Unix style file system, with
dynamically generated fake symbolic links for things that wouldn't
fit (like multiple parent directories).  To get the world to accept
files as directories and other novelties, we may have to use
something like this for the transition from old to new:

Example:
total 2
drwxr-xr-x   1 agmsmith agmsmith        2 May 16 21:06 .
drwxrwxrwx   0 agmsmith agmsmith        7 May 16 21:06 ..
drwxr-xr-x   1 agmsmith agmsmith        1 May 16 21:09 Aunt
drwxr-xr-x   1 agmsmith agmsmith        1 May 16 21:08 Photos

Example/Aunt:
total 1
drwxr-xr-x   1 agmsmith agmsmith        1 May 16 21:09 .
drwxr-xr-x   1 agmsmith agmsmith        2 May 16 21:06 ..
lrwxrwxrwx   1 agmsmith agmsmith        1 May 16 21:09 NewBackStairs -> /RAMDisk/Example/Photos/NewBackStairs

Example/Photos:
total 1
drwxr-xr-x   1 agmsmith agmsmith        1 May 16 21:08 .
drwxr-xr-x   1 agmsmith agmsmith        2 May 16 21:06 ..
drwxr-xr-x   2 agmsmith agmsmith        2 May 16 21:08 NewBackStairs

Example/Photos/NewBackStairs:
total 202
drwxr-xr-x   2 agmsmith agmsmith        2 May 16 21:08 .
drwxr-xr-x   1 agmsmith agmsmith        1 May 16 21:08 ..
lrwxrwxrwx   0 agmsmith agmsmith        2 May 16 21:09 ... -> /RAMDisk/Example/Aunt
-rw-r--r--   1 agmsmith agmsmith       29 May 16 21:08 Description.txt
-rw-rw-rw-   1 agmsmith agmsmith   204641 May 14 15:40 ImageData.jpeg

