From: Georgios Tsalikis <georgios@tsalikis.net>
Subject: Re: Reiser4 extremely slow at deleting.
Date: Wed, 27 Jul 2016 21:39:55 +0300
Message-ID: <nnav5v$rgh$1@ger.gmane.org>
References: <nnasaq$lpq$1@ger.gmane.org>
 <0aa0ad49-a6a7-4d53-8a91-aa78821156c2@intersafeit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <0aa0ad49-a6a7-4d53-8a91-aa78821156c2@intersafeit.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Here is my disappointing data :p

# measurefs.reiser4 -p /dev/sdc3
measurefs.reiser4 1.1.0
=46ormat release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by=20
reiser4progs/COPYING.

Default profile:
create:          "ccreg40"         (id:0x4 type:0x0)    [Regular file=20
plugin for creat(2)]
key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]
node:            "node40"          (id:0x0 type:0x2)    [Node plugin]
compress:        "lzo1"            (id:0x0 type:0xc) [Compression plugi=
n]
compressMode:    "conv"            (id:0x4 type:0xd) [Compression Mode=20
plugin]
cluster:         "64K"             (id:0x0 type:0x10)    [Cluster plugi=
n]
hash:            "r5_hash"         (id:0x1 type:0x3)    [Directory entr=
y=20
hash plugin]
fibration:       "ext_1_fibre"     (id:0x2 type:0x4)    [Key fibration=20
plugin]
formatting:      "smart"           (id:0x2 type:0x5)    [File body=20
formatting plugin]

(actually i formatted it with node41 but it doesn't appear so)

# ls -l resstick.dd
-rw-r--r-- 1 root root 22007840768 =CE=99=CE=BF=CF=8D=CE=BB 26 15:03 re=
sstick.dd
# time rm resstick.dd

real    21m43.005s
user    0m0.000s
sys    5m2.132s

If this is not problematic then what is? It is a single deletion!!


On 27/07/2016 09:15 =CE=BC=CE=BC, Morgan Smith wrote:
> Was the file system created using the reg40 plugin or ccreg40 for on =
the
> fly compression?
>
> It seems to me I had this issue when using ccreg40 for on the fly
> compression. I wrote a similar request for help some years ago and I
> believe the answer was to not use compression. IIRC it's not an issue
> with the compression itself rather the handling of allocated space fo=
r
> it and the shuffling that is done when releasing resources. I was una=
ble
> to quickly find my old email to the list to confirm :(
>
> On 07/27/2016 11:51 AM, Georgios Tsalikis wrote:
>> It is almost always like this. For example a directory with 2.5GB of
>> large files takes about 2 minutes. Right now i am deleting a large
>> directory with small files, I didn't keep the numbers before running=
,
>> but they are many directories with source code. Could it be
>> fragmentation? And how could I mitigate it? Thanks
>>
>>
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-de=
vel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
