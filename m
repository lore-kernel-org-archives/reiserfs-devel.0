From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/block_alloc.c:151
Date: Wed, 09 Feb 2011 16:14:52 +0100
Message-ID: <4D52AF6C.3000002@gmail.com>
References: <AANLkTi=DKZfNUQDXWUNMZXBonYWTdgAr6cMtyGk12ebM@mail.gmail.com>	<4D51C558.8050001@gmail.com>	<AANLkTinGQZdTSQHsgTbDYLn2etE6wGwr8UWSmSs=nCL1@mail.gmail.com>	<4D51DB7A.4000408@gmail.com>	<4D51FE01.2040100@gmail.com> <AANLkTimOHF87hX=s38-_ERrYh7mYEV1bc6xNsjb51U5s@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTimOHF87hX=s38-_ERrYh7mYEV1bc6xNsjb51U5s@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?TWFyY2luIEJhY3p5xYRza2k=?= <marbacz@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Marcin Baczy=C5=84ski wrote:
> W dniu 9 lutego 2011 03:37 u=C5=BCytkownik Edward Shishkin
> <edward.shishkin@gmail.com> napisa=C5=82:
>  =20
>> On 02/09/2011 01:10 AM, Edward Shishkin wrote:
>>    =20
>>> On 02/09/2011 12:56 AM, Marcin Baczy=C5=84ski wrote:
>>>      =20
>>>> W dniu 8 lutego 2011 23:36 u=C5=BCytkownik Edward Shishkin
>>>> <edward.shishkin@gmail.com> napisa=C5=82:
>>>>        =20
>>>>> Marcin Baczy=C5=84ski wrote:
>>>>>          =20
>>>>>> Hi,
>>>>>>
>>>>>>            =20
>>>>> Hello.
>>>>>
>>>>>          =20
>>>>>> I'm attaching a trace of kernel BUG that Firefox hits. It's 100%
>>>>>> reproducible,
>>>>>> every time I start the browser it hits the bug within several se=
conds,
>>>>>> then
>>>>>> whole system hangs. However I've never triggered the problem wit=
h any
>>>>>> other
>>>>>> application.
>>>>>> I've tested 2.6.37-gentoo-hardened + reiser4 patch,
>>>>>>            =20
>>>>> "2.6.37-gentoo-hardened" is based on what vanilla kernel (.36 or =
=2E37)?
>>>>>          =20
>>>> It's based on .37.
>>>>
>>>>        =20
>>> [<ffffffff81142782>] ? grabbed2flush_reserved_nolock+0x42/0xa0
>>> [<ffffffff81144c54>] ? jnode_make_dirty_locked+0xe4/0x190
>>> [<ffffffff81144d31>] ? znode_make_dirty+0x31/0xe0
>>> [<ffffffff81166a69>] ? find_disk_cluster+0x359/0x390
>>> [<ffffffff8117511c>] ? do_readpage_ctail+0xdc/0x570
>>> [<ffffffff81166f7d>] ? prepare_logical_cluster+0x23d/0x760
>>>
>>> A set of blocks reserved in prepare_logical_cluster() is exhausted
>>> at znode_make_dirty() for some reasons. No ideas except inserting
>>> debugging messages to figure out who is stealing the reservation.
>>>      =20
>> Aaahhh, it seems I understand what's up..
>> Could you please apply the attached patch, run
>> Firefox and send me kernel warnings?
>>    =20
>
> Here they are (kernel with patch applied + reiser4_debug=3Dy):
>  =20

Hello Marcin,
debug mode is not needed any more.

> reiser4[firefox(2497)]: find_disk_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
> WARNING: file 404669 consists of 1020 fragments
>  =20

This is an old problem of degeneration we need to fix somehow:
64K disk cluster should occupy not more than 17 4K-blocks
(15 full blocks plus 2 partially filled ones in the worst case).

=46or now please find the degenerated files with "find -inum 404669",
etc. and rename them. Use old names for non-sparse copies that
can be created with "cp" command. Some of those files are used
by Firefox, so it would be better to do it in the singe mode (init 1)
with minimum running applications. Such renaming will allow you to
avoid tons of warnings. Keep a list of degenerated files somewhere:
we'll work with them to narrow down the problem.

Could you join #reiser4 channel at irc://oftc.net, say on weekends?

Thanks,
Edward.

> reiser4[firefox(2497)]: find_disk_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
> WARNING: file 18693127 consists of 1020 fragments
>
> But there are thousands of them, and not all are caused by Firefox:
> reiser4[bash(2708)]: find_disk_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
> WARNING: file 17649897 consists of 1020 fragments
> reiser4[xz(2708)]: find_disk_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
> WARNING: file 17649897 consists of 1020 fragments
>
> And among thousands of these 1020-fragments, there are
> 6 probably more intresting warns:
>
> 6542-reiser4[firefox(2518)]: find_disk_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
> 6543:WARNING: file 404690 consists of 21 fragments
> 6544-reiser4[firefox(2518)]: find_disk_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
> 6545:WARNING: file 404690 consists of 31 fragments
> --
> 9297-reiser4[firefox(2518)]: find_disk_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
> 9298:WARNING: file 404690 consists of 21 fragments
> 9299-reiser4[firefox(2518)]: find_disk_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
> 9300:WARNING: file 404690 consists of 31 fragments
> --
> 9453-reiser4[firefox(2518)]: find_disk_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
> 9454:WARNING: file 404690 consists of 29 fragments
> --
> 9847-reiser4[firefox(2518)]: find_disk_cluster
> (fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
> 9848:WARNING: file 404690 consists of 21 fragments
>
> I don't see any asserts in dmesg. And this time there was no BUG.
> If more of these warning would be of any use, I can send them as well=
,
> but compressed log is >60kB, so not attaching it now.
>
> Thanks,
> Marcin
>
>  =20

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
