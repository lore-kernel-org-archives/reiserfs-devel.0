From: Christoph Hellwig <hch@infradead.org>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 25 Aug 2004 21:35:49 +0100
Message-ID: <20040825213549.A11531@infradead.org>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20515-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org>; from torvalds@osdl.org on Wed, Aug 25, 2004 at 01:22:55PM -0700
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Wed, Aug 25, 2004 at 01:22:55PM -0700, Linus Torvalds wrote:
> And yes, the semantics can _easily_ be solved in very unixy ways.
> 
> One way to solve it is to just realize that a final slash at the end 
> implies pretty strongly that you want to treat it as a directory. So what 
> you do is:
> 
>  - without the slash, a file-as-dir won't open with O_DIRECTORY (ENOTDIR)
>  - with the slash, it won't open _without_ O_DIRECTORY (EISDIR)
> 
> Problem solved. Very user-friendly, and very intuitive.

That would solve the O_DIRECTORY issue, the dentry aliasing still needs
work though with the semantics for link/unlink/rename.

Maybe Hans & you should start 2.7 to work this out? :)

