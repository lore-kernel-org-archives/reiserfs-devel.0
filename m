From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 2 Sep 2004 10:50:31 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0409021048340.2295@ppc970.osdl.org>
References: <20040826150202.GE5733@mail.shareable.org>
 <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org>
 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <20040902002431.GN31934@mail.shareable.org>
 <413694E6.7010606@slaphack.com> <Pine.LNX.4.58.0409012037300.2295@ppc970.osdl.org>
 <4136A14E.9010303@slaphack.com> <Pine.LNX.4.58.0409012259340.2295@ppc970.osdl.org>
 <4136C876.5010806@namesys.com> <Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org>
 <41371702.8030704@andrew.cmu.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21298-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41371702.8030704@andrew.cmu.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Bruce <bruce@andrew.cmu.edu>
Cc: Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>



On Thu, 2 Sep 2004, James Bruce wrote:
> Linus Torvalds wrote:
>
> >In other words, nobody is really ever going to take advantage of this. 
> >This is _not_ how technical advanncement happens. The way you get people 
> >to take advantage of something is to have a nice gradual ramp-up, not a 
> >sudden new feature that they can't realistically use.
> 
> Sure, but there are plenty of existing interfaces that you could 
> emulate. 

Absolutely. We should look at them, and whether they solve any issues. 

I'm not saying that Hans would have to make up a new interface. Quite the
reverse. One interface I suggested to use for attributes (and everybody
hates ;) was the existing one from Solaris. Similarly, there are probably 
perfectly fine interfaces for the issue of transactions..

		Linus
