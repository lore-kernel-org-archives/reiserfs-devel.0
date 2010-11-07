From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: git tree for reiser4 development
Date: Sun, 07 Nov 2010 16:55:09 +0100
Message-ID: <4CD6CBDD.9020802@gmail.com>
References: <201011071538.44063.a.miskiewicz@gmail.com> <4CD6BDFE.2070503@gmail.com> <201011071639.23764.a.miskiewicz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <201011071639.23764.a.miskiewicz@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arkadiusz Miskiewicz <a.miskiewicz@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Arkadiusz Miskiewicz wrote:
> On Sunday 07 of November 2010, Edward Shishkin wrote:
>   
>> Arkadiusz Miskiewicz wrote:
>>     
>>> Hi.
>>>       
>> Hello.
>>
>>     
>>> How reiser4 is developed
>>>       
>> via sending patches to -mm
>>     
>
> Ouh, mm currently has no reiser4 , so I guess it was dropped.
>   

No, it wasn't.
Just disabled by "depends on BROKEN" in Kconfig:
it needs to be adjusted to the latest VFS changes.

>   
>>> - is there a public git repo with development tree
>>> and if so, where?
>>>       
>> There is a Namesys corporative git repo, but currently it is
>> unavailable for public. The last commit was at November 2006,
>> or so. I might want to put it to kernel.org..
>>     
>
> Was looking for something newer - close to 2.6.36

reiser4-for-2.6.36 stuff is not yet ready.

Thanks,
Edward.

