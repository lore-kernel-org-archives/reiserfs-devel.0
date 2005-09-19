From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Mon, 19 Sep 2005 19:15:59 -0400
Message-ID: <200509192316.j8JNFxY8030819@inti.inf.utfsm.cl>
References: <nikita@clusterfs.com>
Return-path: <reiserfs-list-return-26106-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Nikita Danilov <nikita@clusterfs.com> 
   of "Sun, 18 Sep 2005 14:02:55 +0400." <17197.15183.235861.655720@gargle.gargle.HOWL> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Denis Vlasenko <vda@ilport.com.ua>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Nikita Danilov <nikita@clusterfs.com> wrote:
> Denis Vlasenko writes:
>  > On Friday 16 September 2005 20:05, Hans Reiser wrote:
>  > > All objections have now been addressed so far as I can discern.
>  > 
>  > Random observation:
>  > 
>  > You can declare functions even if you never use them.
>  > Thus here you can avoid using #if/#endif:
>  > 
>  > #if defined(REISER4_DEBUG) || defined(REISER4_DEBUG_MODIFY) || defined(REISER4_DEBUG_OUTPUT)
>  > int znode_is_loaded(const znode * node /* znode to query */ );
>  > #endif

> It's other way around: declaration is guarded by the preprocessor
> conditional so that nobody accidentally use znode_is_loaded() outside of
> the debugging mode.

Since when has a missing declaration prevented anyone calling a function in
C?!
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
