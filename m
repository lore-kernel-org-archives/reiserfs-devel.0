From: Hans Reiser <reiser@namesys.com>
Subject: Re: Fibration questions
Date: Sun, 25 Jul 2004 23:28:24 -0700
Message-ID: <4104A488.2060103@namesys.com>
References: <40FE0B47.3010600@slaphack.com> <200407221410.25043.vitaly@namesys.com> <41007B56.2030103@slaphack.com> <200407231309.55295.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19801-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407231309.55295.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: David Masover <ninja@slaphack.com>, =?UTF-8?B?TWFya3VzIFTDtnJucXZpc3Q=?= <mjt@nysv.org>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

Vitaly Fertman wrote:

>>wait -- what does this do:
>>echo -e "tea\0" > somedir/metas/plugin/hash
>>    
>>
>
>will set the hash tea in 'somedir' if it is empty.
>if it has 'subdir' already, nothing happens.
>
>  
>
>>echo -e "something_differenet\0" > somedir/subdir/metas/plugins/hash
>>    
>>
>
>will set the hash 'something_differenet' if any of [r5 | tea | fnv1 | 
>rupasov | degenerate hash | all future hash plugins] in 'somedir/subdir' 
>if 'subdir' is empty.
>  
>
is something_different constrained to

 [r5 | tea | fnv1 | rupasov | degenerate hash | some future hash plugin existing at time of command]

?

(I hope so.)

>  
>
>>echo -e "r5\0" > somedir/metas/plugins/hash
>>    
>>
>
>nothing happens as 'subdir' exists.
>
>  
>
>>What is the hash of "subdir" now?
>>    
>>
>
>'somthing_different'
>
>  
>
>>What about new subdirs?  What hash will they get?
>>    
>>
>
>new subobjects inherit all plugins from the object they are created 
>in at the creation time. future changes of plugins of the object will 
>not be applied to already created subobjects, only to new subobjects.
>
>Note: if a plugin is used for rendering the object content then its 
>changing needs a convertion method. Thus if you create a file in 
>the dir then the hash plugin gets used, and you need to convert the 
>dir to change the hash successfully. As there is no such convertion 
>methods yet, you cannot change the hash of not empty dir.
>
>  
>

