From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 00:35:17 +0400
Message-ID: <20040825203516.GB4688@backtop.namesys.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20517-reiserfs=m.gmane.org@namesys.com>
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

On Wed, Aug 25, 2004 at 10:08:59PM +0200, Christoph Hellwig wrote:
> On Wed, Aug 25, 2004 at 12:53:28PM -0700, Hans Reiser wrote:
> > You ignored everything I said during the discussion of xattrs about how 
> > there is no need to have attributes when you can just have files and 
> > directories, and that xattrs reflected a complete ignorance of name 
> > space design principles.
> 
> Actually in most of the discussion you simply didn't participate.  While
> xattrs might not be the nicest interface they have the advantag of not
> breaking the SuS assumption of what directories vs files are, and they
> do not break the Linux O_DIRECTORY semantics that are defined and need
> to solve real-world races either.

Reiser4 may have a mount option for whoose who like or have to use traditional
O_DIRECTORY semantics.  There would be no /metas under non-directories, if user
wants that.

[ ... ]

-- 
Alex.
