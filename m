From: "David Dabbs" <david@dabbs.net>
Subject: RE: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Sun, 8 Aug 2004 14:09:25 -0500
Message-ID: <20040808191325.BE91F15CC3@mail03.powweb.com>
References: <41166C28.6030402@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20073-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41166C28.6030402@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: 'ReiserFS List' <reiserfs-list@namesys.com>, 'Nikita Danilov' <Nikita@namesys.com>, 'Alexander Zarochentcev' <zam@namesys.com>, "'E. Gryaznova'" <grev@namesys.com>



> -----Original Message-----
> From: Hans Reiser [mailto:reiser@namesys.com]
> Sent: Sunday, August 08, 2004 1:09 PM
> To: David Dabbs
> Cc: 'ReiserFS List'; Nikita Danilov; Alexander Zarochentcev; E. Gryaznova
> Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output
> error"
> 
> most filenames are small.  We have an optimization in reiser4 that
> assumes filenames are less than 15 characters, which most of them are.
> 

This is true, but most file names are also not six characters or less with
no extensions. 

> Maybe you should use a list of real filenames as well as a list of real
> directory names.  You can reuse the filenames, so long as they are
> unique within a directory.
> 

I'm not sure uniqueness is a requirement, as mongo allows for duplicate
filenames. I did use real dirs and files. This is what the MKDIRS and
MKFILES phases do. I generated a list of most of the actual directories and
files in my / partition. In my config these are created by MKFILES and
MKDIRS before the 'stock' mongo phases run.

> Hmm, it occurs to me that rather than using the 7 character filename
> prefix in the hash we should use first 4 letters and last 3 letters.
> 
> Nikita, zam, what do you think?
> 

Then you wouldn't store directories and filenames in lexicographic order as
you originally intended.


> >
> >Since the above code simply opens and closes the file, every file created
> is zero length, and it creates _many_ zero-length files.
> >
> Why would you want that?

I didn't explicitly _want_ zero length files, I just did the minimum to
generate the files. I can easily go back and write one byte to the files,
but that (shouldn't) really have an impact on the operations against the
files created by reiser_fract_tree and later
modified/read/overwritten/deleted by later phases because the files created
by MKFILES are in directories not manipulated by the stock mongo phases.
They use the files and directories created by reiser_fract_tree. The reason
I added the dirs and files created by MKDIRS/FILES was to have mongo work
with a filesystem 'loaded' with as much metadata as a real system might
have. If this adds nothing to the benchmarking then simply run with
MKFILES=off and MKDIRS=off.


> >
> >I made the following changes, see http://dabbs.net/reiser4/mongopl.html
> for more context.
> >
> >In
> >
> >init_fsys:
> >   don't unmount the filesystem after mkfs * df.
> >
> >mongo_launcher:
> >   don't call &mount_fsys; at beginning and &umount_fsys; at end of each
> >phase
> >
> >
> >Only umount_fsys at end of function mongo.
> >
> >
> >David
> >
> >
> ok.  Unmounting between phases was probably a bad idea, as it benchmarks
> unmounting.  It should be fixed.

Mounting/umounting between phases shouldn't cause errors, but I focused
there because the errors I saw didn't begin until the copy phase, which is
the first phase where mongo _reads_ what was created. Perhaps something is
not being committed, at least with my hardware/config, despite the fact that
there's a sync at the end of every phase iteration. I also added a sync
command before the final umount.

David



