From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: The argument for fs assistance in handling archives (was: silent
 semantic changes with reiser4)
Date: Wed, 1 Sep 2004 18:07:36 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0409011800270.2295@ppc970.osdl.org>
References: <20040826150202.GE5733@mail.shareable.org>
 <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org>
 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <20040902002431.GN31934@mail.shareable.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21240-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040902002431.GN31934@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>



On Thu, 2 Sep 2004, Jamie Lokier wrote:
> 
> This is where the file-as-directory metadata stuff is so potentially
> interesting.  It's actually a nice interface that every program can see.

.. but you can _still_ do exactly this in a user-space library and 
prototype it. Just take over "open" (and opendir/readdir), and you can do 
so.

> To be fair, the whole thing could be prototyped (with glitches, but
> enough to demonstrate) in userspace, running everything through
> something like uservfs or even NFS, especially with file-as-directory
> being blessed at the VFS level.

I do believe that you can prototype it even without any kernel support.

This is why I want to have stronger reasons for real VFS support. I see
the Samba argument, and I buy that one, if only because it has such a high
consistency requirement (let's face it, people expect more guarantees of
their file servers than of most other things). But on the other hand, the
Samba guys apparently _are_ happy with "openat()", so they don't
necessarily need any normal namespace stuff.

And I suspect that a user-level prototype would show that what you 
_really_ want may be something else altogether..

		Linus
