From: Pavel Machek <pavel@ucw.cz>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 1 Sep 2004 00:07:26 +0200
Message-ID: <20040831220726.GB16428@elf.ucw.cz>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl> <Pine.LNX.4.58.0408311252150.2295@ppc970.osdl.org> <20040831203226.GB16110@elf.ucw.cz> <Pine.LNX.4.58.0408311336580.2295@ppc970.osdl.org> <20040831205422.GD16110@elf.ucw.cz> <Pine.LNX.4.58.0408311357550.2295@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21185-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408311357550.2295@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, David Masover <ninja@slaphack.com>, Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hi!

> > > However, that said, user space can trivially cache things in the 
> > > filesystem, so while this may be a convenient feature, I think you should 
> > > look at perhaps doing it in the _shell_ instead..
> > 
> > That cache should disappear as soon as I need disk
> > space. I.e. userspace should never see -ENOSPC because of this kind of
> > caching. This need some kernel support. Ouch and cached file should
> > atomically go away as soon as main file changes, otherwise I do not
> > see how multiple processes could cooperate on caching...
> 
> Well, what other projects have done is to just reserve a certain amount of 
> disk for caching. See "ccache", which solves both of the above problems 
> (it doesn't shrink the cache on ENOSPC, but reserving diskspace is 
> accepted practice for things like this..)

Okay, that does work, it just is not really nice. Just as reserving
fixed ammount of space for disk cache is bad, reserving fixed ammount
of space for ccache (and similar) is bad. When there are few of such
caches, balancing between them starts to matter...
								Pavel
-- 
People were complaining that M$ turns users into beta-testers...
...jr ghea gurz vagb qrirybcref, naq gurl frrz gb yvxr vg gung jnl!
