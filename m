From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Wed, 21 Sep 2005 14:47:15 +0400
Message-ID: <17201.14899.683012.997417@gargle.gargle.HOWL>
References: <200509201536.j8KFa6wn011651@laptop11.inf.utfsm.cl>
	<43304A41.7080206@namesys.com>
	<feed8cdd050920150866e7925d@mail.gmail.com>
	<4330A783.9090405@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26202-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4330A783.9090405@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: stephen.pollei@gmail.com, Horst von Brand <vonbrand@inf.utfsm.cl>, Denis Vlasenko <vda@ilport.com.ua>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser writes:
 > Stephen Pollei wrote:
 > 
 > >
 > >
 > >Also note my opinion, doesn't really count if you grep the kernel
 > >sources for pollei, you won't find anything.
 > >
 > >  
 > >
 > Your opinion counts, but lets see what Nikita says before I say
 > anything.  Nikita is more expert than I in regards to compiler tricks.

That sort of guards was useful early in reiser4 debugging, when a lot of
checks and assertions was  added (specifically, because reiser4 has many
levels of debugging), but I am not sure source code clutter is justified
now.

Nikita.
