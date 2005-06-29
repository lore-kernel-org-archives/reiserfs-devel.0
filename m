From: Pavel Machek <pavel@ucw.cz>
Subject: torturing filesystems [was Re: reiser4 plugins]
Date: Wed, 29 Jun 2005 18:44:29 +0200
Message-ID: <20050629164423.GD13336@elf.ucw.cz>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl> <42BB31E9.50805@slaphack.com> <1119570225.18655.75.camel@localhost.localdomain> <42BB7B32.4010100@slaphack.com> <1119612849.17063.105.camel@localhost.localdomain> <42BC5D2E.1070307@namesys.com> <1119806434.28644.15.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24806-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1119806434.28644.15.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Hi!

> > Alan, this is FUD.   Our V3 fsck was written after everything else was,
> > for lack of staffing reasons (why write an fsck before you have an FS
> > worth using).  As a result, there was a long period where the fsck code
> > was unstable.  It is reliable now. 
> > 
> > People often think that our tree makes fsck less robust.  Actually fsck
> > can throw the entire internal tree away and rebuild from leaf nodes, and
> > frankly that makes things pretty robust. 
> 
> I did a series of tests well after resier3 had fsck that consisted of
> modelling the behaviour of systems under error state. I modelled random
> bit errors, bit errors at a fixed offset (class ram failure), sector 4
> byte slip (known IDE fail case) and sectors going away.

Do you have that code somewhere? Best I could do was overwriting
random parts of partition with random data, you seem to have "more
interesting" failures...
							Pavel
-- 
teflon -- maybe it is a trademark, but it should not be.
