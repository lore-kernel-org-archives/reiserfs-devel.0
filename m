From: Sandro Souza <escovadordebits@gmail.com>
Subject: Re: Testing a custom kernel (2.6.39) with native reiser4 support
Date: Thu, 24 May 2012 14:53:25 -0300
Message-ID: <CANish_nJTY=cmKpxhvzNxCGSxs137-PyDbNOf0qWFDtmGpM6Qw@mail.gmail.com>
References: <CANish_kwKO1EUys-QS44oJeD1T7daFMn1QA0LdPC1ZVG6_RtOg@mail.gmail.com>
	<4FB9886F.9000607@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=lwQDEaIzPFQltFoo4hIzOecuy71Y6o/bvLi/vPb1zoI=;
        b=kpAgR8iq+ftOhzb4puGsJNK6ydDxves19fRUuaVK+1oQR+73NdfWLmiKhYLwFZW4ou
         lcMOYjPvQLOEHjil8IifywiQ+YxU+j0lY4I5ojGtHqQoWJePhSnrCYM7YpKGXMNDoKK8
         5jzGf9AQy52HaD3k8pnncDgBNcHTRcLqn/AQscU0HeiEdNSpW/SJUTGBizkOOOF0gyl2
         nwKoBFeQBXrXMKEGWZk6jB1z0hIlaX1PdxPsv1qFWFWQsRgl6HWzTZKnmK1EU+i+mCHb
         CslObp6vvsn/O9tUftzhXzS8Qb2YaalaD/p/uMQtluzP8GGJ6Nisx+amzUV5iU16DuPL
         Rkvg==
In-Reply-To: <4FB9886F.9000607@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello my friends.

Edward, you ARE the man! :D

Your patch works wonderfully.

Inside my virtual machine, I made a new custom distro (based on debian
squeeze, but with 2.6.39 kernel, patched with reiser4 native support),
and I was able to install it in another virtual machine (/boot as
reiser3, / as reiser4 and /home as reiser4).

Everything are working fine now. :D

Now, I'll burn this new custom distro in a DVD and I'll install it on
my notebook (no more VM) to test it.

Please, may you tell me if the reiser4 has some auto-defragmentation fe=
ature?

The compression feature (gzip1) is amazing. If we have
auto-defragmentation feature also.....man!!! No words. :D

Thank you and the entire reiser4 team. You all are making the
difference. REALLY!

2012/5/20 Edward Shishkin <edward.shishkin@gmail.com>:
> Hello.
>
> Please, try the attached patch: it should help...
> I have also fixed a deadlock because of reiser4
> lock ordering violation:
>
> do_lo_send_aops() keeps page locked and calls file_update_time()
> which calls reiser4_update_sd, which tries to acquire a longterm
> lock (bad).
>
> Thanks,
> Edward.
>
>
> On 05/15/2012 12:55 AM, Sandro Souza wrote:
>>
>> Hello my friends.
>>
>> I made a new custom distro based on debian squeeze, but with 2.6.39
>> kernel, patched with reiser4
>
>
> [...]
>
>
>> Trying to copy a folder from a reiser3 partition to a reiser4
>> partition, I got error messages.
>>
>> Testing my custom kernel with "preemption model" in "Preemptible
>> Kernel", I got these messages:
>>
>> [ =A0286.945598] ------------[ cut here ]------------
>> [ =A0286.945609] kernel BUG at fs/reiser4/block_alloc.c:151!
>> [ =A0286.945617] invalid opcode: 0000 [#1] PREEMPT SMP
>> [ =A0286.945626] last sysfs file:
>
>
> [...]
>
>
>> ffffffff8118e00d
>> [ =A0286.945808] Call Trace:
>> [ =A0286.945817] =A0[<ffffffff8117b484>] ? jnode_make_dirty_locked+0=
x112/0x18f
>> [ =A0286.945824] =A0[<ffffffff8117b529>] ? znode_make_dirty+0x28/0x8=
7
>> [ =A0286.945831] =A0[<ffffffff8118e00d>] ? update_sd+0x344/0x3a4
>> [ =A0286.945838] =A0[<ffffffff81387a46>] ? sub_preempt_count+0x83/0x=
94
>> [ =A0286.945845] =A0[<ffffffff8118e096>] ? write_sd_by_inode_common+=
0x29/0x92
>> [ =A0286.945852] =A0[<ffffffff8103cb67>] ? get_parent_ip+0x9/0x1b
>> [ =A0286.945858] =A0[<ffffffff8118512b>] ? reiser4_dirty_inode+0x19/=
0x73
>> [ =A0286.945865] =A0[<ffffffff810edecb>] ? T.1132+0x12/0x2e
>> [ =A0286.945872] =A0[<ffffffff8104b288>] ? current_fs_time+0x1e/0x24
>> [ =A0286.945878] =A0[<ffffffff81112ddb>] ? __mark_inode_dirty+0x28/0=
x1c8
>> [ =A0286.945885] =A0[<ffffffff81108169>] ? file_update_time+0xf7/0x1=
26
>> [ =A0286.945891] =A0[<ffffffff811924ee>] ?
>> reiser4_write_end_careful+0x147/0x184
>> [ =A0286.945897] =A0[<ffffffff81115083>] ? pipe_to_file+0x152/0x161
>> [ =A0286.945903] =A0[<ffffffff81387af5>] ? add_preempt_count+0x9e/0x=
a0
>> [ =A0286.945909] =A0[<ffffffff81114f31>] ?
>> generic_file_splice_write+0x133/0x133
>> [ =A0286.945914] =A0[<ffffffff811143cb>] ? splice_from_pipe_feed+0x6=
d/0xed
>> [ =A0286.945920] =A0[<ffffffff81114eb3>] ?
>> generic_file_splice_write+0xb5/0x133
>> [ =A0286.945933] =A0[<ffffffff811162a6>] ? sys_splice+0x2f8/0x3d2
>> [ =A0286.945939] =A0[<ffffffff8138a7d2>] ? system_call_fastpath+0x16=
/0x1b
>> [ =A0286.945944] Code: 25 80 cc 00 00 53 48 83 ec 08 48 8b 80 38 05 =
00
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
