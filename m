From: Horst von Brand <vonbrand@inf.utfsm.cl>
Subject: Re: List of things requested by lkml for reiser4 inclusion (to review)
Date: Mon, 12 Sep 2005 15:40:42 -0400
Message-ID: <200509121940.j8CJegwe019443@laptop11.inf.utfsm.cl>
References: <reiser@namesys.com>
Return-path: <reiserfs-list-return-25937-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Message from Hans Reiser <reiser@namesys.com> 
   of "Mon, 12 Sep 2005 11:08:37 MST." <4325C425.4030002@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, Reiserfs-Dev@namesys.com, reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> wrote:
> Andrew Morton wrote:
> >The type-unsafety of existing list_heads gives me conniptions too.  Yes,
> >it'd be nice to have a type-safe version available.

[...]

> Vladimir spent 24 hours straight unsafing the lists in reiser4, and
> didn't finish yet.  We need 1-2 more days to address this before we can
> submit reiser4.  I hope this delay will not be too much of a problem.

It won't go in before 2.6.15 or so anyway, so...
-- 
Dr. Horst H. von Brand                   User #22616 counter.li.org
Departamento de Informatica                     Fono: +56 32 654431
Universidad Tecnica Federico Santa Maria              +56 32 654239
Casilla 110-V, Valparaiso, Chile                Fax:  +56 32 797513
