From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: The argument for fs assistance in handling archives (was: silent
 semantic changes with reiser4)
Date: Thu, 2 Sep 2004 11:03:52 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0409021059230.2295@ppc970.osdl.org>
References: <20040826150202.GE5733@mail.shareable.org>
 <200408282314.i7SNErYv003270@localhost.localdomain> <20040901200806.GC31934@mail.shareable.org>
 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
 <1094118362.4847.23.camel@localhost.localdomain> <Pine.LNX.4.58.0409021045210.2295@ppc970.osdl.org>
 <20040902175034.GA18861@lst.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21300-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040902175034.GA18861@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>



On Thu, 2 Sep 2004, Christoph Hellwig wrote:
> 
> http://oss.oracle.com/projects/userfs/ has code that clues gnomevfs onto
> a kernel filesystem.  The code is horrible, but it shows that it can
> be done.

I do like the setup where the extended features are done as a "view" on 
top of some other filesystem, so that you can choose to _either_ access 
the raw (and supposedly stable, simply by virtue of simplicity) or the 
"fancy" interface. Without having to reformat the disk to a filesystem you 
don't trust, or you have other reasons you can't use (disk sharing with 
other systems, whatever).

It doesn't have to be "user", btw, in the sense that a lot of the normal 
code could be in kernel mode. Same way as Tux handling all the regular 
static requests entirely in kernel mode, but having the ability for 
calling down to apache..

		Linus
