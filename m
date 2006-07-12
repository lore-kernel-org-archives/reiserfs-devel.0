From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: any way to disable fsync?
Date: Wed, 12 Jul 2006 06:48:14 +0200
Message-ID: <op.tcj7mozad4os1z@localhost>
References: <op.tcjl3meld4os1z@localhost> <200607112157.k6BLvUqk028924@turing-police.cc.vt.edu> <BAYC1-PASMTP0152E46B1E5184F223039DBF680@CEZ.ICE>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28965-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <BAYC1-PASMTP0152E46B1E5184F223039DBF680@CEZ.ICE>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Wed, 12 Jul 2006 01:41:10 +0200, Toby Thain <toby@smartgames.ca> =20
napisa=B3:

>
> On 11-Jul-06, at 5:57 PM, Valdis.Kletnieks@vt.edu wrote:
>
>> On Tue, 11 Jul 2006 23:03:12 +0200, =3D?iso-8859-2?B?=20
>> o3VrYXN6IE1pZXJ6d2E=3D?=3D said:
>>> I got problem with apps that are calling fsync, it makes my hard drive
>>> flush like mad and it slows down things quite a lot.
>>
>> Several have posted how to bypass it.  I'll pose the opposite side:
>>
>> Usually, applications call fsync() because they're pretty sure that if
>> the disk and in-memory copies aren't lined up, a crash at that point =20
>> could
>> result in data loss and/or corruption.
>>
>> So sqlite calls fsync() - probably because if it *doesn't*, and your
>> system crashes/reboots, you *will* lose that sqlite database.
>
> Absolutely; it's required for commit semantics. :-)
>
>>
>> Your data, your decision.
>

I know it's there to keep data integrity but what should I do when it =20
makes some apps unusable? Becouse it really hurts amarok for me and =20
without disabling it in sqlite code amarok I can't call it listening to =20
music. I can always patch one or few apps and live with it but what if =20
half of my apps will do it?
Anyway I'm goint to work now so I won't be having this problem for next 8  =

hours.
