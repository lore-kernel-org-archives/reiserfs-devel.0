From: Georgios Tsalikis <georgios@tsalikis.net>
Subject: Re: Reiser4 extremely slow at deleting.
Date: Wed, 27 Jul 2016 23:40:57 +0300
Message-ID: <nnb68u$ioe$1@ger.gmane.org>
References: <nnasaq$lpq$1@ger.gmane.org>
 <0aa0ad49-a6a7-4d53-8a91-aa78821156c2@intersafeit.com>
 <nnav5v$rgh$1@ger.gmane.org> <57990A72.8070509@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <57990A72.8070509@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Thanks for responding Edward.

That resstick.dd is a dd image of a thumbdrive with an operating system=
=20
and some media files in it.
Now... i deleted another file. A backup of my $HOME. Approximately 70GB=
=20
and it took a second or two.
Next is another dd of a whole Btrfs . Let's see how it deletes. In the=20
meanwhile I am fscking because that last deletion caused free space to=20
shrink. I will post separately about it.

On 27/07/2016 10:24 =CE=BC=CE=BC, Edward Shishkin wrote:
> By default compression is turned on, and the file system tries to be=20
> "smart".
> However, default heuristics is not perfect. It works well for "/"=20
> (setups created
> during system installation). Also it works fine for various=20
> development sets
> (mixes of well-squeezable sources and not squeezable binaries), which=
=20
> is usual
> environment for Gentoo people.
> For media-files the default heuristics works very bad (is it clear,=20
> why so?).
> For large files it is strongly recommended to dedicate a separate=20
> partition without
> compression (mkfs option "create=3Dreg40").
>
> Thanks,
> Edward.
>
> On 07/27/2016 08:39 PM, Georgios Tsalikis wrote:
>> Here is my disappointing data :p
>>
>> # measurefs.reiser4 -p /dev/sdc3
>> measurefs.reiser4 1.1.0
>> Format release: 4.0.1
>> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by=20
>> reiser4progs/COPYING.
>>
>> Default profile:
>> create:          "ccreg40"         (id:0x4 type:0x0)    [Regular fil=
e=20
>> plugin for creat(2)]
>> key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]
>> node:            "node40"          (id:0x0 type:0x2)    [Node plugin=
]
>> compress:        "lzo1"            (id:0x0 type:0xc) [Compression=20
>> plugin]
>> compressMode:    "conv"            (id:0x4 type:0xd) [Compression=20
>> Mode plugin]
>> cluster:         "64K"             (id:0x0 type:0x10) [Cluster plugi=
n]
>> hash:            "r5_hash"         (id:0x1 type:0x3) [Directory entr=
y=20
>> hash plugin]
>> fibration:       "ext_1_fibre"     (id:0x2 type:0x4)    [Key=20
>> fibration plugin]
>> formatting:      "smart"           (id:0x2 type:0x5)    [File body=20
>> formatting plugin]
>>
>> (actually i formatted it with node41 but it doesn't appear so)
>>
>> # ls -l resstick.dd
>> -rw-r--r-- 1 root root 22007840768 =CE=99=CE=BF=CF=8D=CE=BB 26 15:03=
 resstick.dd
>> # time rm resstick.dd
>>
>> real    21m43.005s
>> user    0m0.000s
>> sys    5m2.132s
>>
>> If this is not problematic then what is? It is a single deletion!!
>>
>>
>> On 27/07/2016 09:15 =CE=BC=CE=BC, Morgan Smith wrote:
>>> Was the file system created using the reg40 plugin or ccreg40 for o=
n=20
>>> the
>>> fly compression?
>>>
>>> It seems to me I had this issue when using ccreg40 for on the fly
>>> compression. I wrote a similar request for help some years ago and =
I
>>> believe the answer was to not use compression. IIRC it's not an iss=
ue
>>> with the compression itself rather the handling of allocated space =
for
>>> it and the shuffling that is done when releasing resources. I was=20
>>> unable
>>> to quickly find my old email to the list to confirm :(
>>>
>>> On 07/27/2016 11:51 AM, Georgios Tsalikis wrote:
>>>> It is almost always like this. For example a directory with 2.5GB =
of
>>>> large files takes about 2 minutes. Right now i am deleting a large
>>>> directory with small files, I didn't keep the numbers before runni=
ng,
>>>> but they are many directories with source code. Could it be
>>>> fragmentation? And how could I mitigate it? Thanks
>>>>
>>>>
>>>> --=20
>>>> To unsubscribe from this list: send the line "unsubscribe
>>>> reiserfs-devel" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>> --=20
>>> To unsubscribe from this list: send the line "unsubscribe=20
>>> reiserfs-devel" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>>
>>
>>
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe=20
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
> --=20
> To unsubscribe from this list: send the line "unsubscribe=20
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
