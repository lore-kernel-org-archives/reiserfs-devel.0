From: Jeff Garzik <jgarzik@pobox.com>
Subject: Re: reiser4 plugins
Date: Thu, 23 Jun 2005 21:45:32 -0400
Message-ID: <42BB65BC.1010703@pobox.com>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl>	 <42BB31E9.50805@slaphack.com> <1119570225.18655.75.camel@localhost.localdomain> <42BB5E1A.70903@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24529-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BB5E1A.70903@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser wrote:
> Alan Cox wrote:
>>>Duplication of effort.  With plugins, we can optimize the upper layers
>>>of ALL filesystems, regardless of the lower layers, in such a way that

>>In which case the features belong in the VFS as all those with
>>experience and kernel contributions have been arguing.

> So you fundamentally reject the prototype it in one fs and then abstract
> it to others development model?


For similar reasons, we don't let hardware vendors implement software 
RAID inside the hardware driver.  It's not appropriate at that level.

	Jeff


