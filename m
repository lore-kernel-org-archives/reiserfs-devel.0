From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 06 Sep 2004 23:02:01 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <413D4ED9.5090206@namesys.com>
References: <200409070206.i8726vrG006493@localhost.localdomain> <413D4C18.6090501@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <413D4C18.6090501@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Spam <spam@tnonline.net>, Tonnerre <tonnerre@thundrix.ch>, Christer Weinigel <christer@weinigel.se>, Linus Torvalds <torvalds@osdl.org>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

I just want to remind that no one has been able to offer a good way of 
handling attributes/streams/metafiles other than reiser4 in which 
CTRL-XCTRL-Ffilename within emacs to edit the stream/attribute/metafile 
will work without modifying the emacs source.  David Masover is right 
that there are far more application writers than kernel hackers, and we 
should make the kernel more complicated if it makes a few thousand apps 
simpler.
