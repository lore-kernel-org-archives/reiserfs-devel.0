From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: reiser4 plugins
Date: Sun, 26 Jun 2005 18:20:36 +0100
Message-ID: <1119806434.28644.15.camel@localhost.localdomain>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl>
	 <42BB31E9.50805@slaphack.com>
	 <1119570225.18655.75.camel@localhost.localdomain>
	 <42BB7B32.4010100@slaphack.com>
	 <1119612849.17063.105.camel@localhost.localdomain>
	 <42BC5D2E.1070307@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24626-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BC5D2E.1070307@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Gwe, 2005-06-24 at 20:21, Hans Reiser wrote:
> Alan, this is FUD.   Our V3 fsck was written after everything else was,
> for lack of staffing reasons (why write an fsck before you have an FS
> worth using).  As a result, there was a long period where the fsck code
> was unstable.  It is reliable now. 
> 
> People often think that our tree makes fsck less robust.  Actually fsck
> can throw the entire internal tree away and rebuild from leaf nodes, and
> frankly that makes things pretty robust. 

I did a series of tests well after resier3 had fsck that consisted of
modelling the behaviour of systems under error state. I modelled random
bit errors, bit errors at a fixed offset (class ram failure), sector 4
byte slip (known IDE fail case) and sectors going away.

Reiserfs didn't handle it anything like as gracefully as ext2. Its a
pretty easy experiment to write the code for and the results are
interesting.

