From: viro@parcelfarce.linux.theplanet.co.uk
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Fri, 3 Sep 2004 00:02:13 +0100
Sender: <viro@www.linux.org.uk>
Message-ID: <20040902230213.GI23987@parcelfarce.linux.theplanet.co.uk>
References: <1094160994.31499.19.camel@shaggy.austin.ibm.com> <20040902214806.GA5272@janus> <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk> <20040902220242.GA5414@janus> <20040902220640.GE23987@parcelfarce.linux.theplanet.co.uk> <20040902221133.GB5414@janus> <20040902221722.GF23987@parcelfarce.linux.theplanet.co.uk> <20040902222650.GA5523@janus> <20040902223324.GG23987@parcelfarce.linux.theplanet.co.uk> <20040902225634.GA5756@janus>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21350-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040902225634.GA5756@janus>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank van Maarseveen <frankvm@xs4all.nl>
Cc: Dave Kleikamp <shaggy@austin.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, Sep 03, 2004 at 12:56:34AM +0200, Frank van Maarseveen wrote:
> And that doesn't mean that the kernel should accept any fs image
> when a user tries to cd into the file.

No, it shouldn't.  It should say "it's not a directory, bugger off".
Which it does.
