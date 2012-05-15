From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Testing a custom kernel (2.6.39) with native reiser4 support
Date: Tue, 15 May 2012 13:49:21 +0200
Message-ID: <4FB242C1.6090409@gmail.com>
References: <CANish_kwKO1EUys-QS44oJeD1T7daFMn1QA0LdPC1ZVG6_RtOg@mail.gmail.com> <4FB22C03.1080509@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4FB22C03.1080509@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sandro Souza <escovadordebits@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 05/15/2012 12:12 PM, Edward Shishkin wrote:
> On 05/15/2012 12:55 AM, Sandro Souza wrote:
>> Hello my friends.
>
> Hello.
>
>>
>> I made a new custom distro based on debian squeeze, but with 2.6.39
>> kernel, patched with reiser4
>> (http://downloads.sourceforge.net/project/reiser4/reiser4-for-linux-2.6/reiser4-for-2.6.39-1.patch.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Freiser4%2Ffiles%2Freiser4-for-linux-2.6%2F&ts=1337035240&use_mirror=ufpr).
>>
>>
>> Trying to copy a folder from a reiser3 partition to a reiser4
>> partition, I got error messages.
>>
>> Testing my custom kernel with "preemption model" in "Preemptible
>> Kernel", I got these messages:
>>
>> [ 286.945598] ------------[ cut here ]------------
>> [ 286.945609] kernel BUG at fs/reiser4/block_alloc.c:151!
>> [ 286.945617] invalid opcode: 0000 [#1] PREEMPT SMP
>> [ 286.945626] last sysfs file:
>>
> [...]
>
>> [ 286.945676]
>> [ 286.945683] Pid: 2433, comm: nautilus Not tainted 2.6.39-reiser4 #1
>> innotek GmbH VirtualBox
>> [ 286.945691] RIP: 0010:[<ffffffff81178fae>] [<ffffffff81178fae>]
>> grabbed2flush_reserved_nolock+0x33/0x7b
>
>
> It seems we forget to reserve space somewhere in write_end_cryptcompress().
>
> Reiser4 uses technique of "soft ENOSPC": since it is impossible to
> estimate precisely amount of disk space that will be spent by any
> operation, every thread reserves needed amount of space with store,
> so that surplus will be freed at commit time.
>
> It seems we forget to reserve space somewhere in
> write_end_cryptcompress() for some needs, so that all reserved space
> is exhausted and update_sd(), which wants 1 reserved block encounters
> a zeroed counter of reserved blocks.


BTW we don't reserve space exactly for update_sd() (one block should be
reserved). Anybody care to fix this?

Thanks,
Edward.
