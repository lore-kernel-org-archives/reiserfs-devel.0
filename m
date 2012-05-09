From: Sandro Souza <escovadordebits@gmail.com>
Subject: Re: Help please
Date: Wed, 9 May 2012 18:03:11 -0300
Message-ID: <CANish_miCVOsjUhQ3GE+1t=vYbTg1W18ky2PP0HfJ_vH94YiVQ@mail.gmail.com>
References: <CANish_k+TucLHQQCkx5kHaqN6e7kJOFqKG4fsey18BhWBs=BWA@mail.gmail.com>
	<20120507201208.5eec936a@Ulf.tvoe.tv>
	<CANish_nX=_XLJgALwLrMV-WjMsBSsPQMXOJG4jTVZBnxbFY23g@mail.gmail.com>
	<4FAAD911.6000403@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=7gi7CXdkuwIDZB0FTlCjOKDIb4CbskyMXRTt/mO4OYk=;
        b=YhvW5crTF3bWrCvETbyLWR3AyDFMPYLrLdWTKdE2EH5vB2a3eNgFiOh8lscMJhOkoi
         aU7a35hVLDhOh7MVbqMHck7iBTSiw49FtZT3NJnjHAd5jRRAymqmq3eI0pFxUbuxjNpP
         Q6d5fHnXMNdI2IJTbIIbqqU/g7U5fMwzRWXawRBI0IprcFsa/Cc7LNEgU7H4zUxqusix
         165ex6Nxmm2A0MVSONhoO0UQD4ImGtXd2M+s9B8urbXWud+xziinC2Cz9n0ZQSi0Dhu+
         XBz7k6zFV2ucD1WjrglKdXGsl1vuVTK+OGjQfZgYX3S5kZ5melcVc0v+9Vx+uYYKgNbX
         ojyA==
In-Reply-To: <4FAAD911.6000403@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Edward, thank you very much for the quick answer. :D

I'll try again with 2.6.39 kernel.

I don't give up. I know it'll work. I just need to discover the right w=
ay. :D

2012/5/9 Edward Shishkin <edward.shishkin@gmail.com>:
> On 05/09/2012 08:24 PM, Sandro Souza wrote:
>>
>> Thanks Dimas for your answer.
>>
>> Following your advice, here is the first part of syslog content (sor=
ry
>> for the big text):
>>
>
> [...]
>
>
>> May =A09 17:58:01 localhost kernel: [ =A0 =A00.000000] Linux version
>> 2.6.32-reiser4 (2.6.32) (root@debian-virtual) (gcc version 4.4.5
>
>
> [...]
>
>
>> May =A09 18:03:13 localhost kernel: [ =A0319.440007] =A0[<ffffffff81=
187ac9>]
>> ? checkin_logical_cluster+0x21/0x1ba
>> May =A09 18:03:13 localhost kernel: [ =A0319.440011] =A0[<ffffffff81=
189698>]
>> ? capture_page_cluster+0xa6/0xe0
>> May =A09 18:03:13 localhost kernel: [ =A0319.440014] =A0[<ffffffff81=
189e03>]
>> ? write_end_cryptcompress+0xd8/0x158
>> May =A09 18:03:13 localhost kernel: [ =A0319.440017] =A0[<ffffffff81=
186893>]
>> ? reiser4_write_end_careful+0x10d/0x194
>> May =A09 18:03:13 localhost kernel: [ =A0319.440022] =A0[<ffffffff81=
109622>]
>> ? pipe_to_file+0x13f/0x14e
>
>
> Hmmmm.... splice.....
> Looks like an old bug, which has been fixed in further reiser4
> patches. Could you please use more fresh kernels? I definitely
> don't have a time to backport fixups to 2.6.32..
>
> Thanks,
> Edward.
>
>
>> May =A09 18:03:13 localhost kernel: [ =A0319.440026] =A0[<ffffffff81=
17949b>]
>> ? reiser4_dirty_inode+0xd/0x70
>> May =A09 18:03:13 localhost kernel: [ =A0319.440029] =A0[<ffffffff81=
1094e3>]
>> ? pipe_to_file+0x0/0x14e
>> May =A09 18:03:13 localhost kernel: [ =A0319.440032] =A0[<ffffffff81=
108487>]
>> ? splice_from_pipe_feed+0x4c/0xd0
>> May =A09 18:03:13 localhost kernel: [ =A0319.440035] =A0[<ffffffff81=
109465>]
>> ? generic_file_splice_write+0xb8/0x136
>> May =A09 18:03:13 localhost kernel: [ =A0319.440038] =A0[<ffffffff81=
1091e1>]
>> ? sys_splice+0x369/0x477
>> May =A09 18:03:13 localhost kernel: [ =A0319.440042] =A0[<ffffffff81=
010a82>]
>> ? system_call_fastpath+0x16/0x1b
>> May =A09 18:03:13 localhost kernel: [ =A0319.440043] Code: 2f 00 00 =
00 01
>> 74 05 e8 62 76 e9 ff 48 89 d0 c3 fa 66 0f 1f 44 00 00 3e 81 2f 00 00
>> 00 01 74 05 e8 49 76 e9 ff c3 b8 00 00 01 00<3e> =A00f c1 07 0f b7 d=
0 c1
>> e8 10 39 c2 74 07 f3 90 0f b7 17 eb f5
>> May =A09 18:03:13 localhost kernel: [ =A0319.440064] RIP
>> [<ffffffff81356a7d>] _spin_lock+0x5/0x1b
>> May =A09 18:03:13 localhost kernel: [ =A0319.440067] =A0RSP<ffff8800=
3a67fc00>
>> May =A09 18:03:13 localhost kernel: [ =A0319.440069] CR2: 0000000000=
000050
>> May =A09 18:03:13 localhost kernel: [ =A0319.440071] ---[ end trace
>> 291a4085ba950956 ]---
>> May =A09 18:03:22 localhost AptDaemon: INFO: Quiting due to inactivi=
ty
>> May =A09 18:03:22 localhost AptDaemon: INFO: Shutdown was requested
>>
>> Any help is wellcome. :)
>>
>> 2012/5/7 dimas<dimas000@ya.ru>:
>>>>
>>>> I made 3 videos (by XVidCap without sound) with these tests.
>>>> They're available in http://www.smartsolutionfactory.com.br/reiser=
4
>>>
>>> screencasts? for what reason?
>>>
>>>> After reboot the VM, no problem. But after it, I've tried to copy =
a
>>>> folder from a reiser3 partition to a reiser4 partition, and
>>>> unfortunally it has failed. :(
>>>> I need to know what I'm doing wrong.
>>>
>>> simply show output of smth like "cp -av /mnt/reiser3/folder /mnt/re=
iser4"
>>> and maybe following dmesg/syslog messages, if copying triggers some
>>> oops/warning
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-d=
evel"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
