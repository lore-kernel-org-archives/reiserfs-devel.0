From: Chris Mason <mason@suse.com>
Subject: Re: Quicker alternative to "find /"?
Date: Mon, 16 Aug 2004 10:21:12 -0400
Message-ID: <1092666072.12138.104.camel@watt.suse.com>
References: <20040815231640.3c926886.felix.klee.reiserfs@gmx.net>
	 <1092660765.28417.4.camel@leto.cs.pocnet.net>
	 <216013485.20040816151904@tnonline.net>
	 <1092663168.12138.46.camel@watt.suse.com>
	 <104591417.20040816155423@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20332-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <104591417.20040816155423@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

On Mon, 2004-08-16 at 09:54, Spam wrote:

> > It varies by filesystem.  The filenames and folder names are stored in
> > one place on almost all filesystems.  But, the actual inode information
> > that tells you what kind of file it is and how to read the file are
> > sometimes stored in a different place (v3, ext[23]).
> 
> > find has to read both sets of information because a recursive find has
> > to descend into all subdirectories, and the only way it can know if
> > something is a subdirectory is by reading the inode.  There is an
> > optimization that ext[23] use to store the mode information (identifying
> > things as a file or dir) in the directory listing.  reiserfs v3 doesn't
> > have this in the disk format, not sure if v4 does or not.
> 
>   Yes  I understand what you are saying. I do not think this behaviour
>   is  any  good.  It  would  mean  that at least two disk reads - also
>   physically apart from eachother on the disk would need to be read to
>   retrieve   this   type   of  information.  It  seem  quite  mad  and
>   unnessesary. :) But then I am not a FS developer. There are perhaps
>   good reasons to keep thing this way?

Well, I'm fairly sure v4 doesn't do it this way.  Hans wanted to fix
this long ago in v3 as well, but there wasn't time for the disk format
change.

One problem with keeping the inode information along with the directory
info is that files can be hard linked, meaning two directory entries
point to the same inode.  The disk format must be able to deal with the
situation where the first of the directory listings is removed but the
other links remain.

-chris


