From: Hans Reiser <reiser@namesys.com>
Subject: Re: bug+fix in reiserfsck - reiserfscore/journal.c
Date: Fri, 27 Feb 2004 06:40:20 +0300
Message-ID: <403EBC24.6000701@namesys.com>
References: <002601c3fc49$815d1880$e91ba8c0@thk.local> <1077843286.8641.36.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16952-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1077843286.8641.36.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Thorsten Kohfeldt <thorsten.kohfeldt@gmx.de>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Thu, 2004-02-26 at 04:18, Thorsten Kohfeldt wrote:
>  
>
>>To whom it may (should!) concern,                                   
>>26-FEB-2004
>> 
>>after having been annoyed for quite some time by corrupt /var file
>>systems after
>>(simulated) powerloss in a SuSE 9.0 setup with reiserfs, I finally
>>tracked the
>>problem down to a nasty bug in reiserfsck - reiserfscore/journal.c
>> 
>>Turned out that the journal is not always correctly replayed by
>>reiserfsck !
>>    
>>
>
>Thank you very much for the patch, I'll review it and try to get a fix
>out asap inside suse.
>
>[ transaction id wrapping ]
>  
>
>> 
>>For a starter, I added a patch that fixes one wrap around issue inside
>>journal.c. Take it or leave it.
>>    
>>
>
>Thanks, I'll play around with this and perhaps a few alternatives.
>
>-chris
>
>
>
>
>  
>
Is this bug present in the mainstream kernel?  Why suse only?

-- 
Hans


