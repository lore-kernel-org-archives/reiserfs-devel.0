From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Carrying Attributes too Far at Great Length
Date: Sat, 11 Oct 2003 19:55:30 -0400 EDT
Message-ID: <30216072281-BeMail@cr593174-a>
References: <1065747725.3f86050de1b25@webmail.st-andrews.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15835-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1065747725.3f86050de1b25@webmail.st-andrews.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

lrc1@st-andrews.ac.uk wrote on Fri, 10 Oct 2003 02:02:05 +0100:
> Should Cedric create photos/people/happy/good/ which links back to
> photos/people/happy/ , or should he create photos/people/good/happy/ ,
> which links back to photos/people/good/ ?)

Sure, you could have non-cyclic directory structures and just hard link
each individual file into all the relevant categories (directories).  But
sometimes I want to do a bunch of files, say a directory full of photos
from my vacation, and I want that to appear in directories identifying
the place and others identifying the people (.../cottage and
.../grandparents).  It isn't a full cycle, just multiple parents, but
supporting full cycles makes it easier to avoid implementation
problems with that (in case someone moves a parent directory inside
one of its children).  Or you could just disallow dangerous cycle
creating operations and avoid the full cycle implementation.

> However, there are certainly things in the current Unix implementation
> of hard linking that make multiple pathnames through hard links
> confusing and, yes, largely useless.

I want as much metadata about the file to be stored with the file (inode),
which means one unique file name.  One icon.  One set of attributes.  But
I also want some other things to be directory specific, such as the
desktop's icon position attributes.  I get around that by having an
Alias Generated Morphing Symbolic link (sort of a hybrid of a hard link,
a MacOS alias and a symbolic link).  The legacy OS sees it as a symbolic
link, which you can attach attributes to (such as icon position), yet it
also lets you deal with the file directly - the same difference as between
stat() and lstat(): http://www.FreeBSD.org/cgi/man.cgi?query=lstat

But it is not a real symbolic link since the target path string is
dynamically generated to identify the file's current true path.  If you
delete the other links to the file, the AGMS link "morphs" and becomes
the actual file (using a cunning sleight-of-hand inode swap under the hood).

> Given a full pathname, a file handle, or even an i-number, there must
> be a system call (or calls) to return all the hard-linked full pathnames
> of the given file, permissions allowing.  This removes the last advantage
> of using a symlink where you really want a hardlink [...]

With a list of parent links included in all inodes, you can do that.
It's just the doubly linked list vs single linked list concept - more
overhead, but we can afford it with modern hardware.

That's enough writing for now - I've recently finished my sabbatical and
started a full time game programming job.  Spare time for these interesting
discussions and code experiments has unfortunately vapourised, so I won't
be able to comment on everything said here.

- Alex
