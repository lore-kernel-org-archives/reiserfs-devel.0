From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Testing a custom kernel (2.6.39) with native reiser4 support
Date: Thu, 24 May 2012 20:45:35 +0200
Message-ID: <4FBE81CF.8030207@gmail.com>
References: <CANish_kwKO1EUys-QS44oJeD1T7daFMn1QA0LdPC1ZVG6_RtOg@mail.gmail.com>	<4FB9886F.9000607@gmail.com> <CANish_nJTY=cmKpxhvzNxCGSxs137-PyDbNOf0qWFDtmGpM6Qw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CANish_nJTY=cmKpxhvzNxCGSxs137-PyDbNOf0qWFDtmGpM6Qw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sandro Souza <escovadordebits@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 05/24/2012 07:53 PM, Sandro Souza wrote:
> Hello my friends.
>
> Edward, you ARE the man! :D
>
> Your patch works wonderfully.
>
> Inside my virtual machine, I made a new custom distro (based on debian
> squeeze, but with 2.6.39 kernel, patched with reiser4 native support),
> and I was able to install it in another virtual machine (/boot as
> reiser3, / as reiser4 and /home as reiser4).
>
> Everything are working fine now. :D

Thanks.

Actually not everything is so iridescent:
there are a couple of bugs which can be really annoying..
We'll continue to narrow down them at leisure. For now make
a friendship with fsck..


>
> Now, I'll burn this new custom distro in a DVD and I'll install it on
> my notebook (no more VM) to test it.
>
> Please, may you tell me if the reiser4 has some auto-defragmentation feature?


Under construction.
I think that repacker and next features will be paid options
(money will go for Reiser's children).

Thanks,
Edward.


>
> The compression feature (gzip1) is amazing. If we have
> auto-defragmentation feature also.....man!!! No words. :D
>
> Thank you and the entire reiser4 team. You all are making the
> difference. REALLY!
>
> 2012/5/20 Edward Shishkin<edward.shishkin@gmail.com>:
>> Hello.
>>
>> Please, try the attached patch: it should help...
>> I have also fixed a deadlock because of reiser4
>> lock ordering violation:
>>
>> do_lo_send_aops() keeps page locked and calls file_update_time()
>> which calls reiser4_update_sd, which tries to acquire a longterm
>> lock (bad).
>>
>> Thanks,
>> Edward.
>>
>>
>> On 05/15/2012 12:55 AM, Sandro Souza wrote:
>>>
>>> Hello my friends.
>>>
>>> I made a new custom distro based on debian squeeze, but with 2.6.39
>>> kernel, patched with reiser4
>>
>>
>> [...]
>>
>>
>>> Trying to copy a folder from a reiser3 partition to a reiser4
>>> partition, I got error messages.
>>>
>>> Testing my custom kernel with "preemption model" in "Preemptible
>>> Kernel", I got these messages:
>>>
>>> [  286.945598] ------------[ cut here ]------------
>>> [  286.945609] kernel BUG at fs/reiser4/block_alloc.c:151!
>>> [  286.945617] invalid opcode: 0000 [#1] PREEMPT SMP
>>> [  286.945626] last sysfs file:
>>
>>
>> [...]
>>
>>
>>> ffffffff8118e00d
>>> [  286.945808] Call Trace:
>>> [  286.945817]  [<ffffffff8117b484>] ? jnode_make_dirty_locked+0x112/0x18f
>>> [  286.945824]  [<ffffffff8117b529>] ? znode_make_dirty+0x28/0x87
>>> [  286.945831]  [<ffffffff8118e00d>] ? update_sd+0x344/0x3a4
>>> [  286.945838]  [<ffffffff81387a46>] ? sub_preempt_count+0x83/0x94
>>> [  286.945845]  [<ffffffff8118e096>] ? write_sd_by_inode_common+0x29/0x92
>>> [  286.945852]  [<ffffffff8103cb67>] ? get_parent_ip+0x9/0x1b
>>> [  286.945858]  [<ffffffff8118512b>] ? reiser4_dirty_inode+0x19/0x73
>>> [  286.945865]  [<ffffffff810edecb>] ? T.1132+0x12/0x2e
>>> [  286.945872]  [<ffffffff8104b288>] ? current_fs_time+0x1e/0x24
>>> [  286.945878]  [<ffffffff81112ddb>] ? __mark_inode_dirty+0x28/0x1c8
>>> [  286.945885]  [<ffffffff81108169>] ? file_update_time+0xf7/0x126
>>> [  286.945891]  [<ffffffff811924ee>] ?
>>> reiser4_write_end_careful+0x147/0x184
>>> [  286.945897]  [<ffffffff81115083>] ? pipe_to_file+0x152/0x161
>>> [  286.945903]  [<ffffffff81387af5>] ? add_preempt_count+0x9e/0xa0
>>> [  286.945909]  [<ffffffff81114f31>] ?
>>> generic_file_splice_write+0x133/0x133
>>> [  286.945914]  [<ffffffff811143cb>] ? splice_from_pipe_feed+0x6d/0xed
>>> [  286.945920]  [<ffffffff81114eb3>] ?
>>> generic_file_splice_write+0xb5/0x133
>>> [  286.945933]  [<ffffffff811162a6>] ? sys_splice+0x2f8/0x3d2
>>> [  286.945939]  [<ffffffff8138a7d2>] ? system_call_fastpath+0x16/0x1b
>>> [  286.945944] Code: 25 80 cc 00 00 53 48 83 ec 08 48 8b 80 38 05 00

