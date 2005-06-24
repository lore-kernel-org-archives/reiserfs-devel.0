From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Thu, 23 Jun 2005 23:49:51 -0700
Message-ID: <42BBAD0F.2040802@namesys.com>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl>	 <42BB31E9.50805@slaphack.com> <1119570225.18655.75.camel@localhost.localdomain> <42BB5E1A.70903@namesys.com> <42BB7083.2070107@cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24535-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BB7083.2070107@cisco.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lincoln Dale <ltd@cisco.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Lincoln Dale wrote:

>
> the irony of this whole thread is that history is repeating itself. 
> see http://www.ussg.iu.edu/hypermail/linux/kernel/0112.1/0519.html
> kernel developers pushed back on you 3 years ago - in 2001 - what has
> really changed?

It is exactly the same, but rather than dwell on that, I'll just remind
that I have sent out two technical emails which talk only about the
issue of plugins and pluginids, and whether plugins are classes rather
than just instances, and whether the classes really would benefit from
being instantiated into VFS at the cost of keeping the same info in two
places, and I got no answer on them.  Zam pointed out that our plugins
do more than just VFS operations, and got no response on that or his
other points.

Regarding trust, Christophe comes out the gate using the words "useless
abstraction layer" that happens to be a core feature of our design,
demanding we cut it out, and not really understanding it or recognizing
any functionality it provides, and you can't really expect me to respect
this, can you?

Now, if his target is reduced to whether we can eliminate a function
indirection, and whether we can review the code together and see if it
is easy to extend plugins and pluginids to other filesystems by finding
places to make it more generic and accepting of per filesystem plugins,
especially if it is not tied to going into 2.6.13, well, that is the
conversation I would have liked to have had.
