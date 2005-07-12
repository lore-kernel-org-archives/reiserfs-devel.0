From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 plugins
Date: Mon, 11 Jul 2005 22:53:40 -0700
Message-ID: <42D35AE4.9000400@namesys.com>
References: <200507120233.j6C2XODw030361@laptop11.inf.utfsm.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25102-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200507120233.j6C2XODw030361@laptop11.inf.utfsm.cl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: Stefan Smietanowski <stesmi@stesmi.com>, David Masover <ninja@slaphack.com>, Hubert Chan <hubert@uhoreg.ca>, Ross Biro <ross.biro@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>, Nate Diller <ndiller@namesys.com>

Horst von Brand wrote:

>Hans Reiser <reiser@namesys.com> wrote:
>  
>
>>Stefan Smietanowski wrote:
>>    
>>
>>>I think "..." and ".meta" both serve as a logical delimiter. However
>>>some programs implement their own "..." which would make it clash with
>>>them. Naturally if some program created a directory called .meta we're
>>>equally screwed.
>>>      
>>>
>
>  
>
>>I chose '....' (four dots) because it clashes with less, not three dots.
>>    
>>
>
>Is this some kind of "My dots are more than yours" contest?!
>
>/None/ of them is safe. ".meta", "...", "....", ".this.has.five.dots." are
>all perfectly legal file (or directory) names, POSIXly. If any one of them
>won't do, none will.
>  
>
There is a long history of encroaching namespaces by creating new
keywords in CS, and it is a survivable problem.

Clearcase (the version control filesystem) is an excellent example. 
They have special meanings for @ and some other common characters, and
you have to learn how to escape those characters if you use them in
Clearcase.

It works, it makes users happy, in practice it is far less of a problem
than one might think.  I think there were two or three times I had to
remember how to escape things in 2 years of using it.....

Better to spend one's mind looking for bugs instead of this issue.....
