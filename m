From: Christoph Hellwig <hch@lst.de>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 22:25:39 +0200
Message-ID: <20040825202539.GA17107@lst.de>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <20040825201929.GA16855@lst.de> <Pine.LNX.4.58.0408251323170.17766@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20514-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408251323170.17766@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Wed, Aug 25, 2004 at 01:24:36PM -0700, Linus Torvalds wrote:
> Now this I agree with, in the sense that I think that if we want to 
> support this, it should be supported at a VFS layer. 
> 
> On the other hand, I think doing it inside the filesystem with ugly hacks 
> is an acceptable way to prototype the idea before it's been proven to 
> really be workable. Maybe it has more problems with legacy apps than we'd 
> expect..

Oh, I'm the last person to tell anyone how to prototype things.  I just
don't want such inconsistancies in the mainline kernel.

