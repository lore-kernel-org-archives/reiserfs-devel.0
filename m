From: Hans Reiser <reiser@namesys.com>
Subject: Re: Directory updates in filesystems
Date: Fri, 29 Oct 2004 13:04:46 -0700
Message-ID: <4182A25E.6050808@namesys.com>
References: <1098955408.29128.TMDA@h34.zynet2.co.uk> <4181D47A.9050609@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22217-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4181D47A.9050609@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Simon Waters <simonw@zynet.net>, reiserfs-list@namesys.com

David Masover wrote:

> Simon Waters wrote:
> [...]
> | If you have multiple processes simultaneously accessing a directory with
> | rename of contents (additions and removals add more fun), a simple
> | opendir/readir loop will on occasion fail to find a file that exists
> (i.e.
> | the stem part of the file name is the same) because the file has been
> | renamed, on most filesystems on most *nix like systems tested.
>
> If this is about locking not working well with NFS, why not ensure that
> the directory itself is owned by root and read-only before attempting?
> Wait -- don't answer that...
>
> | Are there any file systems that fully address this issue, or POSIX
> calls that
> | guaranteed to make an atomic readdir, without specific locking, or 
> must a
> | lock be obtained on the directory to ensure that the read is
> consistent. I
> | think that locking is needed in the application if complete
> consistency is
> | required because the underlying behaviour of the OSes/filesystems is so
> | variable in this regard, but I'd be interested in understanding what
> | characteristics a filesystem would have to have to avoid this.
>
> Maybe an atomic readdir operation?  Does reiser4 do atomic reads?

Only writes at this time.  Will try to get the government to pay for us 
to do atomic reads someday.....;-)

