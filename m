From: Dave Kleikamp <shaggy@austin.ibm.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Fri, 03 Sep 2004 07:50:39 -0500
Message-ID: <1094215839.2680.17.camel@shaggy.austin.ibm.com>
References: <20040826150202.GE5733@mail.shareable.org>
	 <200408282314.i7SNErYv003270@localhost.localdomain>
	 <20040901200806.GC31934@mail.shareable.org>
	 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
	 <1094118362.4847.23.camel@localhost.localdomain>
	 <20040902161130.GA24932@mail.shareable.org>
	 <1094146912.31495.13.camel@shaggy.austin.ibm.com>
	 <4137B9FC.7040708@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21426-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4137B9FC.7040708@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Jamie Lokier <jamie@shareable.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, 2004-09-02 at 19:25, David Masover wrote:
> Dave Kleikamp wrote:
> [...]
> | Please don't tell me that we have expectations to run make from within a
> | tar file.  This is getting silly.  tar does a pretty good job of
> | extracting files into real directories, and putting them back into an
> | archive.  I don't see a need to teach the kernel how to deal with
> | compound files when user space can do it very easily.
> 
> Suppose I've got a tar file with an index attached.  Suppose it's
> something like /usr/src/linux.  Am I expected to extract all code for
> all architectures, with all drivers, all docs, etc?  Now, yes -- or I
> have to figure out exactly which ones I need before I extract them
> manually, one by one.

I don't think it's unreasonable to expect someone to either extract the
whole tar file, or identify what files they want from it.  If you think
there is too much in the tar file, roll your own with only the files you
need.

> But with tar support for make (and so on), files can be extracted on
> demand.  It's possible to do this in userspace, with named pipes, but
> that's much slower and insanely clumsy.

This doesn't justify bloating the kernel.  untar the darn thing and user
space does fine.

> This has further implications -- imagine a desktop, binary distro
> shipped with all files except the very most basic stuff as package
> archives.  They can all be extracted, on demand -- the first time I run
> OpenOffice.org, it's installed.  If there needs to be post-installation,
> that's handled by the .deb plugin (or whatever).

Are you saying install it on demand the first time it's run?  This
doesn't take any new kernel function.

Or are you saying that the files are never installed on the filesystem,
but always accessed from the package archives?  In this case, why not
ship each package as a compressed iso, and have the system mount the iso
to run the app.  I really don't see the point though, in that disk space
is very cheap these days.

> I don't know offhand how big OOo is.  I think it's something like this:
> ~ The installer is at most half (and maybe only a third) of the full
> installation. That's a HUGE optimization!

Optimization?  How much performance are you willing to give up to save a
little bit of disk space?

-- 
David Kleikamp
IBM Linux Technology Center

