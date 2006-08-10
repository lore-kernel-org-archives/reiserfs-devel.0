From: David Masover <ninja@slaphack.com>
Subject: Re: The Infamous Reiser4-randomly-blocks-for-ages-and-writes-the-hd-continously-in-the-mean-while
 now with a btrace log! (hope it helps)
Date: Thu, 10 Aug 2006 16:59:30 -0400
Message-ID: <44DB9E32.9010308@slaphack.com>
References: <20060806162017.GB8613@rvalles.homedns.org.> <5c49b0ed0608070233p68204fd1la2630e49fb08fad7@mail.gmail.com> <44DB6080.8070306@iki.fi> <44DB7F9B.4030504@slaphack.com> <op.td2z6u11d4os1z@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29570-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.td2z6u11d4os1z@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-2?Q?=A3ukasz_Mierzwa?= <prymitive@pcserwis.net>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

=A3ukasz Mierzwa wrote:
> Dnia Thu, 10 Aug 2006 20:48:59 +0200, David Masover <ninja@slaphack.com> =

> napisa=B3:
>=20
>> Vesa Kaihlavirta wrote:
>>
>>> Incidentally, I've witnessed similar behaviour in various simple tasks,
>>> e.g. writing
>>> entries to an sqlite database, or receiving mail from pop3 in=20
>>> thunderbird.
>>
>> Sounds like fsync issues.  That is being worked on.
>=20
> I'm think it's writeout that's involved, I tried to disable fsync and it =

> helped for apps that are calling fsync to keep data integrity (like=20
> sqlite) but it also happens when I'm downloading files using rtorrent=20
> which does not call fsync but generetes many little writes.

Hmm.  Fragmentation, maybe?  Is this easily reproduceable with a=20
freshly-formatted fs?

I'm just guessing here...
