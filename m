From: Chris Mason <mason@suse.com>
Subject: Re: Quicker alternative to "find /"?
Date: Mon, 16 Aug 2004 09:32:48 -0400
Message-ID: <1092663168.12138.46.camel@watt.suse.com>
References: <20040815231640.3c926886.felix.klee.reiserfs@gmx.net>
	 <1092660765.28417.4.camel@leto.cs.pocnet.net>
	 <216013485.20040816151904@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20327-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <216013485.20040816151904@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Spam <spam@tnonline.net>
Cc: reiserfs-list@namesys.com

On Mon, 2004-08-16 at 09:19, Spam wrote:
> > Am Sonntag, den 15.08.2004, 23:16 +0200 schrieb Felix E. Klee:
> 
> >> I'd like to store the directory structure of a partition formatted as
> >> ReiserFS into a file. Currently, I use
> >> 
> >>     find / >file
> >> 
> >> This process takes approximately 5 minutes (the result is 26MB of
> >> data). Are there any alternative *quicker* ways to do this?
> 
> > The main problem is that find only uses one thread. This thread only
> > reads one directory at once and as a result of that you'll get a lot of
> > seeks.
> 
>   I am confused about this in general with most filesystems. I thought
>   that all filenames/foldernames etc were stored in one place and not
>   spread out over the intire filesystem.
> 
>   It seem to me very strange that things like find/ls -R etc takes so
>   so long just read/list files like this on any modern filesystem.

It varies by filesystem.  The filenames and folder names are stored in
one place on almost all filesystems.  But, the actual inode information
that tells you what kind of file it is and how to read the file are
sometimes stored in a different place (v3, ext[23]).

find has to read both sets of information because a recursive find has
to descend into all subdirectories, and the only way it can know if
something is a subdirectory is by reading the inode.  There is an
optimization that ext[23] use to store the mode information (identifying
things as a file or dir) in the directory listing.  reiserfs v3 doesn't
have this in the disk format, not sure if v4 does or not.

Different directories are likely to be stored in different areas of the
disk.  So, a multithreaded find that tries to read multiple dirs at once
is likely to introduce more seeks.

-chris


