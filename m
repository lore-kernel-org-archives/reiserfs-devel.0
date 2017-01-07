From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] Smart fibration plugin ext_4321
Date: Sat, 07 Jan 2017 09:58:59 +0200
Message-ID: <58709FC3.5000606@gmail.com>
References: <CADW=+3=Vwi1LFJn8imp7H6woiRP2Oa0=Q=_K-dDqc=hc2cOkZg@mail.gmail.com> <586165C2.3000702@gmail.com> <CADW=+3moCR2ufXeD4BmXFG0WE5uS2VpM95S6ZiggKg4BD47tfg@mail.gmail.com> <586F9F23.5010409@gmail.com> <CADW=+3nwVneU3ftJOQ8eT5t9Mdm8_XuTwkkBS2u5B0xKT8h86A@mail.gmail.com> <586FF6CA.7090703@gmail.com> <CADW=+3nLSyEFeRu9=GwG-P3Y0f34f-7+L2zoqNO4OWGNGREALA@mail.gmail.com> <587022B5.3040808@gmail.com> <CADW=+3kzCd-jB9dPFyqAdNR6L2Cs81ibTfdYbWdnQd8zY3J38w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=vS8I0hW1cfQQNetfBfJ8adt68EhpafRd9z8jCOqfHnw=;
        b=nvsEjbK/4FCsueQ5+kESvcliWOrlzhSnYxf/T+aw4bxlii7IFmsjTYIWz677ZJ1B9F
         J/muesD4RhbfdbzAjZtsXrrIIbHEktbtba/23bIRcw8PRK87QHRzpEkc5BACCGHMe4uD
         xKU9x5ED8lUGEw3caVXjwX9eXDtY2Xr23UjpwoNFA2908HKnurdfUz8qjhj9bZTlb4PZ
         fA4/1rFtrUyBX8uHeeIkCBzoebjblS2IGvkgsq2c9r/XyE0NySPC5FrqObgaIe9Mldzx
         2f/DtaSn9fOQKqTGu9DWD0HeTrGCwt2VeiC61AqGA4Q8z7L/tcZoPsMU9cAGq+2eCYnj
         I6Aw==
In-Reply-To: <CADW=+3kzCd-jB9dPFyqAdNR6L2Cs81ibTfdYbWdnQd8zY3J38w@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>



On 01/07/2017 10:15 AM, Dušan Čolić wrote:
> On Sat, Jan 7, 2017 at 12:05 AM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> On 01/07/2017 01:09 AM, Dušan Čolić wrote:
>>> On Fri, Jan 6, 2017 at 8:58 PM, Edward Shishkin
>>> <edward.shishkin@gmail.com> wrote:
>>>>
>>>> On 01/06/2017 05:34 PM, Dušan Čolić wrote:
>>>>> On Fri, Jan 6, 2017 at 2:44 PM, Edward Shishkin
>>>>> <edward.shishkin@gmail.com> wrote:
>>>>>> On 12/26/2016 11:13 PM, Dušan Čolić wrote:
>>>>>>> On Mon, Dec 26, 2016 at 7:47 PM, Edward Shishkin
>>>>>>> <edward.shishkin@gmail.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 12/25/2016 02:59 AM, Dušan Čolić wrote:
>>>>>>>>> Fibration is a great way to decrease fragmentation and increase
>>>>>>>>> throughput.
>>>>>>>>> Currently there are 4 fibration plugins, lex, dot.o, ext_1 and ext_3
>>>>>>>>> and they all have their upsides and downsides.
>>>>>>>>>
>>>>>>>>> Proposed fibration plugin combines them all so that it combines
>>>>>>>>> files
>>>>>>>>> with same extensions for 1, 2. 3 and 4 character extension  in
>>>>>>>>> groups
>>>>>>>>> and sorts them in same fiber group.
>>>>>>>>>
>>>>>>>>> With this fibration plugin all eg. xvid files would be in same group
>>>>>>>>> in folder on disk sorted alphabetically
>>>>>>>>
>>>>>>>>
>>>>>>>> What application wants all xvid files to be in the same group?
>>>>>>>> Do you have any benchmark numbers which show advantages
>>>>>>>> of the new plugin?
>>>>>>>>
>>>>>>> Xvid files are just an example.
>>>>>>> ext_1234 fibration would be equal to sum of ext_1, ext_2, ext_3, ext_4
>>>>>>> and dot_o in one.
>>>>>>>
>>>>>>> In currently default plugin (dot_o) we sort all files by name from the
>>>>>>> start except .o files which we put at the end.
>>>>>>> So if we had a source directory with .c .h and .o files in it files by
>>>>>>> extension would be sorted like: chchchchchchchchoooooooooooooo
>>>>>>> I presumed that in some use cases it is better to have files be sorted
>>>>>>> ccccccccccchhhhhhhhhhhhhhoooooooooooo
>>>>>>>
>>>>>>> Hypothesis is to use the premise that files of same extension are in
>>>>>>> same order of size to reduce fragmentation.
>>>>>>
>>>>>>
>>>>>> What kind of fragmentation you are talking about?
>>>>>> Internal (which results in "dead" disk space), or
>>>>>> external (which results in a lot of "extents")?
>>>>>>
>>>>> External
>>>>>
>>>>>> Edward.
>>>>>>
>>>>>>
>>>>>>> If we group files of same extension in groups in one directory, when
>>>>>>> we write files of same extension after deletion of some files of one
>>>>>>> extension  their group would be in same order as the deleted file so
>>>>>>> they would be written in similar place and occupy the 'hole' of
>>>>>>> similar size.
>>>>
>>>>
>>>> So "similar" means the same order, that is file sizes can differ in 2
>>>> times?
>>>> TBH, I don't see what can be deduced from this assumption ;)
>>>> It can happen that new file either doesn't fit to that hole, or occupies
>>>> too
>>>> small place, so that next file won't fit to the rest of the hole..
>>>>
>>> OFC we can never guarantee that the new file completely fits the hole
>>> (especially as we go through compression in next layer) but for both
>>> smaller and larger file than a hole we would have higher probability
>>> for less extents for situations with 2 or more types of files in a
>>> directory. For one type of file in a directory behavior would be the
>>> same as dot_o and ext_1 plugin.
>>
>>
>> I should upset you: fibration plugins are about mapping of a semantic
>> tree to the storage tree. Simply speaking, they manage mapping
>> object-> key, which has nothing common with real locations on diТак ты уже не ищешь? sk.
>>
>> This is a block allocator, who assigns disk addresses to nodes of the
>> storage tree (right before writing them to disk at flush time).
>> And I am sure that block allocator doesn't care about fibration groups.
>>
>> I strongly not recommend you to experiment with block allocator.
>> Simply because I know how many people killed a lot of time without
>> results.
> Then what is this comment in the beginning of kassign.c about:
>
>
> * In reiser4 every piece of file system data and meta-data has a key. Keys
> * are used to store information in and retrieve it from reiser4 internal
> * tree. In addition to this, keys define _ordering_ of all file system
> * information: things having close keys are placed into the same or
> * neighboring (in the tree order) nodes of the tree. As our block allocator
> * tries to respect tree order (see flush.c), keys also define order in which
> * things are laid out on the disk, and hence, affect performance directly.

I can not find where in the code block allocator respects key ordering.
Once you find it, then let me know..

Thanks,
Edward.
