From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Tue, 17 Aug 2004 00:07:22 -0700
Message-ID: <4121AEAA.8050008@namesys.com>
References: <411FFCB4.2060400@namesys.com> <41201252.1080803@comcast.net> <412015D0.8030806@namesys.com> <41210FF5.7080605@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20350-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41210FF5.7080605@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

George Beshers wrote:

>>
>>> 3)  A user and group instantiated mask forms an *operational set of 
>>> functionality*.
>>>
>>>      What is important here is to recognize that a given executable 
>>> may have
>>>      different apparent functionality based on who is running it.
>>
>>
>> I think not in our particular niche.  We do process oriented 
>> security, and that is all for now.  Later we can make it more complex.
>
> We can't avoid it at some level without re-writing Linux security.  
> Take a moment to consider
> the set-UID bit on a file which is an executable and I think you will 
> see what I am driving at.

I don't see what you are saying.  Our mask does process oriented 
security.  The underlying security remains a user/object/permission mapping.

>
> That said, all we need to do is make our specification conform to the 
> smallest code change
> for the time being, e.g., the identity mask---what was happening 
> before is what you get.

Well, we should just pass things through the mask to whatever is below.

>
> NB.  I understand that the overriding goal of the first 3 months is 
> devising and demonstrating
> that we have a strategy that scales to file systems containing 
> millions of files---but I don't
> think we can lose any semantics as fundamental as user/group 
> permissions without inviting
> criticism.

We are not losing, we are residing above and masking them.

>
>
>>
>>>
>>>
>>>
>>> Well, for the moment only more questions:
>>>
>>> Suppose we have a file system and a mask.  If we were to create a 
>>> chroot by copying just
>>> the file system 
>>
>>
>> semantic tree (not files, just filenames)
>>
>>> accessible through the mask and run the application in that environment
>>> would the semantics of running the application on the original file 
>>> system with the mask
>>> by equivalent.  By equivalent I mean no observable difference in the 
>>> instructions executed
>>> at the user level or the output generated.
>>
>>
>> No, because new files might be made visible through the mask without 
>> the new file creator even being aware that there was a mask.
>
> I don't think my question was very clear ...
>
> For any process, could that process determine if it was running
>
>     * on a reiser4 file system that is really the root
>
the root filesystem?

>    *
>
>
>     * on a reiser4 file system with a mask, or
>     * on a reiser4 file system with chroot
>
> /exclusively/ by making calls to the reiser4 file system?

Hmm, sounds like the answer requires carefully traversing the code.;-)

>
>>
>>>
>>> Does the question make sense?
>>
> Uh no... :-[
>

