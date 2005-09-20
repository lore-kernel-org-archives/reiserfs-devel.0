From: Hans Reiser <reiser@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 10:43:29 -0700
Message-ID: <43304A41.7080206@namesys.com>
References: <200509201536.j8KFa6wn011651@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26134-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509201536.j8KFa6wn011651@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Nikita Danilov <nikita@clusterfs.com>, stephen.pollei@gmail.com, Denis Vlasenko <vda@ilport.com.ua>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Horst von Brand wrote:

>Nikita Danilov <nikita@clusterfs.com> wrote:
>  
>
>
>It is supposed to go into the kernel, which is not exactly warning-free.
>  
>
While I have no passionate feelings about Nikita's ifdef, I must note
that Reiser4 will always be warning free within 3 days of my finding out
that somebody left a warning in.;-)

I hate messy code.;-)

The rest of the kernel should be fixed to be warning free.

>Besides, you don't know what idiotic new warnings the gcc people might
>dream up the next round, so just relying on no warnings is extremely
>unwise.
>  
>
I find the above unconvincing.

Is that what this thread boils down to, that you guys think the compile
should fail not warn? 

>As was said before: It it is /really/ wrong, arrange for it not to compile
>or not to link. If it isn't, well... then it wasn't that wrong anyway.
>  
>

