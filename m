From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 can't compile glibc
Date: Tue, 13 Apr 2004 09:34:51 -0700
Message-ID: <407C16AB.4000804@namesys.com>
References: <Pine.LNX.4.21.0404131641470.22275-100000@mlf.linux.rulez.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17889-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.21.0404131641470.22275-100000@mlf.linux.rulez.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

Szakacsits Szabolcs wrote:

>On Tue, 13 Apr 2004, Vladimir Saveliev wrote:
>  
>
>>yes, reiser4 by default has the same time resolution as ext[23] and
>>reiserfs.
>>    
>>
>
>Hmmm, so the kernel's nanosec timestamps can bite Reiser4 as well?
>
>  http://groups.google.com/groups?selm=1GgcQ-4k1-17%40gated-at.bofh.it
>
>  
>
>>However, I think that i found the problem already. The attached patch
>>for fs/reiser4/plugin/item/tail.c should help.
>>    
>>
>
>That's great :)
>	
>	Szaka
>
>
>
>  
>
Interesting.  vs, describe the storage of these in the various reiserfs 
versions.

-- 
Hans

