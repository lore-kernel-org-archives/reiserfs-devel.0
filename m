From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4 plugins
Date: Tue, 28 Jun 2005 00:52:31 +0400
Message-ID: <200506280052.32571.vitaly@namesys.com>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl> <42BB7B32.4010100@slaphack.com> <42BC6307.3080808@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24719-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BC6307.3080808@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, vitaly@thebsh.namesys.com, Alan Cox <alan@lxorguk.ukuu.org.uk>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Friday 24 June 2005 23:46, Hans Reiser wrote:
> David Masover wrote:
> 
> 
> >
> >
> > I was able to recover from bad blocks, though of course no Reiser that I
> > know of has had bad block relocation built in...  
> 
> there was a patch somewhere.  Vitaly, please comment.

http://www.namesys.com/bad-block-handling.html describes 
how reiserfs handles bad blocks.

-- 
Thanks,
Vitaly Fertman
