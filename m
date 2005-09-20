From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 11:36:06 -0400
Message-ID: <200509201536.j8KFa6wn011651@laptop11.inf.utfsm.cl>
References: <nikita@clusterfs.com>
Return-path: <reiserfs-list-return-26127-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Nikita Danilov <nikita@clusterfs.com> 
   of "Tue, 20 Sep 2005 13:30:46 +0400." <17199.54982.637650.772991@gargle.gargle.HOWL> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <nikita@clusterfs.com>
Cc: stephen.pollei@gmail.com, Horst von Brand <vonbrand@inf.utfsm.cl>, Denis Vlasenko <vda@ilport.com.ua>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Nikita Danilov <nikita@clusterfs.com> wrote:
> Stephen Pollei writes:
>  > On 9/19/05, Horst von Brand <vonbrand@inf.utfsm.cl> wrote:
>  > > Nikita Danilov <nikita@clusterfs.com> wrote:
>  > > > It's other way around: declaration is guarded by the preprocessor
>  > > > conditional so that nobody accidentally use znode_is_loaded()
>  > > > outside of the debugging mode.

>  > > Since when has a missing declaration prevented anyone calling a
>  > > function in C?!

> It issues a warning, which is enough, given that reiser4 code was
> warning-free most of the time.

It is supposed to go into the kernel, which is not exactly warning-free.
Besides, you don't know what idiotic new warnings the gcc people might
dream up the next round, so just relying on no warnings is extremely
unwise.

As was said before: It it is /really/ wrong, arrange for it not to compile
or not to link. If it isn't, well... then it wasn't that wrong anyway.
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513

