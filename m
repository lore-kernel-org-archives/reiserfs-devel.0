From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 patches and todo list
Date: Sun, 08 Jan 2012 14:53:58 +0100
Message-ID: <4F099FF6.9010908@gmail.com>
References: <28ea2828ed5cb6c7b01630c1aa548a67@mail.velocitynet.com.au>	<4F05AB45.5020003@gmail.com> <CALvMQwQTTcsf0w+qneYGKfsjN5WfXCf_6uvyVeaso25nGy+OrA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=ReGpFTTtSUM5wsX0lS1SQEa1jhi7mMnxI3DPtM7zsWU=;
        b=ubksTZbGuVz4mNVi5R/3odbXb+Rxg+eOUgvYxysOfpiplBgKQbrcccbgwhTv5Q0brm
         GFFIBPQec5fwy0UUFNM8yzmCbMTu9vLRbSOE5trJ6xbS6MITil3PIXU428E73tELcKNb
         hAy/sZN0bmtzsiylnsDojJYMMxp1Mlbbm2fvg=
In-Reply-To: <CALvMQwQTTcsf0w+qneYGKfsjN5WfXCf_6uvyVeaso25nGy+OrA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?TWFyY2luIEJhY3p5xYRza2k=?= <marbacz@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 01/05/2012 08:33 PM, Marcin Baczy=C5=84ski wrote:
> 2012/1/5 Edward Shishkin<edward.shishkin@gmail.com>:
>> On 01/05/2012 11:51 AM, doiggl@velocitynet.com.au wrote:
>>>
>>> Hello,
>>> Questions:
>>> - Are there any plans for a reiser4 patch for Linux kernel 3.2/3.1/=
3.0
>>> series ?
>>
>>
>> Maybe for 3.2, but not sure..
>>
>> fs-writeback has been changed a lot and I don't have a time to adjus=
t
>> reiser4 to every stupid VFS change. Anybody care to? I'll provide th=
e
>> hints..
>>
>
> Well, if you have patience to provide the hints for somebody with lit=
tle
> kernel experience and who is just learning how the internals of VFS
> work than I think I can do it :]


Ok, I think that adjusting reiser4 to 3.2 would be a good start.

Unlike other file systems reiser4's ->writepages() address space
operation doesn't actually write pages to disk. Instead
reiser4_writepages() puts them into a transaction (actually it
takes place for so-called "anonymous" pages, dirtied via mmap).

So with every portion of writeback-ed inodes we also need in addition
to call reiser4_writeout().

Such slight inconsistency with VFS semantic was fixed via introducing
a new super operation ->writeback_inodes(), so that=20
reiser4_writeback_inodes() makes sure that everything is written
properly (see patches 0-7 for details):

http://marc.info/?l=3Dreiserfs-devel&m=3D126507575609892&w=3D2
http://marc.info/?l=3Dreiserfs-devel&r=3D1&b=3D201002&w=3D2

The following 6 patches adjusts reiser4 to further changes in
fs-writeback:

http://marc.info/?l=3Dreiserfs-devel&r=3D1&b=3D201007&w=3D2

And now (in 3.1) fs-writeback.c got changed again. Specifically,
semantic of writeback_sb_inodes(), the "implicit" ->writeback_inodes()
super operation, has been changed: now it writes not necessarily all
inodes of a superblock. As a result It'll break reiser4_sync_fs() and
reiser4's entd worker semantic, which require _all_ inodes of reiser4
superblock to be writeback-ed.

So I guess we need a version of writeback_sb_inodes(), which writes=20
(optionally) _all_ inodes of a superblock.

Note, that fs-writeback is a single pain in the ass: in other bits
reiser4 is perfectly coherent with VFS.


>
> BTW is there any chance that R4 will be merged into Linus' tree?


Merging upstream has mostly marketing/political aspects which would
mean additional burden for me personally.

Who cares to merge it with upstream? It might be important for some
vendor, who is ready to pay money for reiser4 development.

Perhaps we'll consider possibility of merging, but not now.
Now, when I spend my weekends for reiser4, I would prefer to
concentrate on scientific aspects of file system development.

Edward.


> Or that known bugs will get fixed? Following this list, one can get a=
n
> impression that R4 is in a maintenance-only mode...

>>
>>
>>> - Has the reiser4 todo list changed since 2009 [1] ?
>>>
>>> [1]
>>> https://reiser4.wiki.kernel.org/articles/t/o/d/TODO_b7b1.html
>>>
>>> Thanks Glenn
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
