From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Snappy compression algorithm for Reiser4.
Date: Wed, 25 Sep 2013 21:52:10 +0200
Message-ID: <52433EEA.20309@gmail.com>
References: <CAL2jS+=3q7Nvw89g=17Hj8uP-Cj_OtZ7R=QZRBDBz0Dknhhuug@mail.gmail.com> <523E30C5.2090705@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=q1TEOCtLVn0QvJDDZKKvLuwttAtdQTPYZWbDvYAslO8=;
        b=Dv0Dh1Ug7fVGtPWYUucpVLPJrSDAYPjr4aGUxH1Xi+ah2EhkXoO1kuyzHPLmvp+HAO
         L3IOFv/FOcarFzDBIoHQkttowHujrG0cCcyNz5k1VTtcUBYBSUDYKYLd0p65d+NgsQcc
         Ofd/n/LUSUz7Cw+8Moo7xnXf54FAkVp+QskyXmQGuk9FgevuWhAqOi0V0WwlrB3E7YII
         aXB76STdGEuvopHcDQPWY2e6XLbmXsMKibAh53d4yDy/Nf91qvXZ/h0yUcCf9sarawBT
         S0GRgJVAXwy2C7IxUEXF7ynXmFZZVhGWpgUDpIG4c03UZtxe1VG0uzdprmv9VtVBzIxP
         EYuA==
In-Reply-To: <523E30C5.2090705@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Evgeniy <iron.udjin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 09/22/2013 01:50 AM, Edward Shishkin wrote:
> 21.09.2013 23:12, Evgeniy =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hello all,
>>
>> Last few days I was playing a little bit around implementation Snapp=
y
>> algo in Reiser4. My code is dirty and should be optimized. But it's
>> enough for testing.
>> According to my tests Snappy shows near the same prefomance as LZO. =
In
>> some kind of situations Snappy shows better compression with the les=
s
>> CPU usage.
>> LZO has a few advantages over Snappy:
>> 1) It's in kernel by default
>> 2) It's optimized better then Snappy.
>> Also a very significant fact is we're plaing with small blocks of
>> data. In this case results of all algorithms looks near the same.
>>
>> Maybe in the future I'll reqrite a little bit BratSinot's LZ4 patch
>> (http://sourceforge.net/p/reiser4/discussion/general/thread/780facb4=
/)
>> to make it use LZ4 library which is build-in kernel. Friendly
>> speaking, I'm not expect any big difference in comparison with LZO.
>> But in any case, it funny :)
>
>
> Support of a new compression algorithm means a format change.


To be precise, format _upgrade_ (not change). Format change is a very
bad thing inherent to systems, which don't possess any development
model.


>
> So, people with roots on reiser4 will be forced to fsck their partiti=
ons.
> So, not so funny.  A visible advantage in some benchmarks is highly
> desirable..


It seems, it is hard to invent something more interesting than currentl=
y
supported algorithms (lzo1 and gzip1). At least for file systems, where
we can not afford a luxury to comress/decompress big chunks of data.

Instead, I would suggest to take a look at the "intelligent" compressio=
n
modes implemented by plugins of COMPRESSION_MODE interface. This is
a set of hooks arranged at different levels, which decide, if compressi=
on
should be turned off/on.

The default mode ("conv") was suggested long ago by Hans. It's idea is
that first, we try to compress the first 64K of the file and look at th=
e
result. If it is incompressible, then we turn compression off forever (=
pass
management to unix-file plugin with formatting policy "extents only").
Otherwise, stay with cryptcompress plugin, and perform "selective"
compression on the "dynamic" lattice.

I suspect that such heuristic doesn't work well for all kind of files.=20
At the
same time, we have never experimented in this area. The common idea is
that it would be nice to understand by the beginning of a file, whether=
 the
whole file is incompressible. For example, badly compressible binary
executables have special magics at the beginning, etc. Also, I think, i=
t
doesn't make sense to compress ISO images (no?)

Anyway, a sanity check that file represents a binary executable won't b=
e
superfluous. If someone has other ideas, we'll be happy to discuss/enco=
de
them.

Thanks,
Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
