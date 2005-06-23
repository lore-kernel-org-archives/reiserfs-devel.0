From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 00:43:46 +0100
Message-ID: <1119570225.18655.75.camel@localhost.localdomain>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl>
	 <42BB31E9.50805@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24522-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BB31E9.50805@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Iau, 2005-06-23 at 23:04, David Masover wrote:
> > What for? It works just fine as it stands, AFAICS.
> 
> So does DOS.  Do you use DOS?  I don't even use DOS to run DOS programs.

False argument. So does the pen, so do hinges on doors. Do you still
have hinges on your doors - probably.

> "Ain't broke" is the battle cry of stagnation.

Its also the battle cry of everyone over the age of 20 who also has a
real job to do 8)

> But, there are some things Reiser does better and faster than ext3, even
> if you don't count file-as-directory and other toys.  There's nothing
> ext3 does better than Reiser, unless you count the compatibility with
> random bootloaders and low-level tools.

Certainly compared with reiser3 you've missed a few out including
resilience to disk errors (nearly nil on reiser3), and SMP scaling.

> You know how many I've had thrashed on Reiser4?  Two.  The first one was
> with a VERY early alpha/beta, and the second one was when I dropped a
> laptop and the disk failed.

Entirely or bad blocks ? The latter should have a minimal cost on a well
designed fs.

> Duplication of effort.  With plugins, we can optimize the upper layers
> of ALL filesystems, regardless of the lower layers, in such a way that

In which case the features belong in the VFS as all those with
experience and kernel contributions have been arguing.


