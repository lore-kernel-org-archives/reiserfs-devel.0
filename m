From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: fsck 0.5.5 time
Date: Fri, 18 Jun 2004 15:55:23 +0400
Message-ID: <40D2D82B.3090301@namesys.com>
References: <20040618110112.GG4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19249-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040618110112.GG4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

Hello

Markus T=F6rnqvist wrote:
> Hi
>=20
> How long is the expected time for fsck to run?

It may take several hours. Especially, because, I guess, there was not=20
much work done in its performance

> I did --fix on my root partition, which is around 32 gigabytes and it
> took nearly an hour, maybe. The fact that I cancelled --build-sb to run=

> --fix sort of messed up my measurements.
>=20
> However, my /home/mjt/ is 102G with about 50 free.
>=20
> Time interval: Fri Jun 18 12:41:09 2004 - Fri Jun 18 12:41:14 2004
>=20
> That's about the only time reference I have. The time is now about 14:0=
0.
>=20
> How should it take?
> The thing is, I'm leaving with my desktop computer in a few hours, so I=

> may have to cancel and restart later. I also don't want to re-do this, =
as
> I'll be busy until Sunday with more pressing matters.
>=20
Can you just leave it to work? When you will be back - everything will=20
be done

> Are there any risks in using the read-only mounted /home/ while fscking=
?
>=20
If it mounts - you can probably use it. Just do not be surprised with=20
EIO, ENOENT, etc

> Are there any risks in using the /home/ read-write without the stat dat=
a
> extensions, or whatever --fix fixes?
>=20
> Is there some more verbosity coming into fsck, just to let me know it's=

> actually doing something? Sure, I follow it with top -d1 but that's
> not too reassuring. Maybe some counter of how many {kilo,mega,giga}byte=
s
> left to check or some tree numbers or _anything_.
>=20

How do you run fsck.reiser4?

> Thanks a million!
>=20


