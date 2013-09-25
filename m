From: Evgeniy <iron.udjin@gmail.com>
Subject: Re: Snappy compression algorithm for Reiser4.
Date: Thu, 26 Sep 2013 00:04:10 +0300
Message-ID: <CAL2jS+nbVdjxrj-egqZcup-GMQxxHmBt2nbNKS7kxGQs1BKsEw@mail.gmail.com>
References: <CAL2jS+=3q7Nvw89g=17Hj8uP-Cj_OtZ7R=QZRBDBz0Dknhhuug@mail.gmail.com>
 <523E30C5.2090705@gmail.com> <52433EEA.20309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=pgU/EwxaFz3if/9ZGGllFKP0OFaIRhV323Sj34AN72Q=;
        b=s72Q0gM/T38RnG6rHuBDhr3tvBIwIpEHylV4gf0rqypYFdEABqzN6x7FWVoMEUBWv8
         6KaFjkOKr7rdqYThnIO56zhKjApvliIiCzGNED93KkIFMI/zE270hWStFyoYUjIIgl1S
         3dyPDFFenmXv3SNerBASsLvU/GrJkyTfweW/Cv7hDOWfLv/30BlNVulQTdDS5iKd3ejn
         zHzeuhyp7Nlj6qUr5dFxZga701OeZFVfEsd50L+VM+apBdSgUQeg3WxwCL/VdIDyIrrw
         dkgsa1wr2pAHE6xTleTDo3rS+Ep8GFmcSKCpWgJG8MH1wNVw6EYsrQgN64B9i+Olhy73
         Aw9Q==
In-Reply-To: <52433EEA.20309@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 25 September 2013 22:52, Edward Shishkin <edward.shishkin@gmail.com>=
 wrote:
> On 09/22/2013 01:50 AM, Edward Shishkin wrote:
>>
>> 21.09.2013 23:12, Evgeniy =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>
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
>>
>> Support of a new compression algorithm means a format change.
>
>
>
> To be precise, format _upgrade_ (not change). Format change is a very
> bad thing inherent to systems, which don't possess any development
> model.
>
>
>
>>
>> So, people with roots on reiser4 will be forced to fsck their partit=
ions.
>> So, not so funny.  A visible advantage in some benchmarks is highly
>> desirable..
>
>
>
> It seems, it is hard to invent something more interesting than curren=
tly
> supported algorithms (lzo1 and gzip1). At least for file systems, whe=
re
> we can not afford a luxury to comress/decompress big chunks of data.
Well, I think it depends only of compression algo and its
implementation in the kernel. As I described above, LZO currently has
an advantage over Snappy. That's why Snappy wins in speed of
(de)compression only on 1-2% over LZO which is almost nothing. Maybe
sutuation will be better with curent implementation LZ4 in kernel.
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
> result. If it is incompressible, then we turn compression off forever=
 (pass
> management to unix-file plugin with formatting policy "extents only")=
=2E
> Otherwise, stay with cryptcompress plugin, and perform "selective"
> compression on the "dynamic" lattice.
>
> I suspect that such heuristic doesn't work well for all kind of files=
=2E At
> the
> same time, we have never experimented in this area. The common idea i=
s
> that it would be nice to understand by the beginning of a file, wheth=
er the
> whole file is incompressible. For example, badly compressible binary
> executables have special magics at the beginning, etc. Also, I think,=
 it
> doesn't make sense to compress ISO images (no?)

It's a difficult question what is faster: to check first 64K of the
file and look at the result or read the file header, find type in DB
and deside to turn of or off compression.
To "understand" the file type we need:
1) to include some kind of libmediainfo with file types database.
2) to have our own DB with data like: "images?"->off,
"binaries?"->off,"text?"->on.

Also we can implement "stupid" compression compression mode: on/off
compression use only file extension. If the file is without extension
then use "conv" compression (to test if first 64K compresses well). I
thnks this kind of compression mode will work faster on partition with
SMB file share.

Maybe I'm wrong somewhere above. So please correct me.

> Anyway, a sanity check that file represents a binary executable won't=
 be
> superfluous. If someone has other ideas, we'll be happy to discuss/en=
code
> them.

Is there any documentation regarding file system design? It's quite
difficult to understand from source comments how does it work. For
example, when I copy file to reiser4 partition, first of all it goes
to file cache. In some time (when?) VFS call SYNC function it call R4
hook (where is it?) and run all chains of funtion and finally write
file to disk. When I was debugging compression function I was that FS
doesn't call compress function until I run "sync" in the console.
Maybe these questions not regarding reiser4. Could you please suggest
documentation about such things I wrote above?

P.S: In my opinion to make fsck work faster is the much important task
than compression modes. Sometimes fsck is terribly slow :(

> Thanks,
> Edward.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
