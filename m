From: Christoph Hellwig <hch@lst.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:43:03 +0200
Message-ID: <20040826124303.GB431@lst.de>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <20040825203516.GB4688@backtop.namesys.com> <20040825205149.GA17654@lst.de> <20040825235409.GA23423@mail.shareable.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20654-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040825235409.GA23423@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Christoph Hellwig <hch@lst.de>, Alex Zarochentsev <zam@namesys.com>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Aug 26, 2004 at 12:54:09AM +0100, Jamie Lokier wrote:
> Christoph Hellwig wrote:
> > > Reiser4 may have a mount option for whoose who like or have to use
> > > traditional O_DIRECTORY semantics.  There would be no /metas under
> > > non-directories, if user wants that.
> > 
> > Again, O_DIRECTORY was added to solve a real-world race, not just for
> > the sake of it.  If you really want to add that option I'll research the
> > CAN number for you so you can named it after that - or just call it -o
> > insecure directly.
> 
> man open(2) explains that O_DIRECTORY is used by opendir() to prevent
> blocking when opening pipes and certain devices*, and should only by
> used by opendir (of course it isn't only used by opendir, as it's a
> handy optimisation).
> 
> In fact O_DIRECTORY is also used by Glibc to optimise away stat()
> before and fstat() after calls.
> 
> An O_NODEVICE flag would be equally secure, and more generally useful.

It would prevent the open device issue but you'd need another syscall.
Anyways, this is an existing API and chaging it now would suddenly
making everything that relies on it for that purpose insecure, so it's
completely out of option.

