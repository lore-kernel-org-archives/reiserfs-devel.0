From: Hans Reiser <reiser@namesys.com>
Subject: Re: [patch] Repacker stats
Date: Sat, 23 Oct 2004 09:25:49 -0700
Message-ID: <417A860D.9010701@namesys.com>
References: <200410202159.46110.sikkh@wp.pl> <1378615689.20041022193803@tnonline.net> <200410231033.29164.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22138-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200410231033.29164.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

Christian Mayrhuber wrote:

>On Friday 22 October 2004 19:38, Spam wrote:
> =20
>
>>  Hello,
>>
>>  I was interested in testing the repacker statistics tool that Piotr
>>  Neuman wrote (and others later added to). But from what I can see
>>  the repacker is disabled in 2.6.9-rc4-mm1, because of this patch:
>>
>>    =20
>>   =20
>>
>http://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.9-rc4/2.6.9=
-rc4-mm1/broken-out/reiser4-disable-repacker.patch
> =20
>
>>  Is there something wrong with the repacker that is has to be
>>  disabled?
>>
>>  ~S
>> =20
>>   =20
>>
>>>Hi
>>>     =20
>>>
>>>This is my second attempt at repacker statistics, this time based on=20
>>>     =20
>>>
>comments
> =20
>
>>>from Alex Zarochentsev (thanks ;-).
>>>     =20
>>>
>>>This patch allows reading of repacker stats while it is working. It=20
>>>     =20
>>>
>creates
> =20
>
>>>two files in repacker sysfs hierarchy: formatted_nodes and=20
>>>     =20
>>>
>unformatted_nodes,
> =20
>
>>>which correspond to the stats that repacker prints after it has finished.
>>>     =20
>>>
>>>Download:
>>>     =20
>>>
>>>http://kem.p.lodz.pl/~peter/reiser4_repacker_stats-2.patch
>>>     =20
>>>
>>>Regards
>>>     =20
>>>
>>>Piotr Neuman
>>>     =20
>>>
>>=B4
>>
>>--=20
>>
>>   =20
>>
>
>Currently the repacker is known to corrupt the filesystem, that's
>why it's disabled, I guess.
>
> =20
>
There are two reasons:

1) functionality that is not stable should be turned off until it is=20
stable ("...." and repacker both).

2) we aren't making payroll and need something nonessential to bundle=20
with support if we want people to buy support so that I am to be able to=20
quit my day job and pay people.  There is nothing less essential yet=20
still salable than a repacker/resizer.  ext3 had a proprietary resizer,=20
so it is not an innovation by us.

reiser4 development is going at greatly reduced speed due to our needing=20
to take contracts involving other kernel work rather than working on=20
reiser4.  I am basically unable to spend time reviewing reiser4 code=20
because I have this day job fixing things not related to reiser4 in the=20
kernel.  I am glad to have the day job, but getting money from our work=20
on reiser4 would be better.....

I have also asked both the EU and the US for money, wish me luck.  I'd=20
like to start working on the enhanced semantics for ReiserFS, but I need=20
money to do that.  We are losing momentum vs. Apple and MS.  The resizer=20
might bring in the money for enhanced semantics work.
