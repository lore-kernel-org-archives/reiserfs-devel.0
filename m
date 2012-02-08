From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 patches and todo list
Date: Thu, 09 Feb 2012 00:22:47 +0100
Message-ID: <4F3303C7.3020600@gmail.com>
References: <28ea2828ed5cb6c7b01630c1aa548a67@mail.velocitynet.com.au>	<4F05AB45.5020003@gmail.com>	<CALvMQwQTTcsf0w+qneYGKfsjN5WfXCf_6uvyVeaso25nGy+OrA@mail.gmail.com>	<4F099FF6.9010908@gmail.com> <CALvMQwRHLD19SZqxFZrAZkih+zKdfPjVoWe-m1HhtQcdA9E4mQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=yj94eC4E6WhpyKAc4F4AsgAzJHWtUjxQ8+/Hu3RDUx8=;
        b=T6NBfAMvuTNF5yFIXebxTZ+7kaYRVk5cTvLBRaGj6t7uXuq7t8xqWzzhFsaG635wZ5
         W0lvI3r8zfKx5R17eIrv1qzwpi0XNV8qsKRs2O8FVr7+v5vNkF08P/XNZqwGx1+LR7lt
         CyPlIECMS+LbW4ix6yk7CnZ+KBbvNwYhTZhyo=
In-Reply-To: <CALvMQwRHLD19SZqxFZrAZkih+zKdfPjVoWe-m1HhtQcdA9E4mQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?TWFyY2luIEJhY3p5xYRza2k=?= <marbacz@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 02/08/2012 08:40 PM, Marcin Baczy=C5=84ski wrote:
> W dniu 8 stycznia 2012 14:53 u=C5=BCytkownik Edward Shishkin
> <edward.shishkin@gmail.com>  napisa=C5=82:
>> On 01/05/2012 08:33 PM, Marcin Baczy=C5=84ski wrote:
>>>
>>> 2012/1/5 Edward Shishkin<edward.shishkin@gmail.com>:
>>>>
>>>> On 01/05/2012 11:51 AM, doiggl@velocitynet.com.au wrote:
>>>>>
>>>>>
>>>>> Hello,
>>>>> Questions:
>>>>> - Are there any plans for a reiser4 patch for Linux kernel 3.2/3.=
1/3.0
>>>>> series ?
>>>>
>>>>
>>>>
>>>> Maybe for 3.2, but not sure..
>>>>
>>>> fs-writeback has been changed a lot and I don't have a time to adj=
ust
>>>> reiser4 to every stupid VFS change. Anybody care to? I'll provide =
the
>>>> hints..
>>>>
>>>
>>> Well, if you have patience to provide the hints for somebody with l=
ittle
>>> kernel experience and who is just learning how the internals of VFS
>>> work than I think I can do it :]
>>
>>
>>
>> Ok, I think that adjusting reiser4 to 3.2 would be a good start.
>>
>> Unlike other file systems reiser4's ->writepages() address space
>> operation doesn't actually write pages to disk. Instead
>> reiser4_writepages() puts them into a transaction (actually it
>> takes place for so-called "anonymous" pages, dirtied via mmap).
>>
>> So with every portion of writeback-ed inodes we also need in additio=
n
>> to call reiser4_writeout().
>>
>> Such slight inconsistency with VFS semantic was fixed via introducin=
g
>> a new super operation ->writeback_inodes(), so that
>> reiser4_writeback_inodes() makes sure that everything is written
>> properly (see patches 0-7 for details):
>>
>> http://marc.info/?l=3Dreiserfs-devel&m=3D126507575609892&w=3D2
>> http://marc.info/?l=3Dreiserfs-devel&r=3D1&b=3D201002&w=3D2
>>
>> The following 6 patches adjusts reiser4 to further changes in
>> fs-writeback:
>>
>> http://marc.info/?l=3Dreiserfs-devel&r=3D1&b=3D201007&w=3D2
>>
>> And now (in 3.1) fs-writeback.c got changed again. Specifically,
>> semantic of writeback_sb_inodes(), the "implicit" ->writeback_inodes=
()
>> super operation, has been changed: now it writes not necessarily all
>> inodes of a superblock. As a result It'll break reiser4_sync_fs() an=
d
>> reiser4's entd worker semantic, which require _all_ inodes of reiser=
4
>> superblock to be writeback-ed.
>>
>> So I guess we need a version of writeback_sb_inodes(), which writes
>> (optionally) _all_ inodes of a superblock.
>>
>> Note, that fs-writeback is a single pain in the ass: in other bits
>> reiser4 is perfectly coherent with VFS.
>>
>
> Ok, so attached is my attempt to port the 2.6.39-1 path to the 3.2 ke=
rnel.


Great!
I'll take a look for details a bit later..


> I'm not sure if I got the writeback parts right, so please take a clo=
ser look
> at them and tell me if I missed or misunderstood something.
> The code is probably closer to ugly than to pretty around converting
> struct wb_writeback_work to writeback_control and back again right no=
w.
> I'll clean this up if that code does what it should.
>
> Another thing I don't know what to do with are the new start and end
> arguments to reiser4_sync_common. Currently they are ignored, which
> I think results in always syncing everything.


You are right: we can not fsync specified range, at least in the curren=
t
transaction model.
The best we can do is figure out what atom contains specified page
and commit it (that is exactly what the entd worker tries to do).

Thank you,
Edward.


>
> With this patch, Reiser4 compiles as a module or builtin, and is able=
 to
> do some simple operations on a filesystem. I tried copying some rathe=
r
> large directories to and on the filesystem, but that's pretty much al=
l the
> testing I have done, so if the kconfig option was marked as 'experime=
ntal',
> it probably should be 'highly experimental' by now :)
>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
