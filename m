From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 01:05:35 -0400
Message-ID: <200506270505.j5R55Zsx005315@laptop11.inf.utfsm.cl>
References: <ninja@slaphack.com>
Return-path: <reiserfs-list-return-24659-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from David Masover <ninja@slaphack.com> 
   of "Sun, 26 Jun 2005 19:16:48 EST." <42BF4570.9010405@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

David Masover <ninja@slaphack.com> wrote:
> Hans Reiser wrote:

[...]

> > Reiser4 plugins are not per user, but per kernel.  They are compiled
> > in.  The model is intended to ease the development process, nothing
> > more.  Apologies if the naming suggests more.

What do you gain by this? It is just a kernel configuration option of
sorts? Just name mangling of existing mechanisms for no good reason at all?

> But, to avoid confusion, the inclusion of a crytocompress plugin in a
> given kernel doesn't mean that all files accessed from that kernel are
> encrypted and compressed.  It just means that you can pick an individual
> file and set it to be transparently encrypted/compressed.
> 
> That is what I meant by "enabled".  Not per-user, but per-file.

Wonderful! I carefully "transparently encrypt" my secret files, so
/everybody/ can read them! Now /that/ is progress!
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
