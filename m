From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Thu, 19 Aug 2004 23:19:37 -0700
Message-ID: <412597F9.1010707@namesys.com>
References: <20040819074027.8429715D94@mail03.powweb.com> <41248D43.3040905@dgreaves.com> <4124D255.2060401@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20417-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4124D255.2060401@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

George Beshers wrote:

>
>
>
>>
>>
>>> Masked Processes
>>> - May not create hard links.
>>> - Child processes [of a masked process] must inherit the parent's 
>>>  "mask bit" and mask definition.
>>>  
>>>
>> remind me - what is the mask tied to? UID/GID, EUID, PID, PGID? 
>> filesystem?
>> Hans actually says it's derived from the executable.
>> What if it changes between two processes starting?
>> Does the running processes mask change? (cf chmod a file - seems 
>> reasonable but...)
>> I'd think it needs to be pretty atomic...
>> In fact, maybe changing masks on a running (mounted?) system is a 
>> potential security hole and forbidden?
>> I think I could think of race examples.
>
>
> I am disinclined to tackle changing masks on the fly until I have a 
> compelling story
> to justify the work.

It is less work to allow changing them on the fly than to not do so, 
since they are stored in the fs, not something loaded into the process 
state.

Hans

