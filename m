From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Cleanup patches
Date: Sun, 16 Nov 2014 10:50:06 +0100
Message-ID: <5468734E.5010807@gmail.com>
References: <a08621850711140030x7a5c93bex73af16578bb64ca2@mail.gmail.com>	<5c7c368b0711140634y569c8ce8ke4b2e813a2244ce2@mail.gmail.com>	<a08621850711141050q58fd6830g2d2f195b1db987f3@mail.gmail.com>	<a08621850711141310t166dd07cm6e07f8c81a39b95b@mail.gmail.com>	<5c7c368b0711141439u1cb89d82g8ee0928eabbae2a5@mail.gmail.com>	<CADW=+3kVJUw3cXH79u0WxiiCFU2E1a2jVT4R+kD_mi7dMc9qRg@mail.gmail.com>	<CADW=+3=ruEe_pfMaY6eM6_jQYwiWzTzGL3dtA3OPpa68i0Madw@mail.gmail.com>	<5467E20F.8010903@gmail.com>	<CADW=+3m7-ibPx=ibky1Kd1HqEoxUautrUk46esASu0V0wTNCuA@mail.gmail.com>	<CADW=+3=NJKSd_yLLjQ5agMQE7r29szAgREy0itEr5PE7dvy7+Q@mail.gmail.com> <CADW=+3mRJ0sK+LL6xDb=XXjQ_o6_v1cqK9YrkV=-MPibCYtfwg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=vq/jUIxbfxEZiiqKZ+J86pRofLB5XHWkGus3pdZzks0=;
        b=hEa+RBAqqmzyg5tQxfVNHJFpwOVVbfMEUKCSb9Vw6O+7FKTZYpKzOqEk2GAphmMpLD
         N5MPXLzKmFA6RDX7k43x7jgrFoMO4lKNv6oVXlftm0y90QLuLhtLmQsreMA6fdrOtxfm
         Ts046m1Mh1P2VucYqLzVO0l7KihxAvBRX6mDQYLj+MQA5fNiNSShXoD4SMRjnIi7TIuU
         PCasfpO06sYxhxOEIAjzTHS/8AnF2d4RRfHkez9Y1NAzX6JzEiIcEtDi411Dde2JiqjV
         sNtpqy8h6Iryca6weEweNeM+1MIBRaWQxWwayBePR2hhHNFK6zvubxowkUV1BCgwMWuz
         bMYg==
In-Reply-To: <CADW=+3mRJ0sK+LL6xDb=XXjQ_o6_v1cqK9YrkV=-MPibCYtfwg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


On 11/16/2014 09:29 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> On Sun, Nov 16, 2014 at 2:28 AM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@g=
mail.com> wrote:
>> On Sun, Nov 16, 2014 at 12:30 AM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc=
@gmail.com> wrote:
>>> On Sun, Nov 16, 2014 at 12:30 AM, Edward Shishkin
>>> <edward.shishkin@gmail.com> wrote:
>>>> On 11/16/2014 12:06 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
>>>>> These are results from bisecting of R4 slowdown with ccreg40 plug=
in
>>> Brainfart after hours of bisecting. I meant reg40 plugin.
>>>>
>>>> Hmm.. Are you sure?
>>>> 2.6.10 doesn't know about ccreg...
>>>>
>>>>
>>>>
>>>>> with config and scripts I used, first double run is to see disper=
sion
>>>>> of consecutive tests:
>>>>>
>>>>> Reiser4 patch        Real        User        System
>>>>> 2.6.10-2        2m46.785s    0m3.214s    1m45.286s
>>>>> 2.6.10-2        2m52.700s    0m3.198s    1m43.361s
>>>>> 2.6.16-5        3m32.694s    0m2.900s    1m34.698s
>>>>> 2.6.19-4        3m19.672s    0m3.120s    1m33.234s
>>>>> 2.6.20            3m9.582s    0m3.164s    1m28.830s
>>>>> 2.6.21            7m52.960s    0m2.992s    1m28.326s
>>>>> 2.6.22-2        6m57.991s    0m2.852s    1m28.258s
>>>>>
>> Here are the more bisected results:
>>
>> Reiser4 patch        Real        User        System
>> 2.6.10-2        2m46.785s    0m3.214s    1m45.286s
>> 2.6.10-2        2m52.700s    0m3.198s    1m43.361s
>> 2.6.16-5        3m32.694s    0m2.900s    1m34.698s
>> 2.6.19-4        3m19.672s    0m3.120s    1m33.234s
>> 2.6.20            3m9.582s    0m3.164s    1m28.830s
>> 2.6.21-rc1        3m13.643s    0m2.884s    1m30.482s
>> 2.6.21-rc2        3m10.054s    0m2.904s    1m30.106s
>> 2.6.21-rc3        7m39.374s    0m2.848s    1m29.570s
>> 2.6.21-rc4        7m37.928s    0m2.904s    1m30.778s
>> 2.6.21            7m52.960s    0m2.992s    1m28.326s
>> 2.6.21            7m35.929s    0m3.044s    1m34.738s
>> 2.6.22-2        6m57.991s    0m2.852s    1m28.258s
>>
> And some new relevant ones:
>
> 2.6.29            2m57.027s    0m3.096s    1m33.266s
> 3.17.2            2m34.                            1m20.
>
> 3.17 is cropped because I copied it by hand as network didn't work
> with old userspace.
>
> Is this issue closed now?


