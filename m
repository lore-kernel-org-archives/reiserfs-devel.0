From: Manuel Krause <manuelkrause@netscape.net>
Subject: Re: 2.4.22pre7aa1 ;-) Mit O(1) aber leider kein pre-emption
Date: Mon, 21 Jul 2003 17:55:09 +0200
Message-ID: <3F1C0CDD.8070103@netscape.net>
References: <200307211639.32418.Dieter.Nuetzel@hamburg.de> <3F1C090E.8020903@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14984-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1C090E.8020903@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 07/21/03 17:38, Manuel Krause wrote:
> On 07/21/03 16:39, Dieter N=FCtzel wrote:
>=20
>> Data-logging in the works?
>>
>> Regards,
>>   Dieter
>=20
>=20
> Mmmh. ATM of .22-pre7 only "old" rml-preempt for 2.4.21-final does not=20
> apply well on vanilla .22-pre7.  But that only in=20
> linux/arch/sh/kernel/entry.S and linux/arch/ppc/mm/tlb.c compared to the=20
> adjusted version for -pre5. Do you really need those files for now?!
>=20
> Recent data-logging without quota does apply without errors on here tough.

Heaven, sorry! I definitely don't have the O(1) in here... and no aaX...
So, this info was only for 2.4.22-pre7 plus preempt plus data-logging=20
plus search_reada... Sorry for the inconvenience...

> But I haven't got the compile up and running yet.
>=20
> BTW, the HZ=3D1000 setting makes my system time get some minutes backwards=
=20
>  when having a longer uptime. It's solved on every bootup. I this=20
> typical or have I missed something?!


Bye,

  Manuel

