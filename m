From: Dave Kleikamp <shaggy@austin.ibm.com>
Subject: Re: The argument for fs assistance in handling archives (was:
	silent semantic changes with reiser4)
Date: Thu, 02 Sep 2004 12:41:52 -0500
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <1094146912.31495.13.camel@shaggy.austin.ibm.com>
References: <20040826150202.GE5733@mail.shareable.org>
	 <200408282314.i7SNErYv003270@localhost.localdomain>
	 <20040901200806.GC31934@mail.shareable.org>
	 <Pine.LNX.4.58.0409011311150.2295@ppc970.osdl.org>
	 <1094118362.4847.23.camel@localhost.localdomain>
	 <20040902161130.GA24932@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040902161130.GA24932@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, 2004-09-02 at 11:11, Jamie Lokier wrote:

> Firstly, if I have to do it from a Gnome program, about the only
> program where looking in a tar file is visibly useful is Nautilus.
> Ironically, clicking on a tar file in Nautilus doesn't work, despite
> having a dependency on gnome-vfs2. :/

This should be fixed in Nautilus, not the kernel.

> Secondly, no, Gnome and MC don't support entering a container file,
> letting you make changes in it, and remembering those changes to
> _lazily_ regenerate the container file when you need it linearized,
> possibly months later or never, by some unrelated program.

Why do this in a tar file?  tar = "tape archive".  It isn't designed to
be a file system.  Sure, it's nice to have tools that make it easier to
access files in a tar file, but to this isn't a job for the kernel.

> Thirdly, you must be referring to the Gnome versions of Bash, Make,
> GCC, coreutils and Perl which I haven't found.  Perhaps we have a
> different idea of what "supports this" means :)

Please don't tell me that we have expectations to run make from within a
tar file.  This is getting silly.  tar does a pretty good job of
extracting files into real directories, and putting them back into an
archive.  I don't see a need to teach the kernel how to deal with
compound files when user space can do it very easily.

Shaggy