Thank you for your work!
TBH, I thought that the performance issue introduced in 2.6.21-rc3
still takes place in modern kernels..


Edward.


>
>
> Have a nice day
> Dushan
>
>
>> Obviously something happened between rc2 and rc3
>>
>>>>> Have a nice day
>>>>>
>>>>> Dushan
>>>>>
>>>>> On Fri, Oct 24, 2014 at 11:17 PM, Du=C5=A1an =C4=8Coli=C4=87 <dus=
anc@gmail.com> wrote:
>>>>>> OK after 7 years, can't believe how long ago it was, I decided t=
o dig up
>>>>>> some ancient hw and to try again to do this bisect.
>>>>>> Questions:
>>>>>> 1. Would it still be useful?
>>>>>> 2. Any other tests that I can do on those old kernels that can b=
e of
>>>>>> value?
>>>>>> 3. What would be best bisect range? Oldest and newest kernel?
>>>>>>
>>>>>> On Nov 14, 2007 11:39 PM, "Edward Shishkin" <edward.shishkin@gma=
il.com>
>>>>>> wrote:
>>>>>>> On 11/15/07, Dushan Tcholich <dusanc@gmail.com> wrote:
>>>>>>>> ...
>>>>>>>>>> Well. There is a problem: starting from some point, performa=
nce of
>>>>>>>>>> reiser4 is substantially dropped for unknown reasons. As I r=
emember,
>>>>>>>>>> there were a lot of complaints about it. Also I have made a =
brief
>>>>>>>>>> test not so long ago (copy of linux source tree located in r=
amfs to
>>>>>>>>>> reiser4 partition): yeah, it is 3 times worse then it ought =
to be,
>>>>>>>>>> "vmstat 2" reports low bo-activity (something like 10000 blo=
cks/s,
>>>>>>>>>> instead of usual ~30000).
>>>>>>>>>>
>>>>>>>>>> It would be nice to find a changeset which kills performance=
=2E
>>>>>>>>>>
>>>>>>>>>> Would you please look at this? It is non-trivial task, so ev=
ery
>>>>>>>>>> result would be ok (say, to know the first kernel in -mm ser=
ies
>>>>>>>>>> with slow reiser4).
>>>>>>>>>>
>>>>>>>>>> Hints:
>>>>>>>>>>
>>>>>>>>>> 1. The problem is in (default) unix-file plugin (nobody main=
tained
>>>>>>>>>>      this for a long of time), so compression should be disa=
bled.
>>>>>>>>>> 2. I guess it should be something like bisecting.
>>>>>>>>>> 3. I think that the problem appeared in ~2.6.17-mmXX kernel =
when
>>>>>>>>>>       vs sent vfs patches with batch_write methods, and then=
 Andrew
>>>>>>>>>>       Morton evicted them because of some problems. However,
>>>>>>>>>>       I might be wrong here!
>>>>>>>>>>
>>>>>>>>> If you could give me an easy way to benchmark (guide me by ha=
nd), I
>>>>>>>>> could try to bisect it.
>>>>>>>>> It would be easier if -mm could be bisected using git.
>>>>>>>>> But my / is on r4+cc, so I don't know how could I do it? Mayb=
e on
>>>>>>>>> other machine?
>>>>>>> Yes! Compression announced 15 March 2007, and it may happen
>>>>>>> that some kernel you will need to boot are not support your "/"=
=2E
>>>>>>> So for bisecting you need the following:
>>>>>>> 1. a machine with >=3D 512M RAM and "/" formatted with some fs
>>>>>>>       supported by old kernels.
>>>>>>> 2. a spare partition.
>>>>>>> 3. enable ramfs (it seems it is enabled by default in most dist=
ros).
>>>>>>> 4. put a tarball-to-copy in some working directory (I had
>>>>>>>       linux-2.6.9.tar.gz)
>>>>>>>
>>>>>>> Note, that some old -mm kernels are not compilable/bootable
>>>>>>> (if so, pull the "hotfixes" patches from akpm's directory on ke=
rnel.org)
>>>>>>>
>>>>>>> 5. edit the attached patches in accordance with your configurat=
ions
>>>>>>> 6. build and boot the testing kernel with reiser4 debug disable=
d
>>>>>>>       (I think no needs to boot in single mode, or discard kde,=
 etc..)
>>>>>>> 7. run "vmstat 2"
>>>>>>> 8. run ./prepare_copy.sh && ./ncopy on another console
>>>>>>>
>>>>>>> I have the following:
>>>>>>> real    6m27.970s
>>>>>>> user    0m2.116s
>>>>>>> sys     1m4.972s
>>>>>>>
>>>>>>> God, it is fairly bad results: On my machine real time should b=
e
>>>>>>> something like 2m20......
>>>>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
