From: Christoph Hellwig <hch@lst.de>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 22:19:29 +0200
Message-ID: <20040825201929.GA16855@lst.de>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20507-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040825200859.GA16345@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

Btw, I just got reminded you might take my saying as an "piss of you're
idea stinks" or similar things.  So let me clarify again the actual
technical and project managment issues another time before we start
getting really personal :)

Over the last at least five years we've taken as much as possible
semantics out of the filesystems and into the VFS layer, thus having
a separation between the semantical layer (VFS) and the low level
filesystem.  Your attributes are absoultely a VFS thing and as such
should not happen at the filesystem layer, and no, that doesn't mean
they're bad per se, I just think they are a rather bad fit for Linux.

So now go on and try to work together with the other peope doing VFS
level work instead of hiding, or if you think you can't work together
with us search a nice research OS where you can take over the VFS layer,
if your ideas prove to be good I'm sure Linux will pick them up sooner
or later.

	Christoph
