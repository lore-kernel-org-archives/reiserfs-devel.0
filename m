From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 extremely slow at deleting.
Date: Wed, 27 Jul 2016 21:24:34 +0200
Message-ID: <57990A72.8070509@gmail.com>
References: <nnasaq$lpq$1@ger.gmane.org> <0aa0ad49-a6a7-4d53-8a91-aa78821156c2@intersafeit.com> <nnav5v$rgh$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=Iuk5URkkopy6yqMTbmRteGs/KDMsJmSk3ycnPq4CIbg=;
        b=0hQgwX6aY2MGxgJURStRkDIxSfKJqZh4hqXtGmFqvvcqWANuzgPI1tbzbhvPpLhIwQ
         PYXE9w/rAGddZM+DfwUn1bO3m10BV2z2t88gkjOEEdonAr3KmQOCMuVrm+YNZm3tGM+P
         FPFx58/CqSN45Qgl6MGTF3QTVeLnhkFyUPOrB7QDy5ZH+OdUIlqwHFxETU8c3Q/pdnm7
         n2rG3LteRLrsw/K24BJH/Br2al58mHiSZMfvlrn/tqfpkAyN2kFuFjxuUXJRKOEqTFqQ
         WdF19eTAssne4o5o82rA20F3c6m2vcunhHTp9dMlxEtMPcv5uhvA4T8thf4UWNQVLDf6
         GaNA==
In-Reply-To: <nnav5v$rgh$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Georgios Tsalikis <georgios@tsalikis.net>, reiserfs-devel@vger.kernel.org

By default compression is turned on, and the file system tries to be=20
"smart".
However, default heuristics is not perfect. It works well for "/"=20
(setups created
during system installation). Also it works fine for various development=
 sets
(mixes of well-squeezable sources and not squeezable binaries), which i=
s=20
usual
environment for Gentoo people.
=46or media-files the default heuristics works very bad (is it clear, w=
hy=20
so?).
=46or large files it is strongly recommended to dedicate a separate=20
partition without
compression (mkfs option "create=3Dreg40").

Thanks,
Edward.

On 07/27/2016 08:39 PM, Georgios Tsalikis wrote:
> Here is my disappointing data :p
>
> # measurefs.reiser4 -p /dev/sdc3
> measurefs.reiser4 1.1.0
> Format release: 4.0.1
> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by=20
> reiser4progs/COPYING.
>
> Default profile:
> create:          "ccreg40"         (id:0x4 type:0x0)    [Regular file=
=20
> plugin for creat(2)]
> key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]
> node:            "node40"          (id:0x0 type:0x2)    [Node plugin]
> compress:        "lzo1"            (id:0x0 type:0xc) [Compression plu=
gin]
> compressMode:    "conv"            (id:0x4 type:0xd) [Compression Mod=
e=20
> plugin]
> cluster:         "64K"             (id:0x0 type:0x10)    [Cluster plu=
gin]
> hash:            "r5_hash"         (id:0x1 type:0x3)    [Directory=20
> entry hash plugin]
> fibration:       "ext_1_fibre"     (id:0x2 type:0x4)    [Key fibratio=
n=20
> plugin]
> formatting:      "smart"           (id:0x2 type:0x5)    [File body=20
> formatting plugin]
>
> (actually i formatted it with node41 but it doesn't appear so)
>
> # ls -l resstick.dd
> -rw-r--r-- 1 root root 22007840768 =CE=99=CE=BF=CF=8D=CE=BB 26 15:03 =
resstick.dd
> # time rm resstick.dd
>
> real    21m43.005s
> user    0m0.000s
> sys    5m2.132s
>
> If this is not problematic then what is? It is a single deletion!!
>
>
> On 27/07/2016 09:15 =CE=BC=CE=BC, Morgan Smith wrote:
>> Was the file system created using the reg40 plugin or ccreg40 for on=
 the
>> fly compression?
>>
>> It seems to me I had this issue when using ccreg40 for on the fly
>> compression. I wrote a similar request for help some years ago and I
>> believe the answer was to not use compression. IIRC it's not an issu=
e
>> with the compression itself rather the handling of allocated space f=
or
>> it and the shuffling that is done when releasing resources. I was un=
able
>> to quickly find my old email to the list to confirm :(
>>
>> On 07/27/2016 11:51 AM, Georgios Tsalikis wrote:
>>> It is almost always like this. For example a directory with 2.5GB o=
f
>>> large files takes about 2 minutes. Right now i am deleting a large
>>> directory with small files, I didn't keep the numbers before runnin=
g,
>>> but they are many directories with source code. Could it be
>>> fragmentation? And how could I mitigate it? Thanks
>>>
>>>
>>> --=20
>>> To unsubscribe from this list: send the line "unsubscribe
>>> reiserfs-devel" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe=20
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>
>
>
> --=20
> To unsubscribe from this list: send the line "unsubscribe=20
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
