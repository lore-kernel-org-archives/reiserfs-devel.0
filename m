From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Tue, 17 Aug 2004 12:43:59 -0700
Message-ID: <41225FFF.1030509@namesys.com>
References: <411FFCB4.2060400@namesys.com> <41201252.1080803@comcast.net> <412015D0.8030806@namesys.com> <41210FF5.7080605@comcast.net> <4121AEAA.8050008@namesys.com> <4121F4D6.8090506@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20359-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4121F4D6.8090506@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

George Beshers wrote:

>
>
> Hans Reiser wrote:
>
>>
>>>>
>>>> No, because new files might be made visible through the mask 
>>>> without the new file creator even being aware that there was a mask.
>>>
>>>
>>> I don't think my question was very clear ...
>>>
>>> For any process, could that process determine if it was running
>>>
>>>     * on a reiser4 file system that is really the root
>>>
>> the root filesystem?
>
> Yes, as understood by the OS.
>
>>
>>>    *
>>>
>>>
>>>     * on a reiser4 file system with a mask, or
>>>     * on a reiser4 file system with chroot
>>>
>>> /exclusively/ by making calls to the reiser4 file system?
>>
>>
>> Hmm, sounds like the answer requires carefully traversing the code.;-)
>
> of course :-)
>

> But what would we like the answer to be?

Ah, so that is the question....

>     I will take the position that "no the process can not tell" as
>     being useful
>     because it makes running with a mask a better test environment.
>     Also, I don't see how cluing the process in that a mask is in
>     place can
>     improve security whereas knowing that the mask is in place might
>     encourage someone to try to work around it (beyond the filesystem
>     semantics).
>
>
>
Yes, you are right I think, but you should ask on the mailing list what 
information about what is the root filesystem is used for by the OS
