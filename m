From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: Cleanup patches
Date: Sun, 16 Nov 2014 00:30:40 +0100
Message-ID: <CADW=+3m7-ibPx=ibky1Kd1HqEoxUautrUk46esASu0V0wTNCuA@mail.gmail.com>
References: <a08621850711140030x7a5c93bex73af16578bb64ca2@mail.gmail.com>
	<5c7c368b0711140634y569c8ce8ke4b2e813a2244ce2@mail.gmail.com>
	<a08621850711141050q58fd6830g2d2f195b1db987f3@mail.gmail.com>
	<a08621850711141310t166dd07cm6e07f8c81a39b95b@mail.gmail.com>
	<5c7c368b0711141439u1cb89d82g8ee0928eabbae2a5@mail.gmail.com>
	<CADW=+3kVJUw3cXH79u0WxiiCFU2E1a2jVT4R+kD_mi7dMc9qRg@mail.gmail.com>
	<CADW=+3=ruEe_pfMaY6eM6_jQYwiWzTzGL3dtA3OPpa68i0Madw@mail.gmail.com>
	<5467E20F.8010903@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=yC0HzmqpXnbjUBAa+W/HMtaMGBl/03VVajy7eq28Tgw=;
        b=ONLkGsqFAIkNZECE9m5TjgwKHIchLq6748gZY3de20bP987q0KnTraQtxpASEKJ19w
         QWJ2cQdrx9frQM9QvkxRQ35EJZ3/Vpan364+hVigm74ZFmSGxGmuxoLE2Hzex2ZP+3lc
         38DNSdldgjZxC51cGHOXbNtRNaQZDErJ1gUAF4AuEnhzg19DCZhshyKZTH5XBzWBzRc/
         iA2T7J98DKUzu6HMgckY69DA9YTx7qW7XRxipQu+ebL+A2XJTSFyM6YwPvZROg15lOUB
         Fqdu89to1GKvy3ePakdSIpRKjiTFkqUj0Hjv0cuEUP0WMtyUXQqRY2MgY50v+Z46VOHj
         ItFQ==
In-Reply-To: <5467E20F.8010903@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Sun, Nov 16, 2014 at 12:30 AM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
>
> On 11/16/2014 12:06 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>
>> These are results from bisecting of R4 slowdown with ccreg40 plugin
>

Brainfart after hours of bisecting. I meant reg40 plugin.
>
>
> Hmm.. Are you sure?
> 2.6.10 doesn't know about ccreg...
>
>
>
>> with config and scripts I used, first double run is to see dispersio=
n
>> of consecutive tests:
>>
>> Reiser4 patch        Real        User        System
>> 2.6.10-2        2m46.785s    0m3.214s    1m45.286s
>> 2.6.10-2        2m52.700s    0m3.198s    1m43.361s
>> 2.6.16-5        3m32.694s    0m2.900s    1m34.698s
>> 2.6.19-4        3m19.672s    0m3.120s    1m33.234s
>> 2.6.20            3m9.582s    0m3.164s    1m28.830s
>> 2.6.21            7m52.960s    0m2.992s    1m28.326s
>> 2.6.22-2        6m57.991s    0m2.852s    1m28.258s
>>
>>
>> Have a nice day
>>
>> Dushan
>>
>> On Fri, Oct 24, 2014 at 11:17 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc=
@gmail.com> wrote:
>>>
>>> OK after 7 years, can't believe how long ago it was, I decided to d=
ig up
>>> some ancient hw and to try again to do this bisect.
>>> Questions:
>>> 1. Would it still be useful?
>>> 2. Any other tests that I can do on those old kernels that can be o=
f
>>> value?
>>> 3. What would be best bisect range? Oldest and newest kernel?
>>>
>>> On Nov 14, 2007 11:39 PM, "Edward Shishkin" <edward.shishkin@gmail.=
com>
>>> wrote:
>>>>
>>>> On 11/15/07, Dushan Tcholich <dusanc@gmail.com> wrote:
>>>>>
>>>>> ...
>>>>>>>
>>>>>>> Well. There is a problem: starting from some point, performance=
 of
>>>>>>> reiser4 is substantially dropped for unknown reasons. As I reme=
mber,
>>>>>>> there were a lot of complaints about it. Also I have made a bri=
ef
>>>>>>> test not so long ago (copy of linux source tree located in ramf=
s to
>>>>>>> reiser4 partition): yeah, it is 3 times worse then it ought to =
be,
>>>>>>> "vmstat 2" reports low bo-activity (something like 10000 blocks=
/s,
>>>>>>> instead of usual ~30000).
>>>>>>>
>>>>>>> It would be nice to find a changeset which kills performance.
>>>>>>>
>>>>>>> Would you please look at this? It is non-trivial task, so every
>>>>>>> result would be ok (say, to know the first kernel in -mm series
>>>>>>> with slow reiser4).
>>>>>>>
>>>>>>> Hints:
>>>>>>>
>>>>>>> 1. The problem is in (default) unix-file plugin (nobody maintai=
ned
>>>>>>>     this for a long of time), so compression should be disabled=
=2E
>>>>>>> 2. I guess it should be something like bisecting.
>>>>>>> 3. I think that the problem appeared in ~2.6.17-mmXX kernel whe=
n
>>>>>>>      vs sent vfs patches with batch_write methods, and then And=
rew
>>>>>>>      Morton evicted them because of some problems. However,
>>>>>>>      I might be wrong here!
>>>>>>>
>>>>>> If you could give me an easy way to benchmark (guide me by hand)=
, I
>>>>>> could try to bisect it.
>>>>>> It would be easier if -mm could be bisected using git.
>>>>>> But my / is on r4+cc, so I don't know how could I do it? Maybe o=
n
>>>>>> other machine?
>>>>
>>>> Yes! Compression announced 15 March 2007, and it may happen
>>>> that some kernel you will need to boot are not support your "/".
>>>> So for bisecting you need the following:
>>>> 1. a machine with >=3D 512M RAM and "/" formatted with some fs
>>>>      supported by old kernels.
>>>> 2. a spare partition.
>>>> 3. enable ramfs (it seems it is enabled by default in most distros=
).
>>>> 4. put a tarball-to-copy in some working directory (I had
>>>>      linux-2.6.9.tar.gz)
>>>>
>>>> Note, that some old -mm kernels are not compilable/bootable
>>>> (if so, pull the "hotfixes" patches from akpm's directory on kerne=
l.org)
>>>>
>>>> 5. edit the attached patches in accordance with your configuration=
s
>>>> 6. build and boot the testing kernel with reiser4 debug disabled
>>>>      (I think no needs to boot in single mode, or discard kde, etc=
=2E.)
>>>> 7. run "vmstat 2"
>>>> 8. run ./prepare_copy.sh && ./ncopy on another console
>>>>
>>>> I have the following:
>>>> real    6m27.970s
>>>> user    0m2.116s
>>>> sys     1m4.972s
>>>>
>>>> God, it is fairly bad results: On my machine real time should be
>>>> something like 2m20......
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
