From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: PAP-12365: check_after_balance_leaf: S is  incorrectkernel
 BUG at  prints.c:334! (Part 4)
Date: Tue, 13 Aug 2002 05:47:17 +0200
Message-ID: <3D588145.3020404@mb.tu-ilmenau.de>
References: <3D57B561.1481B525@baldauf.org> <200208121118.23879.kuba@mareimbrium.org> <3D5803A4.13A03623@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11178-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

On 08/12/2002 08:51 PM, Xuan Baldauf wrote:
>=20
> Kuba Ober wrote:
>=20
>=20
>>On poniedzia=B3ek 12 sierpie=F1 2002 09:17 am, Xuan Baldauf wrote:
>>
>>>I checked the filesystem multiple times with
>>>reiserfsck-3.x.0b (first) and reiserfsck-3.x.0k-pre8 (then).
>>>The first run showed a bitmap error which was fixed then
>>>with "--fix-fixable". All subsequent runs could not find any
>>>error. All logs above were captured aftere these reiserfsck
>>>runs.
>>
>>Use version 3.6.3 of reiserfs-utils. *Do not* use any previous version =
(3.x.0b
>>& 3.x.0.k are *really* obsolete), nor do not use any kernel below 2.4.1=
8
>>(2.4.19 is preferred).
>>
>>Umount the filesystems, check them using newest reiserfsck, then upgrad=
e to
>>newest kernel.
>>
>>Cheers, Kuba Ober
>=20
>=20
> Hello Kuba,
>=20
> using reiserfsck 3.6.3 --fix-fixable fixed the problem. Thank you.
>=20
> Xu=E2n.
>=20

Thank you two nice people commenting this thread, so far. Xuan and Kuba!
And finally pointing to reiserfsprogs-3.6.3-finals help.

BTW, I find it poor, the reiserfs-team didn't react with that hint direct=
ly.

I just compiled the newest reiserfsprogs upon your direct "advice",=20
immediately, that Vitaly Fertmans words didn't say that exactly,

Thanks

Manuel

