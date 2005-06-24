From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 11:32:06 -0400
Message-ID: <200506241532.j5OFW79b013979@laptop11.inf.utfsm.cl>
References: <reiser@namesys.com>
Return-path: <reiserfs-list-return-24554-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Hans Reiser <reiser@namesys.com> 
   of "Fri, 24 Jun 2005 01:23:08 MST." <42BBC2EC.2080000@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Lincoln Dale <ltd@cisco.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser <reiser@namesys.com> wrote:
> Lincoln Dale wrote:
> >> Now, if his target is reduced to whether we can eliminate a function
> >> indirection, and whether we can review the code together and see if it
> >> is easy to extend plugins and pluginids to other filesystems by finding
> >> places to make it more generic and accepting of per filesystem plugins,
> >> especially if it is not tied to going into 2.6.13, well, that is the
> >> conversation I would have liked to have had.

> > fantastic - some common ground.
> > any reason WHY there has to be an abstraction of 'pluginid' when in
> > theory VFS operations can already provide the necessary abstraction on
> > a per-object basis?

> VFS supplies instances, plugins are classes.  If a language can
> instantiate an object, that does not eliminate the value of being able
> to create classes.

In OOP speak, VFS is an abstract class, each individual filesystem derives
from this class giving a concrete class, a specific on-disk (or whereever)
filesystem is an object of its (concrete) class. The rest of the kernel (as
a client) doesn't care for the concrete classes, it speaks only (or mostly)
in terms of the abstract class (VFS). And concrete filesystems in turn use
the generic block layer.

> Does it make sense to you now?

No. Sounds jumbled up and backwards. And I don't see how "languages" could
even enter the picture here.

Again: Is there any (sane) way the /existing/ VFS can be used to express
what you want? What are the /minimal/ changes to VFS so each extension can
be catered for in an uniform way across filesystems (anything else destroys
the core idea of having a VFS in the first place!)? What are the required
changes in the clients of VFS (i.e., changes to the core kernel)? What
would be the impact on existing filesystems that /don't/ use new
functionality (this is a lot harder, because it impacts many independent
pieces of code)? What would be required for an existing filesystem to
incorporate it?

When all this is answered, go over the implementation details. But that is
far off still.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513

