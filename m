From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Thu, 23 Jun 2005 18:12:58 -0700
Message-ID: <42BB5E1A.70903@namesys.com>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl>	 <42BB31E9.50805@slaphack.com> <1119570225.18655.75.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24525-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1119570225.18655.75.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Alan Cox wrote:

> SMP scaling.

Reiser4 should do much better at this, as it was designed for it.  I
wish we had a nice hunking multiprocessor to verify that and work
through the inevitable unintended sources of bottlenecks though.

>  
>
>>You know how many I've had thrashed on Reiser4?  Two.  The first one was
>>with a VERY early alpha/beta, and the second one was when I dropped a
>>laptop and the disk failed.
>>    
>>
>
>Entirely or bad blocks ? The latter should have a minimal cost on a well
>designed fs.
>
>  
>
>>Duplication of effort.  With plugins, we can optimize the upper layers
>>of ALL filesystems, regardless of the lower layers, in such a way that
>>    
>>
>
>In which case the features belong in the VFS as all those with
>experience and kernel contributions have been arguing.
>  
>
So you fundamentally reject the prototype it in one fs and then abstract
it to others development model?


