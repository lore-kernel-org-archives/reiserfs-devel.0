From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [RFC] Smart fibration plugin ext_4321
Date: Fri, 6 Jan 2017 16:34:04 +0100
Message-ID: <CADW=+3nwVneU3ftJOQ8eT5t9Mdm8_XuTwkkBS2u5B0xKT8h86A@mail.gmail.com>
References: <CADW=+3=Vwi1LFJn8imp7H6woiRP2Oa0=Q=_K-dDqc=hc2cOkZg@mail.gmail.com>
 <586165C2.3000702@gmail.com> <CADW=+3moCR2ufXeD4BmXFG0WE5uS2VpM95S6ZiggKg4BD47tfg@mail.gmail.com>
 <586F9F23.5010409@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LDmuFbzf0qkZzkgtOJWXojWMOfOBjx4fYdk9Sru40tE=;
        b=Fk0z0Tjb3/+WE0ZJC3shM6CL4B58PZtq92WnzHgEZpNO/8jtojN9jS5+BBuD9ijZeh
         ekl3CZzjWkqZqzD3eZvFNO1RhswA9rVuZykz3lxhwRZcj7tbY7DkpucHDcf9J7oyLg9T
         xSwOyv6d+Rn8zQD6dPLDHZ+HYtMPtvNyb9k+1JiwX7duwieSrEryDhz6+i983XmxbrzV
         jj6KGglDMpEMyZd0/+74Q+TPqqdl9sIYzwkLF+bdweeeCJxrXUyoxx3Mf+kAi2xF7fGQ
         v0QMqGzTperEvYXaIiyCZ4gdTp7HdVG+uQVNqzzIXK5xbcJ9SjjuK2JQCDzGH7CGhMen
         dTAA==
In-Reply-To: <586F9F23.5010409@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Fri, Jan 6, 2017 at 2:44 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 12/26/2016 11:13 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>> On Mon, Dec 26, 2016 at 7:47 PM, Edward Shishkin
>> <edward.shishkin@gmail.com> wrote:
>>>
>>>
>>>
>>> On 12/25/2016 02:59 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>
>>>> Fibration is a great way to decrease fragmentation and increase
>>>> throughput.
>>>> Currently there are 4 fibration plugins, lex, dot.o, ext_1 and ext_3
>>>> and they all have their upsides and downsides.
>>>>
>>>> Proposed fibration plugin combines them all so that it combines files
>>>> with same extensions for 1, 2. 3 and 4 character extension  in groups
>>>> and sorts them in same fiber group.
>>>>
>>>> With this fibration plugin all eg. xvid files would be in same group
>>>> in folder on disk sorted alphabetically
>>>
>>>
>>>
>>> What application wants all xvid files to be in the same group?
>>> Do you have any benchmark numbers which show advantages
>>> of the new plugin?
>>>
>> Xvid files are just an example.
>> ext_1234 fibration would be equal to sum of ext_1, ext_2, ext_3, ext_4
>> and dot_o in one.
>>
>> In currently default plugin (dot_o) we sort all files by name from the
>> start except .o files which we put at the end.
>> So if we had a source directory with .c .h and .o files in it files by
>> extension would be sorted like: chchchchchchchchoooooooooooooo
>> I presumed that in some use cases it is better to have files be sorted
>> ccccccccccchhhhhhhhhhhhhhoooooooooooo
>>
>> Hypothesis is to use the premise that files of same extension are in
>> same order of size to reduce fragmentation.
>
>
>
> What kind of fragmentation you are talking about?
> Internal (which results in "dead" disk space), or
> external (which results in a lot of "extents")?
>
External

> Edward.
>
>
>>
>> If we group files of same extension in groups in one directory, when
>> we write files of same extension after deletion of some files of one
>> extension  their group would be in same order as the deleted file so
>> they would be written in similar place and occupy the 'hole' of
>> similar size.
>> Ofc I am not talking about files of few kB size where Reiser4 is great
>> at packing but about files from few MB to few GB.
>>
>> Eg. directory with mp3 and xvid files. mp3s are on the order of MB and
>> xvid on the order of GB. If we sort them just by name order of xvid
>> and mp3 files in one directory would be random so when deleting the
>> smaller ones we would make random holes (like from
>> mxmxmxxmmmxxxxmxxmmmx to mx xmxx  mx  xmx mmmx).
>> With grouping of writing where all mp3s would be written first and all
>> xvid after them after some deletions we would have smaller holes
>> grouped first  and larger last (like from mmmmmmmmmmmmxxxxxxxxxx to mm
>> m   mmm mmxx xxx xxx) but the main thing that after writing we would
>> write mp3s in mp3 holes and xvid in xvid holes ergo. reduce
>> fragmentation  (like from mm m   mmm mmxx xxx xxx to
>> mmMmMMMmmmXmmxxXxxx xxx) that we would create if we would try to write
>> xvid over mp3 holes.
>>
>> One obvious use case where I hypothesize that this type of fibration
>> is better long term would be directories with content similar to usual
>> Downloads directory, a lot of different types (and siyes) of files
>> that get written and deleted a lot.
>>
>> ext_1234 fibration is the same as dot_o for directories with only one
>> or one and .o file extension.
>>
>> Ofc this is just a hypothesis that I would like to prove with some
>> fragmentation benchmarks but I wanted to hear your thoughts.
>>
>> And while I was looking through the code I found a part that I
>> comprehended, elegant and easy to understand so I wanted to make
>> something so I could learn more.
>>
>>
>>> Thanks,
>>> Edward.
>>>
>> Thank you for your time and effort
>>
>> Dushan
>>
>>
>>>
>>>>    so that we will avoid putting
>>>> small files between them and in that way reduce fragmentation. That
>>>> group (xvid 4 character extensions) would be among last groups under
>>>> one directory so that all small files would be written before it.
>>>>
>>>> Problem with the attached patch is that currently every fibre value is
>>>> defined as u64  (eg. static __u64 fibre_ext_3) but if I understood
>>>> correctly comments in kassign.c and fibration.c fibration part of the
>>>> key is only 7 bits long.
>>>> If that is true how did fibre_ext_3 worked?
>>>>
>>>> Thanks
>>>>
>>>> Dushan
>>>
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel=
"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
