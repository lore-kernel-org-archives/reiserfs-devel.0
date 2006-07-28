From: "Horst H. von Brand" <vonbrand@inf.utfsm.cl>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Fri, 28 Jul 2006 10:02:04 -0400
Message-ID: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl>
References: <jeff@garzik.org>
Return-path: <reiserfs-list-return-29232-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Jeff Garzik <jeff@garzik.org> 
   of "Fri, 28 Jul 2006 07:15:11 -0400." <44C9F1BF.7040003@garzik.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jeff@garzik.org>
Cc: Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Linus Torvalds <torvalds@osdl.org>

Jeff Garzik <jeff@garzik.org> wrote:

[...]

> It is then simple to follow that train of logic:  why not make it easy
> to replace the directory algorithm [and associated metadata]?  or the
> file data space management algorithms?  or even the inode handling?
> why not allow customers to replace a stock algorithm with an exotic,
> site-specific one?

IMVHO, such experiments should/must be done in userspace. And AFAICS, they
can today.

Go wild, but leave the kernel alone.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
