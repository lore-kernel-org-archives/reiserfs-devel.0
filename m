From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Wed, 18 Aug 2004 17:42:36 -0700
Message-ID: <4123F77C.6060703@namesys.com>
References: <20040818075216.B920D15DBC@mail03.powweb.com> <4123ABEE.9020001@comcast.net> <4123BA24.2060001@namesys.com> <4123CDB3.2010506@comcast.net> <4123CE91.4090007@namesys.com> <4123E3C9.90006@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20392-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4123E3C9.90006@comcast.net>
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
>>>>
>>>> Chroot lacks fall through points.
>>>
>>>
>>>
>>>
>>> Other than saving disk space is this important?
>>
>>
>>
>> It is different.
>
>
> Sure.  I am trying to understand the advantages/disadvantages
> of fall through points in your thinking.
>
>>> Are you thinking about multiple processes, with different views, but
>>> sharing a few "resources", i.e., files of one form or another as 
>>> part of
>>> a long term vision?
>>
>>
>>
>> Yes, but chroot can also do that.
>
>
> Achieve it yes, document it in the specification no.

I don't understand the difference between us doing ls -R in a view and 
in a chrooted root, as far as documentation is concerned.

What might be different is that two processes can share a common 
directory (that they can create files in for the other process to see) 
using a mask but not using chroot.  Am I right about that?

>
>>>>>> Hans, in your preferred approach you referred to "a format that 
>>>>>> is as if it is a subdirectory of the masked executable." Did you 
>>>>>> have
>>>>>> in mind checking for something like 
>>>>>> /usr/bin/fooprocess/metas/mask when exec() loads the exe, and if 
>>>>>> this exists then the files rooted in this directory would be set 
>>>>>> as the process's root filesystem?
>>>>>>
>>>>>> Are masks capable of explicit exclusion as well as inclusion?
>>>>>> If the answer is 'Yes,' then what are your thoughts as to how 
>>>>>> this might be accommodated when your main tool is reiser4's 
>>>>>> semantic tree layer? Inclusion would be straightforward -- if the 
>>>>>> directory exists or the name exists within the directory then 
>>>>>> fall through. But exclusion? If you are limited to the semantic 
>>>>>> layer, then there's no stat node with which to play tricks. 
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> I think the correct answer is "anything not explicitly included is 
>>>>> excluded"
>>>>> or on the other side of the looking glass "anything not explicitly 
>>>>> excluded
>>>>> is included".
>>>>>
>>>>> As a user friendly interface both should be supported and the 
>>>>> "compilation"
>>>>> layer handle the conversion.
>>>>>
>>>>> Maybe I am not understanding the question.
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> clearcase has an exclude operation for its view specifications.
>>>>
>>> I don't remember it being more than the boolean complement of
>>> a (potentially much more complex) include operation.
>>>
>>> So good UI point but I don't think extends the semantics?
>>
>>
>>
>> exclude is a semantic feature.
>
>
> Can you elaborate please?  That is specifically why it is different
> from "not included"?

Not included is also a semantic feature.  Explicit rather than implicit 
exclusion is a different semantic.  Lingustic expressions can differ in 
their semantics while still  resolving to the same value.

If A = 1 and B =1 and C = 2

then A + B + C is semantically different from 2 * C, even if it is 
numerically equal.

