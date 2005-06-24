From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 11:41:21 +0100
Message-ID: <1119609680.17066.81.camel@localhost.localdomain>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl>
	 <42BB31E9.50805@slaphack.com>
	 <1119570225.18655.75.camel@localhost.localdomain>
	 <42BB5E1A.70903@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24545-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BB5E1A.70903@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Gwe, 2005-06-24 at 02:12, Hans Reiser wrote:
> >In which case the features belong in the VFS as all those with
> >experience and kernel contributions have been arguing.
> So you fundamentally reject the prototype it in one fs and then abstract
> it to others development model?

More fundamentally - prototype things *out* of the main kernel. If
everyone was doing their prototyping in kernel Andrew Morton would by
now be a team of about 25

Alan

