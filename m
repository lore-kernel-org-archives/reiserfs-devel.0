From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 00:54:09 +0100
Message-ID: <20040825235409.GA23423@mail.shareable.org>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <20040825203516.GB4688@backtop.namesys.com> <20040825205149.GA17654@lst.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20543-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040825205149.GA17654@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, Alex Zarochentsev <zam@namesys.com>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

Christoph Hellwig wrote:
> > Reiser4 may have a mount option for whoose who like or have to use
> > traditional O_DIRECTORY semantics.  There would be no /metas under
> > non-directories, if user wants that.
> 
> Again, O_DIRECTORY was added to solve a real-world race, not just for
> the sake of it.  If you really want to add that option I'll research the
> CAN number for you so you can named it after that - or just call it -o
> insecure directly.

man open(2) explains that O_DIRECTORY is used by opendir() to prevent
blocking when opening pipes and certain devices*, and should only by
used by opendir (of course it isn't only used by opendir, as it's a
handy optimisation).

In fact O_DIRECTORY is also used by Glibc to optimise away stat()
before and fstat() after calls.

An O_NODEVICE flag would be equally secure, and more generally useful.

It's important that device nodes cannot be opened when O_DIRECTORY is
set.  This is compatible with reiser4 file-as-directory semantics, but
I don't know if reiser4 actually implements this.  If it does (and it
should) then there is no device blocking problem.

That leaves only the optimisation of fstat() in opendir().

But that begs the question: do we want opendir() to succeed on a reiser4 file?

It's up to us to decide if we like that semantic, or prefer a
different one such as the one I described before (path search enters
file-as-directory, but opendir() directly on it fails), or the Sun
syscalls someone mentioned.

-- Jamie


* Aside: O_NONBLOCK|O_NOCTTY is an effective way to prevent blocking on
many systems.  It's best if you can avoid opening devices at all though.
