From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Mon, 17 Jul 2006 20:26:49 -0400
Message-ID: <200607180026.k6I0Qo1m010430@laptop11.inf.utfsm.cl>
References: <reiser@namesys.com>
Return-path: <reiserfs-list-return-29054-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Hans Reiser <reiser@namesys.com> 
   of "Mon, 17 Jul 2006 14:03:09 MST." <44BBFB0D.6040105@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Jeff Mahoney <jeffm@suse.com>, 7eggert@gmx.de, Eric Dumazet <dada1@cosmosbay.com>, ReiserFS List <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

Hans Reiser <reiser@namesys.com> wrote:
> Jeff Mahoney wrote:
> > Hans Reiser wrote:
> > >Jeff Mahoney wrote:
> > >>1) Because then the behavior of /proc/fs/reiserfs/ would be
> > >>inconsistent. Devices that contain slashes end up being one level deeper
> > >>than other devices, which is silly and a userspace visible change.
> >
> > >And you think translating / to ! is less work for user space?
> >
> >
> > A one line s#/#!# to access devices they couldn't before versus now
> > having to deal with going deeper into a tree for no real reason? Yes,
> > I do.

> I am willing to bet that perl can tree iterate with one line of code....

;-)

> Please read the Hideous Name by Rob Pike.

Interesting read.

>                                           You are making it more hideous.

By insisting that something that is /not/ a directory /is/ written as such?
Sorry, they are asking for exactly the opposite.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
