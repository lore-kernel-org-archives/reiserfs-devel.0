From: Pavel Machek <pavel@ucw.cz>
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Fri, 3 Sep 2004 17:44:31 +0200
Message-ID: <20040903154431.GB1396@elf.ucw.cz>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21437-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hi!

> I bet you could write a small library to test this out for a few types.  
> See if it's useful to you. And only if it's useful (and would make a huge
> performance difference) would it be worth putting in the kernel.

It seemed really usefull in uservfs incarnation. Unfortunately the
daemon was not multihreaded at that time, so it was not really usefull
on multiuser systems :-(

> Implementation of the _user_space_ library would be something like this:
> 
> 	#define MAXNAME 1024
> 	int open_cached_view(int base_fd, char *type, char *subname)

Well, you'd need more than simple open. For caching tar (etc), you'd
need stat_cached_view and opendir_cached_view and ...

And this really works, only that its called mc_open(), mc_stat() etc.

Gnome actually uses newer incarnation of mc_open etc, but they had to
introduce rather ugly interface to make it asynchronous.
								Pavel
-- 
When do you have heart between your knees?
