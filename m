From: Pavel Machek <pavel@ucw.cz>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 2 Sep 2004 22:58:57 +0200
Message-ID: <20040902205857.GF8653@atrey.karlin.mff.cuni.cz>
References: <rlrevell@joe-job.com> <1094079071.1343.25.camel@krustophenia.net> <200409021425.i82EPn9i005192@laptop11.inf.utfsm.cl> <1535878866.20040902214144@tnonline.net> <20040902194909.GA8653@atrey.karlin.mff.cuni.cz> <1094155277.11364.92.camel@krustophenia.net> <20040902204351.GE8653@atrey.karlin.mff.cuni.cz> <1094158060.1347.16.camel@krustophenia.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21333-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1094158060.1347.16.camel@krustophenia.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Revell <rlrevell@joe-job.com>
Cc: Spam <spam@tnonline.net>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jamie Lokier <jamie@shareable.org>, David Masover <ninja@slaphack.com>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Hi!

> > Application does not have to know how to handle tar/zip/etc, but it
> > has to make distinction between "enter archives" and "do not enter
> > archives". See uservfs.sf.net.
> 
> But how do you cache the information you had to look in the archive for
> in a way that other apps can use it?  How do you synchronize access to
> the cache and maintain cache coherency in userspace?

Uservfs.sf.net.

Unlike alan, I do not think that "do it all in library" is good
idea. I put it in the userspace as "codafs" server, and let
applications see it as a regular filesystem.
							Pavel
