From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Wed, 12 Mar 2003 22:22:49 +0300
Message-ID: <3E6F8909.7080805@namesys.com>
References: <1047403968.8219.337.camel@tiny.suse.com> <3E6E584D.4080809@namesys.com> <1047421551.8219.448.camel@tiny.suse.com> <3E6E674E.4040305@namesys.com> <1047433739.8215.487.camel@tiny.suse.com> <20030312101222.A8452@namesys.com> <1047475876.8215.507.camel@tiny.suse.com> <3E6F3D80.80306@namesys.com> <20030312170522.A2128@namesys.com> <3E6F3F55.2030503@namesys.com> <20030312171718.C2128@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13231-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030312171718.C2128@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Wed, Mar 12, 2003 at 05:08:21PM +0300, Hans Reiser wrote:
>  
>
>>>>>Right, I missed the hint->search_start = bh->b_blocknr for when we don't
>>>>>find an indirect item.
>>>>>This is better, so the search will start from the bh with the stat data
>>>>>for a new file, but it depends on the last path element being in a good
>>>>>position relative to the rest of the files in the directory.
>>>>>          
>>>>>
>>>>Where other than near the stat data do you propose?
>>>>        
>>>>
>>>The permanent problem is that metadata may move inside of the tree from one
>>>block to another.
>>>So after some time, the blockin which stat data was inserted may move away 
>>>from
>>>optimal file location.
>>>      
>>>
>>Sounds like you need a repacker and allocate on flush....
>>    
>>
>
>True for repacker. I do not see for allocate on flush will help.
>I see how relocate on flush may help ;)
>
>Bye,
>    Oleg
>
>
>  
>
If you don't allocate it until flush, you don't need to reallocate at 
flush time...;-)

-- 
Hans


