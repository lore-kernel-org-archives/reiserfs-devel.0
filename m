From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 13:24:36 -0700 (PDT)
Message-ID: <Pine.LNX.4.58.0408251323170.17766@ppc970.osdl.org>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
 <20040825200859.GA16345@lst.de> <20040825201929.GA16855@lst.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20512-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040825201929.GA16855@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>
Cc: Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>



On Wed, 25 Aug 2004, Christoph Hellwig wrote:
> 
> Over the last at least five years we've taken as much as possible
> semantics out of the filesystems and into the VFS layer, thus having
> a separation between the semantical layer (VFS) and the low level
> filesystem.  Your attributes are absoultely a VFS thing and as such
> should not happen at the filesystem layer, and no, that doesn't mean
> they're bad per se, I just think they are a rather bad fit for Linux.

Now this I agree with, in the sense that I think that if we want to 
support this, it should be supported at a VFS layer. 

On the other hand, I think doing it inside the filesystem with ugly hacks 
is an acceptable way to prototype the idea before it's been proven to 
really be workable. Maybe it has more problems with legacy apps than we'd 
expect..

		Linus
