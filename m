From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: The argument for fs assistance in handling archives (was:
	silent semantic changes with reiser4)
Date: Thu, 02 Sep 2004 19:46:05 +0100
Message-ID: <1094150760.5809.30.camel@localhost.localdomain>
References: <20040826150202.GE5733@mail.shareable.org>
	 <200408282314.i7SNErYv003270@localhost.localdomain>
	 <20040901200806.GC31934@mail.shareable.org>
	 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
	 <1094118362.4847.23.camel@localhost.localdomain>
	 <Pine.LNX.4.58.0409021045210.2295@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21310-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0409021045210.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Iau, 2004-09-02 at 18:46, Linus Torvalds wrote:
> > Gnome already supports this in the gnome-vfs2 layer. "MC" has supported
> > it since the late 1990's.
> 
> And nobody has asked for kernel support that I know of.

I asked our desktop people. They want something like inotify because
dontify doesn't cut it. They have zero interest in the multiple streams
and hiding icons in streams type stuff.

Alan

