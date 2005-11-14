From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: Slowdown is gone & apt-get works with updated reiser4. So nevermind...
Date: Mon, 14 Nov 2005 21:22:55 +0100
Message-ID: <4378F21F.4050608@ursynow.2a.pl>
References: <200511111359.39715.jgilmore@glycou.com> <20051113141213.07be2e71@SiRiUS.home> <43774823.2090201@ursynow.2a.pl> <200511141148.18466.pat@patdouble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26934-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511141148.18466.pat@patdouble.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: pat@patdouble.com
Cc: reiserfs-list@namesys.com

Pat Double wrote:
> On Sunday 13 November 2005 08:05, Artur Mak=F3wka wrote:
>> Thomas Kuther wrote:
>>
>> i was using anticipatory I/O as default in debian. i just did echo cfq >
>>   /sys/block/hda/queue/scheduler. Hope its enough to change it.
>>
>> no noticed effects yet, i will give report, if anything changes.
>=20
> I tried changing the scheduler like this and it worked the first time wit=
h low=20
> load and my X session was not started. I tried it again and it locked up =
the=20
> filesystem I had to reboot and rebuild the filesystem. I was changing fro=
m=20
> cfq to anticipatory. Be careful!
>=20

its ok, i changed from anticipatory to cfq also with append option in=20
lilo (elevator=3D).

but i'm afraid it didn't help. I got another crash today. as always -=20
completely nothing in syslog or anywhere.

i can't turn on reiser4 debugging - it will lower performance too much.

i'm not sure what to do now. Is there any tool that will convert reiser4=20
to another fs ? (a stable one i mean...)

