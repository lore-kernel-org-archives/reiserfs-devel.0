From: Hans Reiser <reiser@namesys.com>
Subject: Re: fsck mode halfway between --fix-fixable and --rebuild-tree
 ?
Date: Mon, 30 Sep 2002 17:20:18 +0400
Message-ID: <3D984F92.4010509@namesys.com>
References: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr> <20020929172335.L32363@noris.de> <20020930101824.A3895@namesys.com> <3D98318B.8000905@namesys.com> <20020930131744.X32363@noris.de> <20020930152204.A26742@namesys.com> <20020930150854.Z32363@noris.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11574-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Urlichs <smurf@noris.de>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Matthias Urlichs wrote:

>Hi,
>
>Oleg Drokin:
>  
>
>>>When I tried this, reiserfsck with -S scanned the whole disk, as expected.
>>>Reiserfsck without -S said it would scan roughly half of my disk. That led
>>>      
>>>
>>Yes. It scans all the blocks that are marked as "used" in bitmap.
>>
>>    
>>
>That's not what I meant when I proposed this new option. The method 
>which I proposed would walk the existing tree, both "downwards" and
>"sideways", to find all reachable blocks with nodes, and then do the
>existing rebuild-tree algorithm on the result.
>
>  
>
>>>me to conclude that whatever it does, it doesn't just use the blocks which
>>>are actually used for the tree at the moment.
>>>      
>>>
>>How can it know? It must find all the lost blocks too.
>>
>>    
>>
>... and how can it know that the bitmap represents reality?
>
>Blocks have three pointers which point to them (left neighbour, right
>neighbour, and parent).  (That's my understanding of the way people
>usually lay out their B-trees, anyway; apologies if yours is radically
>different.)
>
Is this the way they do it on disk?  We just have a link from parent to 
child.  Maintaining on disk links to siblings would hurt performance as 
the links would require updating.

> I'd like to assume that blocks don't easily get lost when
>there are so many ways to find them. Three pointers look safer than a
>single bit, anyway.
>
>This method would be a nice compromise between not fixing a problem,
>depending on suspect information, and/or reconnecting every file which
>I've deleted during the last year.
>
>  
>



