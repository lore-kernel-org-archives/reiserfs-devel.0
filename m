From: Gunnar Ritter <Gunnar.Ritter@pluto.uni-freiburg.de>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 07 Sep 2004 14:26:22 +0200
Message-ID: <413DA8EE.nailA301JQ74H@pluto.uni-freiburg.de>
References: <200409070206.i8726vrG006493@localhost.localdomain>
 <413D4C18.6090501@slaphack.com> <m3d60yjnt7.fsf@zoo.weinigel.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21561-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3d60yjnt7.fsf@zoo.weinigel.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>, Christer Weinigel <christer@weinigel.se>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Tonnerre <tonnerre@thundrix.ch>, Spam <spam@tnonline.net>, ReiserFS List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>, Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Jamie Lokier <jamie@shareable.org>, Christoph Hellwig <hch@lst.de>, Alexander Lyamin aka FLX <flx@namesys.com>, Chris Wedgwood <cw@f00f.org>, Christer Weinigel <christer@weinigel.se>

Christer Weinigel <christer@weinigel.se> wrote:

> Additionally, files-as-directores does not solve the problem of 
> "cp a b" losing named streams.  There is curently no copyfile syscall
> in the Linux kernel, "cp a b" essentially does "cat a >b".  So unless
> cp is modified we don't gain anything.  If cp is modified to know
> about named streams, it really does not matter if named streams are
> accessed as file-as-directories, via openat(3) or via a shared library
> with some other interface.

You cannot just 'modify cp'. cp is a programming interface standardized
in POSIX.1. You can of course add non-standard extensions to some cp
implementations, but it seems hardly evitable then that you either have
to use cp in a non-standard manner regularly with Linux or risk to lose
data.

This is even more severe with tar/pax. Just patching GNU tar for file
streams, as it was suggested earlier in this discussion, is still far
away from a real solution because it neither solves the issues with
the POSIX.1 pax standard nor those with other implementations of it.

Given these facts, it does not seem so clear to me that adding named
streams for Windows and Mac OS interoperability would be a win to Linux
in the end. The loss of interoperability to Unix/POSIX/today's Linux
might have much worse effects.

The current xattr extension is much less of a problem because it only
holds metadata, which is mostly not applicable to other environments
anyway.

	Gunnar

-- 
http://omnibus.ruf.uni-freiburg.de/~gritter
