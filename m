From: Hans Reiser <reiser@namesys.com>
Subject: Re: [BK][PATCH] Reiser4, will double Linux FS performance, please
 apply
Date: Fri, 01 Nov 2002 01:47:22 +0300
Message-ID: <3DC1B2FA.8010809@namesys.com>
References: <3DC19F61.5040007@namesys.com> <200210312334.18146.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11879-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DC19F61.5040007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Jeff Garzik <jgarzik@pobox.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Reiserfs-List@namesys.com, Oleg Drokin <green@namesys.com>, zam@namesys.com, umka <umka@thebsh.namesys.com>

Dieter N=FCtzel wrote:

>Am Donnerstag, 31. Oktober 2002 22:05 schrieb Jeff Garzik:
> =20
>
>>Hans Reiser wrote:
>>
>>   =20
>>
>>>If you want to talk about 2.6 then you should talk about reiser4 not=20
>>>reiserfs v3, and reiser4 is 7.6 times the write performance of ext3=20
>>>for 30 copies of the linux kernel source code using modern IDE drives=20
>>>and modern processors on a dual-CPU box, so I don't think any amount=20
>>>of improved scalability will make ext3 competitive with reiser4 for=20
>>>performance usages.=20
>>>     =20
>>>
>>What is the read performance like?
>>   =20
>>
>
From his mentioned paper http://www.namesys.com/v4/fast_reiser4.html, it i=
s=20
>more then doubled compared to ext3 and ReiserFS v3.
>
>To be fair he should explain if it was compared to the latest ext3 (htree)=
=20
>stuff or not, yet.
>
>It looks truly impressive.
>
>Regards,
>	Dieter
> =20
>
Unfortunately that was an older version of reiser4, and we are still=20
analyzing why it has higher read performance than what we are shipping=20
today.  Give me a week, and I'll have a better answer for you.  What we=20
shipped has higher read performance than ext3, but something is not what=20
it should be and needs fixing.

Green and Zam and Umka, on Monday please start work on seriously=20
analyzing how the block allocation differs between the new and the old=20
kernel, now that you can finally reproduce the benchmark on the old kernel.

--=20
Hans


