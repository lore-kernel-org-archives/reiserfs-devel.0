From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: The Infamous Reiser4-randomly-blocks-for-ages-and-writes-the-hd-continously-in-the-mean-while now with a btrace log! (hope it helps)
Date: Thu, 10 Aug 2006 23:06:20 +0200
Message-ID: <op.td258uwvd4os1z@localhost>
References: <20060806162017.GB8613@rvalles.homedns.org.> <5c49b0ed0608070233p68204fd1la2630e49fb08fad7@mail.gmail.com> <44DB6080.8070306@iki.fi> <44DB7F9B.4030504@slaphack.com> <op.td2z6u11d4os1z@localhost> <44DB9E32.9010308@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29571-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44DB9E32.9010308@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: David Masover <ninja@slaphack.com>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Thu, 10 Aug 2006 22:59:30 +0200, David Masover <ninja@slaphack.com> =20
napisa=B3:

> =A3ukasz Mierzwa wrote:
>> Dnia Thu, 10 Aug 2006 20:48:59 +0200, David Masover =20
>> <ninja@slaphack.com> napisa=B3:
>>
>>> Vesa Kaihlavirta wrote:
>>>
>>>> Incidentally, I've witnessed similar behaviour in various simple =20
>>>> tasks,
>>>> e.g. writing
>>>> entries to an sqlite database, or receiving mail from pop3 in =20
>>>> thunderbird.
>>>
>>> Sounds like fsync issues.  That is being worked on.
>>  I'm think it's writeout that's involved, I tried to disable fsync and  =

>> it helped for apps that are calling fsync to keep data integrity (like  =

>> sqlite) but it also happens when I'm downloading files using rtorrent =20
>> which does not call fsync but generetes many little writes.
>
> Hmm.  Fragmentation, maybe?  Is this easily reproduceable with a =20
> freshly-formatted fs?
>
> I'm just guessing here...

That's hard for me to try as I'm using single reiser4 partition for all my =
=20
data, after pushing my reset button several times I'm quite sure that my =20
files are safe (if I won't hit any crazy bug ;) ).
But maybe You are right, it's slowly getting full and I did rebuild entire =
=20
system few times. When I will have some free space for backup I'll =20
reformat my disk.
