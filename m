From: Dave Kleikamp <shaggy@austin.ibm.com>
Subject: Re: The argument for fs assistance in handling archives (was:
	silent semantic changes with reiser4)
Date: Thu, 02 Sep 2004 16:36:34 -0500
Message-ID: <1094160994.31499.19.camel@shaggy.austin.ibm.com>
References: <20040826150202.GE5733@mail.shareable.org>
	 <200408282314.i7SNErYv003270@localhost.localdomain>
	 <20040901200806.GC31934@mail.shareable.org>
	 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
	 <1094118362.4847.23.camel@localhost.localdomain>
	 <20040902203854.GA4801@janus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21334-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040902203854.GA4801@janus>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank van Maarseveen <frankvm@xs4all.nl>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, 2004-09-02 at 15:38, Frank van Maarseveen wrote:
> Can it do this:
> 
> 	cd FC2-i386-disc1.iso
> 	ls
> 
> or this:
> 
> 	cd /dev/sda1
> 	ls
> 	cd /dev/floppy
> 	ls
> 	cd /dev/cdrom
> 	ls
> 
> ?

We have the mount command for that.  :^)
-- 
David Kleikamp
IBM Linux Technology Center

