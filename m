From: George Beshers <gbeshers@comcast.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Wed, 18 Aug 2004 19:18:33 -0400
Message-ID: <4123E3C9.90006@comcast.net>
References: <20040818075216.B920D15DBC@mail03.powweb.com> <4123ABEE.9020001@comcast.net> <4123BA24.2060001@namesys.com> <4123CDB3.2010506@comcast.net> <4123CE91.4090007@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20391-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4123CE91.4090007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com



Hans Reiser wrote:

> George Beshers wrote:
>
>>>
>>> Chroot lacks fall through points.
>>
>>
>>
>> Other than saving disk space is this important?
>
>
> It is different.

Sure.  I am trying to understand the advantages/disadvantages
of fall through points in your thinking.

>> Are you thinking about multiple processes, with different views, but
>> sharing a few "resources", i.e., files of one form or another as part of
>> a long term vision?
>
>
> Yes, but chroot can also do that.

Achieve it yes, document it in the specification no.

>>>>> Hans, in your preferred approach you referred to "a format that is 
>>>>> as if it is a subdirectory of the masked executable." Did you have
>>>>> in mind checking for something like /usr/bin/fooprocess/metas/mask 
>>>>> when exec() loads the exe, and if this exists then the files 
>>>>> rooted in this directory would be set as the process's root 
>>>>> filesystem?
>>>>>
>>>>> Are masks capable of explicit exclusion as well as inclusion?
>>>>> If the answer is 'Yes,' then what are your thoughts as to how this 
>>>>> might be accommodated when your main tool is reiser4's semantic 
>>>>> tree layer? Inclusion would be straightforward -- if the directory 
>>>>> exists or the name exists within the directory then fall through. 
>>>>> But exclusion? If you are limited to the semantic layer, then 
>>>>> there's no stat node with which to play tricks. 
>>>>
>>>>
>>>>
>>>> I think the correct answer is "anything not explicitly included is 
>>>> excluded"
>>>> or on the other side of the looking glass "anything not explicitly 
>>>> excluded
>>>> is included".
>>>>
>>>> As a user friendly interface both should be supported and the 
>>>> "compilation"
>>>> layer handle the conversion.
>>>>
>>>> Maybe I am not understanding the question.
>>>
>>>
>>>
>>>
>>> clearcase has an exclude operation for its view specifications.
>>>
>> I don't remember it being more than the boolean complement of
>> a (potentially much more complex) include operation.
>>
>> So good UI point but I don't think extends the semantics?
>
>
> exclude is a semantic feature.

Can you elaborate please?  That is specifically why it is different
from "not included"?


