From: William Lee Irwin III <wli@holomorphy.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 6 Sep 2004 23:28:06 -0700
Message-ID: <20040907062806.GL3106@holomorphy.com>
References: <200409070206.i8726vrG006493@localhost.localdomain> <413D4C18.6090501@slaphack.com> <413D4ED9.5090206@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <413D4ED9.5090206@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Christer Weinigel <christer@weinigel.se>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Mon, Sep 06, 2004 at 11:02:01PM -0700, Hans Reiser wrote:
> I just want to remind that no one has been able to offer a good way of 
> handling attributes/streams/metafiles other than reiser4 in which 
> CTRL-XCTRL-Ffilename within emacs to edit the stream/attribute/metafile 
> will work without modifying the emacs source.  David Masover is right 
> that there are far more application writers than kernel hackers, and we 
> should make the kernel more complicated if it makes a few thousand apps 
> simpler.

This thread is getting a bit soft on technical details and/or value.

Hans, please post the results of fsstress (the bits from ext3 cvs) on
reiser4 on SMP machines of non-i386 architectures (e.g. ppc64, sparc64,
ia64) as well as the results of transferring reiser4 filesystems
between machines whose PAGE_SIZE, wordsize and endianness vary.


-- wli
