From: Hans Reiser <reiser@namesys.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 02 Sep 2004 23:16:12 -0700
Message-ID: <41380C2C.1030609@namesys.com>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <1094118362.4847.23.camel@localhost.localdomain> <20040902203854.GA4801@janus> <1094160994.31499.19.camel@shaggy.austin.ibm.com> <20040902214806.GA5272@janus> <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk> <4137B5F5.8000402@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21403-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4137B5F5.8000402@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: viro@parcelfarce.linux.theplanet.co.uk, Frank van Maarseveen <frankvm@xs4all.nl>, Dave Kleikamp <shaggy@austin.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

I don't think streams are a good thing, I think that all of the 
different pieces of additional functionality necessary to emulate them 
with files and directories are a good thing.

Keeping streams out of linux was one of the (less important) ideas 
behind reiser4.  Streams are a rigid hack.  The toolkit that can emulate 
them, is useful, and the perceived importance of that emulation will 
fade as people start to use the toolkit for things that are much more 
fun than streams.

I agree with most of the rest of what you say though David.

Hans


David Masover wrote:

> File-as-a-dir has numerous advantages, but enough have been discussed.
> Short list is image mounts, tarballs, streams, metas, and namespace
> unification.  Longer list and explanations can be found if you RTFA.

