From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 01 Sep 2004 12:49:16 +0100
Message-ID: <1094039355.2475.38.camel@localhost.localdomain>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl>
	 <41352279.7020307@slaphack.com>  <41356321.4030307@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21207-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41356321.4030307@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Pavel Machek <pavel@ucw.cz>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Mer, 2004-09-01 at 06:50, Hans Reiser wrote:
> Yes, changing cat to use openat() is no big deal. 1-2% additional coding 
> cost for cat, who cares? 

Large cost on its own. The FSF would almost certainly reject such a
change until someone had written portable emulation of the feature for 
every other platform which would mean vendor patches which would
essentially mean it wouldn't happen.

I know I rarely agree with Hans but I think he's right on this one, it
has to work with the existing open() API.

Alan

