From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Thu, 13 Mar 2003 15:06:33 +0300
Message-ID: <3E707449.5070007@namesys.com>
References: <1047421551.8219.448.camel@tiny.suse.com> <3E6E674E.4040305@namesys.com> <1047433739.8215.487.camel@tiny.suse.com> <20030312101222.A8452@namesys.com> <1047475876.8215.507.camel@tiny.suse.com> <3E6F3D80.80306@namesys.com> <20030312170522.A2128@namesys.com> <3E6F3F55.2030503@namesys.com> <20030312171718.C2128@namesys.com> <3E6F8909.7080805@namesys.com> <20030313091129.B3026@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13242-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030313091129.B3026@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Wed, Mar 12, 2003 at 10:22:49PM +0300, Hans Reiser wrote:
>
>  
>
>>>True for repacker. I do not see for allocate on flush will help.
>>>I see how relocate on flush may help ;)
>>>      
>>>
>>If you don't allocate it until flush, you don't need to reallocate at 
>>flush time...;-)
>>    
>>
>
>But what if we have some free space in already existing node, and new file information
>perfectly fits in there?
>
>Bye,
>    Oleg
>
>
>  
>
We reallocate dirty nodes that are not in the most optimal location when 
we flush them.

-- 
Hans


