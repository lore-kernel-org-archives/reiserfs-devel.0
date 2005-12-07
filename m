From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: reiser4: fd -1 problem ?
Date: Wed, 07 Dec 2005 20:40:43 +0100
Message-ID: <43973ABB.50704@ursynow.2a.pl>
References: <439626FD.7020500@ursynow.2a.pl> <4396C007.3050408@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27217-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4396C007.3050408@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Alexander Lyamin aka FLX <flx@namesys.com>

Vladimir V. Saveliev wrote:
> Hello
>=20
> Artur Mak=F3wka wrote:
>> Hello, i've been investigating this problem for few weeks, and it seems
>> reiser4 can be reason for this.
>>
>> My apache process is from no clear reason suddenly peaking to 95% CPU
>> usage and it stays that way until i kill it and start again.
>>
>> It happens 6-7 times a day, i have hosting services on my server. I
>> thought it was apache fault, but it strings shows this:
>>
>> [pid 31610] munmap(0xb6f29000, 729088)  =3D 0
>> [pid 31610] mmap2(NULL, 729088, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0xb6f29000
>> [pid 31610] munmap(0xb6f29000, 729088)  =3D 0
>> [pid 31610] mmap2(NULL, 729088, PROT_READ|PROT_WRITE,
>> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0xb6f29000
>>
>>
>> in endless loop, when this strange 'lock' happens.
>>
>> is it a problem of fd -1 ?=20
>=20
> -1 is fine because MAP_ANONYMOUS is set.
>=20
>> of course that could be also apache bug, that
>> it can't handle wrong fd number, but why there is wrong fd number?
>>
>=20
> they are using MAP_ANONYMOUS, fd is ignored in that case.
>=20
>> i ran reiser4.fsck and it didnt help.
>>
>=20
> what did reiser4.fsck report? No corruptions found?
>=20
>> i use kernel 2.6.12.6 with latest 2.6.12 reiser4 patch, as it seemed the
>> most stable from recent releases.
>>
>> What could be the problem here, and how can i repair it ? should i keep
>> running fsck.reiser4 until it finds it ?
>>
>> it doesnt happen very often, but like i said 6-7 times a day, but it
>> varies, sometimes it more often sometimes almost 0.
>>
>> thanks in advance for response. (this is probably not Apache issue, i
>> already asked for this many many times)
>>
>=20
> so far it does not look as reiser4 problem either.
>=20
> Flex, can we have apache server running on reiser4 for test purposes?
>=20
>=20

this happens only sometimes, and changing to latest 2.6.14 kernel and=20
reiser4 patch didnt help.

i suppose it would be hard to simulate this, i get only few such errors=20
per day and its pretty busy server (and i never get these at night which=20
means the fact that its busy is important i guess)

no idea if its reiser4, but that was my thought... maybe not, i don't know

any suggestions to what i should do next , when changing to never=20
kernel/fs didn't help? i will run fsck.reiser4 --build-fs tonight, but=20
if this wont help i have no idea


