From: James Bruce <bruce@andrew.cmu.edu>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 02 Sep 2004 08:50:10 -0400
Message-ID: <41371702.8030704@andrew.cmu.edu>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <20040902002431.GN31934@mail.shareable.org> <413694E6.7010606@slaphack.com> <Pine.LNX.4.58.0409012037300.2295@ppc970.osdl.org> <4136A14E.9010303@slaphack.com> <Pine.LNX.4.58.0409012259340.2295@ppc970.osdl.org> <4136C876.5010806@namesys.com> <Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21278-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Linus Torvalds wrote:

>...
>But _my_ point is, no user program is going to take _advantage_ of
>anything that only one filesystem on one system offers.
>
>So there's no point.
>
>It's much saner (from _any_ app standpoint) to roll their own database in 
>user space - that way it just works.
>
>In other words, nobody is really ever going to take advantage of this. 
>This is _not_ how technical advanncement happens. The way you get people 
>to take advantage of something is to have a nice gradual ramp-up, not a 
>sudden new feature that they can't realistically use.
>...
>

Sure, but there are plenty of existing interfaces that you could 
emulate.  One could make a small library to use a transactional 
filesystem to implement the Berkely DB interface (libdb) for example.  
So on filesystems without such support your app could use the regular 
userspace database, but on a transactional filesystem it'd just use 
regular files, which would simplify database management and likely 
increase performance over the userspace-only version (libdb is pretty 
slow).  In terms of functionality it'd just be a drop-in replacement, 
just like math libraries that use MMX/SSE when available.

    - Jim Bruce

