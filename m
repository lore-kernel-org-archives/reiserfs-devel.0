From: =?UTF-8?Q?Marcin_Baczy=C5=84ski?= <marbacz@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/block_alloc.c:151
Date: Wed, 9 Feb 2011 11:15:26 +0100
Message-ID: <AANLkTimOHF87hX=s38-_ERrYh7mYEV1bc6xNsjb51U5s@mail.gmail.com>
References: <AANLkTi=DKZfNUQDXWUNMZXBonYWTdgAr6cMtyGk12ebM@mail.gmail.com>
	<4D51C558.8050001@gmail.com>
	<AANLkTinGQZdTSQHsgTbDYLn2etE6wGwr8UWSmSs=nCL1@mail.gmail.com>
	<4D51DB7A.4000408@gmail.com>
	<4D51FE01.2040100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=6m6ySzqEPVIsXaoRfTsxS0cjQhalalX69ulxj9+/EyM=;
        b=C6PsrXCLakelhOhloCn+AGzmaIKZwoaotaLb1HyegbvLa4QHwEtqJx8yH16kA4ntrd
         69PrHndVsjepQbVB073JtIgOPOlR3f6Fg62Kl8FVAcQgCVRsBSAaPtOmci0R8ltOqcqo
         NNBmjvGQi/ZVDnfmNW/jOhqmgljS2VNSWg74U=
In-Reply-To: <4D51FE01.2040100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

W dniu 9 lutego 2011 03:37 u=C5=BCytkownik Edward Shishkin
<edward.shishkin@gmail.com> napisa=C5=82:
> On 02/09/2011 01:10 AM, Edward Shishkin wrote:
>>
>> On 02/09/2011 12:56 AM, Marcin Baczy=C5=84ski wrote:
>>>
>>> W dniu 8 lutego 2011 23:36 u=C5=BCytkownik Edward Shishkin
>>> <edward.shishkin@gmail.com> napisa=C5=82:
>>>>
>>>> Marcin Baczy=C5=84ski wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>
>>>> Hello.
>>>>
>>>>> I'm attaching a trace of kernel BUG that Firefox hits. It's 100%
>>>>> reproducible,
>>>>> every time I start the browser it hits the bug within several sec=
onds,
>>>>> then
>>>>> whole system hangs. However I've never triggered the problem with=
 any
>>>>> other
>>>>> application.
>>>>> I've tested 2.6.37-gentoo-hardened + reiser4 patch,
>>>>
>>>> "2.6.37-gentoo-hardened" is based on what vanilla kernel (.36 or .=
37)?
>>>
>>> It's based on .37.
>>>
>>>>
>>
>>
>> [<ffffffff81142782>] ? grabbed2flush_reserved_nolock+0x42/0xa0
>> [<ffffffff81144c54>] ? jnode_make_dirty_locked+0xe4/0x190
>> [<ffffffff81144d31>] ? znode_make_dirty+0x31/0xe0
>> [<ffffffff81166a69>] ? find_disk_cluster+0x359/0x390
>> [<ffffffff8117511c>] ? do_readpage_ctail+0xdc/0x570
>> [<ffffffff81166f7d>] ? prepare_logical_cluster+0x23d/0x760
>>
>> A set of blocks reserved in prepare_logical_cluster() is exhausted
>> at znode_make_dirty() for some reasons. No ideas except inserting
>> debugging messages to figure out who is stealing the reservation.
>
>
> Aaahhh, it seems I understand what's up..
> Could you please apply the attached patch, run
> Firefox and send me kernel warnings?

Here they are (kernel with patch applied + reiser4_debug=3Dy):
reiser4[firefox(2497)]: find_disk_cluster
(fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
WARNING: file 404669 consists of 1020 fragments
reiser4[firefox(2497)]: find_disk_cluster
(fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
WARNING: file 18693127 consists of 1020 fragments

But there are thousands of them, and not all are caused by Firefox:
reiser4[bash(2708)]: find_disk_cluster
(fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
WARNING: file 17649897 consists of 1020 fragments
reiser4[xz(2708)]: find_disk_cluster
(fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
WARNING: file 17649897 consists of 1020 fragments

And among thousands of these 1020-fragments, there are
6 probably more intresting warns:

6542-reiser4[firefox(2518)]: find_disk_cluster
(fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
6543:WARNING: file 404690 consists of 21 fragments
6544-reiser4[firefox(2518)]: find_disk_cluster
(fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
6545:WARNING: file 404690 consists of 31 fragments
--
9297-reiser4[firefox(2518)]: find_disk_cluster
(fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
9298:WARNING: file 404690 consists of 21 fragments
9299-reiser4[firefox(2518)]: find_disk_cluster
(fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
9300:WARNING: file 404690 consists of 31 fragments
--
9453-reiser4[firefox(2518)]: find_disk_cluster
(fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
9454:WARNING: file 404690 consists of 29 fragments
--
9847-reiser4[firefox(2518)]: find_disk_cluster
(fs/reiser4/plugin/file/cryptcompress.c:2197)[edward-2222]:
9848:WARNING: file 404690 consists of 21 fragments

I don't see any asserts in dmesg. And this time there was no BUG.
If more of these warning would be of any use, I can send them as well,
but compressed log is >60kB, so not attaching it now.

Thanks,
Marcin
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
