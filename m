From: Lee Revell <rlrevell@joe-job.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 02 Sep 2004 13:47:49 -0400
Message-ID: <1094147268.11364.48.camel@krustophenia.net>
References: <200409021425.i82EPn9i005192@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21297-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409021425.i82EPn9i005192@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Jamie Lokier <jamie@shareable.org>, Pavel Machek <pavel@suse.cz>, David Masover <ninja@slaphack.com>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, 2004-09-02 at 10:25, Horst von Brand wrote:
> Lee Revell <rlrevell@joe-job.com> said:
> 
> [...]
> 
> > FWIW, this is how Windows does it now.  As of XP, 'Find files' has an
> > option, enabled by default, to look inside archives.  If you tell it to
> > look for a driver in a given directory it will also look inside .cab 
> > and .zip files.  It's extremely useful, I would imagine someone who uses
> > XP a lot will come to expect this feature.
> 
> It is trivial to implement this by looking inside the files. I.e., the way
> mc has done this for ages.

This requires a separate, MC-specific namespace.  The point is to unify
the namespace, not fragment it.

If Hans had a comprehensible web page, maybe more people would
understand this aspect of his argument.  Would you put digressions about
chaos theory and King Arthur in a man page?

Lee

