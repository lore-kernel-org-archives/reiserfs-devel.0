From: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Mon, 31 Jul 2006 09:28:38 -0400
Message-ID: <200607311328.k6VDScg6003611@laptop13.inf.utfsm.cl>
References: <reiser@namesys.com>
Return-path: <reiserfs-list-return-29291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Hans Reiser <reiser@namesys.com> 
   of "Fri, 28 Jul 2006 19:36:07 CST." <44CABB87.3050509@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Linus Torvalds <torvalds@osdl.org>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, Jeff Garzik <jeff@garzik.org>, Andrew Morton <akpm@osdl.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser <reiser@namesys.com> wrote:
> David Masover wrote:
> > If indeed it can be changed easily at all.  I think the burden is on
> > you to prove that you can change it to be more generic, rather than
> > saying "Well, we could do it later, if people want us to..."

> None of the filesystems other than reiser4 have any interest in using
> plugins,

Then they are probably nonsense...

>          and this whole argument over how it should be in VFS is
> nonsensical because nobody but us has any interest in using the
> functionality.  The burden is on the generic code authors to prove that
> they will ever ever do anything at all besides complain.  Frankly, I
> don't think they will.  I think they will never produce one line of code.

It is /your/ burden to show that they are worthwhile. And if they are, thay
aren't worthwhile only in your pet filesystem...

> Please cite one ext3 developer who is signed up to implement ext3 using
> plugins if they are supported by VFS.

Have you asked?

> >> .  It also prevents users from getting
> >> advances they could be getting today, for no reason.

> > It prevents users from doing nothing.

> Most users not only cannot patch a kernel, they don't know what a patch
> is.  It most certainly does. 

Simple answer: Fork the kernel with all your grandiose plans, and see which
one wins. Open source, remember? It is not as if your only chance is to get
it into the official kernel.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
