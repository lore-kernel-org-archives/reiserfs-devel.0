From: Pavel Machek <pavel@ucw.cz>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 31 Aug 2004 10:21:44 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040831082144.GA535@elf.ucw.cz>
References: <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org> <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk> <20040826001152.GB23423@mail.shareable.org> <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk> <20040826010049.GA24731@mail.shareable.org> <20040826100530.GA20805@taniwha.stupidest.org> <20040826110258.GC30449@mail.shareable.org> <20040827210638.GE709@openzaurus.ucw.cz> <4133CDA6.4060105@slaphack.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4133CDA6.4060105@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hi!

> | uservfs does
> |
> | cd foo.deb#uar
> cd foo.deb/ar
> | vs.
> | cd foo.deb#udeb
> cd foo.deb/deb
> 
> and why would you want that, instead of just:
> cd foo.deb	# for the ar
> dpkg -i foo.deb	# for the deb

Because I want to see contents of that .deb package, nicely parsed?

> Just want to extract the tar file?  Maybe something like
> cat foo.tgz/gunzip
> In which case (of course) foo.tgz/gunzip has exactly the same directory
> contents as foo.tgz

Yes, that would work.

> In fact, for just about any syntax anyone could suggest, I can't really
> see why you can't just replace all weird symbols with a slash and a
> symbol.  Instead of
> 	foo.tgz#utar
> you have
> 	foo.tgz/#/utar
> Only difference is, some things which used to require special tools can
> now be serviced by less than what's in busybox.

That would work, too. I do not get your comment about busybox.
								Pavel
-- 
People were complaining that M$ turns users into beta-testers...
...jr ghea gurz vagb qrirybcref, naq gurl frrz gb yvxr vg gung jnl!
