From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Tue, 26 Oct 2004 11:37:16 -0700
Message-ID: <417E995C.2060207@namesys.com>
References: <20040819074027.8429715D94@mail03.powweb.com>	 <41248D43.3040905@dgreaves.com> <4124D255.2060401@comcast.net>	 <412597F9.1010707@namesys.com> <1098801919.2610.2.camel@localhost.localdomain> <417E7DCA.5010609@namesys.com> <417E81E9.8070304@speakeasy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22185-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <417E81E9.8070304@speakeasy.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@speakeasy.net>
Cc: "Lamont R. Peterson" <lamont@gurulabs.com>, ReiserFS List <reiserfs-list@namesys.com>

George Beshers wrote:

>
>
> Hans Reiser wrote:
>
>> Lamont R. Peterson wrote:
>>
>>> On Fri, 2004-08-20 at 00:19, Hans Reiser wrote:
>>>
>>>
>>>> George Beshers wrote:
>>>>
>>>>>>> Masked Processes
>>>>>>> - May not create hard links.
>>>>>>> - Child processes [of a masked process] must inherit the 
>>>>>>> parent's "mask bit" and mask definition.
>>>>>>>
>>>>>>>
>>>>>> remind me - what is the mask tied to? UID/GID, EUID, PID, PGID? 
>>>>>> filesystem?
>>>>>> Hans actually says it's derived from the executable.
>>>>>> What if it changes between two processes starting?
>>>>>> Does the running processes mask change? (cf chmod a file - seems 
>>>>>> reasonable but...)
>>>>>> I'd think it needs to be pretty atomic...
>>>>>> In fact, maybe changing masks on a running (mounted?) system is a 
>>>>>> potential security hole and forbidden?
>>>>>> I think I could think of race examples.
>>>>>>
>>>>> I am disinclined to tackle changing masks on the fly until I have 
>>>>> a compelling story
>>>>> to justify the work.
>>>>>
>>>> It is less work to allow changing them on the fly than to not do 
>>>> so, since they are stored in the fs, not something loaded into the 
>>>> process state.
>>>>
>>>
>>> Yes.
>>>
>>> Additionally, if they could not be changed "on-the-fly", then in
>>> practical terms this would force an admin to restart a daemon when a
>>> change is made. That would not be very friendly.
>>>
>>>
>> Yes, and actually, part of our objective is to allow for incremental 
>> improvements/refinements to the masks as we discover more files that 
>> the blackbox binary needs.
>>
> All points above are sound---dynamic changes to masks will be supported
> in the first implementation according to current thinking.
>
> Still, a "batch mode" for production servers is a concept that should 
> not be
> discarded too quickly as static masks would certainly support a more
> efficient implementation

I dispute this point. What do you think would be more efficient than 
reiser4 directories? Or are you referring to compiled regular expressions?

> --- that the savings would be significant is still
> very much an open question.
>
>
>

