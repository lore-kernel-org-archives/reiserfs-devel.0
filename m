From: "Steve Olivieri" <steve86@WPI.EDU>
Subject: Re: Reiser4 SCSI Bug?
Date: Sun, 30 Oct 2005 21:18:29 -0500 (EST)
Message-ID: <1993.130.215.169.201.1130725109.squirrel@webmail.WPI.EDU>
References: <2066.130.215.239.65.1130521750.squirrel@webmail.WPI.EDU>
    <37550.130.215.239.65.1130545649.squirrel@webmail.WPI.EDU>
    <43639DFA.1020107@namesys.com> <43640228.7080807@wpi.edu>
    <4364033C.5010200@namesys.com> <436406DF.8070104@wpi.edu>
    <43643C7E.4080703@namesys.com> <43641554.8040500@wpi.edu>
    <43646B4A.7060301@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26738-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43646B4A.7060301@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Isaac Chanin <chanin@WPI.EDU>, Steve Olivieri <steve86@WPI.EDU>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

Hey guys,

I had a system running on reiser4 with Isaac's patch yesterday and all we
going well.  Of course, then I deleted /var/db and portage went crazy and
I decided to build the system again.

I attempted to do so today, using the same kernel as yesterday, but now
I'm getting the same error as before.  To be a bit more specific,

reiser4[pdflush(218)]: writeout (fs/reiser4/vfs_ops.c:197)[nikita-31001):
code: -12 at fs/reiser4/wander.c:1250
WARNING: Flush failed: -12

I used to get a number of these errors (in fact, they continued until I
would reboot with SysRq keys) but now I only seem to get one before
everything hangs and I'm forced to reboot.

Hope to see a good fix soon,

 Steve

> Isaac Chanin wrote:
>
>> Hans Reiser wrote:
>>
>>> Isaac Chanin wrote:
>>>
>>>
>>>> Hans Reiser wrote:
>>>>
>>>>
>>>>> It should be not 256, but BIO_MAX_PAGES, yes?   Defining limits in
>>>>> two
>>>>> places is bad, yes?
>>>>>
>>>>>
>>>>
>>>> Yeah, I think the code is running into two different limits here.
>>>> Reiser4 wants it to be nr, but limits it to BIO_MAX_PAGES.  However,
>>>> apparently, the BIO_MAX_PAGES limit does not take into consideration
>>>> the underlying 256 limit imposed by bio_alloc.
>>>>
>>>> I'm not quite sure if having the two different limits is a bad thing
>>>> in this case, unless BIO_MAX_PAGES can be made to (or is supposed to,
>>>> and there's a bug) take into account the 256 limit.
>>>>
>>>> I suppose the other solution is to not use bio_alloc et al due to the
>>>> 256 limit, and find another method that allows values as large as
>>>> BIO_MAX_PAGES, under the current implementation, will grow to.
>>>>
>>>>
>>>
>>> but you said:
>>>
>>> "In any case, BIO_MAX_PAGES is defined to be 256"
>>>
>>> Now I am confused.
>>>
>>> We should use the same macro defining our limit as the underlying
>>> layer uses.  What macro is that called?
>>>
>>>
>>
>> Right, it would be far better to do min(BIO_MAX_PAGES, ...); rather
>> than using 256 directly.  It's defined in include/linux/bio.h which is
>> already included in wander.c.
>>
>>
> ok, well, vs, please fix this and put the fix into our next release to
> andrew if you can.
>


