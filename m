From: Hans Reiser <reiser@namesys.com>
Subject: Re: fsck mode halfway between --fix-fixable and --rebuild-tree
 ?
Date: Tue, 01 Oct 2002 22:43:42 +0400
Message-ID: <3D99ECDE.7050904@namesys.com>
References: <H356C4$4F46E50E852BF25DA1E850A48426FCDF@voila.fr> <20020929172335.L32363@noris.de> <20020930101824.A3895@namesys.com> <3D98318B.8000905@namesys.com> <20020930131744.X32363@noris.de> <20020930152204.A26742@namesys.com> <20020930150854.Z32363@noris.de> <3D984F92.4010509@namesys.com> <15769.17050.863426.305725@laputa.namesys.com> <3D998037.8030508@namesys.com> <20021001141508.L32363@noris.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11597-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Urlichs <smurf@noris.de>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Matthias Urlichs wrote:

>Hi,
>
>Hans Reiser:
>  
>
>>>Actually, B-link trees (B-trees with sibling pointers) don't require any
>>>additional io for sibling pointers maintenance. Just draw a picture of
>>>what is going on during insertion of new node or node deletion and you
>>>will see. 
>>>
>>>      
>>>
>>They have constraints we do not desire.  Also, I think they link in only 
>>one direction.  Am I right?
>>
>>    
>>
>Whether you use just a forward-pointing link or also a back-pointing link
>(or nothing at all) is up to you. Personally I like sibling and parent
>links because it is very easy to walk the tree iteratively (just follow
>the "next" or "prev" pointer when you're done with a node). Trees which
>only use downward-pointing links need to be walked recursively.
>
>On the other hand, you're a multitasking file system, therefore you need
>locking, therefore side pointers won't be of much use to you for anything
>(except additional redundancy for error recovery).
>
>  
>
Oh, it is not nearly so simple an argument.... Please read the b-link 
literature.  It is at least interesting, even if we did something else.


