From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: The argument for fs assistance in handling archives
Date: Wed, 1 Sep 2004 20:38:25 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0409012037300.2295@ppc970.osdl.org>
References: <20040826150202.GE5733@mail.shareable.org>
 <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org>
 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <20040902002431.GN31934@mail.shareable.org>
 <413694E6.7010606@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21244-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <413694E6.7010606@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>



On Wed, 1 Sep 2004, David Masover wrote:
> 
> And that is the right solution.  Not the only one, but the right one.
> Caching isn't the only thing sorely in need of transaction support right
> now.  Actually, I find it hard to think of anything on Linux which
> shouldn't have transactions -- why should /etc/fstab or
> /home/david/homework be more fragile than /var/lib/mysql?

It's easy to talk big. 

It's damn hard to _implement_ a complex system, and make it stable and 
bug-free, and support legacy applications.

There is a reason why we do only what _must_ be done in kernel space.

		Linus
