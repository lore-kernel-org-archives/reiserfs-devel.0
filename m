From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Wed, 18 Aug 2004 14:48:01 -0700
Message-ID: <4123CE91.4090007@namesys.com>
References: <20040818075216.B920D15DBC@mail03.powweb.com> <4123ABEE.9020001@comcast.net> <4123BA24.2060001@namesys.com> <4123CDB3.2010506@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20389-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4123CDB3.2010506@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

George Beshers wrote:

>
>
> Hans Reiser wrote:
>
>> George Beshers wrote:
>>
>>>
>>> David Dabbs wrote:
>>>
>>>> In the original proposal posted to the list Hans (I think) referred 
>>>> to viewprinting as "chroot on steroids." Let's assume that the mask 
>>>> creation tools deliver on making viewprint creation and 
>>>> maintainance very easy/painless for admins. In what way will 
>>>> viewprinting be more secure than chroot?
>>>>  
>>>>
>>> Basically, chroot as I at least normally use it, has a lot of 
>>> baggage in terms of
>>> disk consumption that we are planning to avoid by creating a view 
>>> rather than
>>> a copy.
>>
>>
>>
>> Chroot lacks fall through points.
>
>
> Other than saving disk space is this important?

It is different.

>
> Are you thinking about multiple processes, with different views, but
> sharing a few "resources", i.e., files of one form or another as part of
> a long term vision?

Yes, but chroot can also do that.

>
>>
>>>
>>>> Hans, in your preferred approach you referred to "a format that is 
>>>> as if it is a subdirectory of the masked executable." Did you have
>>>> in mind checking for something like /usr/bin/fooprocess/metas/mask 
>>>> when exec() loads the exe, and if this exists then the files rooted 
>>>> in this directory would be set as the process's root filesystem?
>>>>
>>>> Are masks capable of explicit exclusion as well as inclusion?
>>>> If the answer is 'Yes,' then what are your thoughts as to how this 
>>>> might be accommodated when your main tool is reiser4's semantic 
>>>> tree layer? Inclusion would be straightforward -- if the directory 
>>>> exists or the name exists within the directory then fall through. 
>>>> But exclusion? If you are limited to the semantic layer, then 
>>>> there's no stat node with which to play tricks. 
>>>
>>>
>>> I think the correct answer is "anything not explicitly included is 
>>> excluded"
>>> or on the other side of the looking glass "anything not explicitly 
>>> excluded
>>> is included".
>>>
>>> As a user friendly interface both should be supported and the 
>>> "compilation"
>>> layer handle the conversion.
>>>
>>> Maybe I am not understanding the question.
>>
>>
>>
>> clearcase has an exclude operation for its view specifications.
>>
> I don't remember it being more than the boolean complement of
> a (potentially much more complex) include operation.
>
> So good UI point but I don't think extends the semantics?

exclude is a semantic feature.

>
>
>>>> I wonder if it would be feasible if masks only specified 
>>>> exclusions? If, for instance, the mask wanted to exclude /foo/*, 
>>>> then the directory foo would exist (in the mask semantic tree). To 
>>>> exclude /etc/passwd, passwd would exist in the directory /etc. 
>>>> Since you're already going to need to preempt dcache searches 
>>>> (aren't you?) you can insert a search of the mask tree. If the 
>>>> search fails, then it is not excluded and the request falls through 
>>>> to normal VFS handling. In the /etc/passwd case above, it would 
>>>> find /etc/passwd and so the file is excluded. Processing would stop 
>>>> there, returning some error. How does this sound? I need to sleep 
>>>> on this, because it is very late here.
>>>>  
>>>>
>>> At this time I think feasible is true and useful is an open question.
>>>
>>> To address the useful I find that known/desirable use-case scenarios
>>> get the most discussion.
>>>
>>> To give a couple of examples:
>>>     1) A given process (say a restricted shell) can not exec() an
>>>         executable with the set-uid bit on.
>>>          - directly
>>>          - indirectly (e.g., via bash)
>>>     2) Apache can only create/write files in /var/web/incoming.
>>>          - files created or modified can not have any execute bit 
>>> set and executing chmod is excluded.
>>
>>
>>
>> this protection happens while traversing the mask or at the fall 
>> through point.  Hmmm, we need to accumulate a set of permissions that 
>> apply to something that are specific to how we got there.  That could 
>> be complex in the VFS details.  We can defer it to Phase II if 
>> necessary.  George, you should spend a day (not this week) figuring 
>> out how much work it would be to make that work.  It will be the 
>> details of it that will be dangerous....
>>
> OK.
>
>
>

