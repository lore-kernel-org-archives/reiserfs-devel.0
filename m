From: Hans Reiser <reiser@namesys.com>
Subject: Re: A question about slum and relocate
Date: Mon, 24 Nov 2003 05:04:10 -0800
Message-ID: <3FC201CA.9090700@namesys.com>
References: <Pine.GSO.4.58.0311241820230.6503@bingsun2.cc.binghamton.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16157-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GSO.4.58.0311241820230.6503@bingsun2.cc.binghamton.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zhihui Zhang <bf20761@binghamton.edu>
Cc: reiserfs-list@namesys.com, zam@thebsh.namesys.com

Zhihui Zhang wrote:

>Hi,
>
>After reading some code, it seems to me that a slum does not have to be
>relocated.  If a slum is small , it will use the overwrite strategy.  Is
>this understanding correct?  Also, at the leaf level, if the number of
>dirty nodes exceeds FLUSH_RELOCATE_THRESHOLD (64), they are always
>relocated.  Is there any similar threshold for an internal level?  Does
>Reiser4 relocate internal nodes separately (i.e. not as part of the slum
>involving leaf nodes.  
>
zam will answer the above.

>Note a slum can grow backwards if a dirty node is
>the leftmost child of a parent at an internal level)? 
>
Can you say more on this point, I don't quite understand you?

> Thanks for your
>enlightenment.
>
>-Zhihui
>
>  
>
thanks for reading our code in such depth.

-- 
Hans


