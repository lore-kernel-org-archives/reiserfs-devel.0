From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Segfault in fsck.reiser4
Date: Tue, 23 Mar 2010 23:31:48 +0100
Message-ID: <4BA94154.7010106@gmail.com>
References: <op.u906wjlkhogzsi@g17b> <4BA9240D.4080705@gmail.com> <op.u91inegqhogzsi@g17b>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <op.u91inegqhogzsi@g17b>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Cc: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

Jon=C3=A1=C5=A1 Vidra wrote:
> Dne Tue, 23 Mar 2010 21:26:53 +0100 Edward Shishkin=20
> <edward.shishkin@gmail.com> napsal(a):
>
>> The most efficient way is to provide me with a root access to your=20
>> machine.
>> You have encountered a rare case of corruption, and it is important=20
>> to fix this fsck bug properly.
>
> Well =E2=80=A6
> I don't think that would be possible, but I'll see what I can do.

Segfault is caused by aux_adler32: offset (4294839597) is out of bounds=
=2E.
Could you print and show us the structure "hint"?


> Several users have accounts on the machine, so even though they are j=
ust
> family members, not corporate customers, I can't allow everyone in.
> I'd like to help, so I'll try to arrange it somehow.
>
>
>>> By the way, how do I find a filename by node number or key?
>>
>> find - inum 64881
>
> Thanks. That's straightforward, shame on me for asking stupid questio=
ns.
>
>
>>> I'd like to know which file caused the corruption.
>>
>> What do you want to do with this file?
>
> I'd like to know if it is backed up somewhere, unique
> or downloaded from the Internet or whatever.
> I know I can't really trust *any* data on this partition anymore,
> but I'd still like to know which files are the most likely to be lost=
=2E
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
