From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Snappy compression algorithm for Reiser4.
Date: Wed, 25 Sep 2013 17:12:26 -0400
Message-ID: <524351BA.5040508@gmail.com>
References: <CAL2jS+=3q7Nvw89g=17Hj8uP-Cj_OtZ7R=QZRBDBz0Dknhhuug@mail.gmail.com> <523E30C5.2090705@gmail.com> <52433EEA.20309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=69+iAoxIYCC4XreTAEqYmvkIezySNphV7lknBhd0sVI=;
        b=wHJTZH4OqqhfmSIeGyFTs1shRbc9n0rvXx90TOSvmqAjuBjbAWc6GgfrO4BLAEk23q
         zauJDpJG7ItdDIpzwD09zqtrKRP3ag1jMRg4V1aGsZMhnLBOqF5zTYAmTC1QzO13UB6c
         ZN6YnerySRV79oBsWeri7jaolfOoikqNXDpBq2TKdatvwaPXEu4+ZnwskyI8tgQKr3CO
         LmR82D3h80B5TsxnH9EVde0oruuayPZtKIxTdLCd1Pb8G3IQsaGF2cglbxkEo2vpopn8
         8yyAj+RPYgFxICHmxCnuYg64qmS6aLAN5oYWoC+mEAi8CF/C90VMe66jN/K+C43E5ZZn
         L/UQ==
In-Reply-To: <52433EEA.20309@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>, Evgeniy <iron.udjin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Edward,

I would agree on most points, though the LZ4 algorithm is gaining some
interest.  Not to say we know if it works well or not ...
ISO images can be compressed as they are just a concatenation of files,
as well as DD created images (raw block)

If we were to take a vote, I would test LZ4 out in the general sense,
and if it's as good as they say (and fast enough for real-time
compression) I would vote that way.

Chris




On 09/25/13 15:52, Edward Shishkin wrote:
> On 09/22/2013 01:50 AM, Edward Shishkin wrote:
>> 21.09.2013 23:12, Evgeniy =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> Hello all,
>>>
>>> Last few days I was playing a little bit around implementation Snap=
py
>>> algo in Reiser4. My code is dirty and should be optimized. But it's
>>> enough for testing.
>>> According to my tests Snappy shows near the same prefomance as LZO.=
 In
>>> some kind of situations Snappy shows better compression with the le=
ss
>>> CPU usage.
>>> LZO has a few advantages over Snappy:
>>> 1) It's in kernel by default
>>> 2) It's optimized better then Snappy.
>>> Also a very significant fact is we're plaing with small blocks of
>>> data. In this case results of all algorithms looks near the same.
>>>
>>> Maybe in the future I'll reqrite a little bit BratSinot's LZ4 patch
>>> (http://sourceforge.net/p/reiser4/discussion/general/thread/780facb=
4/)
>>> to make it use LZ4 library which is build-in kernel. Friendly
>>> speaking, I'm not expect any big difference in comparison with LZO.
>>> But in any case, it funny :)
>>
>>
>> Support of a new compression algorithm means a format change.
>
>
> To be precise, format _upgrade_ (not change). Format change is a very
> bad thing inherent to systems, which don't possess any development
> model.
>
>
>>
>> So, people with roots on reiser4 will be forced to fsck their
>> partitions.
>> So, not so funny.  A visible advantage in some benchmarks is highly
>> desirable..
>
>
> It seems, it is hard to invent something more interesting than curren=
tly
> supported algorithms (lzo1 and gzip1). At least for file systems, whe=
re
> we can not afford a luxury to comress/decompress big chunks of data.
>
> Instead, I would suggest to take a look at the "intelligent" compress=
ion
> modes implemented by plugins of COMPRESSION_MODE interface. This is
> a set of hooks arranged at different levels, which decide, if compres=
sion
> should be turned off/on.
>
> The default mode ("conv") was suggested long ago by Hans. It's idea i=
s
> that first, we try to compress the first 64K of the file and look at =
the
> result. If it is incompressible, then we turn compression off forever
> (pass
> management to unix-file plugin with formatting policy "extents only")=
=2E
> Otherwise, stay with cryptcompress plugin, and perform "selective"
> compression on the "dynamic" lattice.
>
> I suspect that such heuristic doesn't work well for all kind of files=
=2E
> At the
> same time, we have never experimented in this area. The common idea i=
s
> that it would be nice to understand by the beginning of a file,
> whether the
> whole file is incompressible. For example, badly compressible binary
> executables have special magics at the beginning, etc. Also, I think,=
 it
> doesn't make sense to compress ISO images (no?)
>
> Anyway, a sanity check that file represents a binary executable won't=
 be
> superfluous. If someone has other ideas, we'll be happy to discuss/en=
code
> them.
>
> Thanks,
> Edward.
> --=20
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
