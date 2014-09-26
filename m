From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Non-deleted directories (Was Re: reiser4 (ccreg40)...)
Date: Fri, 26 Sep 2014 22:46:07 +0200
Message-ID: <5425D08F.4060305@gmail.com>
References: <1466481.l6KPymqJEh@intelfx-laptop> <1681022.dqZonnvJOp@intelfx-laptop> <5425C519.1040905@gmail.com> <3250460.uFvVlGa0Ho@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=oLwjM1a01eY63KcYCjaxaOEYQ8ZH8RY6F+L3D6DKwp8=;
        b=XPShtYuN08eqm0T3HrURVawiWr5sVpT8QTg+hzWrpTeXrTBMO1QiFsjiH/HCIoaFfb
         Q1KYfzBcqlJnNPuFk0t9stcf3vgKABpSYtdba1Dx5KVnuCfmz8XM9+V6R6ZIPbVLAdxk
         mVibtZ5+O6TaarCjoU39ZDdNiRGKak0r7NczkDWJSLGj5wMUmMy3+40jB26tOJinOUsd
         71Wl0fkpgGAD0Fs+S/E5lyEbXPLw4jcDWOBz2LKyoQ7rW6E4x15Y8EwSo/4x6VY5/kFG
         Ef7V79Z648V0v9GWB/CZ7REnsxUKaSCqf96MHdjnCxLZBxnU8akSnPYDSXsVuzk7TsN0
         fY8g==
In-Reply-To: <3250460.uFvVlGa0Ho@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>


On 09/26/2014 10:09 PM, Ivan Shapovalov wrote:
> On Friday 26 September 2014 at 21:57:13, Edward Shishkin wrote:	
>> On 09/26/2014 07:27 PM, Ivan Shapovalov wrote:
>>> On Wednesday 24 September 2014 at 21:51:53, Edward Shishkin wrote:	
>>>> On 09/11/2014 07:16 PM, Edward Shishkin wrote:
>>>>> On 09/10/2014 11:39 PM, Ivan Shapovalov wrote:
>>>>>
>>>> [...]
>>>>
>>>>>>>> 3a. I can reproduce the "directory not empty" bug :) Interestingly,
>>>>>>>> it is
>>>>>>>> always the same directory under the aforementioned huge hierarchy.
>>>>>>>> (I've
>>>>>>>> done the unpack-remove cycle a few times.)
>>>>>>> I've made a conclusion that this is caused by unexpected disappearing
>>>>>>> of a record, which represents a directory entry in the directory item
>>>>>>> (currently directory items are managed by cde ITEM plugin, aka
>>>>>>> "compound
>>>>>>> directory entries"). In the error path (ENOENT) the size of the
>>>>>>> directory is
>>>>>>> not decremented, which makes the directory undeletable. I still
>>>>>>> don't know
>>>>>>> who kills the entries. Special debugging info is needed to find/fix it.
>>>>>> What kind of information is needed?
>>>>> We need to find all places, where the records are created / killed
>>>>> and insert a hook, which prints such events for the entry which
>>>>> unexpectedly disappears. This will get us a chance to find the culprit.
>>>>> I have to say: this is not a big fun...
>>>> Ughhh, parse_cut (node40.c) is the culprit.
>>>> If region to cut contains objects with non-unique keys (the case of
>>>> hash collisions), then this function evaluates the cut mode incorrectly.
>>>> non-unique keys
>>> Wow.
>>> (I wonder, how many else "what the..."-style things are there in reiser4?...)
>>
>> Currently I don't know open issues, which lead to data corruptions.
>>
>> There is a number of failed assertions when debug mode is on and
>> partition is formatted with "create=reg40". Specifically, they appear
>> in paths of tail conversion. I believe they are false positives, however,
>> everything is possible..
>>
>>
>>> So this becomes re-classified as kernel version agnostic bug, right? Then why
>>> do you see it in 3.16 only?..
>>
>> Not really. The issue of non-deletable directories is very old.
>> Now we know that it was caused by non-unique keys (because of
>> hash collisions). However, having non-unique keys on the partition
>> is not enough to reproduce this problem: the cut offset should be
>> between objects with identical keys. Now let's assume that tree
>> layout depends on the kernel version...
>>
>>
>>>> I think that this bug has been introduced implicitly ~11 years ago
>>>> after the design change in reiser4 (introducing non-unique keys).
>>>>
>>>> I'll provide the fixup later..
>>> Great. Will be waiting for. /* also, what's with batch discard code and the
>>> second space allocation patchset? do you have any plans for reviewing it? */
>>
>> Discard support v8 looks OK, we'll include it to 3.6.X.
> v8 is what? I don't see any PATCHv8 in the mailing list...


v8 means (v7 + unconditionally delayed de-allocation)


> Actually, by "second space allocation patchset" I've meant this:
> http://www.spinics.net/lists/reiserfs-devel/msg04180.html


Ah, sorry, I forgot about this patchset,
Ok, I'll take a look..

Edward.


>
> BTW, it should be [RFC]: I'm completely unsure if it's OK...
>
>> As to FITRIM ioctl: I'll try to review it at the end of my vacations
>> (weekends 11, 12 Oct).
> OK, will be waiting, thanks.

