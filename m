From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Re: Heuristic readahead for filesystems - GetDirEnts for Attributes
Date: Wed, 11 Sep 2002 14:58:59 EDT (-0400)
Message-ID: <21062363137-BeMail@CR593174-A>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11425-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs List <reiserfs-list@namesys.com>

> In theory, this also could be implemented explicitly if the application
> could tell the kernel "I'm going to read these 100 files in the very
> near future, please make them ready for me". But wait, maybe the
> application can do this (for regular files, not for directory entries
> and stat() data): Could it be efficient if the application used
> open(file,O=5FNONBLOCK) for the next 100 files and subsequent read()s on
> each of the returned filedescriptors=3F

We were discussing something similar for a new system call in OpenBeOS.
Rather than opening each file and reading the stat info and attribute
info separately, we were thinking of having one call for all that.
Kind of like an enhanced getdirentries() call.

The user would specify which metadata they were interested in (as a
list of attribute names, some would be "magic" aliases for getting
that old fashioned stat info) and a directory to examine (or maybe just
a single file, though the benefits wouldn't be as great).  This saves
several calls into kernel space, even if it doesn't happen to save any
disk IO (small attributes are packed into one disk sector).  So now
when the desktop displays a directory window, it will take one call
rather than separate ones to read each file's size, icon, MIME type,
etc.

- Alex


