From: Yury Umanets <yury@clusterfs.com>
Subject: Re: Reiser4 support on parted program ...
Date: Wed, 15 Sep 2004 16:17:48 +0300
Message-ID: <414840FC.4090505@clusterfs.com>
References: <41472F46.4000109@futuretg.com> <41477625.304@slaphack.com> <4147E95B.8090108@futuretg.com> <20040915094952.GA5137@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21758-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040915094952.GA5137@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, David Masover <ninja@slaphack.com>, reiserfs-list@namesys.com, umka@clusterfs.com

Alex Zarochentsev wrote:

>Hello!
>
>On Wed, Sep 15, 2004 at 09:03:55AM +0200, Dr. Giovanni A. Orlando wrote:
>  
>
>>David Masover wrote:
>>
>>    
>>
>>>-----BEGIN PGP SIGNED MESSAGE-----
>>>Hash: SHA1
>>>
>>>Dr. Giovanni A. Orlando wrote:
>>>| Hi,
>>>|
>>>|    Have some implemented the Reiser4 support on the program 'parted'?
>>>[...]
>>>|    If yes, please send the the link.
>>>
>>>Don't know.
>>>
>>>|    If, no will we will implement immediately.
>>>
>>>Thanks, but I bet it's harder than you think.  I don't know if there's a
>>>resizing program yet.  At least the repacker is done.
>>>      
>>>
>>I have no choices. We need this source and therefore we will produce
>>otherwise we cannot release the OS version.
>>
>>Seems easy.
>>    
>>
>
>libreiser4 / libaal are made to support parted easier.
>resizing program is not done.
>  
>
Alex is right in both. To add such a support one should write resizing 
stuff in libreiser4 first. Then write glue code in parted. IMHO both are 
not so difficult. Probably Vitaly or Alex self could do that in week 
(may be few days).

The only problem Hans seems does not want such a support or does not 
count it as somethinf serious attention should be paid to :(

Thanks.

>  
>
>>Thanks,
>>Giovanni
>>
>>    
>>
> 
>
>  
>


-- 
umka

