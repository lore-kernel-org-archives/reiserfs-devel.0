From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Thu, 2 Sep 2004 23:33:24 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20040902223324.GG23987@parcelfarce.linux.theplanet.co.uk>
References: <1094118362.4847.23.camel@localhost.localdomain> <20040902203854.GA4801@janus> <1094160994.31499.19.camel@shaggy.austin.ibm.com> <20040902214806.GA5272@janus> <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk> <20040902220242.GA5414@janus> <20040902220640.GE23987@parcelfarce.linux.theplanet.co.uk> <20040902221133.GB5414@janus> <20040902221722.GF23987@parcelfarce.linux.theplanet.co.uk> <20040902222650.GA5523@janus>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21346-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040902222650.GA5523@janus>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank van Maarseveen <frankvm@xs4all.nl>
Cc: Dave Kleikamp <shaggy@austin.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, Sep 03, 2004 at 12:26:50AM +0200, Frank van Maarseveen wrote:
> On Thu, Sep 02, 2004 at 11:17:22PM +0100, viro@parcelfarce.linux.theplanet.co.uk wrote:
> > 
> > What knowledge does the kernel have about fs type that could deal with the
> > contents of given device?  Details, please.
> 
> Try a "make tags;grep SUPER_MAGIC tags".
> Or is it there for a different purpose?

RTFS and you'll see.  Individual fs generally knows how to check if it
would be immediately unhappy with given image (not all types do, BTW).
Exact form of checks depends on fs type; for crying out loud, there's
not even a promise that they are mutually exclusive!

Read the fucking source.  Read through the code that "chooses" fs type
of root fs.  Look at it.  Then use whatever you have between your ears.
