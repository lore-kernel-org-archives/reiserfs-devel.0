From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Thu, 2 Sep 2004 23:00:27 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk>
References: <20040826150202.GE5733@mail.shareable.org> <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org> <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org> <1094118362.4847.23.camel@localhost.localdomain> <20040902203854.GA4801@janus> <1094160994.31499.19.camel@shaggy.austin.ibm.com> <20040902214806.GA5272@janus>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21338-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040902214806.GA5272@janus>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank van Maarseveen <frankvm@xs4all.nl>
Cc: Dave Kleikamp <shaggy@austin.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Sep 02, 2004 at 11:48:06PM +0200, Frank van Maarseveen wrote:
> mount is nice for root, clumsy for user. And a rather complicated
> way of accessing data the kernel has knowledge about in the first
> place. For filesystem images, cd'ing into the file is the most
> obvious concept for file-as-a-dir IMHO.

The hell it is.

a) kernel has *NO* *FUCKING* *KNOWLEDGE* of fs type contained on a device.
b) kernel has no way to guess which options to use
c) fs _type_ is a fundamental part of mount - device(s) (if any) involved
are arguments to be interpreted by that particular fs driver.
d) permissions required for that lovely operation (and questions like
whether we force nosuid/noexec, etc.) are nightmare to define.

Frankly, the longer that thread grows, the more obvious it becomes that
file-as-a-dir is a solution in search of problem.  Desperate search, at
that.
