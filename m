From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 3 Sep 2004 00:23:50 +0100
Message-ID: <20040902232350.GA32244@mail.shareable.org>
References: <rlrevell@joe-job.com> <1094155277.11364.92.camel@krustophenia.net> <200409022200.i82M0ihC026321@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21353-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200409022200.i82M0ihC026321@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Lee Revell <rlrevell@joe-job.com>, Pavel Machek <pavel@ucw.cz>, Spam <spam@tnonline.net>, David Masover <ninja@slaphack.com>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

Horst von Brand wrote:
> > > You really need archive support in find. At the very least you need
> > > option "enter archives" vs. "do not enter archives". Entering archives
> > > automagically is seriously wrong.
> 
> I have used find(1) for quite some time now, and have never (or very
> rarely) missed this.

I've occasionally had the need to search all files on my system for
the one file which contains a particular phrase -- all I remember is
the phrase.

Just doing "grep -R" was a tedious job: at least half an hour.

Sometimes, I want to search all source files on my system for a
particular word, for example to search for uses of a particular system
call or library function.

That would require something that could search through all the .tar.gz
files and .zip files (nested if necessary) as well as plain files.  It
would take so long -- hours at least, maybe more than a day -- that
I've never bothered doing such a thing.

"find "that entered archives really wouldn't help (although sometimes
"locate" that entered archives would be nice).

In other words, I'd use that capability if it was magically fast, but
as we expect it to be insanely slow (just grepping gigabytes is slow)
that makes it not so useful.

However, if we ever see that search engine index thing happen, it
would be a most excellent capability if it searched inside archive
files too.  I would definitely use that.  Not often, but occasionally I would.

-- Jamie
