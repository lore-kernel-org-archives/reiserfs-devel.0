From: Pavel Machek <pavel@ucw.cz>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 2 Sep 2004 21:49:09 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040902194909.GA8653@atrey.karlin.mff.cuni.cz>
References: <rlrevell@joe-job.com> <1094079071.1343.25.camel@krustophenia.net> <200409021425.i82EPn9i005192@laptop11.inf.utfsm.cl> <1535878866.20040902214144@tnonline.net>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1535878866.20040902214144@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Spam <spam@tnonline.net>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Lee Revell <rlrevell@joe-job.com>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hi!

> >> FWIW, this is how Windows does it now.  As of XP, 'Find files' has an
> >> option, enabled by default, to look inside archives.  If you tell it to
> >> look for a driver in a given directory it will also look inside .cab
> >> and .zip files.  It's extremely useful, I would imagine someone who uses
> >> XP a lot will come to expect this feature.
> 
> > It is trivial to implement this by looking inside the files. I.e., the way
> > mc has done this for ages.
> 
>   Difference is that you can't do "locate" or "find" or "Search".. You
>   would have to open the files in an archive-supporting application
>   such as mc.

You really need archive support in find. At the very least you need
option "enter archives" vs. "do not enter archives". Entering archives
automagically is seriously wrong.
								Pavel
