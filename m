From: Pavel Machek <pavel@ucw.cz>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 2 Sep 2004 22:42:25 +0200
Message-ID: <20040902204225.GD8653@atrey.karlin.mff.cuni.cz>
References: <rlrevell@joe-job.com> <1094079071.1343.25.camel@krustophenia.net> <200409021425.i82EPn9i005192@laptop11.inf.utfsm.cl> <1535878866.20040902214144@tnonline.net> <1094151338.5645.32.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21327-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1094151338.5645.32.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Spam <spam@tnonline.net>, Horst von Brand <vonbrand@inf.utfsm.cl>, Lee Revell <rlrevell@joe-job.com>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hi!

> > > It is trivial to implement this by looking inside the files. I.e., the way
> > > mc has done this for ages.
> > 
> >   Difference is that you can't do "locate" or "find" or "Search".. You
> >   would have to open the files in an archive-supporting application
> >   such as mc.
> 
> And would you rather that logic was running swappable in shared library
> space or privileged and unswappable in kernel ?

Well, having it in kernel mean that cache gets actually shared between
different processes -- and that's usefull. With coda and similar tools
you can put most of the logic into userspace (kernel impact is 20
lines). You *will* want it to run priviledged, because otherwise
caches are useless.
								Pavel
